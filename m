Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686B53559CA
	for <rust-for-linux@vger.kernel.org>; Sat, 16 May 2026 21:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778968442; cv=none; b=S1MK7Y+T6ZlTKH2r2hjpbA3G8Iche7SnR1Rl2lSzj5bGOWcKU+XH0ifFia77ZoVc5CbT9R3FxxS5YzRhalCYonHdU9RWNYKZig6Plq6LoLMv/VT5Hs+02l+MsCyBm4DdMf5cc66H/jra+HygASmIiT/SG86z3yOR6JUO4K5oJDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778968442; c=relaxed/simple;
	bh=QwAXB69n80Pd4ugLOGkroCOn4osl2iR1ETRhBgbC9MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dDK7kCGJMRMEdOsXpbEmgyUvjBoeSq/pnUNHHqkHuIZu0cpQjXM0eOpiuktbjdgR07aOzNV59EXPJibkXatCUnPolD6mSjdVVj4Ld/pHn5Neelwe2hne++8p66Bg8VRUFTG+g62dmIZcdg7fYJhx6fmAB3lLcL+StgushlhkOpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOFA8LoH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOFA8LoH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso4979005e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 16 May 2026 14:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778968439; x=1779573239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LoEw6E2OHGrqT9As9SHPvgWoPv2W3548Fizot2Lu9t8=;
        b=hOFA8LoHy+hFQ08HuffBRKSrHS9+RcW5POgDeMgaSQzXUl6JLwNzImTp9lzXC01Atx
         vcROOAiszSneK8OvEhArwU8qPj3yTGyHvCwgUHryOELY2cWqhH0abd1aLFysUBtewtha
         t9uMP44FH6jmwba7c6uNIjvA72tk9HujYDzJV8sYd9QPNZ5Jnn1rkne711utFjaqJ4UT
         nzX2KoI5JaSxhLmGn1WckF7+NOfbGBAKJ2Bewfg9HcDAC1x+CIfqUpxnpz89bBrfB2z7
         DuCxmAsEvqFOFzGSpQ2A+1mImJ8a20WgIWfQrpzRmJ86igZLMAkmikMDzlMe9SpZzrBR
         9PwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778968439; x=1779573239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoEw6E2OHGrqT9As9SHPvgWoPv2W3548Fizot2Lu9t8=;
        b=D9ZSX4bsi2RGTGl4i4K8XNxulT4UmuNubk+grGvu/zb7dZWyy/g7wFdlyHJsBsCfZd
         pYRnbyj6Irmjq9HYzFH8Mb5mKHUnU6d4/kbrYX0w+JNB3LDIXcl1Ebm97wET0PwLhjhn
         Bj5xVcQypRRNTbc4BtGRlfQMHDeqS5cuKVU0QM1iRaRivJ/iYw5xbIJRXthmjk6iw5Xy
         XW6Fcceg/Sz+UYIXI1w4I1lQjgrgbR2GiCtYMHQECMYBPwuERlHUou4I7WZkqMv5QwMz
         QvtGvJQgL1cxnvLzBrfeo/HxMAn3SZTWKftl5rzP30OBU6ykRMNpJYdNL9A4hGiqZtuy
         BZGA==
X-Forwarded-Encrypted: i=1; AFNElJ8550rw3nhEgIIcMJz+4ez2K8pvCTbLiDKVJhr+/kzVhB/finvP1KfAksq1g7WajlNMdVleeuVy2PyXwDoPFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUb69tWK/JsFIIDz2Y5yg9jt31An4DH7D1M1O+C7J2v3yKVLzy
	VvUXn9zI9JVPq4dUUT4dW+wbKyjyT2/Gb62KIYUSpsvsRJ4GIMcBw0Bc
X-Gm-Gg: Acq92OGAoWRiIET5uhZBpQ7X8w5spqI18gH/M/kOPZvaE+QIUEqDcyNDudz9Z6V0eB3
	v8E46NdB905lklVjbIFx6mv63uNMk2KY3hHLoV6cW6AEVc6uXbfCwh69kK27NDNgPPDSvBrKcPM
	v9kCdsy7wriT5fWCJ13FsJjl0dRY/fgeaXnWMKgMUbfYqxaKvnDe+9KsgjfhVlkE/ZsvML8nggq
	0jlcPZ1OqJdkgnU60rOrA+tjzKNETi3eo+cDh+D766d+vEXt/3Kz13Fo14kQC5mnXnt5nmEA7I5
	/esTTqO2xAhw2XJgkXmBTsy/455D+Mn4uMiOV9k9sVjnY/M7qgWP9U6ZCRuPohlyEKjI9+6FJMm
	zSJSPMwHw4zCgpmXqcB7nHuBcISePcxkXfInMY1T4xy1NUlvSAWIlLkS8KoIyKIiaSoJNFfslVg
	omsERRMs+x1f5wUv+SsoqYukRCPsDd7tcRMrUWMXwjC8oz6stexoK1MwI=
