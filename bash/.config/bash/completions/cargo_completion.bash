if command -v rustc >/dev/null 2>&1; then
	source "$(rustc --print sysroot)"/src/etc/bash_completion.d/cargo
fi
