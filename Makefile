# -----------------------------------------------------------------------------
#  MAKEFILE RUNNING COMMAND
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni (@zeroc0d3)
#  License    : Apache version 2
# -----------------------------------------------------------------------------
# Notes:
# use [TAB] instead [SPACE]

export PATH_WORKSPACE="./src"
export PATH_DOCKER="./docker"
export PATH_SCRIPTS="./scripts/installer/"
export PROJECT_NAME="laravel"

install-ansible:
	@echo "============================================"
	@echo " Task      : Install Ansible "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_SCRIPTS} && bash ./install_ansible.sh
	@echo '- DONE -'

install-docker:
	@echo "============================================"
	@echo " Task      : Install Docker "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_SCRIPTS} && bash ./install_docker.sh
	@echo '- DONE -'

install-pyenv:
	@echo "============================================"
	@echo " Task      : Install Python Environment "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_SCRIPTS} && bash ./install_python_env.sh
	@python ${PATH_SCRIPTS}/get-pip.py
	@echo '- DONE -'

run-docker:
	@echo "============================================"
	@echo " Task      : Docker Container "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_DOCKER} && ./run-docker.sh
	@echo '- DONE -'

stop-docker:
	@echo "============================================"
	@echo " Task      : Stopping Docker Container "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_DOCKER} && docker-compose -f ./compose/app-compose.yml stop
	@echo '- DONE -'

remove-docker:
	@echo "============================================"
	@echo " Task      : Remove Docker Container "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_DOCKER} && docker-compose -f ./compose/app-compose.yml down
	@echo '- DONE -'

composer-install:
	@echo "============================================"
	@echo " Task      : Composer Install "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && composer install
	@echo '- DONE -'

composer-update:
	@echo "============================================"
	@echo " Task      : Composer Update "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && composer update
	@echo '- DONE -'

composer-dumpautoload:
	@echo "============================================"
	@echo " Task      : Composer Dump Autoload "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && composer dumpautoload -o
	@echo '- DONE -'

composer-selfupdate:
	@echo "============================================"
	@echo " Task      : Composer Update "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && composer self-update
	@echo '- DONE -'

key-generate:
	@echo "============================================"
	@echo " Task      : Generate Key "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan key:generate
	@echo '- DONE -'

clear-view:
	@echo "============================================"
	@echo " Task      : Clear Compiled Views "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan view:clear
	@echo '- DONE -'

clear-cache:
	@echo "============================================"
	@echo " Task      : Clear Application Cache "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan cache:clear
	@echo '- DONE -'

clear-config:
	@echo "============================================"
	@echo " Task      : Clear Configuration Cache "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan config:clear
	@echo '- DONE -'

clear-event:
	@echo "============================================"
	@echo " Task      : Clear Cached Event "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan event:clear
	@echo '- DONE -'

clear-debug:
	@echo "============================================"
	@echo " Task      : Clear Debugbar Storage "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan debug:clear
	@echo '- DONE -'

clear-all:
	@echo "============================================"
	@echo " Task      : Clear All Cache "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan view:clear
	@cd ${PATH_WORKSPACE} && php artisan cache:clear
	@cd ${PATH_WORKSPACE} && php artisan config:clear
	@cd ${PATH_WORKSPACE} && php artisan event:clear
	@cd ${PATH_WORKSPACE} && php artisan debug:clear
	@echo '- DONE -'

fixing-cache:
	@echo "============================================"
	@echo " Task      : Fixing Cache Path"
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && for i in {'sessions','views','cache'}; do mkdir -p storage/framework/$i; done
	@echo '- DONE -'

run-migrate:
	@echo "============================================"
	@echo " Task      : Running Artisan Migrate "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan migrate
	@echo '- DONE -'

run-seed:
	@echo "============================================"
	@echo " Task      : Running Artisan Seed "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan db:seed
	@echo '- DONE -'

run-migrate-all:
	@echo "============================================"
	@echo " Task      : Running Artisan Migrate & Seed "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan migrate:install && php artisan migrate --seed
	@echo '- DONE -'

run-npm:
	@echo "============================================"
	@echo " Task      : Running NPM Install "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && npm install
	@echo '- DONE -'

run-yarn:
	@echo "============================================"
	@echo " Task      : Running YARN Install "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && yarn install
	@echo '- DONE -'

run-mix-dev:
	@echo "============================================"
	@echo " Task      : Running Mix Develop "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && npm run dev
	@echo '- DONE -'

run-mix-prod:
	@echo "============================================"
	@echo " Task      : Running Mix Production "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && npm run production
	@echo '- DONE -'

run-mix-watch:
	@echo "============================================"
	@echo " Task      : Running Mix Watch "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && npm run watch
	@echo '- DONE -'

run-project:
	@echo "============================================"
	@echo " Task      : Running Project "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan serve --port=8080
	@echo '- DONE -'
