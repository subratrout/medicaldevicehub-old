class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]

  devise :omniauthable, :omniauth_providers => [:facebook]

  


  validates_uniqueness_of :username, :case_sensitive => false
  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :email

  has_many :device_reviews



  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    @user= User.where(:provider => auth[:provider], :uid => auth[:uid]).first
    if @user
      return @user 
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user= User.create(
          name:auth.extra.raw_info.name,
          image:auth.info.image,
          provider:auth.provider,
          uid:auth.uid,
          email:auth.info.email,
          username:auth.info.email, # Have to put this as my username is required, user later can edit in their profile
          password:Devise.friendly_token[0,20]

          )
      end
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
  end
end
