--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-rm-dm.sql

--Student ID: 34680535
--Student Name: Jinghao Xu

/* Comments for your marker:




*/

--(a)
drop sequence comp_seq;
drop sequence team_seq;

create sequence comp_seq start with 100 increment by 5;
create sequence team_seq start with 100 increment by 5;

--(b)
insert into competitor values ( comp_seq.nextval,
                                'Keith',
                                'Rose',
                                'M',
                                to_date('01/JAN/1995','DD/MON/YYYY'),
                                'keith.rose@email.com',
                                'Y',
                                '0422141112' );

insert into competitor values ( comp_seq.nextval,
                                'Jackson',
                                'Bull',
                                'M',
                                to_date('01/JAN/1996','DD/MON/YYYY'),
                                'jackson.bull@email.com',
                                'Y',
                                '0422412524' );

insert into entry values ( (
    select event_id
      from event e
      join carnival c
    on e.carn_date = c.carn_date
      join eventtype t
    on e.eventtype_code = t.eventtype_code
     where upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
       and upper(t.eventtype_desc) = upper('10 km run')
),
                           (
                               select nvl(
                                   max(entry_no),
                                   0
                               ) + 1
                                 from entry
                                where event_id = (
                                   select event_id
                                     from event e
                                     join carnival c
                                   on e.carn_date = c.carn_date
                                     join eventtype t
                                   on e.eventtype_code = t.eventtype_code
                                    where upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                                    )
                                      and upper(t.eventtype_desc) = upper('10 km run'
                                      )
                               )
                           ),
                           null,
                           null,
                           null,
                           (
                               select comp_no
                                 from competitor
                                where comp_phone = '0422141112'
                           ),
                           null,
                           (
                               select char_id
                                 from charity
                                where upper(char_name) = upper('Salvation Army')
                           ) );

insert into team values ( team_seq.nextval,
                          'Super Runners',
                          (
                              select carn_date
                                from carnival
                               where upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                               )
                          ),
                          (
                              select event_id
                                from event e
                                join carnival c
                              on e.carn_date = c.carn_date
                                join eventtype t
                              on e.eventtype_code = t.eventtype_code
                               where upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                               )
                                 and upper(t.eventtype_desc) = upper('10 km run')
                          ),
                          (
                              select entry_no
                                from entry
                               where comp_no = (
                                      select comp_no
                                        from competitor
                                       where comp_phone = '0422141112'
                                  )
                                 and event_id = (
                                  select event_id
                                    from event e
                                    join carnival c
                                  on e.carn_date = c.carn_date
                                    join eventtype t
                                  on e.eventtype_code = t.eventtype_code
                                   where upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                                   )
                                     and upper(t.eventtype_desc) = upper('10 km run')
                              )
                          ) );

update entry
   set
    team_id = (
        select team_id
          from team
         where upper(team_name) = upper('Super Runners')
           and carn_date = (
            select carn_date
              from carnival
             where upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
        )
    )
 where comp_no = (
    select comp_no
      from competitor
     where comp_phone = '0422141112'
);

insert into entry values ( (
    select event_id
      from event e
      join carnival c
    on e.carn_date = c.carn_date
      join eventtype t
    on e.eventtype_code = t.eventtype_code
     where upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
       and upper(t.eventtype_desc) = upper('10 km run')
),
                           (
                               select nvl(
                                   max(entry_no),
                                   0
                               ) + 1
                                 from entry
                                where event_id = (
                                   select event_id
                                     from event e
                                     join carnival c
                                   on e.carn_date = c.carn_date
                                     join eventtype t
                                   on e.eventtype_code = t.eventtype_code
                                    where upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                                    )
                                      and upper(t.eventtype_desc) = upper('10 km run'
                                      )
                               )
                           ),
                           null,
                           null,
                           null,
                           (
                               select comp_no
                                 from competitor
                                where comp_phone = '0422412524'
                           ),
                           (
                               select team_id
                                 from team
                                where upper(team_name) = upper('Super Runners')
                                  and carn_date = (
                                   select carn_date
                                     from carnival
                                    where upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                                    )
                               )
                           ),
                           (
                               select char_id
                                 from charity
                                where upper(char_name) = upper('RSPCA')
                           ) );

commit;


--(c)
delete from entry
 where comp_no = (
        select comp_no
          from competitor
         where comp_phone = '0422412524'
    )
   and event_id = (
    select event_id
      from event e
      join carnival c
    on e.carn_date = c.carn_date
      join eventtype t
    on e.eventtype_code = t.eventtype_code
     where upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
       and upper(t.eventtype_desc) = upper('10 km run')
);

insert into entry values ( (
    select event_id
      from event e
      join carnival c
    on e.carn_date = c.carn_date
      join eventtype t
    on e.eventtype_code = t.eventtype_code
     where upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
       and upper(t.eventtype_desc) = upper('5 km run')
),
                           (
                               select nvl(
                                   max(entry_no),
                                   0
                               ) + 1
                                 from entry
                                where event_id = (
                                   select event_id
                                     from event e
                                     join carnival c
                                   on e.carn_date = c.carn_date
                                     join eventtype t
                                   on e.eventtype_code = t.eventtype_code
                                    where upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                                    )
                                      and upper(t.eventtype_desc) = upper('5 km run')
                               )
                           ),
                           null,
                           null,
                           null,
                           (
                               select comp_no
                                 from competitor
                                where comp_phone = '0422412524'
                           ),
                           (
                               select team_id
                                 from team t
                                 join carnival c
                               on t.carn_date = c.carn_date
                                where upper(t.team_name) = upper('Super Runners')
                                  and upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                                  )
                           ),
                           (
                               select char_id
                                 from charity
                                where upper(char_name) = upper('Beyond Blue')
                           ) );

commit;

--(d)
update entry
   set
    team_id = null
 where team_id = (
    select team_id
      from team
     where upper(team_name) = upper('Super Runners')
       and carn_date = (
        select carn_date
          from carnival
         where upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
    )
);

delete from team
 where upper(team_name) = upper('Super Runners')
   and carn_date = (
    select carn_date
      from carnival
     where upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
);

delete from entry
 where comp_no = (
        select comp_no
          from competitor
         where comp_phone = '0422141112'
    )
   and event_id = (
    select event_id
      from event e
      join carnival c
    on e.carn_date = c.carn_date
      join eventtype t
    on e.eventtype_code = t.eventtype_code
     where upper(c.carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
       and upper(t.eventtype_desc) = upper('10 km run')
);

commit;