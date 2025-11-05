Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C8A26E17A
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 05:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762321666; cv=none; b=JUMMJvmHJlQXy6QTfjvOJWpziAjFf4NCdKLupEHR5G6VVl2inUONK07S+XT5I/vUk4ct9xH5XmoPeLT7m55v5vmvNpFvTRERO5CxcAba6UZlHQhyErhLkcd8ai8wMo0c3YJ1CLCkiM5V3fEuWSV/ixf/4pWbarH/rgOUbArsY7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762321666; c=relaxed/simple;
	bh=NqsSv/6b13F+nZDKSLwWOQshhcLrq8t7jHQp1RLVPxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IlO7Rlt5UUEAhvywV5XtG1gwmgBuruWsgXQSb+XVWbqQDemqyiofAhd4jWMixkc7ZmNMUlfVd7TxiUAVHe2lciKQO9w3QgAN8g12J4aOW8r+p8fCzONpibKGamix4+NTBWHTfxWFfkSzDzCXYcPYaBIq9taf+2YpGHa725ZAdLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFuYRDP9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFuYRDP9"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso6145369b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 21:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762321664; x=1762926464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RAZjIgj+R1xhkDYALnFZM1TJBYz10m9LNiwy8WClsg=;
        b=YFuYRDP9G/dvq2ydMrSdk05Q23aV4YesY0nYHgJXlK102A5V3z1ZXvK6eAKoi10pc3
         IMftzHAR6YK/0RpYPlNA/bs0I2eHk3r3bAK2nbR97bKuiSOD6EcChcm02zPZuTyi3yaa
         La0NCx44BPN7VHAeKzEU4p9uyn6MoixnagBdwFMwjD5gtZAytQJiJt9T2jxWa0WhCzMS
         gflimw4oJb5wXVGcSHDYfXveLFpKhKk/obb7a0woA51QFAkQc0ANgYArDYqpxQN+77aG
         aHuYoKnkI4q+1DOhcXRK7aXbK5ovHDLF3ExYHBCdY1C6axuYXflBAaG/arF+oRE+JURA
         G7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762321664; x=1762926464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RAZjIgj+R1xhkDYALnFZM1TJBYz10m9LNiwy8WClsg=;
        b=SSXUj713YeHX+RtLdtnEjYtKNZjYfWmmjM7BPoQsGhtPzUddcnogL7i+0tKLx1xtyu
         IHbFEy6SNQUml8esTQiVOgVdsWjv42L7dKF2upSRC8f7K0WI5nVzf6RcFTI6ddEHxp5M
         YqvoaTgn2L1Ba1gttWCnNm3LQAviFTWIkhemyIV5nOwqTBL71zUc5xDclicv+kv/kZQ0
         p5u+f2X4qiOBW63ohAifYVxaCCJTJ/kvH3BDrYQcd9gMzjpd2ppzbY+VnzVaITP3poet
         WyzfAGl+XfwEXSGLNDlFcII++5WOVfXIU2BklzV27BbD37bgHzhmaMcLdD8vrvy03TWN
         +xnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8qQasRQ+jm7XJ0jK9z0xB/C27TRdUSq13q3/2U4E0fPa7+2T4nt4OT3PaAjjiyojC1wfubcsUgcaNcmUwtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+y67PuLJjfKGNerU75VT4FF6XSQipx6S+XWX/en9DxcOGakuc
	btDVSMzPiHwPo4rf0bOcBKUj1Pr0U+BQF/8HV/c61VKBboQOmtfIRTjS
X-Gm-Gg: ASbGncvlydDx+emlwnba80ExUlYvuTisK6uOlGwpSe38V4cu/vGyF4lfxz9pwxMCWhM
	hYPYGynGtpYg//kfGMoseqLVrFwmFyTLrJJ/0sAgPzVy/BBJ+U2OUT+lgVU2HGjmX41zEvgubXP
	76kJmmki79zpUDa/6IUvd95iJ0DfIiLstPKeYoYr35ZOELfQhgOxfvSJTSFU6sJcCX2J4ATbFlh
	k7O5HNGx9oc2BRodTntIFTtHNsnF8w1jXMLwritNsSznQvBC3xlnLm283OXh8TF6v36H0ZfXkRC
	6cnZiQnc/saBjDSnhxzozeU+6W8BmqzfsYATjSHv1XdFu1nPxcNaykag5o/p3Dctsb2T2Ca8QRU
	9dRyxUy4TwKdXfKLi3HLNJ6zkrbyofk5jhwNetsv2+9BER2/AKHVFtj7oL28trgGZnwJmRIR5I2
	9a0PbTd+x1Cd5AVe+bmvlf9/jqAYntmcO7Ilak48qZQR2uYIr7KHsNU+oHaXM=
