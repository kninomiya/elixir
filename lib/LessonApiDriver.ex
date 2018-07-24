defmodule Lesson.ApiDriver do
    @cx "/*CSE ID*/"
    @apikey "/*API KEY*/"
    def searchImage(nil), do: []
    def searchImage(keyword) do
        tesla = GoogleApi.CustomSearch.V1.Connection.new
        case GoogleApi.CustomSearch.V1.Api.Cse.search_cse_list(
            tesla,
            keyword,
            [
                {:cx, @cx },
                {:key, @apikey },
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
