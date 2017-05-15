-module(element_input_button).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    wf_tags:emit_tag(<<"input">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"autofocus">>,Record#input_button.autofocus},
        {<<"disabled">>, if Record#input_button.disabled == true -> "disabled"; true -> undefined end},
        {<<"name">>,Record#input_button.name},
        {<<"type">>, <<"button">>},
        {<<"value">>, Record#input_button.value}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).