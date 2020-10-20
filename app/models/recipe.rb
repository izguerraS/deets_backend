class Recipe < ApplicationRecord
  belongs_to :user
  
  def ingredients_list
    ingredients.downcase.split(", ")
  end

  def friendly_prep_time
    hours = prep_time / 60
    minutes = prep_time % 60
    result = ""

    if hours > 0
      result += "#{hours} hours"
    end

    if minutes > 0
      result += " #{minutes} minutes"
    end
    result
  end
end
