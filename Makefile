BUILD = node_modules/.bin/skewc src/*/*.sk --verbose --target=js --output-file=build/compiled.js --message-limit=0

default: debug

clean:
	rm -fr build

build:
	mkdir -p build

debug: | build node_modules
	$(BUILD)

release: | build node_modules
	$(BUILD) --release

watch-debug:
	node_modules/.bin/watch src 'clear && make debug'

watch-release:
	node_modules/.bin/watch src 'clear && make release'

node_modules:
	npm install
