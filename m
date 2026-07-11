Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA17E3C943F
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783775598; cv=none; b=eE0++QAHecM45fx5nTfE3ijlRb/hH52EO/CriiGtHWCn90886LHxNoZGdxay4sOaArLTKegbzHEEBv8YAz2ScQiWi2dOQvNQfp1tMVELFUphlYkEPULnf6kcU5HpnmR0jyMdk1bO7CndcdC0IsPBPLZI2WYVL6qsqOVv4seRYEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783775598; c=relaxed/simple;
	bh=Ehox8SAP1hezi8192+oo1JkH+FPtt5zIvzxy9/kfZGc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=J+x7an7bpjZeGfKMc5fBxXNyu8aHLmL7ZBLqaMXVZnp/s2b/ZgvAKEDt/Y3dVLos1vmVzIr6lo6LjUsdffaNW8V/OLq7CdEsXa9qj2snaZyVcsNZQsXUMYV3tg7RtaK9VGfUmTqmQSTeVLBBM/H88JhRyJcRrJ1z8mnMnqx5mB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OTOsm74f; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OTOsm74f"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493bd52dae6so11241375e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 06:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783775592; x=1784380392; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+knwv7wId+1eUW5sB+uND4i/4j6+R241YuCQ9i0Ajk=;
        b=OTOsm74fxgh611I0PktP01Xu/ctKJ2J1xzy1aenm3vw5SId6HVmRpRmQCpWcz5anl8
         0Jo+cAWDH9c1vFltt0Z/+KTQGbiTp00TW8bYoTLiVpqQzwAp6iOrblJj2rEA722A2wcn
         gWBjefHPcTTuTJ/f7W1AKtioAM6sxz5L7hkCjwwgT3yyZFnPYML9GTwUxsvpMSMV4asp
         R8KRo8Y36MLhaSDD5xLL8jmjd3qAm1vLV4a8no/r7eS4OI/Jb1Q/IRjQVN+LdbM8i0lr
         ywkEx/5FBY0OhxobvvFa4B/5+mPgH41tTFMu8BupAH0JQctbJNu7Q5ut7+ZQJDpFyTJ7
         lN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783775592; x=1784380392;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+knwv7wId+1eUW5sB+uND4i/4j6+R241YuCQ9i0Ajk=;
        b=DRqEIIXVSp33IMa5AQXME6zYExfPh9SWd+CjzzrEItOUB+LnG/6RvV9Hu9bGYJs9yH
         5W9SiDFGohuQK8VWLsSGDat5dZMUyYKx2+olh6l2kHlIruwTeqzxieAuyjRj03CrJXPr
         NvvVDIwQIJ30LQhP2e2QhbyD6rw1m74zRzATHDg6OXRZhEbWwdBFTF1mnTnv0D5kLGrf
         Lpfs6w0DH0ekHua+sY2mrWSFBD5pKNx+32JUZiMIBjsao4bUa0p0RdOp3YAzofM3zK8l
         o9/Iqwbh8iABGGJnZEzecHWCE2CJ9QTT3DYIGLd1gdhYtpinRtlsvSZg1zddIDocMuo0
         lM7g==
X-Forwarded-Encrypted: i=1; AHgh+Rqv6QyMbLKvnT3AjMlpvHGwT5DCsdU8dnI3dyNYvES2pdRANL0mekEOZmXSIyVI5hKu0nqOdUbXzGH0WLjJDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+efU/zzXdcqQ3azd0CjQ6x2HzFPWCzx3BMI8J9AynYwPUSY1K
	1nU6t+blSCkCCm1zNKQL+u5Edkz+ARdzlHdpLiDR0H49tIdCYUXSDwNzNGMW649/HI02brKhuFo
	hccOUX7TB7Mb9ujfZYg==
X-Received: from wmpr37.prod.google.com ([2002:a05:600c:3225:b0:492:4527:3dee])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f8a:b0:492:43d2:9e6e with SMTP id 5b1f17b1804b1-493f87e9bd4mr24086725e9.9.1783775591956;
 Sat, 11 Jul 2026 06:13:11 -0700 (PDT)
