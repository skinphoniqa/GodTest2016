select
  ALL_TAB_COLUMNS.*
from ALL_TAB_COLUMNS
where 1 = 1
  and ALL_TAB_COLUMNS.OWNER = 'US_GODCOM351OBJ'
  and ALL_TAB_COLUMNS.TABLE_NAME = 'COMTNEMPLYRINFO' /* 업무사용자 */
;
