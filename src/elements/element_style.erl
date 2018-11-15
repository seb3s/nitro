-module(element_style).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"style">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"media">>, Record#style.media},
        {<<"scoped">>, case Record#style.scoped of true -> <<"scoped">>; _ -> undefined end},
        {<<"type">>, Record#style.type}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).