class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    mail(
      to: @review.zoo.user.email,
      subject: "New Review for #{review.zoo.name}"
    )
  end
end
