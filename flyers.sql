-- Run this ONCE in Supabase: SQL Editor > New query > paste > Run.
-- Turns on event flyer uploads (images or PDFs, up to 10 MB each).
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('flyers', 'flyers', true, 10485760,
        array['image/png','image/jpeg','image/webp','image/gif','application/pdf'])
on conflict (id) do nothing;

create policy "flyers read"   on storage.objects for select to anon using (bucket_id = 'flyers');
create policy "flyers upload" on storage.objects for insert to anon with check (bucket_id = 'flyers');
create policy "flyers update" on storage.objects for update to anon using (bucket_id = 'flyers') with check (bucket_id = 'flyers');
create policy "flyers delete" on storage.objects for delete to anon using (bucket_id = 'flyers');
