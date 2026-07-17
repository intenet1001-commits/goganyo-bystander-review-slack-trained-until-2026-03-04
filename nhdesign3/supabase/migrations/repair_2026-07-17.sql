-- nhdesign3 repair pass 2026-07-17: align counts, register orphan page,
-- promote BUILD-verified component keys out of the lessons page into nhdesign3_components.

-- 1. 해외주식의결권 source row: total_pages=0 / learned_pages=7 but 8 actual rows exist.
update nhdesign3_sources
set total_pages = 8, learned_pages = 8, updated_at = now()
where name = '해외주식의결권';

-- 2. Register the one learned-but-topicless page (lesson-color-upgrade).
insert into nhdesign3_topics (topic, keywords, page_ids)
select 'BUILD lesson — 색상 가이드 업그레이드 (jade/jade-strong 보정, Roboto 숫자 폰트, CSS 주석 버그)',
       array['color','색상','jade','roboto','숫자 폰트','css comment','build lesson'],
       array[p.id]
from nhdesign3_pages p
where p.kebab_slug = 'lesson-color-upgrade'
  and not exists (
    select 1 from nhdesign3_topics t where p.id = any(t.page_ids)
  );

-- 3. Promote verified keys (from page component-key-registry, verified via createInstance()
--    in the 해외주식의결권 BUILD session) into nhdesign3_components.

-- 3a. Updates: rows that already exist by name. Update every row of the name —
--     they are the same library component sighted on different pages.
update nhdesign3_components set
  component_key = 'c95043e94317fde7230298017f42dd8099e1cbdc',
  key_kind = 'SET', tier = 'published', status = 'verified',
  variants = '[{"props":"Channel=NM, Left Icon=on, Right Icon=off","key":"c7706f72a18d458759548113071367745adc8d96"}]'::jsonb,
  notes = coalesce(notes,'') || ' | VERIFIED KEY (2026-07-16 BUILD): SET key above; instantiate via importComponentSetByKeyAsync(SET) then children[i].key. See page component-key-registry.',
  updated_at = now()
where name = 'header_basic';

update nhdesign3_components set
  key_kind = 'SET', tier = 'published', status = 'verified',
  variants = '[{"props":"Channel=NM, Type=1-btn, Status=normal","key":"85b534c6205df3e64b4ad7f639d82b122869647b"},{"props":"Type=2-btn, Status=normal","key":"accfb243ce752fd894af2b6db081b1074022a39d"}]'::jsonb,
  notes = coalesce(notes,'') || ' | VERIFIED VARIANT KEYS (2026-07-16 BUILD): SET key not recorded; the two variant keys in variants[] work directly with importComponentByKeyAsync/createInstance. See page component-key-registry.',
  updated_at = now()
where name = 'btn_bottom_page';

update nhdesign3_components set
  component_key = '8cf721cd972b7d75f25d551acf25bcdd62a92f4c',
  key_kind = 'COMPONENT', tier = 'published', status = 'verified',
  variants = '[{"props":"Channel=NM, Type=1-btn","key":"8cf721cd972b7d75f25d551acf25bcdd62a92f4c"}]'::jsonb,
  notes = coalesce(notes,'') || ' | VERIFIED KEY (2026-07-16 BUILD): lives in the NDS_M.web library, NOT NDS_Library. Central layer-popup single full-width button. See page component-key-registry.',
  updated_at = now()
where name = 'btn_bottom_layerpopup';

update nhdesign3_components set
  component_key = 'a036bcc5e212e779d94e08d4ba9c701217fca1dc',
  key_kind = 'COMPONENT', tier = 'published', status = 'verified',
  variants = '[{"props":"strength=3-gray, Status=normal, Location=in page","key":"a036bcc5e212e779d94e08d4ba9c701217fca1dc"}]'::jsonb,
  notes = coalesce(notes,'') || ' | VERIFIED KEY (2026-07-16 BUILD): neutral/secondary button, used for 목록으로 돌아가기. See page component-key-registry.',
  updated_at = now()
where name = 'btn_container_large';

update nhdesign3_components set
  component_key = 'd71897c636a71e92ebef7e6075bb797aa3572b09',
  key_kind = 'SET', tier = 'published', status = 'contested',
  notes = coalesce(notes,'') || ' | CONTESTED (2026-07-16 BUILD): two incompatible naming revisions coexist in the library. Revision1 SET = key above (Lv=1-매우낮은위험 bg #EEF9EE/text #429F40; Lv=4-다소높은위험 bg #FFF4EC/text #EE5B18). Revision2 SET key only partially recorded (ee8f2ee5…) — re-verify before use. Never match by name alone; screenshot the actual variant. See page component-key-registry.',
  updated_at = now()
where name = 'label_risk';