X-Received: by 2002:a05:600c:3f0f:b0:48f:99a9:bbcc with SMTP id 5b1f17b1804b1-48fe60ecb9cmr119600245e9.10.1778968438612;
        Sat, 16 May 2026 14:53:58 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c90b27sm158383415e9.8.2026.05.16.14.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 14:53:58 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: jani.nikula@linux.intel.com,
	akpm@linux-foundation.org,
	gary@garyguo.net,
	ljs@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	masahiroy@kernel.org,
	ojeda@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	yann.prono@telecomnancy.net,
	demiobenour@gmail.com,
	ej@inai.de,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [RFC v3 0/3] add kconfirm
Date: Sat, 16 May 2026 22:53:51 +0100
Message-ID: <20260516215354.449807-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

kconfirm has shrunk a lot since v2!

Okay back to the RFC...

kconfirm is a tool to detect misusage of Kconfig. It detects dead code,
constant conditions, and invalid (reverse) ranges. There are also optional
checks to detect config options that select visible config options, and to
check for dead links in the help texts.

Following this discussion:
https://lore.kernel.org/all/20260405122749.4990dcb538d457769a3276e0@linux-foundation.org/
in which Andrew brought up the possibility of moving kconfirm in-tree,
I've prepared this RFC to do so. See also kconfirm's introduction to the
mailing list:
https://lore.kernel.org/all/6ec4df6d-1445-48ca-8f54-1d1a83c4716d@gmail.com/

False Alarms:
kconfirm aims for zero false-positives, which is currently true for the
default checks (as far as I'm aware - but there are hundreds to go
through); this is not really possible for dead link checks, as this
depends on an internet connection, and we do not attempt to bypass bot
blocks. For this reason, dead link checking is disabled by default, but
I've provided an example below of how to enable it. Additionally, you can
view my previous message to the mailing list with hand-verified dead links
here:
https://lore.kernel.org/all/6732bf08-41ee-40c4-83b2-4ae8bc0da7cf@gmail.com/

Additionally, there is an optional check to detect config options that
select visible config options, as requested by Jani during the review of
the first version of this RFC:
https://lore.kernel.org/all/dcb7439832f0bb35598fba653d922b5f6a4d0058@intel.com/

Even after deduplicating across architectures, there are well over 1,000
instances of these select-visible cases, and I suspect that, despite the
Kconfig documentation saying select-visible should be avoided, some
exceptions will be made. So, I have left this check disabled by default,
keeping in line with the goal of having a low-noise checker. If interested
in using it, I have included an example below of how to enable this check.

Current State of Alarms:
On Linux v7.1-rc3 (which this RFC is based), there are 489 alarms coming
from the default set of checks, and an additional 1,789 alarms if enabling
the optional select-visible check. These counts are with deduplication
across all architectures, a change that was made to the tool's CLI from
RFC v1 to RFC v2. The last time I checked linux-next (next-20260427),
there were 81 unique dead links.

The most critical check is the dead default statements, which has surfaced
a few misconfiguration bugs (fortunately, just for kunit tests), see
examples:
https://lore.kernel.org/all/20260323124118.1414913-1-julianbraha@gmail.com/
and:
https://lore.kernel.org/all/20260323123536.1413732-1-julianbraha@gmail.com/

But hopefully kconfirm can ease maintenance and we can prevent more of
these from making it into the tree in the future.

Use it:
You can test out kconfirm with this patch series by compiling and running
kconfirm like this:

`make kconfirm`

To enable the select-visible check:
`KCONFIRM_ARGS="--enable-check select_visible" make kconfirm`

And to enable dead link checks in the help texts:
`KCONFIRM_ARGS="--enable-check dead_link" make kconfirm`

kconfirm by default runs on the same architecture as the kernel build
would; though additional architectures can be enabled by passing
`--enable-arch` and the default architecture can be disabled using 
`--disable-arch`. Alarms are tagged with the affected architecture. For
alarms that appear in multiple of the enabled architectures, they are
deduplicated and tagged like: [X86] or [X86, ARM].

Dependencies will need to first be downloaded from crates.io by running
the `cargo vendor` command in scripts/kconfirm/
 
Requested feedback:
1. I would like to know if anyone thinks that the select-visible check
   should be enabled by default. 
2. I'm still hoping for some usage feedback!

