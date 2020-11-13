-- ORACLE SQL

-- use the -1 to control how many previous months ago

select
    ADD_MONTHS(LAST_DAY(TRUNC(SYSDATE)),-1)
    - DECODE(to_char(ADD_MONTHS(LAST_DAY(TRUNC(SYSDATE)),-1),'d'), '1', 2, '7', 1, 0) last_bus_day
from dual
;
