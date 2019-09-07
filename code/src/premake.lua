cpp_solution("test")
	group("groupone")
		project_include("moduleone", "projectone")
		project_include("moduleone", "projecttwo")

	group("grouptwo")
		project_include("moduletwo", "projectone")


cs_solution("testcs")
	project_include("csmodule", "csproject")
