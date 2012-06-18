# A module for dealing with access rules and permissions.
#
module Accessible

  # The +Accessible::Rules+ class is used to store a set of conditions (rules)
  # to be applied  in order to allow or deny permission. It is basically a
  # wrapper for a set of constraints that must be met.
  #
  # Example:
  #
  #   rules = Accessible::Rules.new
  #   rules.add do |name, email|
  #     name.downcase != email.downcase
  #   end
  #
  #   rules.add do |name, email|
  #     !User.where(name: name, email: email).first.nil?
  #   end
  #
  #   rules.apply('name', 'email') #=> +true+ or +false+ after running each rule.
  #
  class Rules

    # Adds a rule to the rule set
    #
    def add(&block)
      rules << block
      self
    end

    # Returns a boolen indicanting if the given parameters meet all registered
    # rules
    #
    def apply(*args)
      rules.all? { |rule| rule.call(*args) }
    end


    private

    def rules
      @rules ||= []
    end
  end
end
