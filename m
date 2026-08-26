Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D1A4756CB
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762386; cv=none; b=OAN6gKFsbvkYkxg/ZHVodnTmitkXUkBZhg3l3MbdwdyQI97Tm7ibyWvjxnXd04j4dJFHSxdHpDSqXkCHpeMzygEoIwi5A3JJ8921oIW2tYaU3YZ1Iz3+7SHm1TV4PKWY7MUh2xctn7M04Ji9NmhijL4gRFXOavcSbrhf2boEzLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762386; c=relaxed/simple;
	bh=GnhSFpP2ZZVA6lnDAFu2MoLrDY2uFPIJJMSWayAph9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=It//gpCAbobaQO0Vt+cLrPXvkW/+77IP1Tk2BaIE5PzKBdXTUDwOUR4EM8LPiKWynlQAwa35plEEvgLJKvtLkf8b/7NfLqSGI2tCuOsDW2E/ljJfWdnAZOv6+uSlDcZZw8TiAwVV2S+Xk4qCbL3XW3ta7+LOonnEPXDJqlRr+yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=KC6LCcOz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="KC6LCcOz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49557167508so9289085e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762362; x=1788367162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1IBfOn3czZ5EpdI1ZgvwhTEN3bFG5oFHkL0oK7UJwww=;
        b=KC6LCcOzTp+H3R16ro1MM796R4DIX/UK0tsTOtWG+cWbbGu8aA5OZPFBQPZqh4Ldi6
         jEJhbsGGMHnijeWXLbktBl5BW3EYPMCp1WRp1adOafrYdXJZ9ogX9+Q5AYfFV4iaq3Bo
         xruylxJ2OoZdPKmaVTNg/idXwkhnC8EXGnz4Aap8wShxWyeYfRMt2E5mxoKQiVM8NJoH
         jTo9QGQK37P7L2KF64y8GQHOZCeaFyBQ51e0/C5c5h/jz8cVJFQFGf8ctUUsWl0f7ZUS
         hw+YLaM7wzRacq70+DFNsKO6s0xJRG08ij9nbvl9IgU0PcMQasypozRbV4Ktlzyl7BTR
         L6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762362; x=1788367162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IBfOn3czZ5EpdI1ZgvwhTEN3bFG5oFHkL0oK7UJwww=;
        b=mUXJUmEBfSXBQXK3HNClIOllsXJuVI2PRY6Xye/g1lg4weP9xD2cAZxEHJ9S7G3AhX
         jVR0O2nzHzYopb4eZTFhx1KkhViQN/5RW7ivllEm1lPPxzQ9rpTqNfM6/AYxTMlJ+AWb
         bpl2sZOxPAcEV/jgVayLK/xJqTba4Lo7KH3zMzv06ycFTyG82tIg3ArW6GzNKnjGVukS
         3oXxbSLa/IG4j/9gRWjjRttA+rIXCEoi14MLkEQTjik0UkLtUEwQynZJTp3TypOsqubt
         CKKpLwdCPY052IxfH9Ax9kfS4opxQvlpdxyoXdSf/PKhx7iKllYvNSUse4qPdSzCkYta
         d2rg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5UGfAGWfpxwh20kbuscMI17KB0kUxFVhAs4GBxIMT2LkJ+uE9y3+tGNQ/s/FQSdPQeyB4duxk1DDfGkbq1A==@vger.kernel.org
X-Gm-Message-State: AFuF++kLCSMdV+v10bJv4xSgBv+1VS4N89pNvQY7spN7AwiHaoCDPyrT
	x3OXKVjYi8Ys3VqXnQux4d3K4YLlcgZsSAD2J7QY+pjOUaK1RG97/9/Ij4V1pfdEKrSQ8nbtHk7
	Z0K00AsUK
X-Gm-Gg: AR+sD10xS5DuvtKvnebqyzsCHqaRdZnwq17WbuIETVsXqZY/wxZF/WVbcyFxQVcRTG1
	J2GVI8FW6PfRXHhIDkH2sXNhc2QQsX3kdMuCep5gLoI4KU0kJMTWkeatXOQ5nAEVibUXCPcjNLI
	pWIQ7HCKWf9pFCzX1Z6I+5oBCuWtJaLyC7JJVem3rOO8R1+FERQ+sGJEYVTeAL94dz8e0kw70mC
	pwZjKlGtQZbzOsiqwWUqnjTiwRzJzp9SDyGw976mDttRJjfJ3P77p/J8ck3ezLruM1emzviXX4P
	sn26l6sXULLk//LquMQjqSEg5oKUOMxYMe8l7sOxdIrbImotgcChtg7az9kmriT8Sj8/IyZlpqP
	nWvWZmIxRd2aQeQcPP4jnGyshdOpuh2a0sJBar1gjCUIWIakOyUP1Chy/KlrPRz/OGDMYMBNWuA
	XbFRadCpk3N9BhMUYY/8Hon4IxVAFp/3hWbMNLYR4Oa5RVb/iNKldmkMF3iUzqQM/VjZN1rzjd4
	5muURSqZ1xBFpCQrOg/exjHf62nkK9TfDhL
