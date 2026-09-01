Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DE338A70B
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 01:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224644; cv=none; b=AuyxW/EtuGB+tV0DegOWf9kVMwH2KIr2PtG+6Weq7HiXVNrs2uu+oICbkdCh8hMD9HJMFwnSm8/rdb9OShGxceZZ3sNfVnCK1/bZW7KSJxRgu/8zFliphLHpN3nQ0KUeJvJVvt9oBMA8b9GP4mpSejdxqrSsO2kAvUE15wRrMr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224644; c=relaxed/simple;
	bh=0N7PZFteYPmAdCXOV/1Ri00KQjA0+w/H1rYBhz7BBzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RqaGqcWlJkgnaGbHE7S0aVz8UQsehrRCQtQwcnBq1hg05TKrpR1D7mrvGP04s7jn/6xdTDEdPHBP8OZqCGX/g4WQvLT7/It0ZHb8OLjAbq6Rb7uAu2FxFmEd0CExlf+Q0ITs46+vlGw+AP2wHPYO9I3Of7b2O1YA+Ey4C7g9ANY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZsNlE05; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZsNlE05"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc891373e0so37535595ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 18:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788224641; x=1788829441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWR/AgMdqB4Pk8bTidltEk6Rcw76/YkJaVkIRSZ9AmY=;
        b=dZsNlE05r7kiAEuSerS7zkQaeQ6ZI66/+jNaO05wgRJS5cIB61LkTcD91nYT6KQeGy
         IfooLJj1APQtKdyQntzmCwdI31zmzPBu2ki+H/3izpmmJ/aBGL7Jied2G/mBITgCdSpE
         2t85yQWtB+ImUErSQyi0VQp6gORooPEOpW2dDxz99PLHHRveDamOTSdKYjJCaktESoC3
         PPTaHHD0OLUamnJPX3qDpmD3hUeRHTX08VSgv4R0l7cCWNDl5yXZvIVOMdNyT9lQsbjn
         AJkxGtK+oSyDsQcs7NV0UuMtJ4j3SauujtB+U9AsIlQKBRaBOwb+md9NhovwPtHpKOnM
         HQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788224641; x=1788829441;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jWR/AgMdqB4Pk8bTidltEk6Rcw76/YkJaVkIRSZ9AmY=;
        b=AvZa3iCWM0sgHKrbtlDMYrVytCyn+uBxG0NQsP41aq79NmxDAu9YwdFR+eeFeg1TNB
         L5vts2VZEYf81SMer3uHxs6DrRVwAotUverW/rOjwGAzVvVvKU8ckAjUeJy9UfLBy1Nk
         A5cR2ULbe9ODoTMwc0nYAaAAGHlrgyYHKPdMQkt/p1mm0r18TOzJ/rSFDNC51K8Fs7RA
         bWaVbSWkF+K62WglQx67XjHsj3EPtHfeLVujyb8XFQWjvsZLzoYrx/+WOEi4Vemf6TvP
         6qwwnbd/5JKIGUheya9MjkywfVnbcA7jTwzeFORcV8GRFF1T8hjtgyMOr2zJH+/IuoyS
         XBkg==
X-Forwarded-Encrypted: i=1; AKwUvBzn3UzEeScFS+EcgP0M0Ff6FCr8SCZmZW7d/6rdaOCmp/L0sfSPMhBRHETbUbG5tkeIVx57grdUvTm+RzzTug==@vger.kernel.org
X-Gm-Message-State: AFuF++k0BeCrk8MzI8a5lUGGZ6D9XbLjSvzvh9aXa65Aea+DvU1jylSi
	5VAyXBhdE76o1K6c/bh0Vpywl40qP9/31zwxRjAPlSBeldM4OTLucy4E
X-Gm-Gg: AYBFou36E0TjOAI1nG4Y/4ROmWJVXm7q0+mmqndkwyVvtm7E3R93JiyMcwAmzLbSI7x
	oqEV3zJhj+v/68JlanX4J5iaXWcT6NAldmHJF9Sw5zHzSnLEIxtCAdi4lnDjHcdyRUYXTkks7he
	uvAGQ5ZXgfKtk/Jvm0QbkVjMpn4EjDP4Z9qGLab3GcuhMYKoRqE0NQ6RVVyP0F0wTtcP4a4aQt6
	hbF42456dgXCLJ3GLw6vtcskx/d4GbLyWs+66xmGkcGi1i0dhpjeZlxYszBv4qiNvexNlt9pgKy
	YjE38pg5cUA4BrIDbeMGCKYNBC4CxymaC+1POKgssMGdCrJlKOK8oNmak3Utfmgtt13hI/LNuNm
	5JM7Xv7HJBOX13JV0LGi6wWxUsSEpyEWZMxOjKd+oIwtf1R928h13UdCojyrUWmR0pt0lqYaqyd
	kIVUEZF5wlhR5QqN5Zk0Z52iwf2NK7T3GMw2ZjA03HXO41K7u/hhZF6C6hgVgTZXIjNMsnIVz20
	F96GQ==
