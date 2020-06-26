class Booking < ApplicationRecord
  belongs_to :duck
  belongs_to :user
  has_many :reviews

  validates :start_time, :end_time, presence: true # , availability: true
  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    binding.pry
    if :start_time.blank?
      errors.add("please provide a start date")
    end
    if :end_time.blank?
      errors.add(:end_time, "please provide a end date")
    end
    if end_time <= start_time
      errors.add(:end_time, "must be after the start date")
    end
  end
end
