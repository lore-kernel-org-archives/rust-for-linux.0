Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150DF41F379
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761756; cv=none; b=Dy2OVh08KRT2119F9IsCq8T5GvYRlUjC60MWMQU3L0c7HZnJkIuoxnsTFtS9uaDJviIDEQogPwSRNi+KeLPi2dR6pwKBgqL5y4gubwT23wjl5gpsMyt6cakSA09OF62MItjAgg+ZaOAK/S5NzEa5oUUq6h4pqvzHplIytJUdQaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761756; c=relaxed/simple;
	bh=GN7EG0EW/ZjUTKXiSYpcNPdOhejt11jwQ2KHDJ1FjIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUEDvT6AHnd+DgfMC8E5coFvzxIPnW90EbHPz6y8foJtKgPJoc2z8jC5A8/YtMrbQtbqWNXv+TeYCPs0pkQX8I0gkjXCN0DvgywEVK+YSIQLPYzd7Nl6FwjFDe0bHF2J/wH3CKkk+CRX8UjN6jHq+WnIS7pyd2otW9XGTayQ9FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=Bxtcyjbc; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="Bxtcyjbc"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso931160f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761753; x=1788366553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uS314FoipF72R5oewUCBRDK+ccXh5S3Xp8RndW6m/5A=;
        b=BxtcyjbcKnfLfpsjJyfhUFbn4JgfJoVVydmo/AK7lKz/cH9prUiUKvhW5SLBvl7XYR
         JgUWF0HrQQhWJLgMXlLH2GkPwF5HpZck4KGYLk8QKy2vH/JsS/1glHGqGqLKywY3xdJj
         gcu4K/grdpSNUo3T2pTnA1TTZFGpEwxqZTuatQ+/91wQqKNfcxbWudzKWwLagia3bBs4
         IPChp2LuzrOWDWGy3JFVBh+yqIk2xC+P9bCxn0xI51lPjIg0uaRcM5aSr3Zx3ETW33bu
         BlZeaQ82+ANR8mWx7BFIMd9zU9PvjLEta8u6UIlVj7mK/CePyOQax7DY1dHOJFjidsws
         gm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761753; x=1788366553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uS314FoipF72R5oewUCBRDK+ccXh5S3Xp8RndW6m/5A=;
        b=N/3fdCA94GTiD98thKwgv7EG3rMI9Ktl+YVQlrl5S55etIJhPzmsdK620KxaH+vrQZ
         TsBjACEzH8EsEJsI9VoOcEAGNzdW4jpxhSpzUMIWEmz8Anoj38mFzPJnP/C7cYWP23nP
         h75yT1v3aGshUK1d14pzshLs4JGiI+lN6fNIfW5DsesZvAyFl4KXf4pEX1hd8s0+bbFk
         BZYI6RPuf5LAHEf8YPFt6AYzPPqw3JKX860dtGzBCADS06pWdlWLl5HIdgNjgLZ/yScY
         6Y0rZCaVkSPwsVVqt6aIRbKemyNyQUQmUAJwKAjbZK5ZDX3cbkQe8ERTF1lBHzabWZ5D
         BV1A==
X-Gm-Message-State: AFuF++n+GRRIh/iSZK1SwMepd0s8lXH9wssFB9tyV3mJ607z65+plEYh
	3iH5Un0ZlX2OmkoNelRmRfHQn2jEFii6dYQVn6rRIgXcIkzWImOezfJ5QBE2CVzN9pAKG4E6PbF
	JX4s2cbld
X-Gm-Gg: AR+sD12z91CZB9oU2yhwYoYCl3QUYiNYjq0kyeZpXcAtLk8yb36P41lCuCpDDoj1vXU
	H3VSzQGOdcWdV/32WwOqcx94ojFYx1IqquM4s8+DO9U4i+PKJp3V/x7a0Ewq4PD0pOQSsre3Y3r
	ovE7TXg8LkpWIbejPLIr29zhAIZqha58qkugcIpzl2sYl6SKLmsTC8FqMDTA1I+oQNIQhg7XHcQ
	rR8j9yWM6SgPefOvce89hYEvZ9GzDAJtIXnKnxcQdnw8mSzUe4w5JidAW1G7aoJWoY8gj7ZlJiT
	JOfDo4Fm74jSWQ11in9IuTxZFu9QkacZ8aASXfuY2X52uETHlYzaikhVi1tMB+SK/45eV0lwfTb
	OK4yEMheual+CFJQMDsWUz5hM3Gj78ZP1h6EInlPhKBsI3A+9Q9+CRm3eqt05rpfk6rvIeTH3Os
	rlREQDJRxu5YrnX25mJlg907fja9xiQT2ii613hayQeSah3bwelyqVzHiawRLcKi5xQlMNzT1hh
	bGJpS1q3SRx3hgZogOz9lom25X2+EmNiChn
