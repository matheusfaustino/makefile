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
	docker start mysql56 db2 elasticsearch23 running-edir-php5.6

