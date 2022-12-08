USING: arrays assocs combinators grouping.extras
io.encodings.utf8 io.files kernel math math.matrices math.parser
multiline peg.ebnf prettyprint sequences sorting splitting
strings ;
IN: 2022.07

EBNF: bash [=[
                name = [a-z./]+ => [[ >string ]]
                size = [0-9]+ => [[ dec> ]]
                cd = "$ cd "~ name => [[ "cd" 2array ]]
                ls = "$ ls"~ => [[ { "ls" } ]]
                dir = "dir "~ name => [[ "dir" 2array ]]
                file = size " "~ name~ => [[ "file" 2array ]]
                command = cd|ls|dir|file
            ]=]

: read-input ( path -- seq )
    utf8 file-lines ;

: parse-input ( seq -- seq' )
    [ bash ] map ;

: aoc-input ( -- seq )
    "input" read-input parse-input ;

: tree ( seq -- tree )
    [ V{ } clone V{ } clone ] dip [
        unclip-last {
            ! stack: sizes, current-folder, args
            { "cd" [ first dup ".." = [ drop dup pop* ] [ over push ] if ] }
            { "ls" [ drop ] }
            { "dir" [ drop ] }
            { "file" [
                  first 2over head-clump swap 
                  [ [ "/" join ] dip at+ ] curry with each

                  ! one word shorter, but uses swap in the quot
                  ! first 2over head-clump  
                  ! [ swap [ "/" join ] dip at+ ] 2with each
              ] }
        } case
    ] each drop ;

: part-1 ( seq -- n )
    tree values [ 100,000 <= ] filter sum ;

: part-2 ( seq -- n )
    tree [ "/" of 40,000,000 - ]
    [ values [ <= ] with filter infimum ] bi ;

aoc-input part-1 .  ! => 1086293
aoc-input part-2 .  ! => 366028
