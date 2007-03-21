class Menu
  attr_accessor :label
  attr_reader :entries

  def initialize(label = nil)
    @label = label
    @entries = []
  end
end