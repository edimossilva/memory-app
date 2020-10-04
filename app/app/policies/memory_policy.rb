class MemoryPolicy
  attr_reader :user, :memory

  def initialize(user, memory)
    @user = user
    @memory = memory
  end

  def owner?
    user.owner?(memory)
  end
end
