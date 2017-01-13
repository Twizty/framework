Dir[File.join(__dir__, "framework/**/*")].each{|file| require file }

module Framework
end