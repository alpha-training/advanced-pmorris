\d .qs
HEADERS:string`vars`state`indicators`enter`signal_exit`stop_loss`take_profit`time_stop`trailing_stop`exit_policy`execution

/ entry function
l:{[p]
	f:read0 p;
    lines:-1_'(where f in HEADERS,\:":")_f;
    processSection each lines;
 }

processSection:{[x]
    -1"processing ",-1_first x;
    -1 each 1_x;
    :();
  }