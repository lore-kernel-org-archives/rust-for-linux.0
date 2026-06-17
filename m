Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C96C23D297
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709180; cv=none; b=BB/HN8HukN2Lda7um7XVV1esP7dCkAjtm8U35tpkaw2KSjK8vyQ5Tq/X6DIcBJ7jf1w98bekCnWw+E3SXs9xOIF2u7iV/kQLCgYKbO37t41zaDDeUZ9Lpso62EQ6sNgR4xtLhZ0vR7FLK68UbA5r/2cp13RwCoMhJi8kSsbGN38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709180; c=relaxed/simple;
	bh=olS3e394ZJ2jFIELScF6fCjQNACLyN4Qx8f9GOALydo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l0uDlymBvPq3hcl4lMWWZzKsmSn5eQ5Mn/juxVxy5LWUydwfAiBqDvqy9bk2tsCk0rQYsn7xUhK1kh0RgakHRLAbPll8WxwltIc90VGUItJeXSFkh46HC1C2jlcf1Qt/i+PlEcmCzBQMB6JuXVVuM5CeB9+AiRCbaFFo12U+OPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=OK7HEJwe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="OK7HEJwe"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso56319155e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781709176; x=1782313976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1mULv+koftw5O8PCqfx+7jD7KAbxdOhkeCix7/plmIA=;
        b=OK7HEJwe5E0MKidBErzvmYxIIXFJTxIh06jUakjsgyVmtPF7BLRhbviTeIA4ywgVPF
         o6J59DLd16VAZS6FYtHrGqxW1yInQYdnLyURWqjKL6XrJFC6m7LJMOzN8SmOcLOK7God
         g0GoeOZ5nRysNH4PXdvgkozsKjwaB5/CJZqzTlsEmtZ/Bo48QkdvMjn7my3mP8h2+99p
         EAEycVZXDRbpQMKIEV33AfZuXitNwXToxKaAFXza5azMF5V4xS5CgCZVNXOExR/hPOEn
         1PHx0RchfDAP1782kxAniPM4QwWub8HWTTjOJ9XkK3EjTM5EwpHA/YP8C4VF8DMgDYSV
         C5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781709176; x=1782313976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mULv+koftw5O8PCqfx+7jD7KAbxdOhkeCix7/plmIA=;
        b=Xia2xy1xb44o3POhgcuwSRf02UKW9rezWJIQH+Mm9Hl8GzFlfTKrI0IHx5FKFSP/SM
         ay+sugyaig2bMpJ+brt0cwo4oDvsYs26dJKIemeM1+M5Ne7Du3QA1IHfTg53lyeJlWcc
         h631Ml+Qqqcy0vveF+Dl6p0pSydoVHtUs4GB+TSBZ0DjB0XjaGyWYmxNJLHaeqYpuUxl
         zPoF08z1aDsa4w4vJDUedg1qeVk+XA17rP4L/iWHHu90P79HMgnH7Jve0Df3U0QojnsO
         ZPeVHx66M4Z1QMz0bSF59kd2aAE6MxuYI0XBqBLoA7bCz8pNKkIuCL+B+plJ5H1r88Hk
         xYsg==
X-Forwarded-Encrypted: i=1; AFNElJ+Lu1mjoxJER9nj2ISywddbURkxlKJybaeFu9Ap4kL/uvhNLv/oNTj1l8OLJVNAjbYo7RyVJn+jnxNRBwpifw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUF04hpJUH9F1+v+yglBv1x/CaLRLdrJghj+ZsuYAzG4dUzFzq
	ZLphP5xEHSVDWJMsxwItfjFqzRpDeISiBgCWQTTqCC1GTzZcCiHF04wLCOdWYHJdMQ==
