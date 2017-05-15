-module(element_track).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"track">>, [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"default">>, case Record#track.default of true -> "default"; _ -> undefined end},
        {<<"kind">>, case Record#track.kind of "subtitles" -> "subtitles"; "captions" -> "captions"; "descriptions" -> "descriptions"; "chapters" -> "chapters"; "metadata" -> "metadata"; _ -> undefined end},
        {<<"label">>, Record#track.label},
        {<<"src">>, Record#track.src},
        {<<"srclang">>, Record#track.srclang}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).