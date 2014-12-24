module Ruboty
  module Handlers
    class RubyEval < Base
      on /ruby(_|\-)eval (?<body>.+)/, name: 'ruby_eval', description: 'eval given code'

      def ruby_eval(message)
        value = instance_eval(message[:body])
      rescue => e
        value = [e.class.name, e.message, e.backtrace].join("\n")
      ensure
        message.reply value
      end
    end
  end
end
