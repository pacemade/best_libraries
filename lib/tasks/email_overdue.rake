
desc "Email those who have overdue books"
task :mail_overdue => :environment do
  @borrows = Borrow.where("borrow_status = ?", "on_loan")
  @borrows.each do |borrow|
    if borrow.due_date < Time.now
      OverdueMailer.overdue_book_email(borrow).deliver
    end
  end
end
