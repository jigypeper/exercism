defmodule Username do
  def sanitize(~c""), do: []
  
  def sanitize([head | tail]) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    
    case head do
      head when head == ?ä -> 'ae' ++ sanitize(tail)
      head when head == ?ö -> 'oe' ++ sanitize(tail)
      head when head == ?ü -> 'ue' ++ sanitize(tail)
      head when head == ?ß -> 'ss' ++ sanitize(tail)
      head when head in ?0..?9 -> sanitize(tail)
      head when head in [?*, ?., ?!, ?$, ?%, ?\s] -> sanitize(tail)
      head when head == ?\_ -> [head | sanitize(tail)]
      head when head in ?a..?z -> [head | sanitize(tail)]
      _ -> []
    end
    
  end
end
