Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078748;
	b=kcvwowqVdAAxaSHEYBgg8QTtN9jp+Yj3b4NBxzQCSuizMX/5+42aipqP8Med2Ujwk0u2
	 SDYSLuWLt07fzialVJjtEuFXXfQSHt+RYlB/0H5WR7cd+xnTIUNdrXweVVnz+6Ia3GJKy
	 83lHpSH4nxPx2bKe4pNnc9Y34ucSrMjGa06FzbS9Gkay0QnISsuQ9DXgTFK1jexPMWpf+
	 Psw5o7Qxnh2MZuVx/YWcQz64rCjd2NOZqRueE07oevkx0huHIt42/0kusr7Qt8aRG8VwC
	 iWTQjwKJGD+ELZI6xIQ00LKkHA+ahaiFcYsGrQtrMBT38NWzuq0tfj1fN/JaCWVfvcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kHQppBuxk2+xzYf3QLOTBE1zqBXUyaj0qCJuhImI8OA=;
	b=OSEOkNng5nJ8I1f34cmvTtuVR7fKLfU9bK3Dul+y0ySB9iR49bBpq4/qqxXR2pnTrmQC
	 sjZxjVX/INpDfE8d+w/fFyiTsuBDzk4nm2UbWpdZmGLt2qaB+sypJ7iMxtypCFTpXoTPz
	 TK6wVanWmXB1RcHfD7C9TuQUWDJng9usXYJQ0j6ZzlJGayc/apfK4rEdFVFzCtebg/Z7i
	 YF5bJHsw8uiHFaEdAVPfX0b5mTdqqHRI5Hq17pZbnYLMm1h0koOfWfQoNKAW/M4gT+wab
	 teJ6G66dwoMubatyi8/JqRwtXvfJm1eCsLv4YPGTcKMWC9LFi4USX0dTNrISFNCyMbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="TL/ZMDss";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC90606A31E
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 05:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC90606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TL/ZMDss
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea7190aea1so17066205ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 22:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078747; x=1793683547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHQppBuxk2+xzYf3QLOTBE1zqBXUyaj0qCJuhImI8OA=;
        b=TL/ZMDssXogw5ydIJYnfWZjriwgtecG2+uJ4HMuMiv2WDe4gfJFA1yj0Un2nLCJJv0
         wMw6B7Wdk8jrDHSse/vmrsC2SJyORZIwS45IdraShJqJ1+NE9ue6u3iEje70M6uQ2liF
         NuDQBHpbqTCR5ikqtdV4ZV/KGeu1fzeu86w+Qa8zeZIOfNDjMd4blhgBJXrw4i9oORyt
         +zXMHmFTgB/G+L4MuX1l2ijJHmzZyu7eR/CrPrlrYExpYdDKnEE7bV9F8CNqGIWXfya8
         EP7pFglnJMzkmXrz6UA/vlFxBkWix5BtMFL5A7y7ODruGrxHMJgwxtglYkL3V+kzukI0
         TPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078747; x=1793683547;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kHQppBuxk2+xzYf3QLOTBE1zqBXUyaj0qCJuhImI8OA=;
        b=oevqN+sSFN+BZS/5iBeJAfkgcuilSy/Dw66xj5+TGwCXUxPOEe908hRdJXmTaSSCYB
         IyIpkaP3kEM9f8djGazcQeV/YMSc+3E989BFzQ1Vl4ognR28uLFIfhm/oPGciIw7VF1i
         M5/dwGMs6JpgWgZdpgT9tFBHe3eXQrd9c9+wYb8JE3cztnZ4hqkawhn63qwrxlj8KIhx
         vxTAp3OwrROGu9I6TJdHUftyJX8dFIShRXkiXVfqh8mvSsh5o+RlgnNZWr1F6Z4F/zdM
         4U1/netnsE3PuRJrmGCeBz9LNYQPTmck9Dy5npP7Nf9vBsyy1C/Ba13zsGnvIb103Byt
         CMQQ==
