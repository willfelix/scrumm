class HomeController < ApplicationController

  def index
	height_graphics = 400
	
	sprints = Sprint.all
	tasks = Task.all
	responsibles = Responsible.all
	
	#-------------------- Sprints -------------------------------------
	@sprints_date = Array.new
	@tasks_ammount = Array.new
	@points_ammount = Array.new
	
	sprints.each_with_index do |sprint, i|
		@sprints_date << sprint.date_begin
		
		tasks.each do |task|
			if task.sprint_id == sprint.id
				if @tasks_ammount[i].nil?
					@tasks_ammount[i] = 0
				end
				@tasks_ammount[i] += 1
				
				if @points_ammount[i].nil?
					@points_ammount[i] = 0
				end
				@points_ammount[i] += task.point.name
			end
		end
		
		@tasks_ammount << 0
		@points_ammount << 0
	end
	@tasks_ammount.pop
	@points_ammount.pop
	
	
	@s = LazyHighCharts::HighChart.new('graph') do |f|
		f.options[:chart][:defaultSeriesType] = "line"
		f.options[:chart][:plotBackgroundImage] = nil
		f.options[:chart][:plotBackgroundColor] = nil
		f.options[:chart][:height] = height_graphics
		f.options[:title][:text] = "Sprints"
		f.options[:xAxis][:categories] = @sprints_date
		f.options[:yAxis][:title][:text] = "Tasks Ammount"
		f.options[:yAxis][:min] = 0
		f.series(:name=>'Tasks', :color=>"#FF0000", :data=>@tasks_ammount)
		f.series(:name=>'Points', :color=>"#FFFF00", :data=>@points_ammount)
	end	
	
	#------------------- Tasks Unnplaned -------------------------------------
	@tasks_unplanned_ammount = Array.new
	@points_unplanned_ammount = Array.new
	
	sprints.each_with_index do |sprint, i|
		
		tasks.each do |task|
			if task.sprint_id == sprint.id && task.unplanned == true
				if @tasks_unplanned_ammount[i].nil?
					@tasks_unplanned_ammount[i] = 0
				end
				@tasks_unplanned_ammount[i] += 1
				
				if @points_unplanned_ammount[i].nil?
					@points_unplanned_ammount[i] = 0
				end
				@points_unplanned_ammount[i] += task.point.name
			end
		end
		
		@tasks_unplanned_ammount << 0
		@points_unplanned_ammount << 0
	end
	@tasks_unplanned_ammount.pop
	@points_unplanned_ammount.pop
	
	@t = LazyHighCharts::HighChart.new('graph') do |f|
		f.options[:chart][:defaultSeriesType] = "line"
		f.options[:chart][:plotBackgroundImage] = nil
		f.options[:chart][:plotBackgroundColor] = nil
		f.options[:chart][:height] = height_graphics
		f.options[:title][:text] = "Tasks Unnplaned"
		f.options[:xAxis][:categories] = @sprints_date
		f.options[:yAxis][:title][:text] = "Tasks Ammount"
		f.options[:yAxis][:min] = 0
		f.series(:name=>'Tasks', :color=>"#FF0000", :data=>@tasks_unplanned_ammount)
		f.series(:name=>'Points', :color=>"#FFFF00", :data=>@points_unplanned_ammount)
	end	
	
	#-------------------- Responsibles --------------------------------
	@developers = Array.new
	@points_for_people = Array.new
	
	responsibles.each_with_index do |resp, i|
		@developers << resp.name
		
		tasks.each do |task|
			if task.responsible.name == @developers[i]
				if @points_for_people[i].nil?
					@points_for_people[i] = 0
				end
				@points_for_people[i] += task.point.name
			end
		end
		
		@points_for_people << 0
	end
	@points_for_people.pop
	
	@r = LazyHighCharts::HighChart.new('graph') do |f|
		f.options[:chart][:defaultSeriesType] = "column"
		f.options[:chart][:plotBackgroundImage] = nil
		f.options[:chart][:plotBackgroundColor] = nil
		f.options[:title][:text] = "Responsibles"
		f.options[:chart][:height] = height_graphics
		f.options[:xAxis][:categories] = @developers
		f.options[:yAxis][:title][:text] = "Points Ammount"
		f.series(:name=>'Points', :color=>"#ABCCDE", :data=>@points_for_people)
	end	
	
	#-------------------- Projects ----------------------------------
	projects = Project.all
	@works = Array.new
	points_aux = Array.new
	index = 0
	
	projects.each_with_index do |proj, i|
		@works << proj.name
		
		@developers.each_with_index do |dev|
			tasks.each do |task|
				if points_aux[index].nil?
					points_aux[index] = 0
				end
				
				if task.project.name == proj.name
					if task.responsible.name == dev
						points_aux[index] += task.point.name
					end
				end
			end
			points_aux << 0
			index += 1
		end
		points_aux.pop
		points_aux << "-"
		index += 1
	end
	points_aux.pop
	@points_for_project = points_aux.split("-")
	@points_for_project = @points_for_project.transpose
	
	@p = LazyHighCharts::HighChart.new('graph') do |f|
		f.options[:chart][:defaultSeriesType] = "column"
		f.options[:chart][:plotBackgroundImage] = nil
		f.options[:chart][:plotBackgroundColor] = nil
		f.options[:title][:text] = "Projects"
		f.options[:chart][:height] = height_graphics
		f.options[:xAxis][:categories] = @works
		f.options[:yAxis][:title][:text] = "Points Ammount"
		
		@developers.each_with_index do |dev, i|
			color = rand(0xffffff).to_s(16)
			f.series(:name=>dev, :color=>"##{color}", :data=>@points_for_project[i])
		end
	end	
	
  end

end