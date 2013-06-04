class HomeController < ApplicationController

  def index
	sprints = Sprint.all
	@ammount = Array.new
	
	# --------------------------------------------------------
	# Choice the smaller date
	@smaller_sprint = sprints.first
	sprints.each do |s|
		if @smaller_sprint.date_begin > s.date_begin
			@smaller_sprint = s
		end
	end
	#--------------------------------------------------------#
	
	@ammount_size = 0
	@array_comparative = Array.new
	
	sprints.each_with_index do |sprint, i|
		@date_sprint = sprint.date_begin
		flag = true
		#------------------------------------
		@array_comparative.each do |index|
			if i == index
				flag = false
			end
		end
		#------------------------------------#
		if flag == true
			#-----------------------------------
			sprints.each_with_index do |s, j|
				if @date_sprint == s.date_begin
					if @ammount[i].nil?
						@ammount[i] = 0
					end
					@ammount[i] += 1
					@ammount_size += 1
					if @ammount[i] >= 1
						@array_comparative << j
					end
				end
			end
			#-----------------------------------#
			#-------------------------------
			if @ammount_size == sprints.size
				break
			end
			#-------------------------------#
			i += 1
			if i != sprints.size
				@ammount << 0
			end
		end
		#------------------------------------#
	end
	
	@ammount.delete(0)
	
  end
  
end