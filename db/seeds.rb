require 'csv'

# Pokemons seeder
if Pokemon.count == 0
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
end


# Moves seeder
if Move.count == 0
  moves_table = CSV.parse(File.open('./moves.csv'), headers: true)
  moves_table.each do |move_data|
    puts "Seeding Move Data: #{move_data['Name']}"
    next if move_data['Name'].blank?
    move = Move.new

    move.name = move_data['Name']
    move.type = move_data['Type'].downcase
    move.category = move_data['Category']
    move.contest = move_data['Contest']&.downcase
    move.power_points = move_data['PP']
    move.power = move_data['Power']
    move.accuracy_percent = move_data['Accuracy']

    case move_data['Gen']
    when 'I'
      move.generation = 1
    when 'II'
      move.generation = 2
    when 'III'
      move.generation = 3
    when 'IV'
      move.generation = 4
    when 'V'
      move.generation = 5
    when 'VI'
      move.generation = 6
    when 'VII'
      move.generation = 7
    when 'VIII'
      move.generation = 8
    end

    move.save!
  end
end
