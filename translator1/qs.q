/ qs.q

func.add:{x+y}
func.add3:{x+y+z}

parsef:{[p]
    f:l where not (fir in " /")|null fir:first each l:read0 p;
    replace:{x:ssr[x;",";";"];
        x:ssr[x;"(";"["];
        x:ssr[x;")";"]"];
        x:ssr[x;"\t";""]};
    g:replace each f;
    txt:(m:"S=*"0:/:g)[;1];
    txt:first each txt;
    funcs:string 1_key func;
    vrs:raze m[;0];
	txt2:{$[first (x like "*",(y),"*")&not x like "*[A-z|.]",(y),"*";x:ssr[x;y;"func.",y];x]}/[;funcs]each txt;
    {$[x like "*func.",(y),"[[]*";
        $[(sum x in ";")<>-1+count (get func`$y)[1];
            '"Too many arguments provided: ",x;x];x]}/[;funcs]each txt2;
    printout:(string vrs),'(":",/:txt2);
    badExErr:printout where (sum each printout in "[]") mod 2;
    if[0<>count badExErr;'"Badly formed expression: ",first badExErr];
    -1 printout;
    }

p:`:translator1/test1.qs
p2:`:translator1/test2.qs
p3:`:translator1/test3.qs