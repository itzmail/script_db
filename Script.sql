select * from public.pt_mstr pm 

select * from public.ptcat_mstr pm 

select * from public.ptscat_cat pc 

select * from public.ptnr_mstr pm where ptnr_ptnrg_id notnull 

-- Untuk menambahkan Kategori atau subkategori
insert into public.ptscat_cat (ptscat_oid, ptscat_code, ptscat_id, ptscat_ptcat_id, ptscat_desc, ptscat_add_by, ptscat_add_date, ptscat_active) 
values ('40afc7fc-212f-4186-8723-088876e279b2', 'PTSCAT34', 34, 8, 'Sepatu Boots', 'Admin', '2023-06-16 09:30:00.000', 'Y')

-- Untuk melihat kateogri dan subkategori
select ptcat.ptcat_desc, ptcat.ptcat_id, ptscat.ptscat_id, ptscat.ptscat_desc from public.ptcat_mstr ptcat
left join public.ptscat_cat ptscat on ptcat.ptcat_id = ptscat.ptscat_ptcat_id 
order by ptscat.ptscat_id asc

-- Proses input berlangsung
select pt_desc1, pt_scat_id, pt_cat_id from public.pt_mstr pm where pt_desc1 like 'Leandra Tawny Brown - Tuacany %' 

-- Man 31
-- Gamis 11
-- Little Mutif Boy 27
-- Kerudung

update public.pt_mstr 
set pt_scat_id = 31
where pt_desc1 like 'Leandra Tawny Brown - Tuacany %'