Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81313337B80
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 13:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762953402; cv=none; b=j+C8F+spayHCweicbPmZsXWUOFrCo+NLK7NLQyquZt62nmCzxcPBPYNpn0XGfOYKzI36bTC0k2xVRITXT/sCwuAe2zHAxt2KgD86eakUslGDGU0KTmK9N8iepvkK/Xj9rt5Zsi5uuGZlGJxkNv8zuYQ/XVxiBDavotxbsxXC2Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762953402; c=relaxed/simple;
	bh=Y4ZK2wvYRCfXVP2XPsv/lNxhPcrn9DMPqwS0J3yt64o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRIUPsAdJYJArqXazt5ORBDs3/1oPLguO+qMi7BduzZMTRENc5y0QhrHum9gtTGP7YV50ZuzI6i6TeUtPLw9KFKDWSpjnXKaNX30htLTR0BiPktWo3Yp6vDp0n+RFHb85J4oa5nElU18cVCb+GmL1tuY5IuGShpSym/4dUjWi88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPYAePzH; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPYAePzH"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2956d816c10so8770545ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 05:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762953400; x=1763558200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axOaIaAtcFKkstDY/SjlXn/KvsJcU1B6mN9qbdLmNS8=;
        b=ZPYAePzHIWP9rtrPPzK/UL5DbHLx62dYXI1BB3JTNOwSrZE6j/+WqY2j+xZ0VGSMRM
         4mDmlBo19pMb5kulrQmR0npWmhKKMFixvs483YAngzBxvQJopa9Dx3zfuilmO7Rgyc0e
         5vPkxMAnPcJMmct1HZWopTBdrDt2syglhFuWCg7QiQoIBRa6d3Tjo9F7I4wnNw6u9znd
         6B5DJytti707ZNyIl3j+3NJ6JArLGEhQ7B8xqv/WGXiDwiUbsJd/qF67mm+4nnXqMBIw
         lcazEKYH01B5LxdB4CY/fmUNy7hndyQ8eXAwE+mHbo4LCqzg6eeyka+cWcNXxe5JVf6M
         syAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762953400; x=1763558200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=axOaIaAtcFKkstDY/SjlXn/KvsJcU1B6mN9qbdLmNS8=;
        b=cQuI7tLoRBavNiChyHNJ1R4lKZXJAAw0w7Gwck2+hd18ajBXoDkLQcuNmR9fbQLI+Q
         ZWnDs9CwNNXMgqh6S8vC4e6CKLM+5GWxLQgSn/QgmB/Koxo77cTDSCXB0fu+ZGTOcSKL
         SYZJzUDABmxe91vkyxSkJ+roDktiNUkPtSCJXIQGYBXfK7hmVHSwTRt92MyspPYU4Vi9
         OzOD7FJTJ0Ukpr04VNUq6PaUzkXJ6bpPuMwrOmkdqhlKjSCb7Ar0y2ScKEmPBAxr7Qg6
         vHUYjvie/Q7Eb+9JnRTfL0pHhJApChdN8iK7StL/c3GdfZzSe38JU0L2GdCWqI0xj49B
         U4lA==
X-Forwarded-Encrypted: i=1; AJvYcCXbC6Me2vvmhHfIWLPFlvaVtHRXJsjIJig/NWeu6PLTyAR9HtnKihqeJnM0zmqGMRzuOoKOrCUmUwZqmWhdWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn8DD+CAMLHnu+f+OTqoM2ogKfj3wNuAWsCv5o7OTGSDmLhQB2
	mF213a9ArKfK7LeD6RdWzS5K6IyUE4/hy1FYhzIStADkpJmeREFasFIq
X-Gm-Gg: ASbGncs9LxLZaIhq6xSeoixxJgt51EXKGkOybRzPFSEj+NzBR06x02F9/E79YPo0Ox3
	bj+FRs7oMANCVUOgmcgITMUp+plXF65FWHDj9Bb6IthEezXsKLScZGBsB1jVs80vfKuOIHGdbKn
	S1+lbL8ki6HjU6AH/72uuQ91Wu2azRg3+mh4Ye3nS3xVy+aFcrEwcWTpqc55sOJ7PU/jEBpHuRR
	udYCd3OsV8d8TU8QjiKUTbSJixoWuCQ7SW5PcVqOpGEv5FIs4aFTLsAtsglZTh4WcM091DGbS0y
	6zz0pqstCTZznpZ96paWbNihDs/IGuuTShGcMId0SgzAlO/CQWGXVUWYCU6LXS7B84dXK6xtf64
	2E91BSmW5NzlnYqddIqYLlqFIoXb2gB0oIVj+y6pAr9APx3xGFWSf4+DNwFwjBMW3MJcOovDOTs
	m8vpZUjgpjeS76Af8S6lkllL8bDNwfWmijRWeeoGsmmwpmr1OX
X-Google-Smtp-Source: AGHT+IF3zLxxYX5Ora1CGAPUwhOr1dLRO6AEtDIw5o6P2uK1VQhpPAyvJJzaq//D+0rL1Rlfhtk7XA==
X-Received: by 2002:a17:903:37cd:b0:282:eea8:764d with SMTP id d9443c01a7336-2984ede9844mr41827135ad.35.1762953399674;
        Wed, 12 Nov 2025 05:16:39 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dbd93c0sm31732485ad.6.2025.11.12.05.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:16:39 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: alex.gaynor@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v2 1/2] rust: Add support for calling a function exactly once
Date: Wed, 12 Nov 2025 22:16:18 +0900
Message-ID: <20251112131619.3585510-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112131619.3585510-1-fujita.tomonori@gmail.com>
References: <20251112131619.3585510-1-fujita.tomonori@gmail.com>
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
 rust/kernel/sync.rs           |  1 +
 rust/kernel/sync/once_lite.rs | 83 +++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 rust/kernel/sync/once_lite.rs

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index cf5b638a097d..03789283e2ec 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -17,6 +17,7 @@
 mod condvar;
 pub mod lock;
 mod locked_by;
+pub mod once_lite;
 pub mod poll;
 pub mod rcu;
 mod refcount;
diff --git a/rust/kernel/sync/once_lite.rs b/rust/kernel/sync/once_lite.rs
new file mode 100644
index 000000000000..04c48d18ca39
--- /dev/null
+++ b/rust/kernel/sync/once_lite.rs
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for calling a function exactly once.
+//!
+//! C header: [`include/linux/once_lite.h`](srctree/include/linux/once_lite.h)
+
+use super::atomic::{
+    Atomic,
+    AtomicType,
+    Relaxed, //
+};
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
+    ///
+    /// There is no other synchronization between two `call_once()`s
+    /// except that only one will execute `f`, in other words, callers
+    /// should not use a failed `call_once()` as a proof that another
+    /// `call_once()` has already finished and the effect is observable
+    /// to this thread.
+    pub fn call_once<F>(&self, f: F) -> bool
+    where
+        F: FnOnce(),
+    {
+        // ORDERING: `Relaxed` is used here since no synchronization is required
+        // for `call_once()`.
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
+/// kernel::do_once_lite! {
+///     kernel::pr_info!("This will be printed only once\n");
+/// };
+/// ```
+#[macro_export]
+macro_rules! do_once_lite {
+    { $($e:tt)* } => {{
+        #[link_section = ".data..once"]
+        static ONCE: $crate::sync::once_lite::OnceLite = $crate::sync::once_lite::OnceLite::new();
+        ONCE.call_once(|| { $($e)* });
+    }};
+}
-- 
2.43.0

