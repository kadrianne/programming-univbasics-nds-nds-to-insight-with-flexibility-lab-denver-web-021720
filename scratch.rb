titles = [
            { :name => "Byron Poodle", :movies => [
              { :title => "At the park" },
              { :title => "On the couch" },
            ]
            },
            { :name => "Nancy Drew", :movies => [
              { :title => "Biting" },
            ]
            }
          ] 
index = 0
while title_index < titles.length do
      director_titles[:name] = titles[:name]
      director_titles[:title] = titles[:movies][title_index][:title]
      inner_array << director_titles
      title_index += 1
    end