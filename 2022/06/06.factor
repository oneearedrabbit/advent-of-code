USING: grouping io.encodings.utf8 io.files kernel math
prettyprint sequences sets sorting splitting ;
IN: 2022.06

: read-input ( path -- seq )
    utf8 file-contents ;

: aoc-input ( -- seq )
    "input" read-input ;

: solution ( n seq -- n )
    [ clump [ all-unique? ] find drop ] [ + ] bi ;

: part-1 ( seq -- n )
    4 solution ;

: part-2 ( seq -- n )
    14 solution ;

aoc-input part-1 .
aoc-input part-2 .