X-Google-Smtp-Source: AGHT+IHn808zLxCu5HUA9DswL4+s4ecMIBI3+BZzC+DOeG6SAligwuD//AYdy2TRym+BK2nbNZLHBw==
X-Received: by 2002:a05:6a20:394e:b0:334:9d7d:f255 with SMTP id adf61e73a8af0-34f83b0ff3dmr2860334637.14.1762321664419;
        Tue, 04 Nov 2025 21:47:44 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd6824811sm4913219b3a.64.2025.11.04.21.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 21:47:44 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	jens.korinth.tuta.io@kernel.org
Subject: [PATCH v1 1/2] rust: Add support for calling a function exactly once
Date: Wed,  5 Nov 2025 14:47:30 +0900
Message-ID: <20251105054731.3194118-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Rust equivalent of the kernel's `DO_ONCE_LITE` macro. While it
would be possible to implement the feature entirely as a Rust macro,
the functionality that can be implemented as regular functions has
been extracted and implemented as the `OnceLite` struct for better
code maintainability.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/lib.rs       |  1 +
 rust/kernel/once_lite.rs | 71 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 rust/kernel/once_lite.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3dd7bebe7888..19553eb8c188 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -110,6 +110,7 @@
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod of;
+pub mod once_lite;
 #[cfg(CONFIG_PM_OPP)]
 pub mod opp;
 pub mod page;
diff --git a/rust/kernel/once_lite.rs b/rust/kernel/once_lite.rs
new file mode 100644
index 000000000000..44ad5dbdc67e
--- /dev/null
+++ b/rust/kernel/once_lite.rs
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for calling a function exactly once.
+//!
+//! C header: [`include/linux/once_lite.h`](srctree/include/linux/once_lite.h)
+
+use crate::sync::atomic::{Atomic, AtomicType, Relaxed};
+
+/// A lightweight `call_once` primitive.
+///
+/// This structure provides the Rust equivalent of the kernel's `DO_ONCE_LITE` macro.
+/// While it would be possible to implement the feature entirely as a Rust macro,
+/// the functionality that can be implemented as regular functions has been
+/// extracted and implemented as the `OnceLite` struct for better code maintainability.
+pub struct OnceLite(Atomic<State>);
+
+#[derive(Clone, Copy, PartialEq, Eq)]
+#[repr(i32)]
+enum State {
+    Incomplete = 0,
+    Complete = 1,
+}
+
+// SAFETY: `State` and `i32` has the same size and alignment, and it's round-trip
+// transmutable to `i32`.
+unsafe impl AtomicType for State {
+    type Repr = i32;
+}
+
+impl OnceLite {
+    /// Creates a new [`OnceLite`] in the incomplete state.
+    #[inline(always)]
+    #[allow(clippy::new_without_default)]
+    pub const fn new() -> Self {
+        OnceLite(Atomic::new(State::Incomplete))
+    }
+
+    /// Calls the provided function exactly once.
+    pub fn call_once<F>(&self, f: F) -> bool
+    where
+        F: FnOnce(),
+    {
+        let old = self.0.xchg(State::Complete, Relaxed);
+        if old == State::Complete {
+            return false;
+        }
+
+        f();
+        true
+    }
+}
+
+/// Run the given function exactly once.
+///
+/// This is equivalent to the kernel's `DO_ONCE_LITE` macro.
+///
+/// # Examples
+///
+/// ```
+/// kernel::do_once_lite!(|| {
+///     kernel::pr_info!("This will be printed only once\n");
+/// });
+/// ```
+#[macro_export]
+macro_rules! do_once_lite {
+    ($e:expr) => {{
+        #[link_section = ".data..once"]
+        static ONCE: $crate::once_lite::OnceLite = $crate::once_lite::OnceLite::new();
+        ONCE.call_once($e)
+    }};
+}
-- 
2.43.0