Date: Sat, 11 Jul 2026 13:13:05 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGBBUmoC/x3MTQqAIBBA4avErBtQoYKuEi38GWugVDQikO6et
 PwW71UolJkKzF2FTDcXjqFB9h3YXYeNkF0zKKFGMUnZiCnGA894Exq+Tp1wMMJZ4ZQhb6GVKZP n578u6/t+k/oinmUAAAA=
X-Change-Id: 20260711-id-pool-move-bitmap-5b0dc0d2befc
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4839; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Ehox8SAP1hezi8192+oo1JkH+FPtt5zIvzxy9/kfZGc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqUkFiYB1ZfFNogUbkqBSFnOdU9xXdxT0rGba7U
 So70gI9pUWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCalJBYgAKCRAEWL7uWMY5
 Rm00D/9Jy7mPt/8dcJQvJK/skF38LpJgSMTWFsYw/AWmfs9TJMRPjkmQmyNNfqxju9XfPmgo2Ng
 4f92LVU6u6cnVIiz6zzs/970sUT6iTZF+BioI34VANCeFyKsQJjnJmLqBO8AoO3tJuT0rLP6tIk
 NiiZcChneS5Jx+WrujfRAcFHxtmDwiNhFgLVB5ZzyJYxxXHi9xTWEwacglVJuW9EecRzxo9Td1S
 JI+ZQY3fENIvYDjj9qznHukXVaSbNH/KQXW6jTRQjFgRK5RjXJXrKmPTg3v5zGSUHiffi2x21fI
 3t8R6uYcqDOAjKDbBAlazdr3ls/di1FE5jYU3NgSkM7ijmr6ASL9ZzhQv6UxMe7pZC8eQtaLkQv
 uIPbFHnX/WWx+/tVEmHL9hWKR4SRrlacaijRPMYScxqot65w6NMiXbeQ6rwBwiNioSv7puiqbAp
 cgc+74Jv+L2ZMqjZmeQZ11G4ZjmISzDkE4DH9q+NBbCnou1Yy+jYy6NHyEwEv70D1Q43HGRTj+B
 oXCuKfAnxqgGvky/hudvJL0+K9TazU8+mJ6y7rqdRr0YkEDjRCOja2I/3UvXEEGUeC9TXj8twj9
 yXet1dlKdG7ZEUWYoY3x+d7pxYgheuorbFJGE+A7pNIcF5WTAKo1OspsqLm3XuMLZujHd5n+iCK HYfZm7sK9PwE96g==
X-Mailer: b4 0.14.3
Message-ID: <20260711-id-pool-move-bitmap-v1-1-cd5b7efc2c12@google.com>
Subject: [PATCH] rust: bitmap: encourage using xarray/maple_tree instead of id_pool
From: Alice Ryhl <aliceryhl@google.com>
To: "Liam R . Howlett" <liam@infradead.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, Burak Emir <burak.emir@gmail.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	John Hubbard <jhubbard@nvidia.com>, Matthew Wilcox <willy@infradead.org>, 
	Tamir Duberstein <tamird@kernel.org>, Yury Norov <yury.norov@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Lorenzo Stoakes <ljs@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, Trevor Gross <tmgross@umich.edu>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The id_pool.rs file was added for use in the Binder driver, which is
using a bitmap rather than the normal IDR implementation due its
specialized needs and performance/spinlock requirements. However, its
current name as kernel::id_pool encourages using it over other IDR
solutions.

To discourage choosing this pool when you don't need it, move it to
kernel::bitmap and add a comment recommending the xarray or maple tree
for generic IDR use-cases.

Please see the below links for the discussion that prompted moving this
file.

Link: https://lore.kernel.org/rust-for-linux/2026070334-dollar-hexagram-e49c@gregkh/
Link: https://lore.kernel.org/rust-for-linux/84bc8bd2-e292-4b84-9580-a1b5df4c5bdc@nvidia.com/
Link: https://lore.kernel.org/rust-for-linux/20260711063602.426311-1-ynorov@nvidia.com/
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                         |  2 +-
 drivers/android/binder/process.rs   |  2 +-
 rust/kernel/bitmap.rs               |  2 ++
 rust/kernel/{ => bitmap}/id_pool.rs | 26 +++++++++++++++++++-------
 rust/kernel/lib.rs                  |  1 -
 5 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a8b0fd665ce..d80377d06c3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4639,7 +4639,7 @@ R:	Yury Norov <yury.norov@gmail.com>
 S:	Maintained
 F:	lib/find_bit_benchmark_rust.rs
 F:	rust/kernel/bitmap.rs
