-module(element_video).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"video">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"autoplay">>, case Record#video.autoplay of true -> "autoplay"; _ -> undefined end},      
        {<<"controls">>, case Record#video.controls of true -> "controls"; _ -> undefined end},      
        {<<"height">>, Record#video.height},      
        {<<"loop">>, case Record#video.loop of true -> "loop"; _ -> undefined end},            
        {<<"mediagroup">>, Record#video.mediagroup},      
        {<<"muted">>, case Record#video.muted of true -> "muted"; _ -> undefined end},
        {<<"poster">>, Record#video.poster},      
        {<<"preload">>, case Record#video.preload of "auto" -> "auto"; "none" -> "none"; "metadata" -> "metadata"; _ -> undefined end},
        {<<"src">>, Record#video.src},     
        {<<"width">>, Record#video.width}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).