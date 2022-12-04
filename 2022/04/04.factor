USING: io.encodings.utf8 io.files kernel math.intervals math.matrices
math.parser prettyprint ranges sequences splitting ;
IN: 2022.04

: read-input ( path -- seq )
    utf8 file-lines ;

: parse-input ( seq -- ranges )
    [ "," split ] map [ "-" split [ dec> ] map ] matrix-map ;

: input ( -- ranges )
    "input" read-input parse-input ;

: <array2 ( array -- x y )
    dup first swap second ;

: input-to-intervals ( ranges -- intervals )
    [ <array2 [a,b] ] matrix-map ;

: intervals-superset? ( pair -- ? )
    dup <array2 interval-subset? swap <array2 swap interval-subset? or ;

: calc-total ( list -- n )
    [ t = ] count ;

: part-1 ( ranges -- n )
    input-to-intervals [ intervals-superset? ] map calc-total ;

: part-2 ( ranges -- n )
    input-to-intervals [ <array2 intervals-intersect? ] map calc-total ;

input part-1 .
input part-2 .
