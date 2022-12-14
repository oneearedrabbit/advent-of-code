USING: ascii grouping io.encodings.utf8 io.files kernel math
math.matrices prettyprint sequences sets splitting ;
IN: 2022.03

: read-input ( path -- seq )
    utf8 file-lines ;

: input ( -- seq )
    "input" read-input ;

: priority ( char -- num )
    [ LETTER? 26 0 ? ] [ ch>lower 96 - ] bi + ;

: part-1 ( seq -- n )
    [ halves intersect first priority ] map-sum ;

: part-2 ( seq -- n )
    3 group [ intersect-all first priority ] map-sum ;

input part-1 .
input part-2 .