X-Received: by 2002:a17:90b:2783:b0:398:9beb:5c19 with SMTP id 98e67ed59e1d1-3989beb6352mr31989254a91.20.1788224640516;
        Mon, 31 Aug 2026 18:04:00 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d49e9e0sm2372024a91.11.2026.08.31.18.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:03:59 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: linux-pci@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	djbw@kernel.org,
	rust-for-linux@vger.kernel.org,
	lukas@wunner.de,
	alistair@alistair23.me,
	jic23@kernel.org,
	linux-cxl@vger.kernel.org,
	bhelgaas@google.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: gary@garyguo.net,
	ojeda@kernel.org,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	alistair23@gmail.com,
	boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 00/21] lib: Rust implementation of SPDM
Date: Tue,  1 Sep 2026 11:03:26 +1000
Message-ID: <20260901010347.2614656-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Security Protocols and Data Models (SPDM) [1] is used for authentication,
attestation and key exchange. SPDM is generally used over a range of
transports, such as PCIe, MCTP/SMBus/I3C, ATA, SCSI, NVMe or TCP.

From the kernels perspective SPDM is used to authenticate and attest devices.
In this threat model a device is considered untrusted until it can be verified
by the kernel and userspace using SPDM. As such SPDM data is untrusted data
that can be mallicious.

The SPDM specification is also complex, with the 1.2.1 spec being almost 200
pages and the 1.3.0 spec being almost 250 pages long.

As such we have the kernel parsing untrusted responses from a complex
specification, which sounds like a possible exploit vector. This is the type
of place where Rust excels!

This series implements a SPDM requester in Rust.

This is based on Lukas' C implementation [2], but has been refacted during the
first few RFCs. I have included some of the relevent patchesfrom Lukas' C
SPDM implementation in this series where they are required.

This is a standalone series and doesn't depend on Lukas' implementation.

The goal of this series is to get the smallest possible SPDM implementation
upstream. That will provide building blocks for us to continue working on.

As such we don't yet provide evidence or certificates to userspace, allow
userspace to provide a nonce, support PQC or more advanced SPDM features.
This is enough to communicate with a device and return "authenticated" to
userspace.

Note that RFC v3 did provide evidence and certificates to userspace and
allowed a custom nonce. Showing that it's possible. I also have patches
that build apon [4] to do this via a TSM driver, again showing it's
possible with the current approach.
We just don't support it yet and for TSM I need [4] upstream first.

This series is different to Lukas' original approach and the approach taken
in the previous RFCs and instead adds the PCI-CMA support as a TSM driver.
This was described by Dan in [3] and [5]. The advantage here is that for PCIe
we can leverage the TSM work for a lot of the features and provide userspace
a consistient interface between PCI TSM and CMA.

This series also doesn't check the certificate chain against the kernel
keyring and will instead leave that to userspace once [4] is merged.

Other transport mode (such as ATA, SCSI, NVMe and MCTP) will
therefore need slightly different approaches, as TSM doesn't apply.
The library can support this though, it will just need some netlink
and sysfs wrappers added as applicable. This way each transport can support
SPDM in the way it sees fit.

The entire tree can be seen here:
https://github.com/alistair23/linux/tree/alistair/spdm-rust-tsm

I'm testing this by running the following

```shell
cargo run -- --qemu-server response

qemu-system-x86_64 \
  -nic none \
  -object rng-random,filename=/dev/urandom,id=rng0 \
  -device virtio-rng-pci,rng=rng0 \
  -drive file=deploy/images/qemux86-64/core-image-pcie-qemux86-64.rootfs.ext4,if=virtio,format=raw \
  -usb -device usb-tablet -usb -device usb-kbd \
  -cpu Skylake-Client \
  -machine q35,i8042=off \
  -smp 4 -m 2G \
  -drive file=blknvme,if=none,id=mynvme,format=raw \
  -device nvme,drive=mynvme,serial=deadbeef,spdm_port=2323,spdm_trans=doe \
  -snapshot \
  -serial mon:stdio -serial null -nographic \
  -kernel deploy/images/qemux86-64/bzImage \
  -append 'root=/dev/vda rw  console=ttyS0 console=ttyS1 oprofile.timer=1 tsc=reliable no_timer_check rcupdate.rcu_expedited=1 swiotlb=0 '

ls /sys/devices/pci0000:00/0000:00:03.0/
ls /sys/devices/pci0000:00/0000:00:03.0/tsm/
cat  /sys/devices/pci0000:00/0000:00:03.0/authenticated
echo tsm0 > /sys/devices/pci0000:00/0000:00:03.0/tsm/connect
cat  /sys/devices/pci0000:00/0000:00:03.0/authenticated
```

