require "pp"
require "dotenv/load"

class Hello
  include Faktory::Job

  def perform(*args)
    logger.info args.pretty_inspect
  end
end