-F:	rust/kernel/id_pool.rs
+F:	rust/kernel/bitmap/
 
 BITOPS API
 M:	Yury Norov <yury.norov@gmail.com>
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 96b8440ceac6..eec417604806 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -16,10 +16,10 @@
 
 use kernel::{
     bindings,
+    bitmap::id_pool::IdPool,
     cred::Credential,
     error::Error,
     fs::file::{self, File},
-    id_pool::IdPool,
     list::{List, ListArc, ListArcField, ListLinks},
     mm,
     prelude::*,
diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index b27e0ec80d64..ecf8f194cf3a 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -12,6 +12,8 @@
 use crate::pr_err;
 use core::ptr::NonNull;
 
+pub mod id_pool;
+
 /// Represents a C bitmap. Wraps underlying C bitmap API.
 ///
 /// # Invariants
diff --git a/rust/kernel/id_pool.rs b/rust/kernel/bitmap/id_pool.rs
similarity index 93%
rename from rust/kernel/id_pool.rs
rename to rust/kernel/bitmap/id_pool.rs
index 384753fe0e44..d6440ec8f60f 100644
--- a/rust/kernel/id_pool.rs
+++ b/rust/kernel/bitmap/id_pool.rs
@@ -3,6 +3,14 @@
 // Copyright (C) 2025 Google LLC.
 
 //! Rust API for an ID pool backed by a [`BitmapVec`].
+//!
+//! The id pool provided by this file is designed for specialized use-cases
+//! that need an implementation backed by a bitmap. If you just want a generic
+//! ID allocator, please use [`XArray`] instead. Or for use-cases that require
+//! contiguous ranges of IDs, use the [`MapleTree`].
+//!
+//! [`XArray`]: crate::xarray::XArray
+//! [`MapleTree`]: crate::maple_tree::MapleTree
 
 use crate::alloc::{AllocError, Flags};
 use crate::bitmap::BitmapVec;
@@ -23,8 +31,10 @@
 /// Basic usage
 ///
 /// ```
-/// use kernel::alloc::AllocError;
-/// use kernel::id_pool::{IdPool, UnusedId};
+/// use kernel::{
+///     alloc::AllocError,
+///     bitmap::id_pool::{IdPool, UnusedId},
+/// };
 ///
 /// let mut pool = IdPool::with_capacity(64, GFP_KERNEL)?;
 /// for i in 0..64 {
@@ -47,7 +57,7 @@
 /// ```no_run
 /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
 /// use kernel::sync::{new_spinlock, SpinLock};
-/// use kernel::id_pool::IdPool;
+/// use kernel::bitmap::id_pool::IdPool;
 ///
 /// fn get_id_maybe_realloc(guarded_pool: &SpinLock<IdPool>) -> Result<usize, AllocError> {
 ///     let mut pool = guarded_pool.lock();
@@ -134,10 +144,12 @@ pub fn capacity(&self) -> usize {
     /// ```
     /// use kernel::{
     ///     alloc::AllocError,
-    ///     bitmap::BitmapVec,
-    ///     id_pool::{
-    ///         IdPool,
-    ///         ReallocRequest,
+    ///     bitmap::{
+    ///         id_pool::{
+    ///             IdPool,
+    ///             ReallocRequest,
+    ///         },
+    ///         BitmapVec,
     ///     },
     /// };
     ///
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9512af7156df..8e7717bb8b9f 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -77,7 +77,6 @@
 pub mod gpu;
 #[cfg(CONFIG_I2C = "y")]
 pub mod i2c;
-pub mod id_pool;
 #[doc(hidden)]
 pub mod impl_flags;
 pub mod init;

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260711-id-pool-move-bitmap-5b0dc0d2befc

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