X-Gm-Gg: Acq92OEFn1hqcpRzti3nT1R0Ln3vI5KU9t0esK0valQ0i2jyL0qD6BEIHbysFYYthKG
	MpwsEHFdJWAetVwryfWXRQlV/01jGapfdUBjYLW9nvlUMBn/4IVO0eY5J/h05zW6ImgxAg0G1ri
	DZnl6znkjboKLsryLK17z7cwiE2OXOuQ0h4tlWRKAX/cHmVeyHoVJ79hHzIkwuZ49cTDiq1cKpT
	22HZUAyelExcg4hN9UcsEpZB9uJ4rJLZcR9oC8xrurgNWb4xx7Bj8Zne5E6lKr2saBuDFPpt5Qm
	cLhLT+0KzCLrQejATHsoe1TlkIViQfAuc7hZpEX/xl3W32BC0+EPugAlTs01JfCAKunhE+cwSyC
	/bhLGXuc8UQ9RvMpQKIdYNd6EVnp8vjkw+TiJNHXQd0c3LDQ5Zr+UIo3c8stdqNBAK9A5yMYP9v
	jMdl0hxe3MBAFPqqgF/8TfAiHmGrlR0AXbsMxNiPs0RObTCyOL2+22t5Bu
X-Received: by 2002:a05:600c:828a:b0:490:3fdd:d353 with SMTP id 5b1f17b1804b1-492333a14c5mr76057075e9.8.1781709176515;
        Wed, 17 Jun 2026 08:12:56 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a9a399sm151019305e9.14.2026.06.17.08.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:12:55 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	rust-for-linux@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/7] drm/vino: DisplayLink DL3 dock driver (RFC, help wanted)
Date: Wed, 17 Jun 2026 16:12:37 +0100
Message-ID: <20260617151249.2937-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vino is a clean-room, in-kernel Rust DRM driver for DisplayLink DL3 USB
docks (Dell Universal Dock D6000, 17e9:6006), a native replacement for
the out-of-tree EVDI module plus the proprietary DisplayLinkManager
userspace daemon. It is built on the in-tree Rust USB, crypto and DRM/KMS
bindings, which are posted as their own prerequisite series; this series
is the driver that consumes them and touches only drivers/gpu/drm/vino/
plus the two drivers/gpu/drm/{Kconfig,Makefile} wiring lines.

Prerequisite binding series (apply in this order before this one):
  - [RFC PATCH 0/9] rust: usb: synchronous bulk/control transfers + helpers
    https://lore.kernel.org/r/20260617145946.1894-1-mike@fireburn.co.uk
  - [RFC PATCH 0/2] rust: crypto: library AES-128 / SHA-256 / HMAC + RSA
    https://lore.kernel.org/r/20260617150143.2152-1-mike@fireburn.co.uk
  - [RFC PATCH 0/5] rust: drm: minimal KMS bindings, EDID read, rotation, HDCP defs
    https://lore.kernel.org/r/20260617150232.2210-1-mike@fireburn.co.uk

It is posted as an [RFC] in a deliberately INCOMPLETE state to ask for
help with one remaining blocker -- the control-plane engagement "wall"
(see below and patch 3). It was previously a single ~5000-line patch; it
has been split into one self-contained subsystem per patch so it is
reviewable and so others can pick up and fix a single layer in isolation:

  1. skeleton + USB bind + the plaintext connect handshake (proto);
  2. the clean-room HDCP 2.2 AKE/LC/SKE (crypto, rng, hdcp, ake, golden);
  3. the AES-CTR/AES-CMAC ("Dl3Cmac") control-plane seal + arm (cp);
  4. the Vino RawRl mode-2 framebuffer codec (video);
  5. the DRM/KMS device + EP08 framebuffer scanout (drm_sink);
  6. DDC/CI brightness/contrast, DPMS power and DFU device-info;
  7. KUnit self-tests for the protocol and crypto paths.

Each commit builds and the module loads on its own, so the series is
bisectable. With the prerequisite binding series applied it is
git-am-clean and checkpatch.pl --strict reports no errors (the only notes
are the expected "does MAINTAINERS need updating?" on the new files and a
few >100-column verbatim log strings).

Note on tooling: the implementation was AI-assisted (see the Assisted-by:
trailers); the reverse-engineering, the hardware testing on a real D6000,
and responsibility for the code under the DCO are the author's.

