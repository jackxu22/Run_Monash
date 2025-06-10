/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-rm-insert.sql

--Student ID: 34680535
--Student Name: Jinghao Xu

/* Comments for your marker:
I acknowledge the use of Claude 4 (https://claude.ai/new) to generate SQL INSERT statements
for the COMPETITOR, ENTRY, and TEAM tables in T2-rm-insert.sql.
The tool was used on June 8, 2025 to produce 15 COMPETITOR, 37 ENTRY, and 5 TEAM records 
satisfying Task 2 requirements. 
The output was modified by manually adjusting some input data to ensure compliance with constraints.

Data insertion strategy description:
Due to the cyclic foreign key dependency between the ENTRY table and the TEAM table,
the ENTRY table refers to the TEAM table (via team_id),
and the TEAM table refers to the ENTRY table (via event_id, entry_no)
So the following three-step insertion strategy is adopted:
1. First insert all entry in the ENTRY table and set the team_id field to NULL
2. Insert all the entry in the TEAM table (at this time, the ENTRY table already exists and satisfies the foreign key constraints)
3. Finally, use the UPDATE statement to update the team_id field in the ENTRY table to the correct value.


*/

-- Task 2 Load the COMPETITOR, ENTRY and TEAM tables with your own
-- test data following the data requirements expressed in the brief

-- =======================================
-- COMPETITOR
-- =======================================
insert into competitor values ( 1,
                                'John',
                                'Smith',
                                'M',
                                to_date('15/MAY/1990','DD/MON/YYYY'),
                                'john.smith@email.com',
                                'Y',
                                '0412345678' );

insert into competitor values ( 2,
                                'Emma',
                                'Wilson',
                                'F',
                                to_date('22/AUG/1995','DD/MON/YYYY'),
                                'emma.wilson@email.com',
                                'N',
                                '0423456789' );

insert into competitor values ( 3,
                                'Alex',
                                'Taylor',
                                'U',
                                to_date('30/NOV/1988','DD/MON/YYYY'),
                                'alex.taylor@email.com',
                                'Y',
                                '0434567890' );

insert into competitor values ( 4,
                                'Sarah',
                                'Brown',
                                'F',
                                to_date('10/MAR/1992','DD/MON/YYYY'),
                                'sarah.brown@email.com',
                                'N',
                                '0445678901' );

insert into competitor values ( 5,
                                null,
                                'Lee',
                                'M',
                                to_date('25/JUL/1993','DD/MON/YYYY'),
                                'lee@email.com',
                                'Y',
                                '0456789012' );

insert into competitor values ( 6,
                                'Lisa',
                                null,
                                'F',
                                to_date('12/JAN/1997','DD/MON/YYYY'),
                                'lisa@email.com',
                                'N',
                                '0467890123' );

insert into competitor values ( 7,
                                null,
                                null,
                                'M',
                                to_date('05/SEP/1985','DD/MON/YYYY'),
                                'null@email.com',
                                'Y',
                                '0478901234' );

insert into competitor values ( 8,
                                'Sophie',
                                'Harris',
                                'U',
                                to_date('18/DEC/1994','DD/MON/YYYY'),
                                'sophie.harris@email.com',
                                'N',
                                '0489012345' );

insert into competitor values ( 9,
                                'James',
                                'Walker',
                                'M',
                                to_date('20/JUN/1991','DD/MON/YYYY'),
                                'james.walker@email.com',
                                'Y',
                                '0490123456' );

insert into competitor values ( 10,
                                'Olivia',
                                'Moore',
                                'F',
                                to_date('14/FEB/1996','DD/MON/YYYY'),
                                'olivia.moore@email.com',
                                'N',
                                '0401234567' );

insert into competitor values ( 11,
                                'Ethan',
                                'Young',
                                'M',
                                to_date('08/OCT/1989','DD/MON/YYYY'),
                                'ethan.young@email.com',
                                'Y',
                                '0413456789' );

insert into competitor values ( 12,
                                'Mia',
                                'King',
                                'F',
                                to_date('17/APR/1993','DD/MON/YYYY'),
                                'mia.king@email.com',
                                'Y',
                                '0424567890' );

