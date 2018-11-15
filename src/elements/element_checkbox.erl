-module(element_checkbox).
-author('Rusty Klophaus, Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = case Record#checkbox.id of undefined -> nitro:temp_id(); I->I end,
    case Record#checkbox.postback of
        undefined -> ignore;
        Postback -> nitro:wire(#event { type=change, postback=Postback, target=Id, source=Record#checkbox.source, delegate=Record#checkbox.delegate })
    end,
    Label = [ wf_tags:emit_tag(<<"input">>, [], [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"autofocus">>,Record#checkbox.autofocus},
        {<<"checked">>, if Record#checkbox.checked == true -> <<"checked">>; true -> undefined end},
        {<<"data-toggle">>, <<"checkbox">>},
        {<<"disabled">>, if Record#checkbox.disabled == true -> <<"disabled">>; true -> undefined end},
        {<<"form">>, Record#checkbox.form},
        {<<"name">>, Record#checkbox.name},
        {<<"required">>, if Record#checkbox.required == true -> <<"required">>; true -> undefined end},
        {<<"type">>, <<"checkbox">>},
        {<<"value">>, Record#checkbox.value}
        ?NITRO_DATA_ARIA_ATTRIBUTES
        ]),
        case Record#checkbox.body of undefined -> []; B -> B end
    ],
    wf_tags:emit_tag(<<"label">>, nitro:render(Label), [
        {<<"class">>, Record#checkbox.class},
        {<<"style">>, Record#checkbox.style},
        {<<"for">>, Id} ]).