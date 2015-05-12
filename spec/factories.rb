FactoryGirl.define do
  factory :post do
    title "Sample Post"
    body  "This is a post body."
    author "John Doe"
    status "published"
    created_at 1.day.ago
    updated_at 1.hour.ago
  end

  factory :comment do
    body  "This is a comment."
    author "John Doe"
    created_at 1.day.ago
    updated_at 1.hour.ago
  end
end
