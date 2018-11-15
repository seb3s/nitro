-module(element_audio).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"audio">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"autoplay">>, case Record#audio.autoplay of true -> <<"autoplay">>; _ -> undefined end},
        {<<"controls">>, case Record#audio.controls of true -> <<"controls">>; _ -> undefined end},
        {<<"loop">>, case Record#audio.loop of true -> <<"loop">>; _ -> undefined end},
        {<<"mediagroup">>, Record#audio.mediagroup},
        {<<"muted">>, case Record#audio.muted of true -> <<"muted">>; _ -> undefined end},
        {<<"preload">>, case nitro:to_binary(Record#audio.preload) of
            <<"auto">> -> <<"auto">>;
            <<"none">> -> <<"none">>;
            <<"metadata">> -> <<"metadata">>;
            _ -> undefined end},
        {<<"src">>, Record#audio.src},
        {<<"width">>, Record#audio.width}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).