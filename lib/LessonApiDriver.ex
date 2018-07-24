defmodule Lesson.ApiDriver do
    def searchImage(keyword) do
        tesla = GoogleApi.CustomSearch.V1.Connection.new
        case GoogleApi.CustomSearch.V1.Api.Cse.search_cse_list(
            tesla,
            keyword,
            [
                {:cx, "013595435806448571340:qrcz-ciehnm"},
                {:key, "AIzaSyBDBmhYu2qeGV_Gx1TaVvfKQkhzyHib3o0"},
                {:search_type, "image"},
                {:lr, "lang_ja"}, {:num, "2"}
            ]
        ) do
        {:ok, contents} -> 
            contents.items
            |> Enum.map(&(&1.pagemap["cse_image"])) 
            |> Enum.map(&( Enum.at(&1,0)["src"] ))
        _ -> raise "Search Image Error"
        end
    end
end