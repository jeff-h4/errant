
json.result @result

json.my_errands @my_errands do |errand|
  json.id                errand.id
  json.title             errand.title
  json.item_name         errand.item_name
  json.price             errand.price
  json.store             errand.store
  json.aasm_state        errand.aasm_state
  json.owner_first_name  errand.owner.first_name
  json.owner_last_name   errand.owner.last_name
  json.owner_full_name   errand.owner.full_name
  if errand.runner.nil?
    json.runner_first_name ""
    json.runner_last_name  ""
    json.runner_full_name  ""
  else
    json.runner_first_name errand.runner.first_name
    json.runner_last_name  errand.runner.last_name
    json.runner_full_name  errand.runner.full_name
  end
end
json.my_posted_errands @my_posted_errands do |errand|
  json.id                errand.id
  json.title      errand.title
  json.item_name  errand.item_name
  json.price      errand.price
  json.store      errand.store
  json.aasm_state        errand.aasm_state
  json.owner_first_name  errand.owner.first_name
  json.owner_last_name   errand.owner.last_name
  json.owner_full_name   errand.owner.full_name
  if errand.runner.nil?
    json.runner_first_name ""
    json.runner_last_name  ""
    json.runner_full_name  ""
  else
    json.runner_first_name errand.runner.first_name
    json.runner_last_name  errand.runner.last_name
    json.runner_full_name  errand.runner.full_name
  end
end
json.other_posted_errands @other_posted_errands do |errand|
  json.id                errand.id
  json.title             errand.title
  json.item_name         errand.item_name
  json.price             errand.price
  json.store             errand.store
  json.aasm_state        errand.aasm_state
  json.owner_first_name  errand.owner.first_name
  json.owner_last_name   errand.owner.last_name
  json.owner_full_name   errand.owner.full_name
  if errand.runner.nil?
    json.runner_first_name ""
    json.runner_last_name  ""
    json.runner_full_name  ""
  else
    json.runner_first_name errand.runner.first_name
    json.runner_last_name  errand.runner.last_name
    json.runner_full_name  errand.runner.full_name
  end
end
json.my_accepted_errands @my_accepted_errands do |errand|
  json.id                errand.id
  json.title      errand.title
  json.item_name  errand.item_name
  json.price      errand.price
  json.store      errand.store
  json.aasm_state        errand.aasm_state
  json.owner_first_name  errand.owner.first_name
  json.owner_last_name   errand.owner.last_name
  json.owner_full_name   errand.owner.full_name
  if errand.runner.nil?
    json.runner_first_name ""
    json.runner_last_name  ""
    json.runner_full_name  ""
  else
    json.runner_first_name errand.runner.first_name
    json.runner_last_name  errand.runner.last_name
    json.runner_full_name  errand.runner.full_name
  end
end
json.my_completed_errands @my_completed_errands do |errand|
  json.id                errand.id
  json.title      errand.title
  json.item_name  errand.item_name
  json.price      errand.price
  json.store      errand.store
  json.aasm_state        errand.aasm_state
  json.owner_first_name  errand.owner.first_name
  json.owner_last_name   errand.owner.last_name
  json.owner_full_name   errand.owner.full_name
  if errand.runner.nil?
    json.runner_first_name ""
    json.runner_last_name  ""
    json.runner_full_name  ""
  else
    json.runner_first_name errand.runner.first_name
    json.runner_last_name  errand.runner.last_name
    json.runner_full_name  errand.runner.full_name
  end
end
