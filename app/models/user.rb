class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

    validates_presence_of :first_name, :last_name

    has_many :wallets
    has_many :orders

    after_create :welcome_mailer

    def name
        [first_name, last_name].join(' ')
    end

    def welcome_mailer
        p "email has been sent!"
        WelcomeMailer.welcome_mailer(self).deliver
    end
end
