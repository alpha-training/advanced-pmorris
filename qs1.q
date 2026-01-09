\d .qs
HEADERS:string`vars`state`indicators`enter`signal_exit`stop_loss`take_profit`time_stop`trailing_stop`exit_policy`execution

/ entry function
l:{[p]
    f:read0 p;
    fheads:f[where raze (-1#'f in ":")&not 1#'f in " "];
    heads:HEADERS,\:":";
    if[not all heads in fheads;
        bad:fheads except heads;
        '"invalid header(s): "," " sv bad]
    lines:-1_'(where f in heads)_f;
    processSection each lines;
 }

processSection:{[x]
    -1"processing ",-1_first x;
    -1 each 1_x;
    :();
  }