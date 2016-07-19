clean:
	app/console cache:clear --no-warmup

event:
	app/console debug:event-dispatcher --domain=local.edirectoryx -e=dev

doctrine:
	app/console doctrine:migrations:status --em=domain --domain=local.edirectoryx

sync:
	php -dmemory_limit=-1 app/console edirectory:synchronize -e=dev --force-domain=local.edirectoryx --domain=local.edirectoryx

syncr:
	php -dmemory_limit=-1 app/console edirectory:synchronize -r -e=dev --force-domain=local.edirectoryx --domain=local.edirectoryx

run:
	cd docker && docker-compose up -d

stop:
	cd docker && docker-compose stop

create-container:
	cd docker && docker-compose up -d --build

EDIRECTORY_BRANCH=v11.1
rebase:
	git stash
	git checkout $(EDIRECTORY_BRANCH)
	git pull
	git checkout -
	git rebase $(EDIRECTORY_BRANCH)
	set -e ;\
	BRANCH_TO_MERGE=$$(git symbolic-ref --short HEAD) ;\
	git checkout $(EDIRECTORY_BRANCH) ;\
	git merge $$BRANCH_TO_MERGE
	git push
	git stash pop
