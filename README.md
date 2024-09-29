# Frida Servers Download

A simple bash script to download the latest Frida Servers release.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Introduction

[Frida](https://frida.re/) is an open-source dynamic instrumentation toolkit for developers, reverse engineers and security researchers.

This project contains a script that automates the process of downloading and extracting the latest release of Frida server binaries from the official [Frida Github](https://github.com/frida/frida) repository.

## Features

This script will:

- Download the latest Frida server binaries
- Create a folder labeled with the version that is being downloaded
- Automatically extract the `.xz` archives
- Delete the archive after installation to save space

## Requirements

- `curl` for downloading
- [`gojq`](https://github.com/itchyny/gojq) for parsing JSON from GitHub API
- `xz` for extracting `.xz` files
- Unix-based operataing system (Linux, macOS)

> [!NOTE]
> While **gojq** can be installed via **apt** on Kali Linux, it is recommended
> to download the latest release from the official GitHub page due to differences
> between the available versions. For more information and version comparisons, visit https://github.com/itchyny/gojq and https://pkg.kali.org/pkg/gojq

## Installation

To install the script in your device, make sure to clone the repository and make the script executable with the following commands

```bash
git clone https://github.com/jmpman1/fridaservers-download.git
cd fridaservers-download
chmod +x fridaservers-download.sh
```
## Usage

Simply run the script inside the directory you wish and it will download the latest Frida servers:

```bash
./fridaservers-download.sh
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits

- [Frida](https://github.com/frida/frida) for the server binaries.