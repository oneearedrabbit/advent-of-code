USING: assocs io io.encodings.utf8 io.files kernel math.matrices
math.parser prettyprint sequences sorting splitting locals.types ;
IN: 2022.02

: read-input ( path -- seq )
    utf8 file-lines ;

: parse-input ( seq -- turns )
    [ " " split ] map ;

: aoc-input ( -- turns )
    "input" read-input parse-input ;

: score ( turn dict -- n )
    swap [ { { "A" 0 } { "B" 1 } { "C" 2 } { "X" 0 } { "Y" 1 } { "Z" 2 } } at ] map swap matrix-nth ;

: game ( moves turns -- n )
    [ score ] curry map-sum ;

: part-1 ( turns -- n )
    { { 4 8 3 } { 1 5 9 } { 7 2 6 } } game ;

: part-2 ( turns -- n )
    { { 3 4 8 } { 1 5 9 } { 2 6 7 } } game ;

aoc-input part-1 .  ! => 12535
aoc-input part-2 .  ! => 15457
