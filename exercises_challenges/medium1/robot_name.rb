class Robot
  @@robot_names = []

  attr_reader :name

  def initialize
    @name = generate_name
    @name = @@robot_names.include?(@name) ? generate_name : @name
    @@robot_names << @name
  end

  def reset
    @name = generate_name
    while @@robot_names.include?(@name)
      @name = generate_name
    end
    @@robot_names << @name
  end

  private

  def generate_name
    new_name = ''
    2.times { new_name << ('A'..'Z').to_a.sample }
    3.times { new_name << ('0'..'9').to_a.sample }
    new_name
  end
end