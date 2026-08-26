Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8519347125B
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762200; cv=none; b=Mi6uyPfA8DawBUyRYTS/VoSaHIZHX4kOrlul5bq7X8KlGzgOizQKD/fWDl69nEJrR4djHErIlxv5ikEDJBsGx1V3U9ClYrAhJngmRYAEqAa/EXRNN8p/Aclm/ZWxJKE/Ulr4fqDsAmLUVTqJy/BNQ5frPUu++B//rX9ipHNPxfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762200; c=relaxed/simple;
	bh=zFWeP+8ct14G8fPYPF7YLoOKazDhFZn/d/KC/UovZy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/SE2FfU7hXIgd3helxQhNBOjX7y6QH1djSjStn4f7WE/UuyIN1HM9xcySdx9rm34EgBYZ114YDTBNF+lCbj5ld01r0iX7aL+0LOfqUmwzj8JZa0lWK847cSFVXZJkJ/W0IhJ7FexnqrwGlQ8Qpyvh1XKh8cuHRSkq7z2HLfrIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=xqMP83/W; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="xqMP83/W"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so1157115e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762183; x=1788366983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vl+DiUajk5iNhGqiCsP7kWZwbRynvLhcntFNkKHXw/s=;
        b=xqMP83/WRtagVxmisvrO0nc4wRR8Ba1UTH+8dlWUWXLe+zO0aWBb2zZJDeuefl5Vzh
         meSfgqGH1yVcAqjWsbnb+XNBgaqyanuZsZYQVFiAZGqWi984JbM92r5J5g6X3jYZWFKn
         f4FYN5NOq0Bw0VjHs5IJLEpYtLbjONRSP6S0dv228sZv6fmraGulpkRhg6JUtRyoRobA
         bz7e0/wFRTHD+WWwuSd7UcDbuXJjCh2So6FljgdQkd6yeWzfdouIMcnPouC1LOyIx3uY
         Ug9TknsgmZ/UB+apLdOHXfRSNhchRHfHimncMzQYrpfrX7gZi8Td6Ct7c7438g6K2IU+
         vugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762183; x=1788366983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vl+DiUajk5iNhGqiCsP7kWZwbRynvLhcntFNkKHXw/s=;
        b=SG1auHqs1EkYIRG9ifCxcCBgPNpKXxsyJY4HFqWpCOFPAVHkg78YNy1SlThFt3iAPt
         VaMYfCpbu3JiWLFXO37ohf57PBr3zPsqu+LTL0udAsUS7z5CBLlLOqXdF2RXSsFMGoQm
         LLePiADji2ehChXommMFXwHWdBZkYOv0fKYiQF2Bji7VU2fGeeARPyzf1nC8OyB/TAfh
         oi89DD7SR7hzz1dHw1CjaGgB8aME5q8YHUhYOjrdo6jVGszUzr0sWv/jQ0o0welX4Kga
         Tb3afQ452n56/bVUqpaCiPgJ9i8LlwnKmUqRCvZy6Gw5ck772VQIkA6eiol71TkVapfK
         aGDw==
X-Forwarded-Encrypted: i=1; AHgh+RoFtOI+xA08Wn6EVudnoAz1BOMU4zRa7iyI+rnOgl7VIuB8xOlzQAJ9/i3WLQiMwck5PHSLyxMAMgwix3RCmw==@vger.kernel.org
X-Gm-Message-State: AFuF++nVw7K9JuS5gzS6w+UdrhbgPfrkGF+bPreAaHVqBYyII5povYAj
	LkSjCMHYzcJtqOQsuf7jaVbYR8Ao/n3M3wAqhwT6NTXeAFOzO5k2T//O2Rq4ySUfnw==
X-Gm-Gg: AR+sD138FcvNF9yHpn9E/SXtLZuZUew5a+Unt6UNGsIdoAhxWKrB5yB66MFuFVUXWjK
	0sdLImMBOv4AirnCNndl1y7wwJWL24FLBW6rpPBAybmp2TqvBg1NJer4OsqEndbpc/xB1Cmi3ID
	NRmQar4C/S47wS0ofFBY+OPC9Uh9I/85W5vFIAIQDR4J6jf6nBACkbmp5Pbq9I1MePYJK5w7D7e
	Ue53d4tI7byJqFqVsQ2wU8Ovmmoes7mh6Hg4i1gvbaPIIlVDgzi309na9UckNbaj3nIcxYGs2rH
	yvuYpUH87cV4gCsYxBbHFptAVTAugW8wezBPapu0yVxD9EvgvDS6Y7NEbA7HGxW2g9hCgaOqtEt
	LJSeJGG46K5wCrsIKHzCbz8svPlFJqvw0Y4obMkfjW0Hz7mEmV+/0Mnm1lIe9cJUcbjS9hcXwd4
	us+X5aElc2prob7uD28DrlgpQsLjxZ0PoCSm+ZKe6/ZPu0XfvuzZDpX1n4nQ2j6HKIGz1W4LEK3
	EtYYeK5PoPPzhdUpDxs9GnFf0drKTe+Oyy5
X-Received: by 2002:a05:600c:a086:b0:499:b000:b828 with SMTP id 5b1f17b1804b1-499dc6e9a9dmr93091925e9.4.1787762183517;
        Wed, 26 Aug 2026 09:36:23 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:21 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 18/23] rust: drm: expose mode flags and CTA VIC matching