-- 3b. Inserts: registry entries with no existing row. source_page_id = the registry page.
with reg as (
  select id from nhdesign3_pages where kebab_slug = 'component-key-registry'
)
insert into nhdesign3_components (name, component_key, key_kind, tier, variants, source_page_id, notes, status)
select v.name, v.component_key, v.key_kind, v.tier, v.variants::jsonb, reg.id, v.notes, v.status
from reg, (values
  ('statusbar', 'e453babe03efec7dabe6c99a8db8d6a46eebac58', 'SET', 'published',
   '[{"props":"Type=NM","key":"cb5f0b3d84426eeb3e20a2765b0612fb14263025"}]',
   'VERIFIED KEY (2026-07-16 BUILD). importComponentSetByKeyAsync(SET) then children[i].key. See page component-key-registry.', 'verified'),
  ('quickmenu_basic', '9c5dd3cd3e714255914cf288f442fad7c3ac76dd', 'SET', 'published',
   '[{"props":"Channel=NM, Type=normal","key":"0b75c3c90ea55d51fd61cbd25802aa23a530f0e4"}]',
   'VERIFIED KEY (2026-07-16 BUILD). See page component-key-registry.', 'verified'),
  ('nds_icon_arrow', '84d800ab499d17b8733469ec30690423b5105b68', 'COMPONENT', 'published',
   '[{"props":"Color=04, Type=right, Height=h24","key":"84d800ab499d17b8733469ec30690423b5105b68"}]',
   'VERIFIED KEY (2026-07-16 BUILD): key above is the per-variant key. WARNING: library holds TWO duplicate SET keys (dde648604e4d08cc6b99c44dda81ec73ccbb4b15, e5c1cd3126858fc4f2ad492128e21c059097a5b9) — never trust a bare SET key from search; open it and take the variant key. Used as list-row trailing chevron. See page component-key-registry.', 'verified'),
  ('icon_comm_complate', 'bd8e167c6f55b50541eaafb51cd867468da3af7b', 'COMPONENT', 'published',
   '[{"props":"Channel=NM, Result=Success","key":"bd8e167c6f55b50541eaafb51cd867468da3af7b"}]',
   'VERIFIED KEY (2026-07-16 BUILD): completion checkmark, 75x75 green badge. See page component-key-registry.', 'verified'),
  ('유의사항_Content_popup', '9448217e1879d57c134cfbc8a042d5be7d82d8b8', 'COMPONENT', 'published',
   '[{"props":"Type=기본","key":"9448217e1879d57c134cfbc8a042d5be7d82d8b8"}]',
   'VERIFIED KEY (2026-07-16 BUILD): NDS_Library. Bullet-row content for notice sheets, itemSpacing 10px. See page component-key-registry.', 'verified'),
  ('info_solid', null, 'unknown', 'published',
   '[{"props":"Height=h22, Color=5","key":null}]',
   'Sighted in 2026-07-16 BUILD as caution-banner icon, but the registry recorded only a truncated key (2797bfd0…) — key must be re-verified via search_design_system before use. See page component-key-registry.', 'unverified'),
  ('nds_icon_info', 'a8c8213957d82b75453df70541d4de215db3c24d', 'COMPONENT', 'published',
   '[{"props":"Color=4, Height=h30","key":"a8c8213957d82b75453df70541d4de215db3c24d"}]',
   'VERIFIED KEY (2026-07-16 BUILD): used in empty-state pattern. See page component-key-registry.', 'verified'),
  ('Sectionbar', 'ad9cefda1769100abea9504333515a02853e318b', 'COMPONENT', 'published',
   '[]',
   'DO NOT USE standalone — internal offset bug when instantiated alone; see ledger anchor sectionbar-offset-bug. NDS_Templates; a single COMPONENT, not a SET. Key verified 2026-07-16 BUILD.', 'verified')
) as v(name, component_key, key_kind, tier, variants, notes, status)
where not exists (
  select 1 from nhdesign3_components c where c.name = v.name
);

-- 4. Topic so BUILD finds the key registry + verified components via the documented path.
insert into nhdesign3_topics (topic, keywords, page_ids, component_ids)
select '검증된 컴포넌트 키 레지스트리 (verified component keys, SET→variant 2-step)',
       array['component key','컴포넌트 키','componentkey','createInstance','importComponentSetByKeyAsync','verified keys','키 레지스트리'],
       array[(select id from nhdesign3_pages where kebab_slug = 'component-key-registry')],
       (select coalesce(array_agg(id), '{}') from nhdesign3_components
        where status in ('verified','contested')
           or name in ('statusbar','header_basic','quickmenu_basic','nds_icon_arrow','btn_bottom_page',
                       'label_risk','icon_comm_complate','btn_container_large','유의사항_Content_popup',
                       'btn_bottom_layerpopup','info_solid','nds_icon_info','Sectionbar'))
where not exists (
  select 1 from nhdesign3_topics where topic like '검증된 컴포넌트 키 레지스트리%'
);
