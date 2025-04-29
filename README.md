# cnitool-builder 🛠️

This is a simple project to build and install **cnitool** without needing to install **Go** on your system.  
It uses **Docker** to build the binary in a safe container and copies it to your local `/usr/local/bin`.  

---

## How to use

Clone this repository:

```
git clone https://github.com/spurin/cnitool-builder.git
cd cnitool-builder
```

Run the install script:

```
./install.sh
```

The script will:
- 🚀 Build a Docker container that compiles **cnitool**
- 🏗️ Extract the `cnitool` binary
- 🔧 Install it into `/usr/local/bin`
- ✅ Finish with **cnitool** ready to use!

---

## Requirements

- Docker installed and running
- `sudo` permissions to install to `/usr/local/bin`

---

## Notes

- This builds the **latest** version of `cnitool` from GitHub.
- If you want a specific version, you can edit the `Dockerfile` and change `@latest` to a specific tag or commit.
- No Go installation required on your host machine! 🎉
- The final build uses a **scratch** container — zero libraries, zero overhead.

---

## License

MIT
