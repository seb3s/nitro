-module(element_embed).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"embed">>, [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"height">>,Record#embed.height},      
        {<<"src">>,Record#embed.src},
        {<<"type">>,Record#embed.type},
        {<<"width">>,Record#embed.width}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).