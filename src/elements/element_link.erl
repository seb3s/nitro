-module(element_link).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) -> 
    Id = case Record#link.postback of
        undefined -> Record#link.id;
        Postback ->
            ID = case Record#link.id of undefined -> nitro:temp_id(); I -> I end,
            nitro:wire(#event{ type=click,postback=Postback,target=ID,
                            source=Record#link.source,delegate=Record#link.delegate,validation=Record#link.validate}),
            ID end,
    List = [
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
    ],
    wf_tags:emit_tag(<<"a">>, nitro:render(Record#link.body), List).