What works, all on real hardware (Dell Universal Dock D6000):
 - the plaintext connect handshake over the Rust USB bulk + control API;
 - the clean-room HDCP 2.2 AKE/LC/SKE -- H', L' and V' all verify against
   the dock, establishing the shared session key;
 - the AES-CTR + AES-CMAC control-plane seal, byte-exact against the
   reference daemon's captured wire, plus the plaintext stream-open arm;
 - registration of a real struct drm_device via an atomic KMS pipeline, so
   the dock appears as a mode-settable GEM/dumb DRM card, with a live EP08
   framebuffer-scanout hook on every page-flip.

What does NOT work -- the wall (help wanted):
 After the arm marker the driver sends the first encrypted control-plane
 frame and the dock never acknowledges it (the wsub=0x45 ack count stays
 0), so the CP cipher never engages and no pixels flow. Every
 host-observable channel has been matched to the reference daemon -- the
 bulk wire is byte-identical through the arm and the first encrypted frame,
 the AKE verifies, the seal/MAC/IV are byte-exact, the full EP0 control and
 endpoint sets match, and the arm timing is tighter than the daemon's --
 yet the dock silently drops our encrypted CP while engaging the daemon's.
 The gate appears not to be visible on the host wire. If you have knowledge
 of the DisplayLink DL3 control-plane engagement sequence, or ideas for
 isolating a whole-bus timing/ordering property a per-channel diff cannot
 see, help would be very welcome.

Not-for-merge as-is: the driver carries RE diagnostics behind pr_debug and
a small captured plaintext cap-announce skeleton (golden) that a fully
field-derived builder should eventually replace.

Mike Lothian (7):
  drm/vino: add DisplayLink DL3 dock skeleton and plaintext bring-up
  drm/vino: add the clean-room HDCP 2.2 AKE/LC/SKE
  drm/vino: add the AES-CTR/AES-CMAC control-plane seal and arm
  drm/vino: add the Vino (RawRl mode-2) framebuffer codec
  drm/vino: register a DRM/KMS device and scan out to EP08
  drm/vino: add DDC/CI brightness/contrast, DPMS power and DFU info
  drm/vino: add KUnit self-tests for the protocol and crypto paths

 drivers/gpu/drm/Kconfig          |    2 +
 drivers/gpu/drm/Makefile         |    2 +
 drivers/gpu/drm/vino/Kconfig     |   21 +
 drivers/gpu/drm/vino/Makefile    |    2 +
 drivers/gpu/drm/vino/ake.rs      |  167 +++
 drivers/gpu/drm/vino/cp.rs       |  686 ++++++++++
 drivers/gpu/drm/vino/crypto.rs   |   81 ++
 drivers/gpu/drm/vino/drm_sink.rs | 1466 +++++++++++++++++++++
 drivers/gpu/drm/vino/golden.rs   |   69 +
 drivers/gpu/drm/vino/hdcp.rs     |  167 +++
 drivers/gpu/drm/vino/proto.rs    |   73 ++
 drivers/gpu/drm/vino/rng.rs      |   12 +
 drivers/gpu/drm/vino/video.rs    |  348 +++++
 drivers/gpu/drm/vino/vino.rs     | 2053 ++++++++++++++++++++++++++++++
 14 files changed, 5149 insertions(+)
 create mode 100644 drivers/gpu/drm/vino/Kconfig
 create mode 100644 drivers/gpu/drm/vino/Makefile
 create mode 100644 drivers/gpu/drm/vino/ake.rs
 create mode 100644 drivers/gpu/drm/vino/cp.rs
 create mode 100644 drivers/gpu/drm/vino/crypto.rs
 create mode 100644 drivers/gpu/drm/vino/drm_sink.rs
 create mode 100644 drivers/gpu/drm/vino/golden.rs
 create mode 100644 drivers/gpu/drm/vino/hdcp.rs
 create mode 100644 drivers/gpu/drm/vino/proto.rs
 create mode 100644 drivers/gpu/drm/vino/rng.rs
 create mode 100644 drivers/gpu/drm/vino/video.rs
 create mode 100644 drivers/gpu/drm/vino/vino.rs

-- 
2.54.0

