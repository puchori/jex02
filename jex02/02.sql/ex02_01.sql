select * from tbl_board order by bno + 1 desc;

insert into tbl_board (bno, title, content, writer)
(select seq_board.nextval, title, content, writer from tbl_board);

select * from tbl_board order by bno asc;

select /*+INDEX_DESC (tbl_board pk_board) */* from tbl_board; 


select 
    /*+ INDEX_DESC(tbl_board pk_board) */
    *
from
    tbl_board
where bno > 0;

select
 /* +Hint name ( param...) */ column name, ...
From
 table name
 ...
 
 
select /*+ FULL(tbl_board)*/ * from tbl_board order by bno desc;

/* INDEX_ASC, INDEX_DESC */

select /*+ INDEX_ASC(tbl_board pk_board) */ * from tbl_board
where bno > 0;


select /*+ INDEX_DESC(tbl_board pk_board)  */ * from tbl_board
where bno > 0;


/* rowNum */
select /*+ FULL(tbl_board) */
rownum rn, bno, title
from tbl_board where bno > 0
order by bno;

select /*+ INDEX_ASC(tbl_board pk_board) */
rownum rn, bno, title, content
from tbl_board;

select /*+ INDEX_DESC(tbl_board pk_board) */
rownum rn, bno, title, content
from tbl_board
where bno > 0;

select /* +INDEX_DESC(tbl_board pk_board) */
    rownum rn, bno, title, content
from 
    tbl_board
where rownum <= 10;


/* 안됨 1이 반드시 포함이되어야 함 */
select /* +INDEX_DESC(tbl_board pk_board) */
    rownum rn, bno, title, content
from
    tbl_board
where rownum > 10 and rownum <= 20;


/*  */
select /*+INDEX_DESC(tbl_board pk_board)*/
    rownum rn, bno, title, content
from
    tbl_board
where rownum <= 20;


/* in-line-view */
select 
    bno, title, content
from
    (
        select /*+ INDEX_DESC(tbl_board pk_board)*/
            rownum rn, bno, title, content
        from
            tbl_board
        where rownum <= 20
    )
where rn > 10;




