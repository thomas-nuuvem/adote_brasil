# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Criando animais de exemplo..."

animals_data = [
  {
    name: "Luna",
    species: "dog",
    breed: "Vira-lata",
    age: "2 anos",
    gender: "female",
    size: "medium",
    image: "https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=800&q=80",
    city: "São Paulo",
    state: "SP",
    description: "Luna é uma cachorrinha muito carinhosa e brincalhona. Adora passear e está vacinada e castrada. Perfeita para famílias com crianças!",
    is_vaccinated: true,
    is_neutered: true,
    caregiver_name: "Maria Santos",
    caregiver_whatsapp: "+5511999999999",
    caregiver_instagram: "@abrigo_patinhas"
  },
  {
    name: "Thor",
    species: "dog",
    breed: "Labrador Mix",
    age: "1 ano",
    gender: "male",
    size: "large",
    image: "https://images.unsplash.com/photo-1552053831-71594a27632d?w=800&q=80",
    city: "Rio de Janeiro",
    state: "RJ",
    description: "Thor é um cachorro muito dócil e obediente. Já sabe fazer as necessidades no lugar certo e adora brincar com bola.",
    is_vaccinated: true,
    is_neutered: false,
    caregiver_name: "João Silva",
    caregiver_whatsapp: "+5521988888888",
    caregiver_facebook: "joao.protetor"
  },
  {
    name: "Mia",
    species: "cat",
    breed: "Siamês Mix",
    age: "6 meses",
    gender: "female",
    size: "small",
    image: "https://images.unsplash.com/photo-1574158622682-e40e69881006?w=800&q=80",
    city: "Belo Horizonte",
    state: "MG",
    description: "Mia é uma gatinha muito independente mas carinhosa. Perfeita para apartamentos. Está vacinada e vermifugada.",
    is_vaccinated: true,
    is_neutered: false,
    caregiver_name: "Ana Costa",
    caregiver_instagram: "@gatinhos_bh",
    caregiver_whatsapp: "+5531977777777"
  },
  {
    name: "Bob",
    species: "dog",
    breed: "Poodle",
    age: "5 anos",
    gender: "male",
    size: "small",
    image: "https://images.unsplash.com/photo-1605568427561-40dd23c2acea?w=800&q=80",
    city: "Curitiba",
    state: "PR",
    description: "Bob é um senhor muito educado. Calmo, ideal para pessoas mais tranquilas. Já está castrado e em dia com as vacinas.",
    is_vaccinated: true,
    is_neutered: true,
    caregiver_name: "Carlos Mendes",
    caregiver_whatsapp: "+5541966666666"
  },
  {
    name: "Pipoca",
    species: "cat",
    breed: "Persa Mix",
    age: "3 anos",
    gender: "female",
    size: "medium",
    image: "https://images.unsplash.com/photo-1533738363-b7f9aef128ce?w=800&q=80",
    city: "Salvador",
    state: "BA",
    description: "Pipoca é uma gata muito tranquila e amorosa. Adora colo e se dá bem com outros gatos.",
    is_vaccinated: true,
    is_neutered: true,
    caregiver_name: "Fernanda Lima",
    caregiver_instagram: "@fernanda_resgata",
    caregiver_facebook: "fernanda.lima.gatos"
  },
  {
    name: "Rex",
    species: "dog",
    breed: "Pastor Alemão Mix",
    age: "4 anos",
    gender: "male",
    size: "large",
    image: "https://images.unsplash.com/photo-1589941013453-ec89f33b5e95?w=800&q=80",
    city: "Porto Alegre",
    state: "RS",
    description: "Rex é um cão muito leal e protetor. Ideal para casas com quintal. Precisa de espaço para correr.",
    is_vaccinated: true,
    is_neutered: true,
    caregiver_name: "Roberto Campos",
    caregiver_whatsapp: "+5551955555555"
  },
  {
    name: "Mel",
    species: "cat",
    breed: "SRD",
    age: "1 ano",
    gender: "female",
    size: "small",
    image: "https://images.unsplash.com/photo-1573865526739-10659fec78a5?w=800&q=80",
    city: "Brasília",
    state: "DF",
    description: "Mel é uma gatinha muito brincalhona e ativa. Adora brinquedos e se dá bem com outros animais.",
    is_vaccinated: true,
    is_neutered: false,
    caregiver_name: "Patrícia Souza",
    caregiver_instagram: "@patricia_adota"
  },
  {
    name: "Max",
    species: "dog",
    breed: "Golden Retriever",
    age: "2 anos",
    gender: "male",
    size: "large",
    image: "https://images.unsplash.com/photo-1633722715463-d30f4f325e24?w=800&q=80",
    city: "Campinas",
    state: "SP",
    description: "Max é um golden super dócil e amoroso. Perfeito para famílias com crianças. Adora água e brincadeiras.",
    is_vaccinated: true,
    is_neutered: true,
    caregiver_name: "Lucas Ferreira",
    caregiver_whatsapp: "+5519944444444",
    caregiver_instagram: "@lucas_pets"
  }
]

animals_data.each do |animal_data|
  Animal.find_or_create_by!(name: animal_data[:name], city: animal_data[:city]) do |animal|
    animal.assign_attributes(animal_data)
  end
end

puts "✅ #{Animal.count} animais criados!"
