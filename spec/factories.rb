FactoryGirl.define do
  factory :post do
    title "Sample Post"
    body  "This is a post body."
    author "John Doe"
    status "published"
  end

  factory :comment do
    body  "This is a comment."
    author "John Doe"
  end
end
