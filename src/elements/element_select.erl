-module(element_select).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record = #select{}) ->
    case element(#element.postback, Record) of
        undefined -> Id = element(#element.id, Record);
        Postback ->
            Id = case element(#element.id, Record) of undefined -> nitro:temp_id(); I -> I end,
            nitro:wire(#event{type=change, postback=Postback, target=Id,
                source=[nitro:to_atom(Id)], delegate=element(#element.delegate, Record) })
    end,
    wf_tags:emit_tag(<<"select">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"name">>, Record#select.name},
        {<<"required">>, case Record#select.required of true -> <<"required">>; _-> undefined end},
        {<<"disabled">>, case Record#select.disabled of true -> <<"disabled">>; _-> undefined end},
        {<<"multiple">>, case Record#select.multiple of true -> <<"multiple">>; _-> undefined end}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]);

render_element(Record = #optgroup{}) ->
    wf_tags:emit_tag(<<"optgroup">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"disabled">>, case Record#optgroup.disabled of true-> <<"disabled">>; _-> undefined end},
        {<<"label">>, Record#optgroup.label}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]);

render_element(Record = #option{}) ->
    wf_tags:emit_tag(<<"option">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"disabled">>, case Record#option.disabled of true -> <<"disabled">>; _-> undefined end},
        {<<"label">>, Record#option.label},
        {<<"selected">>, case Record#option.selected of true -> <<"selected">>; _-> undefined end},
        {<<"value">>, Record#option.value}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).