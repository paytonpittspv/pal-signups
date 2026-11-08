-- Run this once in Supabase: SQL Editor > New query > paste > Run.

create table if not exists events  (id text primary key, data jsonb not null);
create table if not exists signups (id text primary key, data jsonb not null);
create table if not exists pals    (id text primary key, data jsonb not null);

alter table events  enable row level security;
alter table signups enable row level security;
alter table pals    enable row level security;

-- Anyone with the link can read and edit these three tables (no logins).
create policy "open events"  on events  for all to anon using (true) with check (true);
create policy "open signups" on signups for all to anon using (true) with check (true);
create policy "open pals"    on pals    for all to anon using (true) with check (true);

-- Live updates
alter publication supabase_realtime add table events, signups, pals;

-- ===== FLYERS (added later; safe to run on its own) =====
-- A public bucket for event flyers (images or PDFs, up to 10 MB each).
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('flyers', 'flyers', true, 10485760,
        array['image/png','image/jpeg','image/webp','image/gif','application/pdf'])
on conflict (id) do nothing;

create policy "flyers read"   on storage.objects for select to anon using (bucket_id = 'flyers');
create policy "flyers upload" on storage.objects for insert to anon with check (bucket_id = 'flyers');
create policy "flyers update" on storage.objects for update to anon using (bucket_id = 'flyers') with check (bucket_id = 'flyers');
create policy "flyers delete" on storage.objects for delete to anon using (bucket_id = 'flyers');
