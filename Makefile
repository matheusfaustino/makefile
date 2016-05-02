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

create-container:
	docker run -d --add-host local.edirectoryx:127.0.0.1 \
		-v "$PWD":/var/www/html \
		-p 80:80 \
		--name running-edir-php5.6 \
		--link db2:db2 \
		--link mysql56:mysql56 \
		--link elasticsearch23:elasticsearch23 \
		php56-apache

reset-container:
	docker rm running-edir-php5.6
	make create-container
