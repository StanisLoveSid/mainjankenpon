class User < ActiveRecord::Base
 
  searchkick
  acts_as_messageable
  has_many :evaluations, class_name: "RSEvaluation", as: :source
  has_many :lessons
  acts_as_voter
  has_many :favorite_posts  
  has_many :favorites, through: :favorite_posts, source: :post
  act_as_bookmarker
 

has_reputation :votes, source: {reputation: :votes, of: :posts}, aggregated_by: :sum


def admin? 
  self.role == 'admin' 
end

  def mailboxer_email(object)
    #Check if an email should be sent for that object
      #if true
        return email
      #if false
        #return nil
    end

def voted_for?(comment)
  evaluations.where(target_type: comments.class, target_id: comment.id).present?
end

  def self.create_from_omniauth(params)
    attributes = {
      email: params['info']['email'],
      password: Devise.friendly_token
    }

    create(attributes)
  end



  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, 
      :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  validates_presence_of :email
  validates_confirmation_of  :password
  
  has_many :authorizations
 
  
  has_attached_file :avatar, styles: { medium: "700x500#", small: "10x10#" },  :default_url => ":style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/



end


  

  

