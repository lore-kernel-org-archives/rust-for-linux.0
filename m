Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9D62BF3F4
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047746; cv=none; b=Viy5+7ucKeRprh75f9npOUfB/yTSMuMumluiK3eRyfXJdQ4tXMqvH0+YE9dxe5S4QuuAOFLXTKpkpJKIWqlNhiVrGPYzQvYUHmaiZWItbb4e58LFJFh6q0BiRZbmiTdSNsdJ5TEf9kLG9Qj8eW9ODgfoV/5a1Qzbcu0UZ9MFZUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047746; c=relaxed/simple;
	bh=HYrBDSzN90nJE0FNJnWKJ6iX4fI4UTQy5O60mKWyI9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5vTUEwn8xFz0EURpTUHMVL1bAJy5YNdFJging2SJDlyxg3kg1kO2s4J1Z4PdqAItTt2Q9OuK6jZE6qlx1jRRUqUhhFrZqO4VX2tG/u/GVLFb0TRii7sK7G/J2kiPkAF5lWgnn0qEwZVRvS/m7uQxckOFudgIbNxx1cmr4cwXjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=T7xOy1NY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="T7xOy1NY"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso99686f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047743; x=1783652543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsUqz/Qkq/LceV8TelFggUzjDk1o9pU0ZJGrnJynFBo=;
        b=T7xOy1NY/9etKIOuGN8ZgOo6A0dINgr0bkyWrGMP8COV24zDZT7aOsHf/BtKsyYq8u
         Ki4EdKCxwyiHo9JQO3W36zV86Gk8FunmnCeBY88Q3NukJRRCP8b4/zG0hsEtEtXX6xVg
         qMxY2uPNH1dDX4vtTZajgeKmOIqJxxm3CpkWhL538LpjH2YJ7oqdmD/aX9cCQt6RRMq/
         XlpwhlKY0FglxyrdXYqX4PEa9YkzYpifAhwYtODQQwzsG7bpJhkVkfT2a8lHybJnIeWv
         VL041hJXiBoCLrj3/e0WObTVcDatOHoLYWRY9b6FsDGf01HVE/t/Ks7EwUKGeQt8rHM6
         UESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047743; x=1783652543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HsUqz/Qkq/LceV8TelFggUzjDk1o9pU0ZJGrnJynFBo=;
        b=QB9BUuzBAjq3YJCMrDknPbMVaQ/vgegN8f3itW+BRgMEz1XdI0CjpKJcN15zVO6cSS
         CXPaQ6eZaJZA7gl/gwJJmkgqkwKLEB9yC5VWYm+5HFjWTdQvdDkHWN8o9/D5ZcMbjpRb
         NKevkI6Zb3rDkZ/VWLS1xfjPdeBzboen9UqOUqyOnGE7M7qEzM92df0+ELu8xtFikRMW
         p1tjAtRJ8XR7KsKrOCtW5whSXgmWiJIGpYtVV562KCPN0Oa4b5LeOBQYQaFE8Wtoauq1
         mCkcfHjWDLOJrerGdjpq5+xnL7gG/XHrSN53gMpx0vMC4kx8Sjzk/1iZRPXP7wVEoF7N
         aXhg==
X-Gm-Message-State: AOJu0YxYEcbC5CjFr3RYUy1ex283mw7Va8Ca8rhbNopnqN2hG/7acnCD
	0i50C7AA8AKaslKqGWOmkPaRMctFWW6+TuDrMRUO/EgisLkKIcAcL7Ly6+UHNSMXZ1xEJgi9sTk
	rnUjjCtuh
X-Gm-Gg: AfdE7cn3iFX/yMFoohnvYQQ0jFCzpyANQIamDWyYedLWYBjtWD3D9tYOfmNO80v51ue
	yCM+OC2Y3ItVOYqnIAojxo3pa1c1IfqAOO99F99ZTrZkTPZdAxuPDOBNZoP8JEsLdYE1dkNrKxf
	hp71EY+YHZ9cZoI4i8UrnTO9XtpeT0rR+mOQE16LQZWhDjFJF428H/jw+MaZf2EUo20bGQk/8Wf
	00oZ12VpAIK0BOnP9wuQJm/dQgGDCFjt/z0lcrySSI/BMV0O7sjKfYxSFBd7qM8S+KNMicbSM6G
	RlZ6Zj7hENhZDii5Z8oraUTq8EPaDh5NhEtqwOKmALvbbigiiYYpVssMQWklf+yXZaFqyw5CNtu
	MaRTzGe2VHUhdy+PZjPnLkUK8MGyHlnmkpWbacU4Cbbmbx7St3qlz6/8cbELHN0Y3ympcMKyVEL
	wtfZU4ZZKQ/SUVf8CVec4/YKl8vrgOHbFcb561DYsCxFfwgMhRnKazr1agOmop/AmXv50=
