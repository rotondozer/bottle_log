months = 1..12
days = 1..30
hours = [2, 6, 9, 12, 15, 18]
minutes = (1..59).to_a
amounts = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0, 6.5]

nick = User.first_or_create! email_address: "nick@email.com", password: "applesauce"
elisha = User.first_or_create!(email_address: "elisha@email.com", password: "applesauce")
daycare = User.first_or_create!(email_address: "daycare@email.com", password: "applesauce")

users = [nick, elisha, daycare]

months.each do |month|
  days.each do |day|
    break if month == 2 && day > 28 # Stupid February

    hours.each do |hour|
      min = minutes.sample
      started_at = DateTime.new(2024, month, day, hour, min)
      Bottle.create! started_at:, ended_at: started_at + 30.minutes, amount: amounts.sample, user: users.sample
    end
  end
end
