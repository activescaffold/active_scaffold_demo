Factory.sequence :name do |n|
  "name#{n}"
end

Factory.define :tracking_device do |t|
  t.name Factory.next(:name)
end