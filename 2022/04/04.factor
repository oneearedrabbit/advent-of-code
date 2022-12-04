USING: io.encodings.utf8 io.files kernel math.intervals math.matrices
math.parser prettyprint ranges sequences splitting ;
IN: 2022.04

: read-input ( path -- seq )
    utf8 file-lines ;

: <array2 ( array -- x y )
    dup first swap second ;

: parse-input ( seq -- ranges )
    [ "," split ] map [ "-" split [ dec> ] map ] matrix-map ;

: aoc-input ( -- ranges )
    "input" read-input parse-input ;

: input-to-intervals ( ranges -- intervals )
    [ <array2 [a,b] ] matrix-map ;

: intervals-superset? ( pair -- ? )
    dup <array2 interval-subset? swap <array2 swap interval-subset? or ;

: part-1 ( -- fn )
    [ intervals-superset? ] ; inline

: part-2 ( -- fn )
    [ <array2 intervals-intersect? ] ; inline

: solution ( ranges fn -- n )
    swap input-to-intervals swap count ; inline

aoc-input part-1 solution .
aoc-input part-2 solution .
