insert into nhdesign4_sources
  (id, file_key, name, source_url, kind, total_pages, learned_pages,
   learned_date, reviewed_date, status, created_at, updated_at)
  select
    id, file_key, name, source_url, kind, total_pages, learned_pages,
    learned_date, reviewed_date, status, created_at, updated_at
  from nhdesign3_sources
  on conflict (id) do nothing;

insert into nhdesign4_pages
  (id, source_id, node_id, page_name, kebab_slug, naming_convention,
   content_md, sections_studied, status, learned_date, reviewed_date)
  select
    id, source_id, node_id, page_name, kebab_slug, naming_convention,
    content_md, sections_studied, status, learned_date, reviewed_date
  from nhdesign3_pages
  on conflict (id) do nothing;

insert into nhdesign4_components
  (id, name, component_key, key_kind, tier, variants, tokens,
   source_page_id, notes, status, created_at, updated_at)
  select
    id, name, component_key, key_kind, tier, variants, tokens,
    source_page_id, notes, status, created_at, updated_at
  from nhdesign3_components
  on conflict (id) do nothing;

insert into nhdesign4_topics
  (id, topic, keywords, page_ids, component_ids, flag)
  select
    id, topic, keywords, page_ids, component_ids, flag
  from nhdesign3_topics
  on conflict (id) do nothing;

insert into nhdesign4_ledger
  (id, anchor, title, description, status, resolved_date, history, created_at)
  select
    id, anchor, title, description, status, resolved_date, history, created_at
  from nhdesign3_ledger
  on conflict (id) do nothing;

update nhdesign4_sources set domain = 'homepage' where kind = 'website';

update nhdesign4_sources set domain = 'app' where kind = 'project';

update nhdesign4_sources set domain = 'app' where kind = 'guide';
update nhdesign4_sources set domain = 'homepage'
  where kind = 'guide'
    and (file_key = 'lib-guide-homepage' or name like '%홈페이지%');

update nhdesign4_sources set domain = 'app'
  where kind = 'knowhow' and file_key = 'knowhow-nhdesign3';
