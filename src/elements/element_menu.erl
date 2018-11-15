-module(element_menu).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"menu">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"label">>, Record#menu.label},
        {<<"type">>, case nitro:to_binary(Record#menu.type) of
            <<"toolbar">> -> <<"toolbar">>;
            <<"context">> -> <<"context">>;
            _ -> undefined end}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).