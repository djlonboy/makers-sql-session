require 'pg'

class CountryData
  attr_reader :name, :continent, :population, :density, :gni

  def initialize(name = '', continent = '', population = '', density = '', gni = '')
    @name = name
    @continent = continent
    @population = population
    @density = density
    @gni = gni
  end

  def self.all
    sql('SELECT * FROM countries;')
  end

  def self.european_countries
    sql("SELECT * FROM countries WHERE continent = 'Europe';")
  end

  def self.all_data_sorted_by_population_increasing_order
    sql("SELECT * FROM countries ORDER BY population;")
  end

  def self.all_data_sorted_by_population_decreasing_order
    sql("SELECT * FROM countries ORDER BY population DESC;")
  end

  def self.population_greater_than_100_million
    sql("SELECT * FROM countries WHERE population>100;")
  end

  def self.population_less_than_20_million
    sql("SELECT * FROM countries WHERE population<20;")
  end

  def self.population_density_between_50_and_150
    sql("SELECT * FROM countries WHERE population BETWEEN 50 AND 150;")
  end

  def self.highest_gni_per_capita_in_asia
    sql('SELECT * FROM countries;')
  end

  def self.third_lowest_gni_per_capita_in_south_america
    sql('SELECT * FROM countries;')
  end

  def self.all_countries_not_in_europe
    sql('SELECT * FROM countries;')
  end

  def self.all_data_country_name_and_population_only
    sql('SELECT * FROM countries;')
  end

  def self.south_american_countries_hide_population
    sql('SELECT * FROM countries;')
  end

  def self.countries_not_in_asia_hide_gni_per_capita_and_population_density
    sql('SELECT * FROM countries;')
  end

  private

  def self.sql(query)
    result = DatabaseConnection.query(query)
    result.map{ |country| CountryData.new(country['name'], country['continent'], country['population'], country['density'], country['gni']) }
  end
  
end