X-Forwarded-Encrypted: i=1; AKwUvByYBx9DV12q2/R6X8SgX6EblNdvmwF8edOXrK/z6nmvs58NZ3dV+PqHgfrkLVXBdCFwhOYzx37WJviwYW1yCw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKFNxNLoq0MuDVlY6GQZJv5oQbyrMVHBhVWkGqq0cxoKy5upd7+
	yYcfNjK9zMO1uEPwB1BbZ3QJkptjkptdra1JLQowwdzQuC9UuEDUad4R
X-Gm-Gg: AYBFou2F98VHb6bBIJ/NpsQjiMqywl7IGS/vaLwsDVFcav2zmerFAecKX/JufoRyX7d
	y56Kr9v/jYtitBkVcniGLXjnMMl2rvdtQXmRWdKEZZ2PemNwUl7Dc6gL0X2LfqCoGTM2h3BVP8E
	ZjMHjD3wrE8+URW5cG2mARV0dyBvVQ60E4f6OXEYPqEtczdwGuR/Tr5/iGgXMQRnqGtVNNiMkP9
	A3Q1I3N4uTftTxThq1gjwCCQuTRd45iQVUGJb3c76hRyE7FpMj2QYrm7CTo9ACUzNd1ocuSrNDs
	/N++9NIP4HwDFTasv73Ncpx6yJwYEFmw4vtPzpXTm4mms6QB1TFX4u5jeusJUCcIXhmulLuCJYu
	3LWHxTOcbduQNKAqBEObJVfpl7c1tY4oyyux458O8A8d3NRUuYZYjheGuhnvYHh1EovrWkKBUAj
	sDCRaGRUhL0vYwhYoFSJ2ZOYieqqYzW66ucTZDq3OdGW4GssUzyqn27yO3oOdJOi1uIbWsMjnZE
	sBX0GnbEEI6IcFe8M8bDLbcWM9tZvqcW41Ap1qnjutAFi+zK+6ZCTRSM8aI+5zENZdvkEkTTwLZ
	bafBZ6Btan6h+TifAvrlCstyWUUOzHVjH8+co030It0i1kc=
X-Received: by 2002:a17:903:fa8:b0:2e9:5eee:e078 with SMTP id d9443c01a7336-2ea9c0f39c7mr63239465ad.3.1793078746410;
        Mon, 26 Oct 2026 22:25:46 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:25:45 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	alistair@alistair23.me,
	rust-for-linux@vger.kernel.org,
	jic23@kernel.org
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	alistair23@gmail.com,
	wilfred.mallawa@wdc.com,
	bjorn3_gh@protonmail.com,
	gregkh@linuxfoundation.org,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	gary@garyguo.net,
	tmgross@umich.edu,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 00/23] lib: Rust implementation of SPDM
Date: Tue, 27 Oct 2026 15:25:13 +1000
Message-ID: <20261027052536.1722081-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
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

This is done using the `Validate` and `Untrusted` traits. The `validate()`
function has been updated updated to allow `context` which we use as
part of the validation.

The validation has also swapped from a C style pointer cast to using a valid
Rust struct and copying the data from the original buffer to the new struct.
This obvious has some overhead, but as SPDM packets are relativly small, and
not used as part of a constant hot path this seems fine. The big advantage is
that we can validate everyting at once, convert the endianess when creating
the struct and we get left with valid (not repr[c, packed]) Rust structs.

This makes the code a lot cleaner and more robust. It also removes a large
number of `unsafe`s and using `get()` for the arrays removes a large number
of possible `panic`s. Thanks for everyone at Kangrejos for the help with this!

I have kept Jonathon's reviews of the SPDM code, as the changes since the
last vesion are mostly just mechanical, convertting the repr[c, packed] structs
to copy structs.

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
  -device pcie-root-port,chassis=1,id=pci.1 \
  -device nvme,drive=mynvme,serial=deadbeef,spdm_port=2323,spdm_trans=doe,bus=pci.1 \
  -snapshot \
  -serial mon:stdio -serial null -nographic \
  -kernel deploy/images/qemux86-64/bzImage \
  -append 'root=/dev/vda rw  console=ttyS0 console=ttyS1 oprofile.timer=1 tsc=reliable no_timer_check rcupdate.rcu_expedited=1 swiotlb=0 '

