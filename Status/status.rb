class Status
  attr_reader :result

  def initialize
    @result = false
  end

	def complete?(result)
    @result = result
  end
end