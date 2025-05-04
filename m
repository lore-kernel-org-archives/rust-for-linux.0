Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A355E56A
	for <rust-for-linux@vger.kernel.org>; Sun,  4 May 2025 16:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746377063; cv=none; b=ebyfhiMpMWQT3vFzA66p/Pke0SFnOj363BaimHlriYBPJUar6vi9moSq3I3vcE8Efm1qmhkzyk8t6PFDJrEpTLFqR0qZoQ3N78riS9I8zq/+5kaTvJTEBZ83ZaTZeBGOX89E3rcFEl1INUCcoDzEcmNI+MJRDFvnkA0pBeINPHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746377063; c=relaxed/simple;
	bh=lcrmShmH21MTTd/g2oQHczNRN7Ngf8qO/8W9FNghdBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZITj7TrfDsmBzpWe2RJxiGZRp6kGBmtjtDyujnYRY7WXmktoyea20l5rW7uHfudQPs0xA6r5Lx/FcANcnV7924x75tR4UnucrI6mt1G1avafE/QYsWJ6vgz2ry3fAoesakYWxvUy3RENVOFRcYyZcbGqIYo0w3jmUkhUQDJJdF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=KAW4vysA; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="KAW4vysA"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6fead317874so30947807b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 May 2025 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1746377060; x=1746981860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uj59XSLRl99T9zbvClvw/LXiZfREJ5NNfiBfdflIPaU=;
        b=KAW4vysAvl2vAS6cb69/3YtTXUckxnKTS+8ssMwaMA212pr25AaE9VNeEhGdcbxybu
         5nreqO5GPOZZfXiJYJt7zLaoavgzahQ8vpCBgQvle+lmmmmNyYRFZ9i0Z5I/tVSm063R
         KvEbRywroDU105TClRL1vLRotwXsElAfqRgdrtuJvVwTFme/48FW4ahdpVg9aBQmuD3q
         sbn5iiQxiXpW8XVZMRjnAkvmX3yP1yVMHkC1UUMjmwF59pV+mjJyeBn2JbDSa85jz8Cx
         OwM4uo5OGRzbNzO3YOrOlfCytOe/uCMhjHOB+KEsPevgrOmykgk8Mxrg5d5FiRtDcJi6
         O/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746377060; x=1746981860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uj59XSLRl99T9zbvClvw/LXiZfREJ5NNfiBfdflIPaU=;
        b=B+EBpPs3XKqmAwfYnmIWDKomiqWe0o3GYcZRJA2AgOFhW0RNlk/yccVXWdHEpfvLbR
         Ud+cVCJa3xIkxj2NYykolv3Pewjb598TgskpUcmNj+853TB9NWmPWbp7A7KB8HgHXJLU
         6bEuOM/yv7WTv4Rjo0nkNMRIzlNqd9Dvu+QC/bI1crdJwJyrV7TZk4Eg1uVEXPuKkgD5
         MYUxv4ByRARl12Ssc3pEMbb7IG/IN2BzdWVcHdgFxnWYiRk2MZOepYvT9WeY91c5Jfko
         uh+F4CuxTeqbCfX9UhBSFpjfEp9AEjlUhwdwN6JEH29YvM6ErJ5KTaIPvEfB5qmCMnuQ
         M3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk9YuwIw2SZA469oAHMZjmFVkU/MwUdO8Nbf7+KHhdmV5UgtU8gDSNnjwAFFlpN10uSnJT00djVyy2wO2bLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHoSIJkV2h74N/ihI4rwpOmhcHrthxQ7RIj+0Zi4E3W40UgxvN
	LlgRNLVXIIc5J0bCezNv5avtHcx99KOAQS7BPm8bLWY1nVy6hseJJrsIjQPQgyLV0EUq2i4d2//
	g
