-module(element_link).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) -> 
    case element(#element.postback, Record) of
        undefined -> Id = element(#element.id, Record);
        Postback ->
            Id = case element(#element.id, Record) of undefined -> nitro:temp_id(); I -> I end,
            nitro:wire(#event{type=click, postback=Postback, target=Id,
                source=element(#element.source, Record), delegate=element(#element.delegate, Record),
                validation=element(#element.validate, Record)})
    end,
    wf_tags:emit_tag(<<"a">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"href">>, nitro:coalesce([Record#link.href,Record#link.url])},
        {<<"hreflang">>, Record#link.hreflang},
        {<<"target">>, Record#link.target},
        {<<"media">>, Record#link.media},
        {<<"rel">>, Record#link.rel},
        {<<"type">>, Record#link.type},
        {<<"download">>, Record#link.download},
        {<<"name">>, Record#link.name},
        {<<"onclick">>, Record#link.onclick},
        {<<"onmouseover">>, Record#link.onmouseover}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).