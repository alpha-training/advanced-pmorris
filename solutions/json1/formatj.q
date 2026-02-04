copy:read0[`:qi.copy.json]

formatj:{[indent;flat]
    p:ssr[flat; "\":"; "\": "];
    p:ssr[p; ","; ",\n "];
    p:ssr[p; "{"; "{\n "];
    p:ssr[p; "}"; "\n}"];
    p:"[\n " sv "[" vs p;
    p:"\n]" sv "]" vs p;
    split:"\n" vs p;
    split:ltrim split;
    plusInd:sums prev last each split in "{[";
    negInd:sums sum each split in "}]";
    ind:plusInd-negInd;
    (raze each ind #\: enlist indent),'split
    }