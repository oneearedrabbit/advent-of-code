USING: ascii grouping io.encodings.utf8 io.files kernel math
math.matrices math.parser math.vectors prettyprint sequences
sequences.extras sorting splitting vectors ;
IN: 2022.05

: read-input ( path -- seq )
    utf8 file-lines ;

: parse-input ( seq -- data commands )
    { "" } split first2
    ! Data section. Some functions to consider: sift? Shape: { { "G" "T" "R" "W" } ... }
    [ [ 4 group ] map
      but-last flip [ [ LETTER? not ] "" collapse ] matrix-map
      [ [ empty? ] trim reverse >vector ] map ]
    ! Commands section. Shape: { { <blocks:number> <from:number> <to:number> } ... }
    [ [ " " split ] map
      [ dec> ] matrix-map
      [ sift >vector V{ 0 1 1 } v- ] map ]
    bi* ;

: aoc-input ( -- data commands )
    "input" read-input parse-input ;

: part-1 ( commands data -- str )
    [
        unclip swap '[
            _ over nths first2 [ pop ] dip push
        ] times
    ] each [ last ] map "" join ;

aoc-input part-1 .
! part 2 is missing; all my attempts turned out to be ugly, and I gave up