X-Received: by 2002:a05:600c:a418:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-499dc82073fmr78646645e9.11.1787762361624;
        Wed, 26 Aug 2026 09:39:21 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5721a0sm21769715e9.4.2026.08.26.09.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:39:20 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 0/13] drm/vino: a Rust driver for DisplayLink DL3 docks
Date: Wed, 26 Aug 2026 17:37:25 +0100
Message-ID: <20260826163913.7052-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vino is a DRM/KMS driver for DisplayLink DL3 docks. These devices carry no
standard display protocol: the host encodes each frame with a vendor codec and
ships it over bulk USB, inside a control plane sealed with AES-CTR and keyed by
an HDCP 2.2 authentication exchange. Until now the only way to drive one on
Linux was an out-of-tree kernel module paired with a closed source userspace
daemon

The headline change since v2 is not a refactor. v1 and v2 never lit a panel.
This one does, on three generations of dock, driving a real desktop, from a cold
boot with nothing of the vendor's loaded

Three generations are supported, and they differ in more than identifiers:

  DL-3x00 (Ella), which shares one pipe between control and video, states its
    decoder tables in a narrow form, and must never be blanked by painting
    black, because its shared pipe halts and the session dies with the panel
    still lit
  DL-6xxx (Ridge), including the Dell D6000, which serves both connectors from
    a single EDID handler, so a fetch on an empty connector returns the other
    one's monitor
  DL-7400 (Navarro), four connectors over two video endpoints, 10 Gbps

The differences are data. A dock is placed by family into a DockProfile carrying
its endpoints, codec geometry, allocation rules and quirks, and there is one code
path through the driver for all three. No per-device branches, and no module
parameter selects a profile or a code path

On DL-7400 the driver drives 30 bpp in PQ: 2560x1440p120 on two connectors, with
the sink reporting 10 bit. Depth is not a flag on the wire but a set of
agreements, the DMA format, the colour-depth word, the framebuffer allocation,
and the entropy coder's escape ceilings, each of which is stated to the dock by
its own decoder code table. Getting one of them wrong is not a clean failure: a
DC ceiling the dock was not told about desynchronises the bitstream mid-record,
and an AC one stays in step while reconstructing every sharp edge from a
truncated magnitude

Firmware. A dock carries its running version in a vendor descriptor rather than
in bcdDevice, which does not move across an update, so the driver reads that,
compares it against the packaged image and writes a newer one over DFU. This is
how a dock too old to enumerate its connectors is brought forward. With nothing
installed the dock stays on whatever it shipped with, probe says so and carries
on, so the update path is opt-in by putting the file there

The images are DisplayLink's own, out of their Linux driver bundle, which
installs them to /opt/displaylink. Copy the ones you want into /lib/firmware/vino
under the names they already have:

  ella-dock-release.spkg      DL-3x00
  ridge-dock-release.spkg     DL-6xxx, the D6000
  navarro-dock-release.spkg   DL-7400

From the 6.8.1 bundle those carry 12.2.15, 12.2.25 and 12.2.26, and that is what
the three docks here are running. Each was written by this driver, from 11.4.47,
11.5.28 and 11.5.29 respectively, so the DFU path is exercised rather than only
read. A manual write is also there through /sys/class/firmware/vino-<dock>/,
which is the direction the firmware upload API is designed around

Tested on:

  HP 3005pr port replicator, DL-3900, two connectors at 1920x1080p60
  Dell Universal Dock D6000, 17e9:6006, two connectors at 2560x1440p120
  WAVLINK DL7400 quad dock, 17e9:7000, four connectors, two of them driven at
    2560x1440p120 in 30 bpp PQ

All three bind concurrently on the same host, with monitors attached, driving a
KDE desktop. 97 KUnit tests across 19 suites run at module load under
CONFIG_DRM_VINO_KUNIT_TEST

Changes since v2:

  It works, which v2 did not. The gate was one byte: the EDID engage message
    carries its connector selector in two places and the second was being filled
    with the message's random tail, so the dock acked it and then never enabled
    the downstream sink
  No raw C KMS anywhere. The driver is built on the safe KMS mode-object layer,
    which is what Danilo Krummrich asked for on v1, and git grep bindings::drm_
    over the driver returns nothing
  No unsafe block and no direct bindings:: call in the driver at all
  Three generations rather than one, and the second and third arrived without
    adding a branch, which is the test of whether the profile split was real
  The development history is folded away. This was 33 commits carrying a revert
    pair, a module parameter added and later deleted, and fixes to patches
    earlier in the same series. It is now 13 that introduce the driver in the
    order it is understood, and a fix to a commit this series adds is folded
    into that commit
  select DRM_GEM_SHMEM_HELPER is gone, since RUST_DRM_GEM_SHMEM_HELPER pulls it
    in, which Julian Braha pointed out
  The related series are linked and Vino is named as the user for all of them,
    which Miguel Ojeda asked for

