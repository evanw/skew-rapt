BUILD = node_modules/.bin/skewc src/*/*.sk --verbose --target=js --output-file=build/compiled.js --message-limit=0

default: debug

clean:
	rm -fr build

build:
	mkdir -p build

debug: | build
	$(BUILD)

release: | build
	$(BUILD) --release

watch-debug:
	watch src 'clear && make debug'

watch-release:
	watch src 'clear && make release'