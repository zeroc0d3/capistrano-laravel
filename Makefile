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
	@cd ${PATH_WORKSPACE} && composer install
	@echo '- DONE -'

composer-dumpautoload:
	@echo "============================================"
	@echo " Task      : Composer Dump Autoload "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && composer dumpautoload -o
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
	@echo " Task      : Clear Compiled View "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan view:clear
	@echo '- DONE -'

clear-cache:
	@echo "============================================"
	@echo " Task      : Clear Application Cache View "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan cache:clear
	@echo '- DONE -'

clear-config:
	@echo "============================================"
	@echo " Task      : Clear Config Cache View "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan config:clear
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

run-project:
	@echo "============================================"
	@echo " Task      : Running Project "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan serve
	@echo '- DONE -'