The trace_crypto module parameter, default off, deliberately logs one session's
keys so that a USB capture of that session can be decrypted. Every constant in
this driver came from such a capture, and it is the only way somebody holding a
DisplayLink dock nobody here owns can produce one that says anything. It is
flagged here rather than left to be found, because a kernel option that
discloses key material is a fair thing to argue about

The protocol was reverse engineered from captured wire traffic and from the
vendor binaries. There is no vendor documentation for any of it, every constant
here came from a measurement, and the assistance noted below covers that work as
well as the implementation

v2: https://lore.kernel.org/r/20260703030217.2886-1-mike@fireburn.co.uk

The rest of the posting, which is one series per subsystem:

  rust-core, 9 patches, rust-for-linux and linux-kernel
  https://lore.kernel.org/r/20260826162851.2497-1-mike@fireburn.co.uk
  rust-crypto, 2 patches, linux-crypto and rust-for-linux
  https://lore.kernel.org/r/20260826163004.3365-1-mike@fireburn.co.uk
  rust-usb, 5 patches, linux-usb and rust-for-linux
  https://lore.kernel.org/r/20260826163101.4168-1-mike@fireburn.co.uk
  rust-drm, 23 patches, dri-devel and rust-for-linux
  https://lore.kernel.org/r/20260826163359.4998-1-mike@fireburn.co.uk
  rust-firmware, 1 patch, linux-kernel and rust-for-linux
  https://lore.kernel.org/r/20260826163716.6274-1-mike@fireburn.co.uk
  drm-vino, 13 patches, this one

Vino is the user for all of them. The abstractions themselves are generic and
carry no knowledge of DisplayLink

The whole thing is one branch, base and prerequisites included, which is the
quickest way to read it:

  git clone -b vino-v3 https://github.com/FireBurn/linux
  cd linux
  make LLVM=1 rustavailable
  make LLVM=1 -j$(nproc)
  make LLVM=1 -j$(nproc) modules

CONFIG_RUST=y and CONFIG_DRM_VINO=m are the two to set; DRM_VINO selects the
rest of what it needs

It is the exact tree these patches were generated from, at 4c9ba407018e, the
drm-rust-next tip of 2026-08-06. drm-next has moved on since, and this follows
drm-rust-next deliberately: the KMS layer underneath this work lives only there,
and that tree picks up drm-next on its own schedule

Two commits on the branch are not in any of the series above, because they
enable no part of Vino: a scheduler call site that stops compiling under the
locking-guard series, and the Kms associated type Tyr needs once the KMS
registration trait requires one

It applies to the base above plus this, and nothing else:

  Lyude Paul, Rust bindings for KMS + RVKMS
  https://lore.kernel.org/r/20250305230406.567126-1-lyude@redhat.com

  Colin Braun, rust: usb: add usb request block abstractions
  https://lore.kernel.org/r/20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com

  Alice Ryhl, Creation of workqueues in Rust, plus Onur Ozkan's cancel_sync
  https://lore.kernel.org/r/20260312-create-workqueue-v4-0-ea39c351c38f@google.com

The reference branch also carries Boqun Feng's counted interrupt disabling
series, which SpinLockIrq needs. One patch of it is already in tip locking/core
as e901c1510e24

Danilo Krummrich's OwnedQueue, ScopedQueue and ScopedWork series supersedes part
of the workqueue work carried here, and is the better answer: Vino calls
Work::cancel_sync() in seven places to make teardown wait for its own work
items, and ScopedWork cancels on drop, which is that idiom done properly

  https://lore.kernel.org/r/20260807165252.3849875-1-dakr@kernel.org

It was still moving when this was cut, so this uses what is available today.
When it lands the swap goes in as one commit moving the prerequisites and the
call sites together, since either half alone leaves the tree not building

These patches were written with the assistance of Claude (Anthropic), used
through Claude Code as an interactive coding assistant, across the design, the
implementation and the tests. Every patch it contributed to carries an
Assisted-by trailer. The Signed-off-by is mine: I have reviewed and tested what
is here and I stand behind it

Mike Lothian (13):
  drm/vino: add the DL3 wire framing
  drm/vino: add the USB transport
  drm/vino: add the crypto primitives and the HDCP 2.2 AKE
  drm/vino: add the encrypted control plane
  drm/vino: add the dock profiles
  drm/vino: add the video codec
  drm/vino: add control-session bring-up
  drm/vino: add the KMS device and the atomic path
  drm/vino: add the dock activation and scanout path
  drm/vino: read the dock's firmware version, and update it over DFU
  drm/vino: add the USB driver frontend
  drm/vino: allow the driver to be built
  Documentation/gpu: document the Vino driver

 43 files changed, 24047 insertions(+), 4 deletions(-)

base-commit: 4c9ba407018e8deb06dbc643112bac8f40404f95
prerequisite-message-id: <20250305230406.567126-1-lyude@redhat.com>
prerequisite-message-id: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
prerequisite-message-id: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
