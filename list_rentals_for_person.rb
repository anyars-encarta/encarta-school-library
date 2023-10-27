def list_rentals_for_person
  puts 'Enter the person\'s ID:'
  person_id = gets.chomp.to_i

  app.list_rentals_for_person(person_id)
end
