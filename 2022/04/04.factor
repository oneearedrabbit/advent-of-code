USING: io.encodings.utf8 io.files kernel math.matrices math.parser
prettyprint ranges sequences sets sets.extras splitting ;
IN: 2022.04

: read-input ( path -- seq )
    utf8 file-lines ;

: parse-input ( seq -- seq )
    [ "," split ] map
    [ "-" split [ dec> ] map
      first2 [a..b] ]
    matrix-map ;

: aoc-input ( -- seq )
    "input" read-input parse-input ;

: part-1 ( seq -- n )
    [ first2 [ subset? ] [ superset? ] 2bi or ] count ;

: part-2 ( seq -- n )
    [ first2 intersects? ] count ;

aoc-input part-1 .
aoc-input part-2 .