echo tsm0 > /sys/bus/pci/devices/0000:01:00.0/tsm/connect
```

1: https://www.dmtf.org/standards/spdm
2: https://lore.kernel.org/all/cover.1719771133.git.lukas@wunner.de/
3: http://lore.kernel.org/69976d7d39c60_2f4a1009@dwillia2-mobl4.notmuch
4: https://lore.kernel.org/all/69976d7d39c60_2f4a1009@dwillia2-mobl4.notmuch/
5: https://lore.kernel.org/lkml/69e19c80b892b_fe0831000@djbw-dev.notmuch/

v5:
 - Split out crypto into Rust kernel wrappers
 - Use ZeroCopy for SpdmHeader
 - Add the Transport trait and CTransport type
 - Bind the device driver
 - Address bugs and issues from reviews
v4:
 - Based on discussions at Kangrejos the following changes were made
     - Add context to the validate functions
     - Convert the validate() functions to be complete Rust structs and copy the
       data, instead of C style pointer casts
     - Use ForeignOwnable trait for SpdmState
     - Use get() for array accesses
 - Address review comments
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

Alistair Francis (17):
  virt: coco: change tsm_register() to use a const struct
  rust: add bindings for hash.h
  rust: device: Expose Device from_raw() publically
  lib: rspdm: Initial commit of Rust SPDM
  PCI/TSM: Rename pf0 to host
  PCI/TSM: Support connecting to PCIe CMA devices
  PCI/CMA: Add a PCI TSM CMA driver using SPDM
  lib: rspdm: Support SPDM get_version
  lib: rspdm: Support SPDM get_capabilities
  rust: kernel: Add crypto hash bindings
  lib: rspdm: Support SPDM negotiate_algorithms
  lib: rspdm: Support SPDM get_digests
  lib: rspdm: Support SPDM get_certificate
  rust: public_key: Add crypto public key bindings
  rust: x509: Add X509 certificate bindings
  lib: rspdm: Support SPDM certificate validation
  lib: rspdm: Support SPDM challenge

Benno Lossin (2):
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
 drivers/crypto/ccp/sev-dev-tsm.c          |   14 +-
 drivers/pci/Kconfig                       |   14 +
 drivers/pci/Makefile                      |    5 +
 drivers/pci/cma.asn1                      |   41 +
 drivers/pci/cma.c                         |  271 +++++
 drivers/pci/doe.c                         |    6 +-
 drivers/pci/tsm.c                         |  122 ++-
 drivers/virt/coco/tsm-core.c              |    4 +-
 include/keys/asymmetric-type.h            |    2 +
 include/keys/x509-parser.h                |   57 ++
 include/linux/oid_registry.h              |    3 +
 include/linux/pci-doe.h                   |    4 +
 include/linux/pci-tsm.h                   |   48 +-
 include/linux/pci.h                       |    1 +
 include/linux/spdm.h                      |   66 ++
 include/linux/tsm.h                       |    2 +-
 lib/Kconfig                               |   17 +
 lib/Makefile                              |    2 +
 lib/rspdm/Makefile                        |   10 +
 lib/rspdm/consts.rs                       |  113 +++
 lib/rspdm/lib.rs                          |  329 ++++++
 lib/rspdm/state.rs                        |  784 ++++++++++++++
 lib/rspdm/validator.rs                    | 1129 +++++++++++++++++++++
 rust/bindings/bindings_helper.h           |    5 +
 rust/helpers/hash.c                       |   22 +
 rust/helpers/helpers.c                    |    1 +
 rust/kernel/device.rs                     |    2 +-
 rust/kernel/hash.rs                       |  145 +++
 rust/kernel/lib.rs                        |    7 +
 rust/kernel/public_key.rs                 |   69 ++
 rust/kernel/validate.rs                   |  275 +++++
 rust/kernel/x509.rs                       |  118 +++
 37 files changed, 3669 insertions(+), 125 deletions(-)
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
 create mode 100644 rust/kernel/hash.rs
 create mode 100644 rust/kernel/public_key.rs
 create mode 100644 rust/kernel/validate.rs
 create mode 100644 rust/kernel/x509.rs

-- 
2.56.0

