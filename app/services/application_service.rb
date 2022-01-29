class ApplicationService
  class << self
    delegate :call, to: :new
  end
end