1: https://www.dmtf.org/standards/spdm
2: https://lore.kernel.org/all/cover.1719771133.git.lukas@wunner.de/
3: http://lore.kernel.org/69976d7d39c60_2f4a1009@dwillia2-mobl4.notmuch
4: https://lore.kernel.org/all/69976d7d39c60_2f4a1009@dwillia2-mobl4.notmuch/
5: https://lore.kernel.org/lkml/69e19c80b892b_fe0831000@djbw-dev.notmuch/

v3:
 - Rebase on 7.3-rc1
v2:
 - Tidy up the PCI/TSM function naming and is_pci_tsm_host()
 - A large number of changes (mostly to the Rust code) based on Sashiko reviews
     - This includes a few local runs of Sashiko
     - This has fixed a few undefined behviour bugs in the Rust code
 - Rebase on v4 of Benno's validate patches (patch 1, 2, 3)
v1:
 - Add CMA as a TSM driver
 - Initial support for SPDM 1.4
 - Cleanup a range of comments and concerns from RFC
 - Remove kernel keyring checks
RFC v3:
 - Use netlink to send information to userspace
 - Don't autogenerate Rust helpers
RFC v2:
 - Drop support for Rust and C implementations
 - Include patches from Lukas to reduce series deps
 - Large code cleanups based on more testing
 - Support for authentication

Alistair Francis (14):
  rust: add bindings for hash.h
  rust: error: impl From<FromBytesWithNulError> for Kernel Error
  lib: rspdm: Initial commit of Rust SPDM
  PCI/TSM: Rename pf0 to host
  PCI/TSM: Support connecting to PCIe CMA devices
  PCI/CMA: Add a PCI TSM CMA driver using SPDM
  lib: rspdm: Support SPDM get_version
  lib: rspdm: Support SPDM get_capabilities
  lib: rspdm: Support SPDM negotiate_algorithms
  lib: rspdm: Support SPDM get_digests
  lib: rspdm: Support SPDM get_certificate
  lib: rspdm: Support SPDM certificate validation
  rust: allow extracting the buffer from a CString
  lib: rspdm: Support SPDM challenge

Benno Lossin (3):
  rust: transmute: add `cast_slice[_mut]` functions
  rust: create basic untrusted data API
  rust: validate: add `Validate` trait

Lukas Wunner (4):
  X.509: Make certificate parser public
  X.509: Parse Subject Alternative Name in certificates
  X.509: Move certificate length retrieval into new helper
  PCI/CMA: Validate Subject Alternative Name in certificates

 MAINTAINERS                               |   13 +
 crypto/asymmetric_keys/x509_cert_parser.c |    9 +
 crypto/asymmetric_keys/x509_loader.c      |   38 +-
 crypto/asymmetric_keys/x509_parser.h      |   42 +-
 drivers/crypto/ccp/sev-dev-tio.h          |    4 +-
 drivers/crypto/ccp/sev-dev-tsm.c          |   12 +-
 drivers/pci/Kconfig                       |   14 +
 drivers/pci/Makefile                      |    5 +
 drivers/pci/cma.asn1                      |   41 +
 drivers/pci/cma.c                         |  275 +++++
 drivers/pci/doe.c                         |    6 +-
 drivers/pci/tsm.c                         |  115 +-
 include/keys/asymmetric-type.h            |    2 +
 include/keys/x509-parser.h                |   57 +
 include/linux/oid_registry.h              |    3 +
 include/linux/pci-doe.h                   |    4 +
 include/linux/pci-tsm.h                   |   30 +-
 include/linux/pci.h                       |    1 +
 include/linux/spdm.h                      |   37 +
 lib/Kconfig                               |   15 +
 lib/Makefile                              |    2 +
 lib/rspdm/Makefile                        |   10 +
 lib/rspdm/consts.rs                       |  184 +++
 lib/rspdm/lib.rs                          |  167 +++
 lib/rspdm/state.rs                        | 1230 +++++++++++++++++++++
 lib/rspdm/validator.rs                    |  554 ++++++++++
 rust/bindings/bindings_helper.h           |    5 +
 rust/helpers/hash.c                       |   18 +
 rust/helpers/helpers.c                    |    1 +
 rust/kernel/error.rs                      |   18 +-
 rust/kernel/lib.rs                        |    1 +
 rust/kernel/str.rs                        |   13 +-
 rust/kernel/transmute.rs                  |   59 +
 rust/kernel/validate.rs                   |  216 ++++
 34 files changed, 3071 insertions(+), 130 deletions(-)
 create mode 100644 drivers/pci/cma.asn1
 create mode 100644 drivers/pci/cma.c
 create mode 100644 include/keys/x509-parser.h
 create mode 100644 include/linux/spdm.h
 create mode 100644 lib/rspdm/Makefile
 create mode 100644 lib/rspdm/consts.rs
 create mode 100644 lib/rspdm/lib.rs
 create mode 100644 lib/rspdm/state.rs
 create mode 100644 lib/rspdm/validator.rs
 create mode 100644 rust/helpers/hash.c
 create mode 100644 rust/kernel/validate.rs

-- 
2.55.0

