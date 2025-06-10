/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-rm-json.sql

--Student ID: 34680535
--Student Name: Jinghao Xu


/* Comments for your marker:




*/


-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

--SET PAGESIZE 200
select
    json_object(
        '_id' value t.team_id,
                'carn_name' value c.carn_name,
                'carn_date' value to_char(
            c.carn_date,
            'DD-MON-YYYY'
        ),
                'team_name' value t.team_name,
                'team_leader' value
            json_object(
                'name' value
                    case
                        when leader.comp_fname is null
                           and leader.comp_lname is null then
                            '-'
                        when leader.comp_fname is null then
                            trim(leader.comp_lname)
                        when leader.comp_lname is null then
                            trim(leader.comp_fname)
                        else
                            trim(leader.comp_fname)
                            || ' '
                            || trim(leader.comp_lname)
                    end,
                        'phone' value nvl(
                    leader.comp_phone,
                    '-'
                ),
                        'email' value nvl(
                    leader.comp_email,
                    '-'
                )
            ),
                'team_no_of_members' value(
            select count(distinct e2.comp_no)
              from entry e2
             where e2.team_id = t.team_id
        ),
                'team_members' value json_arrayagg(
            json_object(
                'competitor_name' value
                    case
                        when comp.comp_fname is null
                           and comp.comp_lname is null then
                            '-'
                        when comp.comp_fname is null then
                            trim(comp.comp_lname)
                        when comp.comp_lname is null then
                            trim(comp.comp_fname)
                        else
                            trim(comp.comp_fname)
                            || ' '
                            || trim(comp.comp_lname)
                    end,
                        'competitor_phone' value nvl(
                    comp.comp_phone,
                    '-'
                ),
                        'event_type' value nvl(
                    et.eventtype_desc,
                    '-'
                ),
                        'entry_no' value e.entry_no,
                        'starttime' value nvl(
                    to_char(
                        e.entry_starttime,
                        'HH24:MI:SS'
                    ),
                    '-'
                ),
                        'finishtime' value nvl(
                    to_char(
                        e.entry_finishtime,
                        'HH24:MI:SS'
                    ),
                    '-'
                ),
                        'elapsedtime' value nvl(
                    to_char(
                        e.entry_elapsedtime,
                        'HH24:MI:SS'
                    ),
                    '-'
                )
            )
        )
    format json)
    || ','
  from team t
  join carnival c
on t.carn_date = c.carn_date
  join entry leader_entry
on t.event_id = leader_entry.event_id
   and t.entry_no = leader_entry.entry_no
  join competitor leader
on leader_entry.comp_no = leader.comp_no
  join entry e
on e.team_id = t.team_id
  join competitor comp
on e.comp_no = comp.comp_no
  join event ev
on e.event_id = ev.event_id
  join eventtype et
on ev.eventtype_code = et.eventtype_code
 group by t.team_id,
          c.carn_name,
          c.carn_date,
          t.team_name,
          leader.comp_fname,
          leader.comp_lname,
          leader.comp_phone,
          leader.comp_email
 order by t.team_id;