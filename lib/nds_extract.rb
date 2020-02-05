# Provided, don't edit
require 'directors_database'
require 'pry'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection) # movies_collection = [{title: "", year: ""},{title: "", year: ""}]
  movies_by_director = []
  i = 0
  # turn movies_collection (array of hash) into a hash of movie_data
  while i < movies_collection.length do
    movie_info = movie_with_director_name(name, movies_collection[i])
    movies_by_director << movie_info
    i += 1
  end
  movies_by_director
  
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
end


def gross_per_studio(collection)
  mov_index = 0
  studio_gross = {}
  while mov_index < collection.length do
    movie = collection[mov_index]
    if !studio_gross[movie[:studio]]
      studio_gross[movie[:studio]] = movie[:worldwide_gross]
    else 
      studio_gross[movie[:studio]] += movie[:worldwide_gross]
    end
    mov_index += 1
  end
  # binding.pry
  studio_gross
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  # ex. {
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  # ex. {studios: 
end

def movies_with_directors_set(source)
  dir_index = 0
  directors_movies = []
  while dir_index < source.length do
    titles = source[dir_index]
    binding.pry
    # title_index = 0
    # inner_array = []
    # director_titles = {}
    while title_index < titles.length do
      
      director_titles[:director_name] = titles[:name]
      director_titles[:movies] = titles[:movies][title_index]
      inner_array << director_titles
      title_index += 1
    end
    directors_movies << inner_array
    dir_index += 1
  end
  # binding.pry
  directors_movies
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
end

pp directors_database


# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
