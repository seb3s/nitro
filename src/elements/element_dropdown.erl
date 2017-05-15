-module(element_dropdown).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record = #dropdown{}) -> 
    Id = nitro:wire_postback(Record),

    Opts = [wf_tags:emit_tag(<<"option">>, [O#option.label], [
        {<<"disabled">>, O#option.disabled},
        {<<"label">>, O#option.label},
        {<<"selected">>, case O#option.selected of true -> <<"selected">>; _-> undefined end},
        {<<"value">>, O#option.value}
    ])|| O = #option{show_if=Visible} <- Record#dropdown.options, Visible == true],

    wf_tags:emit_tag(<<"select">>, Opts, [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"name">>, Record#dropdown.name},
        {<<"disabled">>, case Record#dropdown.disabled of true -> <<"disabled">>; _-> undefined end},
        {<<"multiple">>, case Record#dropdown.multiple of true -> <<"multiple">>; _-> undefined end}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).