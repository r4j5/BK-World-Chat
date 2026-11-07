-- BK World Chat database foundation
-- Run in Supabase SQL Editor only after reviewing. RLS is enabled.
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  username text unique not null check (char_length(username) between 3 and 24),
  created_at timestamptz not null default now()
);
create table if not exists public.rooms (
  id bigint generated always as identity primary key,
  slug text unique not null,
  name text not null,
  emoji text not null default '🌍'
);
insert into public.rooms(slug,name,emoji) values
 ('pakistan','Pakistan','🇵🇰'),('india','India','🇮🇳'),
 ('uk','United Kingdom','🇬🇧'),('usa','United States','🇺🇸'),
 ('friendship','Friendship','❤️'),('international','International','🌍')
on conflict(slug) do nothing;
create table if not exists public.messages (
  id bigint generated always as identity primary key,
  room_id bigint not null references public.rooms(id) on delete cascade,
  user_id uuid not null references public.profiles(id) on delete cascade,
  body text not null check (char_length(body) between 1 and 2000),
  created_at timestamptz not null default now()
);
alter table public.profiles enable row level security;
alter table public.rooms enable row level security;
alter table public.messages enable row level security;
create policy "Profiles readable by signed-in users" on public.profiles for select to authenticated using (true);
create policy "Users create own profile" on public.profiles for insert to authenticated with check (auth.uid()=id);
create policy "Users update own profile" on public.profiles for update to authenticated using (auth.uid()=id) with check (auth.uid()=id);
create policy "Rooms readable by everyone signed in" on public.rooms for select to authenticated using (true);
create policy "Messages readable by signed-in users" on public.messages for select to authenticated using (true);
create policy "Users send as themselves" on public.messages for insert to authenticated with check (auth.uid()=user_id);
create index if not exists messages_room_created_idx on public.messages(room_id,created_at desc);
alter publication supabase_realtime add table public.messages;
