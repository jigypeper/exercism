defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.first()
  end

  def initial(name) do
    name
    |> String.capitalize()
    |> first_letter()
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    first = full_name
    |> String.split()
    |> hd()
    |> initial()
    last = full_name
    |> String.split()
    |> tl()
    |> hd()
    |> initial()
    
    first
    |> Kernel.<>(" ")
    |> Kernel.<>(last)
    
  end

  def pair(full_name1, full_name2) do
    # ❤-------------------❤
    # |  X. X.  +  X. X.  |
    # ❤-------------------❤
    first = initials(full_name1)
    second = initials(full_name2)
    """
    ❤-------------------❤
    |  #{first}  +  #{second}  |
    ❤-------------------❤
    """
    
    
  end
end
