class Animal < ApplicationRecord
  # Enums
  enum :species, { dog: 0, cat: 1, other: 2 }
  enum :gender, { male: 0, female: 1 }
  enum :size, { small: 0, medium: 1, large: 2 }

  # Validations
  validates :name, presence: true
  validates :species, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :size, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :description, presence: true
  validates :caregiver_name, presence: true

  # Scopes
  scope :by_species, ->(species) { where(species: species) if species.present? }
  scope :by_size, ->(size) { where(size: size) if size.present? }
  scope :by_gender, ->(gender) { where(gender: gender) if gender.present? }
  scope :search, ->(term) {
    return all if term.blank?
    where("name LIKE :term OR city LIKE :term OR state LIKE :term", term: "%#{term}%")
  }

  # Labels para tradução
  def species_label
    case species
    when "dog" then "Cachorro"
    when "cat" then "Gato"
    else "Outro"
    end
  end

  def species_emoji
    case species
    when "dog" then "🐕"
    when "cat" then "🐱"
    else "🐾"
    end
  end

  def gender_label
    gender == "male" ? "Macho" : "Fêmea"
  end

  def gender_symbol
    gender == "male" ? "♂" : "♀"
  end

  def size_label
    case size
    when "small" then "Pequeno"
    when "medium" then "Médio"
    when "large" then "Grande"
    end
  end

  def location
    "#{city}, #{state}"
  end

  def whatsapp_url
    return nil unless caregiver_whatsapp.present?
    clean_number = caregiver_whatsapp.gsub(/\D/, "")
    "https://wa.me/#{clean_number}"
  end

  def instagram_url
    return nil unless caregiver_instagram.present?
    handle = caregiver_instagram.delete("@")
    "https://instagram.com/#{handle}"
  end

  def facebook_url
    return nil unless caregiver_facebook.present?
    "https://facebook.com/#{caregiver_facebook}"
  end

  # Brazilian states
  STATES = %w[AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO].freeze
end
