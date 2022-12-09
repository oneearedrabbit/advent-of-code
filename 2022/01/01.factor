USING: io.encodings.utf8 io.files math.matrices math.parser
prettyprint sequences sorting splitting ;
IN: 2022.01

: read-input ( path -- seq )
    utf8 file-lines ;

: parse-input ( seq -- matrix )
    { "" } split [ dec> ] matrix-map ;

: input ( -- matrix )
    "input" read-input parse-input ;

: part-1 ( matrix' -- n )
    [ sum ] map supremum ;

: part-2 ( matrix -- n )
    [ sum ] map { 0 1 2 } kth-largests sum ;

input part-1 .
input part-2 .
