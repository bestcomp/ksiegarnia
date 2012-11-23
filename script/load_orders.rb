Order.transaction do 
  (1..100).each do |i|
    Order.create(name: "Klient #{i}", 
    address: "Ulica Dluga #{i} ", 
    email: "klient-#{i}@example.com", pay_type: "Przelew")
  end 
end
