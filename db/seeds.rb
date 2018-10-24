# tạo 50 thằng users
50.times do |n|

	user = User.new(
		nickname:  "name_#{n}",
		uid: "#{n+1}",
	    mail_address: "main-#{n}@gm.com",
	    password: "12345678",
	    password_confirmation: "12345678"
	)

	user.save!
end