json.array!(@ideas) do |idea|
  json.extract! idea, :name, :description, :number_of_likes, :number_of_dislikes, :state, :board_id
  json.url idea_url(idea, format: :json)
end