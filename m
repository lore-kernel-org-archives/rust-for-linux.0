Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82B43D8105
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708561; cv=none; b=OSwuHkONrx+JxM6D04AYIDjtlzGwglpmrf1S6H85sLMCKrD2fmnxpJ/Enu6ZbJFO8nBrZTi1AJd8Ns8CYTVy2Og6fC4Ly/eQGoVl5yKPrZkXhp1UeCSa9XGJRH4zwtoom+/gprJv6NVD6wvFXapkoS3A9yEOraV/F/cb4RZPUUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708561; c=relaxed/simple;
	bh=HgAsGPcIsWFm6yjX16LNzN20kh5XERUxvB1p3l7joy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q6PXQX6F9MeAHAQvObB3DW+0g+sZtFe/fqxAoAJ1rfMHcEztAnYZQ9akaqPBTLTa8EnBAiYqYLH9/+7wtFDp+kWmiWxmE0IAbsDxUQ5o8maJFSkB/TQT2x2k8TyKQaVKjycGtzba4WQgtd8AJUAW6UaII+hL/k1Z0grtvrdh0iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ddx+jn+2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ddx+jn+2"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bf046d4da1fso567109466b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708558; x=1782313358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lCa0uenWWZ89F0YVTYC+LQ6UyP30FoInUSkltfqEQkI=;
        b=ddx+jn+2Ey0M3UdwIGAyNFaDEcIRPMfiUm1oyXTWzi04qwqJtvQXGxoAEGSrQwwiH6
         gIBgnpmeeME0l2nZ8gGGiQ+egwuwYizzWGfbZiof6PkQGM9MbbKCfYlvtMQ295JsYUNm
         C4uAclvGyAeOO8uVRHRtv3YkFlohmmKRl92a9nlPX/wxCF2QHAanu9OE0rXLljSG2G38
         WihDJG3uz8olGu0ZtbaZ0hYo/pBDC2xljJkdVIHaBCpAtL/7ZuTYelNjfTLvlFT7H7wb
         yiDNoO9c0EQ+h7jNB79y8cGXZlcbxl5lyJHtZO8rT8liPv6vmFcI4tdKaLw5TgpWgT9H
         m/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708558; x=1782313358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCa0uenWWZ89F0YVTYC+LQ6UyP30FoInUSkltfqEQkI=;
        b=pcIo7rRGGln1wuUk650+CQK3WJQwrRtgzedapAzqwMBHP8S1Pq3kXnMJmp88I0lu7b
         a0W3m59am/vLt1zvblIkYjNgROzsCG5rITStUE3EwqemwkJLI5tOnBpf4lHCk0WnSH84
         lynNV8qetRQaZmdSstjlsg9P8NN/WU6Z8DPQjC4yFPmPSzf1wdJQ79sbVKGWNkSOzVNF
         2L4h+ijQqbO5gzE7xYCWj41hlZOQVkOCA8g44O7l0Bi/ksdIbD5l4HvykDJz4j1PgpT4
         uaGHOLMc9SHeX9wSbXgfrWN2TKdUI0IUEl/rCwsUmVdrJ8fdiYaGl1GA0K4yOZ8Y6LKW
         p0rg==
X-Forwarded-Encrypted: i=1; AFNElJ8wcmbIIgVZhePvJXVVNsrQHD5ejGDBGxknsv/INlxhrvZjpPVJF2c/pkQ9mLhAv5pur2zQT0t4cRVFDIOBXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBF5NMjrnBvTmK9w4w5ilz4zenZtDKi8UFFVNhflxVzMU2IyVx
	CEYrnUUi4JtukFkOXUWlSz5WnWIHtYSdzftLVOYEI15ENiS6TJ29Z0BFZsofU3rVQQ==
X-Gm-Gg: Acq92OERtbNm9lUvEk45GrB/JcBrwEXAdu47IoKLa9pb6/4vuD16p0OM7y67GO4LFmV
	/4d1Mdulc5Pb/Fj392zfX6AXf0luZst+EJvRmWg1mflSdxq4JroWZfIHh0AFBbI9mhe9vQHZUI8
	TJxiH4GZyNvzPI8fhuxCzJztmOzrWunCkrjgsGfH4F8cdlxA9ZYjR5Xa7CBQDI/nl5trhJRW603
	R40Ay+x+A1ucZII/jN2d4+lQYJIgiFIIhMczUzORcNa7wvxqyutukkb62D31Vsyzsg12/z0TxP/
	RTaES3rR15QjqTBK58QzeTzXd4EZoL7qhvz519hBXqgbsWFiEWks/hl8sZO3FAfYqedw76yBQNR
	iDD9QTZyJe4RQqBbyLgwMmTB9HbRCer1QWOKQEuzedn96xRkUslgQRgtoGbhuLuSkfrCsfsaGR7
	nh+l5iSUN91iZgLTr61B+1Ugi+9nnuZSdLQYuQ2CWg/dm05XJF4A24TAWj
