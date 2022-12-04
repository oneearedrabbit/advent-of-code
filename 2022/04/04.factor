USING: io.encodings.utf8 io.files kernel math.intervals math.matrices
math.parser prettyprint ranges sequences splitting ;
IN: 2022.04

: read-input ( path -- seq )
    utf8 file-lines ;

: parse-input ( seq -- ranges )
    [ "," split ] map [ "-" split [ dec> ] map ] matrix-map ;

: aoc-input ( -- ranges )
    "input" read-input parse-input ;

: <array2 ( array -- x y )
    dup first swap second ;

: input-to-intervals ( ranges -- intervals )
    [ <array2 [a,b] ] matrix-map ;

: intervals-superset? ( pair -- ? )
    dup <array2 interval-subset? swap <array2 swap interval-subset? or ;

: calc-total ( list -- n )
    [ t = ] count ;

: part-1 ( -- fn )
    [ intervals-superset? ] ; inline

: part-2 ( -- fn )
    [ <array2 intervals-intersect? ] ; inline

: solution ( ranges fn -- n )
    swap input-to-intervals swap map calc-total ; inline

aoc-input part-1 solution .
aoc-input part-2 solution .
