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
		COLORS = {
			'F'		=> "\e[1m\e[31m",	# FAILED: red
			:fail	=> "\e[1m\e[31m",	# FAILED: red
			'E'		=> "\e[1m\e[35m",	# ERROR: purple
			'M'		=> "\e[1m\e[33m",	# MISSING: yellow
			:ok 	=> "\e[1m\e[32m"	# PASSED/OK: green
		}

 		alias_method :output_handle_requirement, :handle_requirement
    def handle_requirement(description)
  			print(colorize_requirement { output_handle_requirement(description) { yield } })
    end

 		alias_method :output_handle_summary, :handle_summary
 	  def handle_summary
 			puts(colorize_summary { output_handle_summary })
 	  end

		private
		def capture_stdout
			s = StringIO.new
		  oldstdout = $stdout
		  $stdout = s
		  yield
		  s.string
		ensure
		  $stdout = oldstdout
		end

		def colorize_requirement
			out = capture_stdout { yield }

			color = case out
			when /(FAILED|ERROR|MISSING)/ then $1[0..0] # SpecDox, Tap, Knock
			when /\A([FME])\Z/ then $1 # TestUnit
			else :ok
			end

			out.sub(/^(.|(ok|not ok|-) .+)$/, colorize('\0', color))
		end

		def colorize_summary
			line = capture_stdout { yield }

			color = line.match(/0 failures, 0 errors/).nil? ? :fail : :ok
			line.sub(/^.+\d+ failures, \d+ errors$/, colorize('\0', color))
		end

		def colorize(text, color)
			"#{COLORS[color]}#{text}\e[0m"
		end

	end
end