USING: assocs io io.encodings.utf8 io.files kernel math.matrices
math.parser prettyprint sequences sorting splitting locals.types ;
IN: 2022.02

CONSTANT: moves { { "A" 0 } { "B" 1 } { "C" 2 } { "X" 0 } { "Y" 1 } { "Z" 2 } }

: read-input ( path -- seq )
    utf8 file-lines ;

: parse-input ( seq -- turns )
    [ " " split ] map ;

: input ( -- turns )
    "input" read-input parse-input ;

: score ( turn dict -- n )
    swap [ moves at ] map swap matrix-nth ;

! TODO: I think this could be improved by using curry

: game-1 ( turns -- n )
    [ { { 4 8 3 } { 1 5 9 } { 7 2 6 } } score ] map-sum ;

: game-2 ( turns -- n )
    [ { { 3 4 8 } { 1 5 9 } { 2 6 7 } } score ] map-sum ;

input game-1 .  ! => 12535
input game-2 .  ! => 15457
