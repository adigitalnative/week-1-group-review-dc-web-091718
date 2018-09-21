# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class


class Photo
  attr_reader :comments
  attr_accessor :user

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def make_comment(text)
    Comment.new(self, text)
  end

  def comments
    Comment.all.select {|comment| comment.photo == self }
  end

end

class User

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def photos
    Photo.all.select do |photo|
      photo.user == self
    end
  end

end

class Comment
  attr_reader :content, :photo

  @@all = []

  def initialize(photo, content)
    @content = content
    @photo = photo
    @@all << self
  end

  def self.all
    @@all
  end
end

sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
sandwich_photo.user.name
# => "Sophie"
sandwich_photo.user.photos
# => [#<Photo:0x00007fae2880b370>]


sandwich_photo.comments
# # => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

Comment.all
# => [#<Comment:0x00007fae28043700>]
