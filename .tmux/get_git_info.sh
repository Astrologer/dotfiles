#!/bin/bash
dir=$(tmux display-message -p '#{pane_current_path}')
git -C $dir status >/dev/null 2>&1
if [ $? -eq 0 ]; then
    branch_name=$(git -C $dir symbolic-ref --short HEAD)
    project_name=$(git -C $dir rev-parse --show-toplevel)
    project_name=$(echo $project_name | rev | cut -d / -f 1 | rev)
    echo [$project_name] $branch_name
fi

# 	0	1	2	3	4	5	6	7	8	9	A	B	C	D	E	F
#U+260x	☀	☁	☂	☃	☄	★	☆	☇	☈	☉	☊	☋	☌	☍	☎	☏ 
#U+261x	☐	☑	☒	☓	☔	☕	☖	☗	☘	☙	☚	☛	☜	☝	☞	☟ 
#U+262x	☠	☡	☢	☣	☤	☥	☦	☧	☨	☩	☪	☫	☬	☭	☮	☯ 
#U+263x	☰	☱	☲	☳	☴	☵	☶	☷	☸	☹	☺	☻	☼	☽	☾	☿ 
#U+264x	♀	♁	♂	♃	♄	♅	♆	♇	♈	♉	♊	♋	♌	♍	♎	♏ 
#U+265x	♐	♑	♒	♓	♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟ 
#U+266x	♠	♡	♢	♣	♤	♥	♦	♧	♨	♩	♪	♫	♬	♭	♮	♯ 
#U+267x	♰	♱	♲	♳	♴	♵	♶	♷	♸	♹	♺	♻	♼	♽	♾	♿ 
#U+268x	⚀	⚁	⚂	⚃	⚄	⚅	⚆	⚇	⚈	⚉	⚊	⚋	⚌	⚍	⚎	⚏ 
#U+269x	⚐	⚑	⚒	⚓	⚔	⚕	⚖	⚗	⚘	⚙	⚚	⚛	⚜	⚝	⚞	⚟ 
#U+26Ax	⚠	⚡	⚢	⚣	⚤	⚥	⚦	⚧	⚨	⚩	⚪	⚫	⚬	⚭	⚮	⚯ 
#U+26Bx	⚰	⚱	⚲	⚳	⚴	⚵	⚶	⚷	⚸	⚹	⚺	⚻	⚼	⚽	⚾	⚿ 
#U+26Cx	⛀	⛁	⛂	⛃	⛄	⛅	⛆	⛇	⛈	⛉	⛊	⛋	⛌	⛍	⛎	⛏ 
#U+26Dx	⛐	⛑	⛒	⛓	⛔	⛕	⛖	⛗	⛘	⛙	⛚	⛛	⛜	⛝	⛞	⛟ 
#U+26Ex	⛠	⛡	⛢	⛣	⛤	⛥	⛦	⛧	⛨	⛩	⛪	⛫	⛬	⛭	⛮	⛯ 
#U+26Fx	⛰	⛱	⛲	⛳	⛴	⛵	⛶	⛷	⛸	⛹	⛺	⛻	⛼	⛽	⛾	⛿ 
#		✉ 
