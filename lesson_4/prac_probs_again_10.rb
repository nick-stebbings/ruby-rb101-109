
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def categorize_ages(hash)
  key_values = hash.keys
  counter = 0
  
  loop do
    current_key = key_values[counter]
  
    current_value = hash[current_key]
    age = current_value['age']
    
    if (0..17).include?(age)
      hash[current_key]['age_group'] = 'kid'
    elsif (18..64).include?(age)
      hash[current_key]['age_group'] = 'adult'
    else
      hash[current_key]['age_group'] = 'senior'
    end

    counter += 1
    break if counter == hash.keys.length
  end
end
categorize_ages(munsters)
p munsters