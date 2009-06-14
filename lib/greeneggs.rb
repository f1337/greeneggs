# GreenEggs -- small red/green patch for Bacon
#
# "I do not like Green Eggs and Ham." ---Sam I Am
#
# Copyright (C) 2009 Michael Fleet <disinnovate.com>
#
# GreenEggs is freely distributable under the terms of the MIT license.
# See LICENSE or http://www.opensource.org/licenses/mit-license.php for details.

module Bacon
	class << self
		# ANSI terminal colors
		COLORS = { 'F' => 31,	'E' => 35, 'M' => 33, :ok => 32	}

		def colorize_string(text, color); "\e[1m\e[#{COLORS[color]}m#{text}\e[0m"; end

		def colorize_result(out)
			return out if PLATFORM =~ /win32/ 

			requirement_color = case out
			when /(FAILED|ERROR|MISSING)/ then $1[0..0] # SpecDox, Tap, Knock
			when /\A([FME])\Z/ then $1 # TestUnit
			else :ok
			end

			summary_color = out.match(/0 failures, 0 errors/).nil? ? 'F' : :ok

			out.sub(/^(.|(ok|not ok|-) .+)$/, 
				colorize_string('\0', requirement_color)).sub(/^.+\d+ failures, \d+ errors$/, 
					colorize_string('\0', summary_color))
		end

		def puts(*args)
			args.map! { |arg| arg.instance_of?(String) ? colorize_result(arg) : arg }
			super(args)
		end

		def print(*args)
			args.map! { |arg| arg.instance_of?(String) ? colorize_result(arg) : arg }
			super(args)
		end
	end

  module SpecDoxOutput
    def handle_requirement(description)
      error = yield
      puts "- #{description}" << (error.empty? ? "" : " [#{error}]")
    end
  end

  module TestUnitOutput
    def handle_summary
      puts "\n"
      puts ErrorLog  if Backtraces
      puts "%d tests, %d assertions, %d failures, %d errors" %
        Counter.values_at(:specifications, :requirements, :failed, :errors)
    end
  end
end