Thanks,
Julian Braha
---
Changes since v2:
- Reduce Rust dependencies significantly (follows Demi's suggestions):
  - from 6 direct dependencies to 1
  - from 107 indirect dependencies to 4
  - Replace ureq crate with usage of system libcurl (thanks Demi)
  - Replace clap crate with FFI bindings to libc's getopt_long (also Demi)
  - Remove crates env_logger, regex
- Switch from vendoring dependencies to requiring users to first download
  outside of Make (as suggested by Miguel)
- Various makefile improvements (as pointed out by Nicolas):
  - Fix out-of-tree builds
  - Only delete kconfirm artifacts with 'distclean' and 'mrproper'
- Add myself as maintainer of kconfirm (as discussed with Nicolas)
- Remove dedicated code license file (pointed out by Jani)
- Update documentation to explain tool setup
- Add hint to users to check documentation and download tool dependencies
- Address sashiko's many code-level and documentation suggestions:
  - Follow the kernel's rust import style
  - Fix a dead_range/duplicate_range alarm mixup
  - Fix potential duplicates in default value style check
  - Avoid panicking on errors
  - Clarify parse failure check usage in documentation 
  - Fix typo in documentation
- Can now enable architectures and disable the default (host) architecture in the CLI

Link to v2:
https://lore.kernel.org/all/20260509203808.1142311-1-julianbraha@gmail.com/

Changes since v1:
- vendored dependencies instead of requiring an internet connection
- removed Cargo.lock
- replaced reqwest dependency with smaller ureq
- removed rustls, expect user to have openssl instead
- added select-visible check based on Jani's feature request
- added invalid (reverse) range check
- deduplicating alarms that appear for multiple architectures
- `make clean` no longer deletes kconfirm's build artifacts
- typo fixes in documentation
- added patch description for the main "add kconfirm" patch (patch 1/2)

Link to v1:
https://lore.kernel.org/all/20260427174429.779474-1-julianbraha@gmail.com/
---

Julian Braha (3):
  scripts: add kconfirm
  Documentation: add kconfirm
  MAINTAINERS: create entry for kconfirm

 Documentation/dev-tools/index.rst             |   1 +
 Documentation/dev-tools/kconfirm.rst          | 222 ++++++
 MAINTAINERS                                   |   6 +
 Makefile                                      |  15 +-
 scripts/Makefile                              |   2 +-
 scripts/kconfirm/.gitignore                   |   3 +
 scripts/kconfirm/Cargo.lock                   |  60 ++
 scripts/kconfirm/Cargo.toml                   |  12 +
 scripts/kconfirm/Makefile                     |  14 +
 scripts/kconfirm/kconfirm-lib/Cargo.toml      |  12 +
 scripts/kconfirm/kconfirm-lib/src/analyze.rs  | 643 ++++++++++++++++
 scripts/kconfirm/kconfirm-lib/src/checks.rs   | 701 ++++++++++++++++++
 scripts/kconfirm/kconfirm-lib/src/curl_ffi.rs | 182 +++++
 .../kconfirm/kconfirm-lib/src/dead_links.rs   | 138 ++++
 scripts/kconfirm/kconfirm-lib/src/lib.rs      |  62 ++
 scripts/kconfirm/kconfirm-lib/src/output.rs   | 111 +++
 .../kconfirm/kconfirm-lib/src/symbol_table.rs | 223 ++++++
 scripts/kconfirm/kconfirm-linux/Cargo.toml    |  10 +
 .../kconfirm/kconfirm-linux/src/getopt_ffi.rs |  99 +++
 scripts/kconfirm/kconfirm-linux/src/lib.rs    |  78 ++
 scripts/kconfirm/kconfirm-linux/src/main.rs   | 192 +++++
 21 files changed, 2781 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/dev-tools/kconfirm.rst
 create mode 100644 scripts/kconfirm/.gitignore
 create mode 100644 scripts/kconfirm/Cargo.lock
 create mode 100644 scripts/kconfirm/Cargo.toml
 create mode 100644 scripts/kconfirm/Makefile
 create mode 100644 scripts/kconfirm/kconfirm-lib/Cargo.toml
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/analyze.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/checks.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/curl_ffi.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/dead_links.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/lib.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/output.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/symbol_table.rs
 create mode 100644 scripts/kconfirm/kconfirm-linux/Cargo.toml
 create mode 100644 scripts/kconfirm/kconfirm-linux/src/getopt_ffi.rs
 create mode 100644 scripts/kconfirm/kconfirm-linux/src/lib.rs
 create mode 100644 scripts/kconfirm/kconfirm-linux/src/main.rs

-- 
2.53.0

