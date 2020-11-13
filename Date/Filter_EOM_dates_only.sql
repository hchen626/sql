-- Oracle - suppose you need filter for end of month dates only
-- use where extract(day from (date_column +1))=1

-- Logic is add 1 day to see if date is the first of the next month
-- if so, success!

-- This work work for Oracle 12c
-- select * from v$version;

select
    a.*,
    case when extract(day from (date_test + 1))=1 then 'Y' ELSE 'N' END AS eom_date_flag
from
(
    select add_months(last_day(trunc(sysdate)),-1) as date_test from dual union
    select add_months(last_day(trunc(sysdate)),-1) 
           - decode(to_char(add_months(last_day(trunc(sysdate)),-1),'d'),'1', 2, '7', 1, 0) as date_test from dual

) a
where extract(day from (date_test + 1))=1 -- filter used to only show only End of Month dates
;

