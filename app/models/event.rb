class Event < ActiveRecord::Base
  attr_accessible :name, :description

  validates_presence_of :access_token
  validates_uniqueness_of :access_token

  # using this method, a unique and secreat URL can be used for accessing
  # the event resource
  def to_param
    self.access_token
  end

  # create a unique and secret token
  before_validation(:on => :create) do
    self.access_token = create_access_token if self.new_record? and self.access_token.nil?
  end

protected
  def create_access_token
    rand(36**8).to_s(36)
  end

end
