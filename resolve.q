.conf.v1:100
s:"$ENV1"
s2:"Hey$ENV1THERE"
s3:"Hey$ENV1/THERE"
s4:"This is $ENV1 which is .conf.v1 and running on .z.o. But what is not needed is $ENV2 or .conf.v3"

\d .qi

resolve:{[x]
    o:x in "$/ ";
    l:(asc 0,(where o),ss[x;". "])_x;
    if[0=count first l;l:1_l];
    l[ds]:getenv`$1_'l[ds:where first each l in "$"];
    l[fs]:ltrim l[fs:where (1<>count each l)&"." in 'l];
    l[fs]:{" ",string @[get;x;{`MISSING}]}each ltrim l[fs];
    if[any z:0=count each l;l[where z]:enlist"MISSING"];
    raze l
    }

\d .