insert into competitor values ( 13,
                                'Noah',
                                'Scott',
                                'M',
                                to_date('23/SEP/1990','DD/MON/YYYY'),
                                'noah.scott@email.com',
                                'N',
                                '0435678901' );

insert into competitor values ( 14,
                                'Ava',
                                'Green',
                                'F',
                                to_date('11/NOV/1995','DD/MON/YYYY'),
                                'ava.green@email.com',
                                'Y',
                                '0446789012' );

insert into competitor values ( 15,
                                'Liam',
                                'Adams',
                                'U',
                                to_date('30/JUL/1987','DD/MON/YYYY'),
                                'liam.adams@email.com',
                                'N',
                                '0457890123' );


-- =======================================
-- ENTRY
-- =======================================
insert into entry values ( 1,
                           1,
                           to_date('09:30:00','hh24:mi:ss'),
                           to_date('10:00:00','hh24:mi:ss'),
                           to_date('00:30:00','hh24:mi:ss'),
                           1,
                           null,
                           1 );
insert into entry values ( 1,
                           2,
                           to_date('09:35:00','hh24:mi:ss'),
                           to_date('10:05:00','hh24:mi:ss'),
                           to_date('00:30:00','hh24:mi:ss'),
                           2,
                           null,
                           1 );
insert into entry values ( 1,
                           3,
                           to_date('09:40:00','hh24:mi:ss'),
                           to_date('10:20:00','hh24:mi:ss'),
                           to_date('00:40:00','hh24:mi:ss'),
                           3,
                           null,
                           1 );
insert into entry values ( 1,
                           4,
                           to_date('09:30:00','hh24:mi:ss'),
                           null,
                           null,
                           4,
                           null,
                           null );

insert into entry values ( 2,
                           1,
                           to_date('08:30:00','hh24:mi:ss'),
                           to_date('09:10:00','hh24:mi:ss'),
                           to_date('00:40:00','hh24:mi:ss'),
                           5,
                           null,
                           null );
insert into entry values ( 2,
                           2,
                           to_date('08:35:00','hh24:mi:ss'),
                           to_date('09:15:00','hh24:mi:ss'),
                           to_date('00:40:00','hh24:mi:ss'),
                           6,
                           null,
                           null );
insert into entry values ( 2,
                           3,
                           to_date('08:40:00','hh24:mi:ss'),
                           to_date('09:30:00','hh24:mi:ss'),
                           to_date('00:50:00','hh24:mi:ss'),
                           7,
                           null,
                           null );

insert into entry values ( 3,
                           1,
                           to_date('09:00:00','hh24:mi:ss'),
                           to_date('09:35:00','hh24:mi:ss'),
                           to_date('00:35:00','hh24:mi:ss'),
                           8,
                           null,
                           2 );
insert into entry values ( 3,
                           2,
                           to_date('09:05:00','hh24:mi:ss'),
                           to_date('09:40:00','hh24:mi:ss'),
                           to_date('00:35:00','hh24:mi:ss'),
                           9,
                           null,
                           2 );
insert into entry values ( 3,
                           3,
                           to_date('09:10:00','hh24:mi:ss'),
                           to_date('09:55:00','hh24:mi:ss'),
                           to_date('00:45:00','hh24:mi:ss'),
                           10,
                           null,
                           2 );
insert into entry values ( 3,
                           4,
                           null,
                           null,
                           null,
                           11,
                           null,
                           null );

insert into entry values ( 4,
                           1,
                           to_date('10:00:00','hh24:mi:ss'),
                           to_date('10:45:00','hh24:mi:ss'),
                           to_date('00:45:00','hh24:mi:ss'),
                           1,
                           null,
                           null );
insert into entry values ( 4,
                           2,
                           to_date('10:05:00','hh24:mi:ss'),
                           to_date('10:50:00','hh24:mi:ss'),
                           to_date('00:45:00','hh24:mi:ss'),
                           2,
                           null,
                           null );
