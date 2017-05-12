-module(element_table).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record = #table{}) -> 
  Header = case Record#table.header of
    undefined -> "";
    H when is_tuple(H) -> H;
    _ -> wf_tags:emit_tag(<<"thead">>, nitro:render(Record#table.header), [])
  end,
  Footer = case Record#table.footer of
    undefined -> "";
    _ -> wf_tags:emit_tag(<<"tfoot">>, nitro:render(Record#table.footer), [])
  end,
  Bodies = case Record#table.body of
    #tbody{} = B -> B;
    undefined -> #tbody{};
    [] -> #tbody{};
    Rows -> [case B of #tbody{}=B1 -> B1; _-> #tbody{body=B} end  || B <- Rows]
  end,
  Caption = case Record#table.caption of
    undefined -> "";
    _ -> wf_tags:emit_tag(<<"caption">>, nitro:render(Record#table.caption), [])
  end,
  Colgroup = case Record#table.colgroup of
    undefined -> "";
    _ -> wf_tags:emit_tag(<<"colgroup">>, nitro:render(Record#table.colgroup), [])
  end,
  wf_tags:emit_tag( <<"table">>, nitro:render([Caption, Colgroup, Header, Footer, Bodies]), [
      ?NITRO_GLOBAL_ATTRIBUTES
      ?NITRO_DATA_ARIA_ATTRIBUTES
  ]).