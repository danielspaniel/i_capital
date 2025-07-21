Fabricator(:partner) do
  name { |attrs| attrs[:name] || Faker::Company.name }
end
