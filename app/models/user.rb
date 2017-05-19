class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :subscriptions
  has_many :stripe_plans
  has_many :stripe_customers
  has_many :stripe_charges
  has_many :children_names
  has_many :children
  accepts_nested_attributes_for :children_names, allow_destroy: true
  accepts_nested_attributes_for :children, allow_destroy: true
  
  serialize :holiday
  serialize :child_name, Array

def self.find_for_facebook_oauth(access_token, signed_in_resourse=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid).first

    if user
      return user
    else
      registered_user = User.where(:email => data.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          name: access_token.extra.raw_info.name,
          provider: access_token.provider,
          email: data.email,
          uid: access_token.uid,
          image: data.image,
          password: Devise.friendly_token[0,20],
        )
      end
    end
  end

  def build_children(interval)
    children_count = self.children.count
    puts "======#{children_count}=========="
    if (children_count < interval)
      total = (interval + children_count)
      diff = (interval - children_count).abs
      diff_count = total > 3 ? (3 - children_count) : diff
      diff_count.to_i.times {   self.children.build }
    
    end
   # else
   #   puts "===in else===#{children_count}========#{interval}=="
    #  until (children_count == interval)

    #    self.children.last.destroy
     # end
    #end
  end

end