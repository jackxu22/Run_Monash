--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-rm-mods.sql

--Student ID: 34680535
--Student Name:Jinghao Xu

/* Comments for your marker:




*/

--(a)
ALTER TABLE competitor ADD comp_events_completed NUMBER(3) DEFAULT 0 NOT NULL;

comment on column competitor.comp_events_completed is
    'Number of events completed by this competitor';

update competitor c
   set
    comp_events_completed = (
        select count(*)
          from entry e
         where e.comp_no = c.comp_no
           and e.entry_finishtime is not null
    );
commit;

DESC competitor;

select c.comp_no,
       c.comp_fname,
       c.comp_lname,
       c.comp_events_completed
  from competitor c
 order by c.comp_events_completed desc,
          c.comp_no;

select e.comp_no,
       e.entry_no,
       e.event_id,
       to_char(
           entry_finishtime,
           'HH24:MI:SS'
       ) as finish_time
  from entry e
 where e.entry_finishtime is not null
 order by e.comp_no,
          e.event_id;

--(b)
drop table entry_charity cascade constraints purge;

create table entry_charity (
    event_id   number(6) not null,
    entry_no   number(5) not null,
    char_id    number(6) not null,
    percentage number(5,2) default 100 not null
);

comment on column entry_charity.event_id is
    'Event ID (surrogate primary key)';

comment on column entry_charity.entry_no is
    'Entry number of the competitor in this event';

comment on column entry_charity.char_id is
    'Charity supported for this entry';

comment on column entry_charity.percentage is
    'Percentage of total funds raised for this charity (0-100)';


alter table entry_charity
    add constraint entry_char_pk primary key ( event_id,
                                               entry_no,
                                               char_id );

alter table entry_charity
    add constraint entry_entry_char_fk
        foreign key ( event_id,
                      entry_no )
            references entry ( event_id,
                               entry_no );

alter table entry_charity
    add constraint char_entry_char_fk foreign key ( char_id )
        references charity ( char_id );

alter table entry_charity
    add constraint ck_entry_char_percentage
        check ( percentage >= 0
           and percentage <= 100 );

insert into entry_charity (
    event_id,
    entry_no,
    char_id,
    percentage
)
    select event_id,
           entry_no,
           char_id,
           100
      from entry
     where char_id is not null;

alter table entry drop column char_id;

DESC entry_charity;
DESC entry;

select ec.event_id,
       ec.entry_no,
       c.char_name,
       ec.percentage
  from entry_charity ec
  join charity c
on ec.char_id = c.char_id
 order by ec.event_id,
          ec.entry_no;

commit;