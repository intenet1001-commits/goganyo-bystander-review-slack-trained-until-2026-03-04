-- nhdesign3: NDS knowledge store (nhdesign3_ prefix, shared "portmanagement" project)
-- Mirrors nhdesign2's schema exactly, table-for-table, under a distinct prefix so it can
-- hold an independent copy of the data for A/B comparison without touching nhdesign_*.

create extension if not exists pgcrypto;

create table if not exists nhdesign3_sources (
  id uuid primary key default gen_random_uuid(),
  file_key text unique not null,
  name text not null,
  source_url text not null,
  kind text not null check (kind in ('guide', 'project', 'website')),
  total_pages int,
  learned_pages int default 0,
  learned_date date,
  reviewed_date date,
  status text not null default 'not_started' check (status in ('not_started', 'in_progress', 'complete')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists nhdesign3_pages (
  id uuid primary key default gen_random_uuid(),
  source_id uuid not null references nhdesign3_sources(id) on delete cascade,
  node_id text not null,
  page_name text not null,
  kebab_slug text not null,
  naming_convention text,
  content_md text,
  sections_studied text[],
  status text not null default 'learned' check (status in ('learned', 'gap', 'skip')),
  learned_date date not null default current_date,
  reviewed_date date,
  unique (source_id, node_id)
);

create table if not exists nhdesign3_components (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  component_key text,
  key_kind text check (key_kind in ('SET', 'COMPONENT', 'unknown')),
  tier text check (tier in ('published', 'page_local', 'unpublished')),
  variants jsonb default '[]'::jsonb,
  tokens jsonb default '{}'::jsonb,
  source_page_id uuid references nhdesign3_pages(id) on delete set null,
  notes text,
  status text not null default 'unverified' check (status in ('verified', 'unverified', 'contested')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists nhdesign3_topics (
  id uuid primary key default gen_random_uuid(),
  topic text not null,
  keywords text[] default '{}',
  page_ids uuid[] default '{}',
  component_ids uuid[] default '{}',
  flag text not null default 'none' check (flag in ('none', 'contested', 'blocked'))
);

create table if not exists nhdesign3_ledger (
  id uuid primary key default gen_random_uuid(),
  anchor text unique not null,
  title text not null,
  description text not null,
  status text not null default 'open' check (status in ('open', 'resolved')),
  resolved_date date,
  history jsonb default '[]'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists nhdesign3_pages_source_idx on nhdesign3_pages(source_id);
create index if not exists nhdesign3_components_key_idx on nhdesign3_components(component_key);
create index if not exists nhdesign3_topics_keywords_idx on nhdesign3_topics using gin(keywords);

-- Copy data over verbatim (same ids, so FK relationships transfer intact).
insert into nhdesign3_sources
  select * from nhdesign_sources
  on conflict (id) do nothing;

insert into nhdesign3_pages
  select * from nhdesign_pages
  on conflict (id) do nothing;

insert into nhdesign3_components
  select * from nhdesign_components
  on conflict (id) do nothing;

insert into nhdesign3_topics
  select * from nhdesign_topics
  on conflict (id) do nothing;

insert into nhdesign3_ledger
  select * from nhdesign_ledger
  on conflict (id) do nothing;
