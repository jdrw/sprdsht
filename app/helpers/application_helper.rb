module ApplicationHelper

	def time_table(start_time, end_time)

		output = ""
		duration = end_time - start_time + 1
		if start_time > 7
			initial_dur = start_time - 7
			output += "<td colspan=#{initial_dur}></td>"
		end
		output += "<td colspan=#{duration} class=\"scheduled\"></td>"
		if end_time < 21
			ending_dur = 21 - end_time
			output += "<td colspan=#{ending_dur}></td>"
		end

		return output.html_safe
	end

	def time_table_mobile(start_time, end_time)

		output = ""
		duration = end_time - start_time + 1
		if start_time > 7
			initial_dur = start_time - 7
			output += "<td colspan=#{initial_dur}></td>"
		end
		output += "<td colspan=#{duration} class=\"scheduled\">#{start_time} - #{end_time}</td>"
		if end_time < 21
			ending_dur = 21 - end_time
			output += "<td colspan=#{ending_dur}></td>"
		end

		return output.html_safe
	end

end