X-Received: by 2002:a05:600c:8b61:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-493c47f3c63mr88463955e9.5.1783047742662;
        Thu, 02 Jul 2026 20:02:22 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4a343csm141233875e9.0.2026.07.02.20.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:02:22 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 00/10] drm/vino: DisplayLink DL3 dock driver
Date: Fri,  3 Jul 2026 04:02:05 +0100
Message-ID: <20260703030217.2886-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260617151249.2937-1-mike@fireburn.co.uk>
References: <20260617151249.2937-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the vino RFC: an in-kernel Rust driver for DisplayLink
DL3 docks (Dell D6000, 17e9:6006), replacing the out-of-tree EVDI
module plus the DisplayLinkManager userspace daemon.

Still an RFC in the same place v1 was: the dock never engages its
content-protection channel for vino, so no pixels flow yet. What's
different is everything underneath it. v1's review said, in short,
"work on safe KMS abstractions instead of raw C KMS + as_raw()" --
that's the bulk of this round (see the drm series cover for the
detail), plus the driver picked up several months of hardware-testing
fixes since v1 that had nowhere to land until now.

   1/10  skeleton + USB bind + plaintext bring-up          (proto, rng)
   2/10  clean-room HDCP 2.2 AKE/LC/SKE                     (crypto, hdcp, ake, golden)
   3/10  AES-CTR/AES-CMAC control-plane seal + arm          (cp)
   4/10  Vino framebuffer codec                             (video)
   5/10  DRM/KMS sink, on the safe KMS mode-object layer    (drm_sink)
   6/10  the driver itself: USB bind, bring-up, KUnit tests (vino)
   7/10  the hardware cursor plane (cursor_atomic_update -> CP)      (drm_sink)
   8/10  CRTC gamma, plane rotation and DDC/CI monitor controls      (drm_sink, cp)
   9/10  two heads, 90/270 rotation, damage clips, connector probe   (drm_sink)
  10/10  hrtimer-driven software vblank for refresh-rate pacing      (drm_sink)

