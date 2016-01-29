FactoryGirl.define do 
  factory :ruby_book, class: Product do
    title "Ruby book"
    description "book ruby"
    price 100
  end
  factory :php_book, class: Product do
    title "PHP book"
    description "book php"
    price 200
  end
end
