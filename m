Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E400040B0EC
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762192; cv=none; b=A5iQJ51mfIz++5EqpZl1wlg5Uo29fuU+zJ7MbVtxYgAgELbgQBUjihGcP4aM7lOwJFZl+FDVeU4qEue9nJO33zoipGI9hijfiJRfLg9QK7D5tcz/9p3scXS006sWDiXkn9gPoRYi0RJgQ1t/gvO874lYRy2XQRI8yxFqV+59u48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762192; c=relaxed/simple;
	bh=uxy81Zi5nQv9TZNXSqJV9XlHTuBekJSMAz2Em3fQbA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TTt/g5jilPoatH4qJLVOA7V5r8G6zxaxPtbIgM4bkShdn5FA6U1jpO7h7gzxjlrfzdttCNlw+HwkqUp8Me2cZeowZxYz3oF70rReL6jg3yH5HcckzJtvmOvWnnE6HCMWyYNL7t5sLsCQNpqc9Vvc6PEjhVLxYZoF010nFLKJHTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=wRGSrY3h; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="wRGSrY3h"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495590dde14so8733165e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762179; x=1788366979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=suzR7ASY40M8VgE4lgqLDHANl8DdGYCBb6jwppDWyAA=;
        b=wRGSrY3hcOzYffPlYKDhiVzQpXHElhT1xfAVaiNO14EHtSgbfrMmtJtSwZGNsD8o2G
         Rvtf9sh2Uy/Q2QsQVyH5dLzGhT29FQbKAjR51Vq+wqR3/APJPPEop+Dhh+6gAPhuX1Pw
         DmFLjdhARJZe/wg65VZLZvg/KjwAj27pdUZDqxhPgow98YQ2a2uegc3TjpgnPhpJhcoM
         WlB+IC3BM3F2OCyodlBVO90xUv7ThTL8dYu90AmI7bu4pW7AqSqPCfPCUaVWHsLv369c
         lK8Rj0quao7WASyQqZfgihJtCuDPKuW++MSicxy3Exhr78FtZwLYURPxBBUQJvdv5xj1
         21Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762179; x=1788366979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=suzR7ASY40M8VgE4lgqLDHANl8DdGYCBb6jwppDWyAA=;
        b=XT4MBOx5W1wUe+nIHLF1HCnsXoXlyewRsDg9rHYH3Gq/uaYMGVB8dQudFP8zb5EFOv
         2uCfZJ/NYyJi5FLmmP6OzmudiL6UjoyxadF1AcsWxlokJIAONYBSeVVaLL7Y+LqUmVKy
         Q0rGkocATGqQoJT5AUXBjPt10UhJsNudrp2PBuJeeGALQSyCt9hRcjboiDrqjep3GG5X
         FaFn/U8ZDIIwsPY4LyWSxmk/ONc0jikK6dmLbn5ddd7xtt73ts+9AS6iUA8JKjLwnbx+
         yoZ9QTvjF8Uw0ia+S1IPbZ9j20NSappWgicdzlCUcOy9KiUH9wvk2k96JhGl6vrzE+Pj
         Ofnw==
X-Forwarded-Encrypted: i=1; AHgh+RrYSHTtbYJD8lm6Cvaz4lUVO3L7zZocgIjapbLui8f8yt0hMVQXg4HBt1fuBtdLOcRn2K23WFfUB/Pa5vI4Jw==@vger.kernel.org
X-Gm-Message-State: AFuF++nUTsTiWWOT5mQFGuCvUTj8i3inyx5ZMP5A1YBYXZC+os2QiihA
	mI/ummnSc9oJ5oeGZeZIVunTMcA3nFnQfiSNBkmw+6THcROCjhuvmE28vQFQpL4icw==
