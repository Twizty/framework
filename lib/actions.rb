Dir[File.join(__dir__, "actions/**/*")].each{|file| require file }

module Actions
end
