class Message < ActiveRecord::Base
  belongs_to :program
  belongs_to :delayed_template

  validates :target, :body, :send_at, :program, :delayed_template, presence: true

  scope :in_progress_by_target, -> (target) { where(target: target).where(status: nil) }
  scope :time_passed, -> { where(status: nil).where('send_at < ?', Time.now) }
end
