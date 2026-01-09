# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "\n🌱 Starting seed process...\n"

# Load Ukrainian ABC (Буквар) seed data
puts "\n📚 Loading Ukrainian ABC seed data..."
load Rails.root.join('lib', 'seeds', 'ukrainian_abc.rb')

puts "\n✅ Seed data loading completed!\n"