X-Gm-Gg: AR+sD10+wBZKvK+cpRb8OfDENv+4cc6WHmehmCTbeMoKwm6h6fWwgLtmGoEC/d4QEEB
	rAw+bOsl9ZaC0+0j5wJfRfC1/FE5IccY95ff6iYwt6QB18Cy8N+XxZl+x6azq+hQPhwqyCcC7pF
	mHCbYE7eUaDg2sROtKynNrd5VLErHmEfh7FOveG5vWsejlJyCPV7pOjOhzmHByNsmBK6D3MQpgE
	RjijPv2ozA/lXjHcJxeoc9f+PAVUzWtf+OdB3Yq0so0WmKH0Kt7UtTv5YaQLn5mQrGGbyH4Axzz
	H4Ty/XgEvKCY1ePggIKzPImIXMC0rhhKFbdGEdplf65Cu6i8KmFx4gmlng/UDNup3JlOR5YGIWK
	xGq8uDMYJYkMKqgwPr33W51GEnNw4nJJC1cpqagvQ4f4hsjlr7z/wgXt8NtSk2FNTL1p4wuNvDg
	VRrknTvySrxKuIam9K7enf28xE0ASS+Y2Ia5tC7HxmDhaaD6ACRIdY9o2OBp4xo78CdlYu2QURV
	5SY5DdQaj4A13w90pIK5QOkPTR3/9J8p0cmMBnFSYqiVvk=
X-Received: by 2002:a05:600c:c8f:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-499dc6f68b5mr69481545e9.5.1787762178738;
        Wed, 26 Aug 2026 09:36:18 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:17 -0700 (PDT)
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
Subject: [PATCH v3 17/23] rust: drm: add an owned display mode constructor
Date: Wed, 26 Aug 2026 17:31:48 +0100
Message-ID: <20260826163359.4998-18-mike@fireburn.co.uk>
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

Add a safe constructor for standalone display modes used by drivers
and tests.

Accept the essential timing fields and reject invalid active, sync,
and total ordering before exposing the owned mode.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/modes.rs | 62 +++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/kms/modes.rs b/rust/kernel/drm/kms/modes.rs
index cc3c486eecf1..b48a02edfc13 100644
--- a/rust/kernel/drm/kms/modes.rs
+++ b/rust/kernel/drm/kms/modes.rs
@@ -6,7 +6,33 @@
 
 use bindings;
 
-use crate::types::Opaque;
+use crate::{
+    error::{code::EINVAL, Result},
+    types::Opaque,
+};
+
+/// The essential timing fields of a display mode.
+#[derive(Clone, Copy)]
+pub struct ModeTimings {
+    /// Pixel clock in kHz.
+    pub clock_khz: i32,
+    /// Horizontal active pixels.
+    pub hdisplay: u16,
+    /// Start of the horizontal sync pulse.
+    pub hsync_start: u16,
+    /// End of the horizontal sync pulse.
+    pub hsync_end: u16,
+    /// Total horizontal pixels including blanking.
+    pub htotal: u16,
+    /// Vertical active lines.
+    pub vdisplay: u16,
+    /// Start of the vertical sync pulse.
+    pub vsync_start: u16,
+    /// End of the vertical sync pulse.
+    pub vsync_end: u16,
+    /// Total vertical lines including blanking.
+    pub vtotal: u16,
+}
 
 /// DRM kernel-internal display mode structure.
 ///
@@ -30,6 +56,40 @@ unsafe impl Send for DisplayMode {}
 unsafe impl Sync for DisplayMode {}
 
 impl DisplayMode {
+    /// Creates a standalone display mode from validated timings.
+    ///
+    /// This is useful when a driver needs an owned mode for validation or tests rather than a
+    /// reference to a mode owned by the DRM core.
+    pub fn from_timings(t: ModeTimings) -> Result<Self> {
+        if t.clock_khz <= 0
+            || t.hdisplay == 0
+            || t.hdisplay > t.hsync_start
+            || t.hsync_start > t.hsync_end
+            || t.hsync_end > t.htotal
+            || t.vdisplay == 0
+            || t.vdisplay > t.vsync_start
+            || t.vsync_start > t.vsync_end
+            || t.vsync_end > t.vtotal
+        {
+            return Err(EINVAL);
+        }
+
+        let mut mode = bindings::drm_display_mode::default();
+        mode.clock = t.clock_khz;
+        mode.hdisplay = t.hdisplay;
+        mode.hsync_start = t.hsync_start;
+        mode.hsync_end = t.hsync_end;
+        mode.htotal = t.htotal;
+        mode.vdisplay = t.vdisplay;
+        mode.vsync_start = t.vsync_start;
+        mode.vsync_end = t.vsync_end;
+        mode.vtotal = t.vtotal;
+
+        Ok(Self {
+            inner: Opaque::new(mode),
+        })
+    }
+
     /// Convert a raw pointer to a `struct drm_display_mode` into an immutable [`DisplayMode`] ref.
     ///
     /// # SAFETY