Date: Wed, 26 Aug 2026 17:31:49 +0100
Message-ID: <20260826163359.4998-19-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163359.4998-1-mike@fireburn.co.uk>
References: <20260826163359.4998-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let Rust DRM drivers construct modes with signal flags, inspect those
flags, and use the DRM EDID helper to identify the matching CTA-861
Video Identification Code. This keeps drivers from duplicating the
canonical HDMI mode table.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/modes.rs | 73 ++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/rust/kernel/drm/kms/modes.rs b/rust/kernel/drm/kms/modes.rs
index b48a02edfc13..584f20456c07 100644
--- a/rust/kernel/drm/kms/modes.rs
+++ b/rust/kernel/drm/kms/modes.rs
@@ -11,6 +11,60 @@
     types::Opaque,
 };
 
+/// Flags describing signal polarity and scan format for a display mode.
+///
+/// These correspond to the `DRM_MODE_FLAG_*` values accepted by the DRM mode helpers.
+#[derive(Clone, Copy, Default, PartialEq, Eq)]
+pub struct ModeFlags(u32);
+
+impl ModeFlags {
+    /// Horizontal sync is active high.
+    pub const PHSYNC: Self = Self(bindings::DRM_MODE_FLAG_PHSYNC);
+    /// Horizontal sync is active low.
+    pub const NHSYNC: Self = Self(bindings::DRM_MODE_FLAG_NHSYNC);
+    /// Vertical sync is active high.
+    pub const PVSYNC: Self = Self(bindings::DRM_MODE_FLAG_PVSYNC);
+    /// Vertical sync is active low.
+    pub const NVSYNC: Self = Self(bindings::DRM_MODE_FLAG_NVSYNC);
+    /// The mode is interlaced.
+    pub const INTERLACE: Self = Self(bindings::DRM_MODE_FLAG_INTERLACE);
+    /// The mode uses doublescan.
+    pub const DBLSCAN: Self = Self(bindings::DRM_MODE_FLAG_DBLSCAN);
+    /// The mode uses composite sync.
+    pub const CSYNC: Self = Self(bindings::DRM_MODE_FLAG_CSYNC);
+    /// Composite sync is active high.
+    pub const PCSYNC: Self = Self(bindings::DRM_MODE_FLAG_PCSYNC);
+    /// Composite sync is active low.
+    pub const NCSYNC: Self = Self(bindings::DRM_MODE_FLAG_NCSYNC);
+    /// The mode carries a horizontal skew value.
+    pub const HSKEW: Self = Self(bindings::DRM_MODE_FLAG_HSKEW);
+    /// The mode is double-clocked.
+    pub const DBLCLK: Self = Self(bindings::DRM_MODE_FLAG_DBLCLK);
+    /// The mode uses a half-rate clock.
+    pub const CLKDIV2: Self = Self(bindings::DRM_MODE_FLAG_CLKDIV2);
+
+    /// Return whether all flags in `other` are set.
+    pub fn contains(self, other: Self) -> bool {
+        self & other == other
+    }
+}
+
+impl core::ops::BitOr for ModeFlags {
+    type Output = Self;
+
+    fn bitor(self, rhs: Self) -> Self::Output {
+        Self(self.0 | rhs.0)
+    }
+}
+
+impl core::ops::BitAnd for ModeFlags {
+    type Output = Self;
+
+    fn bitand(self, rhs: Self) -> Self::Output {
+        Self(self.0 & rhs.0)
+    }
+}
+
 /// The essential timing fields of a display mode.
 #[derive(Clone, Copy)]
 pub struct ModeTimings {
@@ -32,6 +86,8 @@ pub struct ModeTimings {
     pub vsync_end: u16,
     /// Total vertical lines including blanking.
     pub vtotal: u16,
+    /// Signal polarity and scan-format flags.
+    pub flags: ModeFlags,
 }
 
 /// DRM kernel-internal display mode structure.
@@ -84,6 +140,7 @@ pub fn from_timings(t: ModeTimings) -> Result<Self> {
         mode.vsync_start = t.vsync_start;
         mode.vsync_end = t.vsync_end;
         mode.vtotal = t.vtotal;
+        mode.flags = t.flags.0;
 
         Ok(Self {
             inner: Opaque::new(mode),
@@ -202,10 +259,26 @@ pub fn clock(&self) -> i32 {
         unsafe { (*self.as_raw()).clock }
     }
 
+    /// Return the mode's signal-polarity and scan-format flags.
+    #[inline]
+    pub fn flags(&self) -> ModeFlags {
+        // SAFETY: Reading this field is safe via the type invariants.
+        ModeFlags(unsafe { (*self.as_raw()).flags })
+    }
+
     /// Return the refresh rate in Hz as computed by DRM.
     #[inline]
     pub fn vrefresh(&self) -> i32 {
         // SAFETY: `drm_mode_vrefresh` only reads this valid display mode.
         unsafe { bindings::drm_mode_vrefresh(self.as_raw()) }
     }
+
+    /// Return the CTA-861 Video Identification Code matching this mode.
+    ///
+    /// A return value of zero means the mode is not one of the CTA-861 modes known to DRM.
+    #[inline]
+    pub fn cea_vic(&self) -> u8 {
+        // SAFETY: `drm_match_cea_mode` only reads this valid display mode.
+        unsafe { bindings::drm_match_cea_mode(self.as_raw()) }
+    }
 }
