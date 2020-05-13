module TypeBadgesHelper
  def multiple_type_badges_of(types)
    pokemon_types = types.map do |type|
      link_to type.upcase, '#', class: "type-icon type-#{type}"
    end
    pokemon_types.join("&nbsp;").html_safe
  end
end
