-module(element_iframe).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"iframe">>, [], [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"height">>,Record#iframe.height},      
        {<<"sandbox">>,Record#iframe.sandbox},      
        {<<"seamless">>, if Record#iframe.seamless == true -> "seamless"; true -> undefined end},
        {<<"src">>,Record#iframe.src},
        {<<"srcdoc">>,Record#iframe.srcdoc},            
        {<<"name">>,Record#iframe.name},
        {<<"width">>,Record#iframe.width}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).