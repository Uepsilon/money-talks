u1 = User.create! username: 'test', password: 'Test1234', password_confirmation: 'Test1234', pb_id: 'Funk1', pb_pw: 'Abc12345'
u2 = User.create! username: 'maxim', password: 'Test1234', password_confirmation: 'Test1234', pb_id: 'Funk1', pb_pw: 'Abc12345'
u3 = User.create! username: 'marcel', password: 'Test1234', password_confirmation: 'Test1234', pb_id: 'Funk1', pb_pw: 'Abc12345'

Message.create! recipient: u1, sender_name: 'Hans Wurst', iban: '12345', message: 'Ich lebe!', recieved_at: 5.days.ago, amount: 0.01, transaction_id: 'TRANS1'
Message.create! recipient: u1, sender_name: 'Hans Wurst', iban: '12345', message: 'Spam', recieved_at: 5.days.ago, amount: 0.01, transaction_id: 'TRANS2'
Message.create! recipient: u1, sender_name: 'Hans Wurst', iban: '12345', message: 'ER MER GERD! MERSSERGES!', recieved_at: 5.days.ago, amount: 0.01, transaction_id: 'TRANS3'
Message.create! recipient: u1, sender_name: 'Hans Wurst', iban: '12345', message: 'You are rich now!', recieved_at: 2.days.ago, amount: 99.99, transaction_id: 'TRANS4'