insert into entry values ( 4,
                           3,
                           to_date('10:10:00','hh24:mi:ss'),
                           to_date('10:55:00','hh24:mi:ss'),
                           to_date('00:45:00','hh24:mi:ss'),
                           3,
                           null,
                           null );
insert into entry values ( 4,
                           4,
                           to_date('10:15:00','hh24:mi:ss'),
                           null,
                           null,
                           4,
                           null,
                           null );
insert into entry values ( 4,
                           5,
                           to_date('10:20:00','hh24:mi:ss'),
                           null,
                           null,
                           5,
                           null,
                           null );

insert into entry values ( 5,
                           1,
                           to_date('08:00:00','hh24:mi:ss'),
                           to_date('10:30:00','hh24:mi:ss'),
                           to_date('02:30:00','hh24:mi:ss'),
                           14,
                           null,
                           null );
insert into entry values ( 5,
                           2,
                           to_date('08:00:00','hh24:mi:ss'),
                           to_date('10:45:00','hh24:mi:ss'),
                           to_date('02:45:00','hh24:mi:ss'),
                           15,
                           null,
                           null );
insert into entry values ( 5,
                           3,
                           to_date('08:00:00','hh24:mi:ss'),
                           to_date('11:00:00','hh24:mi:ss'),
                           to_date('03:00:00','hh24:mi:ss'),
                           12,
                           null,
                           null );
insert into entry values ( 5,
                           4,
                           to_date('08:00:00','hh24:mi:ss'),
                           to_date('11:15:00','hh24:mi:ss'),
                           to_date('03:15:00','hh24:mi:ss'),
                           13,
                           null,
                           null );

insert into entry values ( 6,
                           1,
                           to_date('14:00:00','hh24:mi:ss'),
                           to_date('15:30:00','hh24:mi:ss'),
                           to_date('01:30:00','hh24:mi:ss'),
                           1,
                           null,
                           null );
insert into entry values ( 6,
                           2,
                           to_date('14:00:00','hh24:mi:ss'),
                           to_date('15:35:00','hh24:mi:ss'),
                           to_date('01:35:00','hh24:mi:ss'),
                           2,
                           null,
                           null );
insert into entry values ( 6,
                           3,
                           to_date('14:00:00','hh24:mi:ss'),
                           to_date('15:40:00','hh24:mi:ss'),
                           to_date('01:40:00','hh24:mi:ss'),
                           3,
                           null,
                           null );

insert into entry values ( 7,
                           1,
                           to_date('16:00:00','hh24:mi:ss'),
                           to_date('17:15:00','hh24:mi:ss'),
                           to_date('01:15:00','hh24:mi:ss'),
                           4,
                           null,
                           null );
insert into entry values ( 7,
                           2,
                           to_date('16:00:00','hh24:mi:ss'),
                           to_date('17:20:00','hh24:mi:ss'),
                           to_date('01:20:00','hh24:mi:ss'),
                           5,
                           null,
                           null );

insert into entry values ( 8,
                           1,
                           to_date('08:00:00','hh24:mi:ss'),
                           to_date('08:50:00','hh24:mi:ss'),
                           to_date('00:50:00','hh24:mi:ss'),
                           6,
                           null,
                           3 );
insert into entry values ( 8,
                           2,
                           to_date('08:00:00','hh24:mi:ss'),
                           to_date('08:55:00','hh24:mi:ss'),
                           to_date('00:55:00','hh24:mi:ss'),
                           7,
                           null,
                           3 );
insert into entry values ( 8,
                           3,
                           to_date('08:00:00','hh24:mi:ss'),
                           to_date('09:00:00','hh24:mi:ss'),
                           to_date('01:00:00','hh24:mi:ss'),
                           8,
                           null,
                           3 );
insert into entry values ( 8,
                           4,
                           to_date('08:00:00','hh24:mi:ss'),
                           null,
                           null,
                           9,
                           null,
                           null );
