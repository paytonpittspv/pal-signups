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
