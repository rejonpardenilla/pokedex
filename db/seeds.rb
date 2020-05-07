require 'csv'

pokemons_table = CSV.parse(File.open('./pokemon.csv'), headers: true)
pokemons_table.each do |pokemon_data|
  puts "Seeding Pokemon Data: #{pokemon_data['Name']}"
  next if pokemon_data['Name'].blank?
  pokemon = Pokemon.new

  pokemon.pokedex_identifier = pokemon_data['#']
  pokemon.name = pokemon_data['Name']
  pokemon.mega = pokemon_data['Name'].include? 'Mega'
  pokemon.type_1 = pokemon_data['Type1'].downcase
  pokemon.type_2 = pokemon_data['Type2'].downcase if pokemon_data['Type2'].present?
  pokemon.hp = pokemon_data['HP'].to_i
  pokemon.attack = pokemon_data['Attack'].to_i
  pokemon.defense = pokemon_data['Defense'].to_i
  pokemon.special_attack = pokemon_data['Sp.Atk'].to_i
  pokemon.special_defense = pokemon_data['Sp.Def'].to_i
  pokemon.speed = pokemon_data['Speed'].to_i
  pokemon.generation = pokemon_data['Generation'].to_i
  pokemon.legendary = pokemon_data['Legendary'].include? 'True'

  pokemon.save!
end
