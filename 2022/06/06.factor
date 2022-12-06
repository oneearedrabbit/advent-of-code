USING: grouping io.encodings.utf8 io.files kernel math
prettyprint sequences sets sorting splitting ;
IN: 2022.06

: read-input ( path -- seq )
    utf8 file-lines ;

: parse-input ( seq -- seq )
    first ;

: aoc-input ( -- seq )
    "input" read-input parse-input ;

: solution ( n seq -- n )
    dup -rot <clumps> [ all-unique? ] find drop + ;

: part-1 ( seq -- n )
    4 solution ;

: part-2 ( seq -- n )
    14 solution ;

aoc-input part-1 .
aoc-input part-2 .
