USING: arrays combinators io.encodings.utf8 io.files kernel math
math.matrices math.parser prettyprint sequences sorting
splitting ;
IN: 2022.08

: read-input ( path -- seq )
    utf8 file-lines ;

: parse-input ( seq -- matrix )
    [ >array ] map ;

: left ( matrix y x -- seq )
    [ swap nth ] dip head reverse ;

: right ( matrix y x -- seq )
    [ swap nth ] dip 1 + tail ;

: up ( matrix y x -- seq )
    [ head ] dip [ swap nth ] curry map reverse ;

: down ( matrix y x -- seq )
    [ 1 + tail ] dip [ swap nth ] curry map ;

: aoc-input ( -- matrix )
    "input" read-input parse-input ;

: part-1 ( matrix -- n )
    dup [ -roll rot
          [ { [ up ] [ down ] [ left ] [ right ] } 3cleave 4array ] dip
          [ [ < ] curry all? ] curry any? 1 0 ?  ! this fn could be parameterized, stack shuffling is hard
    ] curry matrix-map-index
    [ sum ] map-sum ;

aoc-input part-1 .  ! => 1708
! no part-2, need to optimize the solution first