X-Received: by 2002:a05:6000:645:b0:47f:8b24:ef01 with SMTP id ffacd0b85a97d-482e2696ba9mr8602655f8f.1.1787761753380;
        Wed, 26 Aug 2026 09:29:13 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:29:11 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
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
	Lyude Paul <lyude@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] rust: xxhash: add a safe xxh64 wrapper
Date: Wed, 26 Aug 2026 17:28:38 +0100
Message-ID: <20260826162851.2497-5-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162851.2497-1-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose xxh64() through a slice-based Rust API for non-cryptographic
hashing such as framebuffer damage detection.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/lib.rs              |  1 +
 rust/kernel/xxhash.rs           | 68 +++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 rust/kernel/xxhash.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 1124785e210b..2d079f278a04 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -93,6 +93,7 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <linux/xarray.h>
+#include <linux/xxhash.h>
 #include <trace/events/rust_sample.h>
 
 /*
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f39648246271..d7ced2a4c11f 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -141,6 +141,7 @@
 pub mod usb;
 pub mod workqueue;
 pub mod xarray;
+pub mod xxhash;
 
 #[doc(hidden)]
 pub use bindings;
diff --git a/rust/kernel/xxhash.rs b/rust/kernel/xxhash.rs
new file mode 100644
index 000000000000..fca24cddef46
--- /dev/null
+++ b/rust/kernel/xxhash.rs
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! xxHash, a fast non-cryptographic hash function.
+//!
+//! C header: [`include/linux/xxhash.h`](srctree/include/linux/xxhash.h)
+
+use core::mem::MaybeUninit;
+
+use crate::{bindings, error::to_result, prelude::*};
+
+/// Incremental xxHash64 state.
+///
+/// Use this when the input is split across several buffers. Calling
+/// [`update`](Self::update) for each buffer produces the same digest as hashing
+/// their concatenation with [`xxh64`].
+pub struct Xxh64(bindings::xxh64_state);
+
+impl Xxh64 {
+    /// Start a new hash with `seed`.
+    pub fn new(seed: u64) -> Self {
+        let mut state = MaybeUninit::uninit();
+        // SAFETY: `xxh64_reset()` initializes every byte of the state before
+        // returning.
+        unsafe {
+            bindings::xxh64_reset(state.as_mut_ptr(), seed);
+            Self(state.assume_init())
+        }
+    }
+
+    /// Add `data` to the hash.
+    pub fn update(&mut self, data: &[u8]) -> Result {
+        // SAFETY: `self.0` is initialized and exclusively borrowed; `data` is
+        // valid for reads of `data.len()` bytes.
+        to_result(unsafe { bindings::xxh64_update(&mut self.0, data.as_ptr().cast(), data.len()) })
+    }
+
+    /// Return the current digest without consuming the state.
+    pub fn digest(&self) -> u64 {
+        // SAFETY: `self.0` was initialized by `xxh64_reset()` and remains live.
+        unsafe { bindings::xxh64_digest(&self.0) }
+    }
+}
+
+/// Returns the 64-bit xxHash of `data`, starting from `seed`.
+///
+/// This is a non-cryptographic hash: use it for change detection, bucketing and similar, never for
+/// anything security-relevant.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::xxhash::xxh64;
+///
+/// // The same input and seed always produce the same hash.
+/// assert_eq!(xxh64(b"hello", 0), xxh64(b"hello", 0));
+///
+/// // Different seeds produce different hashes.
+/// assert_ne!(xxh64(b"hello", 0), xxh64(b"hello", 1));
+///
+/// // Hashing the empty slice is well-defined.
+/// let _ = xxh64(&[], 0);
+/// ```
+#[inline]
+pub fn xxh64(data: &[u8], seed: u64) -> u64 {
+    // SAFETY: `data` is a valid slice, so its pointer is valid for reads of `data.len()` bytes,
+    // and `xxh64()` only reads from it for the duration of the call.
+    unsafe { bindings::xxh64(data.as_ptr().cast(), data.len(), seed) }
+}