X-Received: by 2002:a17:906:9fca:b0:c03:b8c6:cc27 with SMTP id a640c23a62f3a-c05a6bded8bmr287227266b.24.1781708557936;
        Wed, 17 Jun 2026 08:02:37 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm57264311f8f.11.2026.06.17.08.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:02:36 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/5] rust: drm: minimal KMS bindings, EDID read, rotation, HDCP defs
Date: Wed, 17 Jun 2026 16:02:22 +0100
Message-ID: <20260617150232.2210-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This RFC series exposes enough of the C KMS API to Rust for a driver to
bring up an atomic mode-setting pipeline with the drm_simple_display_pipe
helper (one CRTC + primary plane + encoder) and install a real EDID read
off its own transport:

  1/4  KMS headers + Driver::FEAT_MODESET/FEAT_ATOMIC
  2/4  <drm/drm_edid.h>: drm_edid_alloc/_connector_update/_add_modes
  3/4  pub drm::Device::as_raw() escape hatch (separate, contentious bit)
  4/4  <drm/drm_blend.h> (atomic plane rotation property) + a rust_helper
       for drm_atomic_get_new_crtc_state() (inspect proposed CRTC state
       from a mode_config atomic_check)

It is deliberately an RFC and interim: it does NOT add safe Rust KMS
abstractions (CRTC/plane/connector wrappers - an active upstream effort),
only the raw binding surface plus the trait/visibility tweaks a driver
needs to call the C helpers itself.

FEAT_MODESET / FEAT_ATOMIC follow the existing FEAT_RENDER idiom exactly
(per-feature bool associated consts folded into compute_features()), so
GEM-only drivers are unaffected.

drm::Device::as_raw() is made pub as a documented temporary escape hatch
for calling the C KMS helpers until safe wrappers exist. That is the part
most likely to draw objections, so it is split into its own patch (3/3):
the feature flags and header bindings in 1/3 and 2/3 are useful on their
own and can land even if the escape hatch is reworked or dropped (e.g.
replaced by narrow per-helper safe wrappers).

drm_blend.h (4/4) exposes drm_plane_create_rotation_property() so a
driver can offer the standard atomic rotation property, and adds a
rust_helper for the static-inline drm_atomic_get_new_crtc_state() so a
driver can read a CRTC's proposed state during atomic_check() (the vino
driver uses it to reject a multi-head modeset that would exceed the USB
bandwidth). Like the rest of the series it is interim raw-binding surface.

drm_hdcp.h (5/5) exposes <drm/display/drm_hdcp.h> so a Rust HDCP driver
can use the canonical HDCP 2.2 message IDs, length constants and hdcp2_*
message structs instead of redefining them (the vino driver runs HDCP 2.2
over a vendor USB transport and reuses only the message definitions, not
the drm_hdcp_helper state machine). It only pulls in <linux/types.h>.

Note: a related but independent fix - using drm_dev_unplug() instead of
drm_dev_unregister() in Registration::drop, which closes a real
use-after-free for Rust DRM drivers on a hot-removable bus - is sent as a
standalone, non-RFC patch ("rust: drm: unplug the device on Registration
drop") rather than buried in this RFC, since it stands alone and should
not be gated on the KMS-surface discussion.

Factored out of an out-of-tree in-kernel Rust DisplayLink DL3 dock driver
that drives a virtual connector and reads the dock's downstream EDID; but
the bindings are generic (the same path simpledrm/gud/udl use).
Compile-tested in-tree against drm-next.

Mike Lothian (3):
  rust: drm: add minimal KMS bindings for simple-display-pipe drivers
  rust: drm: expose drm_edid.h for reading connector EDID
  rust: drm: expose drm::Device::as_raw()
  rust: drm: expose drm_blend.h and the atomic new-CRTC-state helper
  rust: drm: expose <drm/display/drm_hdcp.h> HDCP 2.2 message definitions

 rust/bindings/bindings_helper.h | 10 ++++++++++
 rust/kernel/drm/device.rs       | 18 +++++++++++++++++-
 rust/kernel/drm/driver.rs       | 17 +++++++++++++++++
 3 files changed, 44 insertions(+), 1 deletion(-)

--
2.54.0
