def list_rentals_for_person_menu
  puts 'Enter the person\'s ID:'
  person_id = gets.chomp.to_i

  person = @app.people.find { |p| p.id == person_id }

  if person
    @app.list_rentals_for_person(person_id)
  else
    puts 'Person not found. Please enter a valid ID.'
  end
end
