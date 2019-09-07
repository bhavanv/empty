newaction {
   trigger     = 		"generate",
   description = 		"Generate projects and solutions",
   execute = function ()
      if _OPTIONS["vs"] == "2015" then
				_ACTION="vs2015"
				print_info("generating..")
			end
   end
}

if(_ACTION == "clean") then
	-- a more thorough clean
	print_info("cleaning directories")
	os.rmdir(OBJ_DIR)
	os.rmdir(OUT_DIR)
   os.rmdir(SLN_DIR)
end
