-module (element_submit).
-author('Andrew Zadorozhny').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    case Record#submit.click of
         undefined -> ignore;
         ClickActions -> nitro:wire(#event { target=Id, type=click, actions=ClickActions }) 
    end,
    wf_tags:emit_tag(<<"input">>, [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"type">>, <<"submit">>},
        {<<"value">>, Record#submit.body}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).