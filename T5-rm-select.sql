/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-rm-select.sql

--Student ID: 34680535
--Student Name: Jinghao Xu


/* Comments for your marker:




*/


/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
select rpad(
    t.team_name,
    30
) as "TEAM_NAME",
       to_char(
           c.carn_date,
           'DD-MON-YYYY'
       ) as "CARNIVAL_DATE",
       rpad(
           leader.comp_fname
           || ' '
           || leader.comp_lname,
           62
       ) as "TEAMLEADER",
       lpad(
           to_char(count(members_entrys.comp_no)),
           16
       ) as "TEAM_NO_MEMBERS"
  from team t
  join carnival c
on t.carn_date = c.carn_date
  join entry leader_entry
on t.event_id = leader_entry.event_id
   and t.entry_no = leader_entry.entry_no
  join competitor leader
on leader_entry.comp_no = leader.comp_no
  join entry members_entrys
on t.team_id = members_entrys.team_id
 where c.carn_date < sysdate
   and t.team_name in (
    select team_name
      from (
        select team_name,
               count(*) as name_count
          from team t2
          join carnival c2
        on t2.carn_date = c2.carn_date
         where c2.carn_date < sysdate
         group by team_name
        having count(*) = (
            select max(name_count)
              from (
                select team_name,
                       count(*) as name_count
                  from team t3
                  join carnival c3
                on t3.carn_date = c3.carn_date
                 where c3.carn_date < sysdate
                 group by team_name
            )
        )
    )
)
 group by t.team_name,
          c.carn_date,
          leader.comp_fname,
          leader.comp_lname
 order by t.team_name,
          c.carn_date;

/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
select rpad(
    et.eventtype_desc,
    50
) as "Event",
       rpad(
           c.carn_name
           || ' held '
           || to_char(
               c.carn_date,
               'Dy DD-MON-YYYY'
           ),
           72
       ) as "Carnival",
       rpad(
           to_char(
               e.entry_elapsedtime,
               'HH24:MI:SS'
           ),
           15
       ) as "Current Record",
       rpad(
           LPAD(comp.comp_no, 5, '0')
           ||
               case
                   when comp.comp_fname is not null then
                       ' ' || comp.comp_fname
                   else ''
               end
           || case
               when comp.comp_lname is not null then
                   ' ' || comp.comp_lname
               else ''
           end,
           68
       ) as "Competitor No and Name",
       rpad(
           floor(months_between(
               c.carn_date,
               comp.comp_dob
           ) / 12),
           15
       ) as "Age at Carnival"
  from entry e
  join event ev
on e.event_id = ev.event_id
  join eventtype et
on ev.eventtype_code = et.eventtype_code
  join carnival c
on ev.carn_date = c.carn_date
  join competitor comp
on e.comp_no = comp.comp_no
 where e.entry_elapsedtime is not null
   and e.entry_elapsedtime = (
    select min(e2.entry_elapsedtime)
      from entry e2
      join event ev2
    on e2.event_id = ev2.event_id
     where ev2.eventtype_code = ev.eventtype_code
       and e2.entry_elapsedtime is not null
)
 order by et.eventtype_desc,
          comp.comp_no;

/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
select rpad(
    c.carn_name,
    50
) as "Carnival Name",
       to_char(
           c.carn_date,
           'DD MON YYYY'
       ) as "Carnival Date",
       rpad(
           et.eventtype_desc,
           50
       ) as "Event Description",
       case
           when count(e.entry_no) = 0 then
               rpad(
                   'Not offered',
                   18
               )
           else
               lpad(
                   to_char(count(e.entry_no)),
                   18
               )
       end as "Number of Entries",
       case
           when count(e.entry_no) = 0 then
               rpad(
                   '',
                   22
               )
           else
               lpad(
                   to_char(round(count(e.entry_no) * 100.0 / carnival_totals.total_entries
                   )),
                   22
               )
       end as "% of Carnival Entries"
  from carnival c
 cross join eventtype et
  left outer join event ev
on c.carn_date = ev.carn_date
   and et.eventtype_code = ev.eventtype_code
  left outer join entry e
on ev.event_id = e.event_id
  join (
    select c2.carn_date,
           count(e2.entry_no) as total_entries
      from carnival c2
      left outer join event ev2
    on c2.carn_date = ev2.carn_date
      left outer join entry e2
    on ev2.event_id = e2.event_id
     group by c2.carn_date
    having count(e2.entry_no) > 0
) carnival_totals
on c.carn_date = carnival_totals.carn_date
 where carnival_totals.total_entries > 0
 group by c.carn_name,
          c.carn_date,
          et.eventtype_desc,
          carnival_totals.total_entries
 order by c.carn_date,
          case
              when count(e.entry_no) = 0 then
                  0
              else
                  1
          end,
          case
              when count(e.entry_no) = 0 then
                  null
              else
                  count(e.entry_no)
          end
      desc,
          et.eventtype_desc;