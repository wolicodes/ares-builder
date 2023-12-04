PURPLE := $(shell tput -Txterm setaf 5)

all:
	@echo "$(PURPLE)Building containers ... $(RESET)"
	docker compose build
	docker compose up -d

stop:
	@echo "$(PURPLE)Stopping containers... $(RESET)"
	docker compose stop

clean:
	@echo "$(PURPLE)Stopping and removing containers... $(RESET)"
	@echo "$(PURPLE)Removing networks... $(RESET)"
	docker compose down
	@echo "$(PURPLE)Cleaning complete, local data untouched$(RESET)"

fclean:
	@echo "$(PURPLE)Stopping and removing containers... $(RESET)"
	@echo "$(PURPLE)Removing networks... $(RESET)"
	@echo "$(PURPLE)Removing volumes... $(RESET)"
	@echo "$(PURPLE)Removing images... $(RESET)"
	docker compose down -v --rmi all
	@echo "$(PURPLE)All data have been deleted. $(RESET)"

re: fclean all

.PHONY: all stop clean fclean re
