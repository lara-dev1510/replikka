json.results render(partial: "pages/pieces-result", formats: :html, locals: {query: @query, pieces: @pieces, grouped_pieces: @grouped_pieces})
