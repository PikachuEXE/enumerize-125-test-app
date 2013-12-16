class Post < ActiveRecord::Base
  module PostTypeValues
    NORMAL  = 'normal'.freeze
    SPECIAL = 'special'.freeze

    ALL = [
      NORMAL,
      SPECIAL,
    ].freeze
  end
  module CategoryNameValues
    FOOD  = 'food'.freeze
    DRINK = 'drink'.freeze

    ALL = [
      FOOD,
      DRINK,
    ].freeze
  end

  extend Enumerize
  enumerize :post_type, in: PostTypeValues::ALL, default: PostTypeValues::NORMAL
  enumerize :category_name, in: CategoryNameValues::ALL
end
