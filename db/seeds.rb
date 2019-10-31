# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Warrior.destroy_all
Weapon.destroy_all



warriors = [
  {name: "Nain sauvage", life: 115, attack_point: 15, dexterity_points: 25, picture: "https://picsum.photos/id/805/50/50" },
  {name: "Orc pâle", life: 80, attack_point: 10, dexterity_points: 10, picture: "https://picsum.photos/id/805/50/50" },
  {name: "Mouche géante", life: 400, attack_point: 2, dexterity_points: 5, picture: "https://picsum.photos/id/805/50/50" },
]

warriors.each do |warrior|
  Warrior.create!(warrior)
end

weapons = [
  {name: "Epée", attack_bonus: 9, life_bonus: 0},
  {name: "Sabre", attack_bonus: 4, life_bonus: 0},
  {name: "Lance", attack_bonus: 3, life_bonus: 0},
  {name: "Bouclier", attack_bonus: 0, life_bonus: 80},
]

weapons.each do |weapon|
  Weapon.create!(weapon)
end

