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

: append-nth ( matrix i elt -- matrix' )
    '[ _ append ] overd change-nth ;

: part-1 ( commands data -- str )
    [
        unclip swap '[
            _ over nths first2 [ pop ] dip push
        ] times
    ] each [ last ] map "" join ;

: part-2 ( commands data -- str )
    [
        first3 spin [ pick 2dup nth ] dip cut*
        ! stack: M t f M b a
        [ -rot set-nth ] [ append-nth ] bi*  ! -rot is deprecated, wha?!
    ] each [ last ] map "" join ;

aoc-input part-1 .

! FWIW, I solved part-2 using Ruby first, stack shuffling is hard
aoc-input part-2 .
