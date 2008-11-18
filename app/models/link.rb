class Link < ActiveRecord::Base
  
  validates_presence_of :short, :long
  validates_uniqueness_of :short, :message => 'URL has already been taken.'
  
  before_save :generate_short, :if => Proc.new{|l|l.new_record?}
  
  def generate_short
    symbols = '0123456789abcdefgihjklmnopqrstuvwxyz'
    while self.short.blank? or ![self,nil].include?(Link.find_by_short(self.short)) do
      srand
      self.short = symbols[rand(symbols.size),1] + symbols[rand(symbols.size),1] + symbols[rand(symbols.size),1] + symbols[rand(symbols.size),1] + symbols[rand(symbols.size),1] + symbols[rand(symbols.size),1]
    end
    return short
  end
  
  def id
    short
  end
end