X-Gm-Gg: ASbGncuaOYeWA2gcfsx1bw0XK8CqtEU9adMj5RMaq0R3chmhfmJOYNxQ3DqnrG7MBXV
	1EslhQek6J5EmzhrGT9SztYb4wWzmR7Gqt7I/XaQPK2P2Zcv/mbSpxonyrDdU0IL8bQuXrbNyq2
	rvb7bMvJTlkA07e+mJZpZ4gKlZjElZv5LpHieB6wq9BusP0M6VheAu9/qGWmqjg5AIboL2kMIWD
	R1iP+XXnc6nnH6ZZT90aIH8EzkROtYnAFVsOuOtqs1riQPf8FQ0d+V2SvAPd8HUM3IiT/sBOTcQ
	IET+zJjxSuM9F26MSSpR7RXJ7x9jte6+Ffi8QLylR5NDZpzWcICAyxUjZYugerrmjTEJqx2ZZ+X
	PPfJTxOfSJJ1nLrloo7z2QCLZD3Af+CpLTvMb
X-Google-Smtp-Source: AGHT+IFzg3nIQgQd/EC9UOMkoXJ+I4/segGJzwVw1n3f/Qm56DtX3vRgDYtZNVp52XbN22RYrRDmUQ==
X-Received: by 2002:a05:690c:c08:b0:703:ac44:d367 with SMTP id 00721157ae682-708eaeb2baamr64677887b3.6.1746377060489;
        Sun, 04 May 2025 09:44:20 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-708c3f092d3sm17932047b3.20.2025.05.04.09.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:44:20 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/1] rust: kernel: create `overflow_assert!`
Date: Sun,  4 May 2025 12:43:49 -0400
Message-ID: <20250504164349.84149-2-contact@antoniohickey.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504164349.84149-1-contact@antoniohickey.com>
References: <20250504164349.84149-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit creates a macro for overflow assertions, the use of this
macro will avoid local `#ifdef`s by encapsulating the conditional
behavior to the macro. In addition this macro allows us to document
the intent of the assertion more clearly.

Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1159
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/lib.rs             |  1 +
 rust/kernel/overflow_assert.rs | 42 ++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 rust/kernel/overflow_assert.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index de07aadd1ff5..feeb99fc4bbd 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -64,6 +64,7 @@
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod of;
+pub mod overflow_assert;
 pub mod page;
 #[cfg(CONFIG_PCI)]
 pub mod pci;
diff --git a/rust/kernel/overflow_assert.rs b/rust/kernel/overflow_assert.rs
new file mode 100644
index 000000000000..42c274403498
--- /dev/null
+++ b/rust/kernel/overflow_assert.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Overflow assert.
+
+/// Overflow assert (i.e. runtime bound check).
+///
+/// Verifies at runtime that an expression is within an expected bound.
+///
+/// This macro is only active when `CONFIG_RUST_OVERFLOW_CHECKS` is enabled.
+///
+/// # Examples
+///
+/// ```
+/// overflow_assert!(3, 10);
+/// overflow_assert!(6, 5);
+///
+/// const X: u8 = 5;
+/// overflow_assert!(X + 1, 10);
+///
+/// const fn f(x: i32) -> i32 {
+///     x + 2
+/// }
+/// overflow_assert!(f(40), 42);
+/// ```
+#[macro_export]
+#[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
+macro_rules! overflow_assert {
+    ($x:expr, $y:expr) => {
+        core::assert!($x <= $y, "overflow assertion failed: {} > {}", $x, $y);
+    };
+}
+
+/// Disabled overflow assertion (no-op).
+///
+/// This macro exists to allow code using `overflow_assert!` to compile when
+/// `CONFIG_RUST_OVERFLOW_CHECKS` is **not** enabled. It expands to nothing
+/// so it performs no checks and emits no code.
+#[macro_export]
+#[cfg(not(CONFIG_RUST_OVERFLOW_CHECKS))]
+macro_rules! assert_no_overflow {
+    ($x:expr, $y:expr) => {};
+}
-- 
2.49.0

