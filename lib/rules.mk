.PHONY: default
default:
	@echo "Targets:"
	@echo
	@echo "  check:"
	@echo "    Check JS/JSON files (e.g. under kubejs/) for syntax errors"
	@echo
	@echo "  check-config:"
	@echo "    Check JS/JSON files under config/ only"
	@echo
	@echo "  check-kubejs:"
	@echo "    Check JS/JSON files under kubejs/ only"
	@echo
	@echo "  sync-kubejs:"
	@echo "    Sync kubejs/ to server"

.PHONY: check
check:
	@$(PACKDEV)/bin/json-syntax-checker --all
	@CHECK_DIR=. $(PACKDEV)/bin/js-syntax-checker

.PHONY: check-config
check-config:
	@$(TOP)/maint/json-syntax-checker --config
	@CHECK_DIR=config $(PACKDEV)/bin/js-syntax-checker

.PHONY: check-kubejs
check-kubejs:
	@$(packdev)/bin/json-syntax-checker --kubejs
	@CHECK_DIR=kubejs $(PACKDEV)/bin/js-syntax-checker

.PHONY: sync-kubejs
sync-kubejs:
	@$(PACKDEV)/bin/sync-kubejs

##
# vim: ts=8 sw=8 noet fdm=marker :
##
