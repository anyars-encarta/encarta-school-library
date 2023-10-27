def list_rentals_for_person(app)
  puts 'Enter the person\'s ID:'
  person_id = gets.chomp.to_i

  app.list_rentals_for_person(person_id)
end
