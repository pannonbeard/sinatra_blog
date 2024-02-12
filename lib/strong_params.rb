# frozen_string_literal: true

# Handles Strong Parameters
class StrongParams < Hash
  def initialize(params)
    super
    @params = params
    @required = ''
    @permitted = []

    @params.each { |par, value| self[par.to_sym] = value }
  end

  def require(sym)
    raise "Missing param: :#{sym}" unless @params.keys.any? { |key| key.to_s == sym.to_s }
    
    @required = sym.to_s

    self
  end

  def permit(*syms)
    @permitted = syms

    entered = @params[@required]

    not_allowed = []

    adjusted_hash = {}

    entered.each_key do |key|
      if(@permitted.include?(key.to_sym))
        adjusted_hash[key] = entered[key]
      else
        not_allowed << key
      end
    end

    # puts 'The following keys were not allowed'
    # puts not_allowed
    
    self[@required.to_sym] = adjusted_hash

    self
  end
end
