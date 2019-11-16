.PHONY: help
help:
	$(MAKE) -p -q  no-such-target | \
        grep -v -e '^no-such-target' -e '^makefile' | \
        awk '/^[^.%][-A-Za-z0-9_]*:/ { print substr($$1, 1, length($$1)-1) }' | \
        sort | \
        pr --omit-pagination --width=80 --columns=4