insert into entry values ( 8,
                           5,
                           to_date('08:00:00','hh24:mi:ss'),
                           to_date('09:05:00','hh24:mi:ss'),
                           to_date('01:05:00','hh24:mi:ss'),
                           10,
                           null,
                           null );
insert into entry values ( 8,
                           6,
                           to_date('08:00:00','hh24:mi:ss'),
                           to_date('09:10:00','hh24:mi:ss'),
                           to_date('01:10:00','hh24:mi:ss'),
                           11,
                           null,
                           null );

insert into entry values ( 11,
                           1,
                           to_date('07:45:00','hh24:mi:ss'),
                           to_date('11:45:00','hh24:mi:ss'),
                           to_date('04:00:00','hh24:mi:ss'),
                           10,
                           null,
                           4 );
insert into entry values ( 11,
                           2,
                           to_date('07:45:00','hh24:mi:ss'),
                           to_date('12:15:00','hh24:mi:ss'),
                           to_date('04:30:00','hh24:mi:ss'),
                           11,
                           null,
                           4 );
insert into entry values ( 11,
                           3,
                           to_date('07:45:00','hh24:mi:ss'),
                           to_date('12:45:00','hh24:mi:ss'),
                           to_date('05:00:00','hh24:mi:ss'),
                           12,
                           null,
                           4 );
insert into entry values ( 11,
                           4,
                           to_date('07:45:00','hh24:mi:ss'),
                           to_date('13:00:00','hh24:mi:ss'),
                           to_date('05:15:00','hh24:mi:ss'),
                           13,
                           null,
                           null );
insert into entry values ( 11,
                           5,
                           to_date('07:45:00','hh24:mi:ss'),
                           to_date('13:30:00','hh24:mi:ss'),
                           to_date('05:45:00','hh24:mi:ss'),
                           14,
                           null,
                           null );
insert into entry values ( 11,
                           6,
                           to_date('07:45:00','hh24:mi:ss'),
                           to_date('14:00:00','hh24:mi:ss'),
                           to_date('06:15:00','hh24:mi:ss'),
                           15,
                           null,
                           null );


-- =======================================
-- TEAM
-- =======================================
insert into team values ( 1,
                          'Coyotes',
                          to_date('22/SEP/2024','DD/MON/YYYY'),
                          1,
                          1 );

insert into team values ( 2,
                          'Sprinters',
                          to_date('05/OCT/2024','DD/MON/YYYY'),
                          3,
                          1 );

insert into team values ( 3,
                          'Runners',
                          to_date('02/FEB/2025','DD/MON/YYYY'),
                          8,
                          1 );

insert into team values ( 4,
                          'Coyotes',
                          to_date('15/MAR/2025','DD/MON/YYYY'),
                          11,
                          1 );

insert into team values ( 5,
                          'Chasers',
                          to_date('29/JUN/2025','DD/MON/YYYY'),
                          5,
                          1 );

update entry
   set
    team_id = 1
 where event_id = 1
   and entry_no = 1;
update entry
   set
    team_id = 1
 where event_id = 1
   and entry_no = 2;
update entry
   set
    team_id = 1
 where event_id = 1
   and entry_no = 3;
update entry
   set
    team_id = 1
 where event_id = 1
   and entry_no = 4;

update entry
   set
    team_id = 2
 where event_id = 3
   and entry_no = 1;
update entry
   set
    team_id = 2
 where event_id = 3
   and entry_no = 2;
update entry
   set
    team_id = 2
 where event_id = 3
   and entry_no = 3;

update entry
   set
    team_id = 3
 where event_id = 8
   and entry_no = 1;
update entry
   set
    team_id = 3
 where event_id = 8
   and entry_no = 2;
update entry
   set
    team_id = 3
 where event_id = 8
   and entry_no = 3;

update entry
   set
    team_id = 4
 where event_id = 11
   and entry_no = 1;
update entry
   set
    team_id = 4
 where event_id = 11
   and entry_no = 2;
update entry
   set
    team_id = 4
 where event_id = 11
   and entry_no = 3;

update entry
   set
    team_id = 5
 where event_id = 5
   and entry_no = 1;

commit;