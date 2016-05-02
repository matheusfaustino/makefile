clean:
	app/console cache:clear --no-warmup

event:
	app/console debug:event-dispatcher --domain=local.edirectoryx -e=dev

doctrine:
	app/console doctrine:migrations:status --em=domain --domain=local.edirectoryx

sync:
	php -dmemory_limit=-1 app/console edirectory:synchronize --domain=local.edirectoryx -e=dev