What's here and works, HW-verified: USB bind + plaintext session init;
HDCP 2.2 AKE (H'/L'/V'); AES-CTR + Dl3Cmac control-plane seal, byte-exact
against the reference daemon's wire traffic; the stream-open arm marker
that gets the dock processing our encrypted CP for the first time; a
registered DRM/KMS card (CRTC + primary plane + virtual connector/
encoder, GEM-shmem dumb buffers); the Vino codec's DC plane and 8x8
transform, byte-exact against captured hardware output.

What's missing / why it's still RFC:
 - No live pixels. Every host-observable byte we put on the wire now
   matches the daemon -- verified down to paired full-bus USB captures
   and xHCI TRB completion codes -- but the dock still won't ack the
   first encrypted control-plane frame. Current read is a dock-firmware
   gate unreachable from the host; a hardware USB analyser is the one
   untried next step. See docs/BLOCKER.md in the source tree for the
   full trail of what's been ruled out.
 - The codec's AC coefficient entropy grammar is reverse-engineered but
   not finished (EOB/scan/context still open), so the WHT colour path
   only covers 64x16-aligned geometry; other modes use the RLE
   fallback. Not fabricating the rest until it's verified against
   hardware.
 - Per-head EDID and per-head mode-set/DDC. Two heads are wired (patch
   9), each scanned out to its own video endpoint with its own cursor,
   but the bring-up only reads head 0's EDID, and the CP mode-set has no
   decoded head/stream field -- so a head is conveyed on the wire only by
   which endpoint its frames go to. Real dual-monitor use past the CP
   wall needs those captured.
 - Two known-open items from v1's automated review, unresolved because
   fixing them properly needs more of the safe-KMS work above: some CP
   message builders (cursor/mode-set) still GFP_KERNEL-allocate from a
   path DRM considers atomic-commit context, and CP_ENGAGED/scanout
   state are still module-global statics rather than per-device (the
   driver is single-instance throughout, so this only matters for a
   theoretical multi-dock case).

Depends on the safe KMS mode-object layer landing (posted alongside,
"[RFC PATCH v2 00/18] rust: drm: safe KMS mode-object layer + evdi
bindings") and, transitively, on the locking/DRM-registration
prerequisite postings that series depends on -- see that cover letter
for exactly what and why. This series won't build without them.

Source, HDCP/HDMI specs referenced, and the full RE trail:
  https://github.com/FireBurn/vino-scripts
  https://github.com/FireBurn/linux/tree/vino
  https://gitlab.freedesktop.org/FireBurn/linux/-/tree/vino

Changes since v1:
 - Rebuilt on the safe KMS mode-object layer instead of raw C KMS +
   as_raw() (Danilo, Miguel) -- see the drm series cover.
 - Folded in the v1 review fixes that survive independently of the KMS
   rework: in-tree AES-CMAC + key-prepared-once AES (Eric Biggers);
   Interface<Bound> threading + cancel_work_sync() of the bring-up work
   in disconnect() (fixes a dropped-work-handle UAF); EP08 16-bit
   length overflow rejected; codec SECTION_CODE mode indexing fixed;
   encoder shadow committed only on full-frame success; cursor_image
   checked arithmetic; EP84_BUF-sized cap reads; pace_cap_ack/
   lockstep_reply no longer abort on short frames; Kconfig depends on
   USB (was USB=y); #[cfg(CONFIG_KUNIT)] (was the always-false
   CONFIG_KUNIT = "y"); a redundant Kconfig select dropped (Julian
   Braha). All from the Sashiko bot + human review on v1.
 - Added the byte-exact Vino colour codec (DC plane + 8x8 transform)
   and the real EP08 wire-record framing, from continued hardware
   testing since v1.
 - Re-added the hardware cursor plane (patch 7) and, now that the safe
   KMS layer exposes them, the CRTC gamma LUT, plane rotation property
   and DDC/CI brightness/contrast/DPMS controls (patch 8) that v1's
   raw-KMS driver had.
 - Added a second display head, 90/270 rotation, damage-clipped repaint
   and connector detect()/mode_valid() (patch 9), consuming the new
   drm-series bindings. The KMS feature set now exceeds v1's.
 - Added hrtimer-driven software vblank (patch 10): the CRTC now paces
   page-flips to the display's refresh rate instead of completing them
   immediately, using the safe KMS layer's VblankSupport.

Mike Lothian (10):
  drm/vino: add DisplayLink DL3 dock skeleton and protocol framing
  drm/vino: add the clean-room HDCP 2.2 AKE/LC/SKE handshake
  drm/vino: add the AES-CTR/AES-CMAC control-plane seal and arm sequence
  drm/vino: add the Vino framebuffer codec
  drm/vino: add the DRM/KMS sink, built on the safe KMS mode-object
    layer
  drm/vino: add the DisplayLink DL3 dock driver
  drm/vino: wire the hardware cursor plane
  drm/vino: wire CRTC gamma, plane rotation and DDC/CI monitor controls
  drm/vino: two heads, 90/270 rotation, damage clips and connector probe
  drm/vino: hrtimer-driven software vblank

 drivers/gpu/drm/Kconfig          |    1 +
 drivers/gpu/drm/Makefile         |    1 +
 drivers/gpu/drm/vino/Kconfig     |   20 +
 drivers/gpu/drm/vino/Makefile    |    2 +
 drivers/gpu/drm/vino/ake.rs      |  173 ++
 drivers/gpu/drm/vino/cp.rs       |  733 +++++++++
 drivers/gpu/drm/vino/crypto.rs   |   48 +
 drivers/gpu/drm/vino/drm_sink.rs | 1173 +++++++++++++
 drivers/gpu/drm/vino/golden.rs   |   69 +
 drivers/gpu/drm/vino/hdcp.rs     |  167 ++
 drivers/gpu/drm/vino/proto.rs    |   73 +
 drivers/gpu/drm/vino/rng.rs      |   12 +
 drivers/gpu/drm/vino/video.rs    | 1229 ++++++++++++++
 drivers/gpu/drm/vino/vino.rs     | 2640 ++++++++++++++++++++++++++++++
 14 files changed, 6341 insertions(+)
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
2.55.0

