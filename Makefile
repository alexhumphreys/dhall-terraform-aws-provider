build:
	docker build . -t advancedtelematic/dhall-terraform-aws-provider

generate-schema: build
	docker run --rm -it -v $(CURDIR)/schema:/usr/src/app/schema advancedtelematic/dhall-terraform-aws-provider

generate-dhall: build
	docker run --rm -it -v $(CURDIR)/dhall:/usr/src/app/dhall -v $(CURDIR)/schema:/usr/src/app/schema advancedtelematic/dhall-terraform-aws-provider ruby ./generate-dhall.rb

run-interactive: build
	docker run --rm -it advancedtelematic/dhall-terraform-aws-provider bash
