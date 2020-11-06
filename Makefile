documentation:
	@jazzy \
        	-x -workspace,quick-questions.xcworkspace,-scheme,quick-questions \
		--min-acl private \
        	--theme fullwidth \
        	--output ./docs \
        	--documentation=./*.md
	@rm -rf ./build
