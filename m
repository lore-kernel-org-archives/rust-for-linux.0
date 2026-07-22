Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFDD3E49E7
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 10:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715145; cv=none; b=A7LxEG3TkyZco1Xf0FUSf45eJjiiO2QptOJwCQp8JaNVsFeoiaC3/R9V3jBxHawaneNIxYe6moiowcByU92rY7ZTKd6eQu6xFnswVr589xPwSWeb5i0PHKrQtG5RReDT3TSsGMhQQLp9Q7jTZ3cqAyrbyXZ03oR6bZN8m34EDhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715145; c=relaxed/simple;
	bh=VJEn9k0cad7bQSpM4TtNmV26i5N7k4ratpVcrf9ivaI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GNROE5WvUt/xr/qkQSmwTJNDKqkHsWmbcAEn18o6Kt2EMCx/hjQinYQwLlJMyJKQC8mbKQOxA7giiwYdYiB5sQ1+OzL+W484f0Syw3aLJ8Nhd/QgF0QreqfqGCRgrlvluGc+qjKbvogvbFG9kOlq+/NHf2oT2UHhO1lvkFQdigY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l+qBKgxq; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l+qBKgxq"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4954fe32d6eso24146555e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 03:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784715142; x=1785319942; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbRCBYBDraMwLArP9KmBXsMFVhgFXmfSbkHCccVZDpg=;
        b=l+qBKgxqbMsqAd2aJ1uI3jMqUc8hT7qdPt3wD9B9wyqKhiOutqjPXHNn8DJkhOfWpT
         e7TbRBWzh8hmHbd1lUOU5HmYDBIGBpRIb1VZbnh99R/MrRz0ZPp3ACj89XgbHH985nKx
         FdPJGF64nCUhxbUZ51pZM3JDlzbgW9U1JaCPOSfIGKfSWbgppuCy5PvDqlwbr034mio8
         Ox5BWehsb32V3Jm6TTtkU9FHtpgOGIksomVzGrUA1qUiZGzmqKXe+laGuJkTEdYNxtId
         nv3gnQfxsDPdER99h3XgtSFtv+ZXPS2Rel1d4oCSut/y0wbCaVicyU3Ybhur9cFui4GU
         AFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784715142; x=1785319942;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbRCBYBDraMwLArP9KmBXsMFVhgFXmfSbkHCccVZDpg=;
        b=UryUfF5GAi5CaVIRc1/OJ+ALGUH9oaslmXdefx6cy8aYEMKKJn3FfU7icbU2G0MPSR
         YdQT65jiD+KnJ4CU3Wz3cfqOF1y10XCbgQih68THddK9NHHLTPliqeHdm5wMNo3uMKu8
         enJMIKMPl6L48AiJUSIjdLgssixWMiM2vIbzsS2mNwivjnV1LFsphpA9JkNcdhEsvvIx
         /oiNLhgJOwO2IMAGNSDEMrAdM6gft6A2z1XQSbQt+ebHB7UcWJ+CgtPKt4WiDwvt2x74
         LMqMGJMvbi9F4lawNJ1zxY3GYCfhOdyIrE4gujEpZX2M0Mh1gTtnAf4pU84sswI9IoOW
         7+3w==
X-Forwarded-Encrypted: i=1; AHgh+RpYd0DAGXmr14BJUkBkTk01qmop/1BgBsw8xqBXfL1AT+70O1a4JYHywTXWewnKd8ryR8zmjE4WS6l94CZljQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+vjDWigW4yybLiVKagL+oVCF66xDnLH7f/KCobx702Y4L8iu
	LvVPTu2WLxBRUlCBRXtkAtni3475hKNX64Rh+eMRjpZBxWxCHjnbFCeDYOmRqFtlF1fZdzFWTQK
	EHTOHLGhY0eck+N7L1g==
X-Received: from wmg10.prod.google.com ([2002:a05:600c:22ca:b0:493:c531:facd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4746:b0:495:4d07:4fcb with SMTP id 5b1f17b1804b1-4954d0784c6mr229986875e9.36.1784715141388;
 Wed, 22 Jul 2026 03:12:21 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:12:10 +0000
In-Reply-To: <20260722-pr-ratelimited-v3-0-57faa37fdfbd@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-pr-ratelimited-v3-0-57faa37fdfbd@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5073; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=VJEn9k0cad7bQSpM4TtNmV26i5N7k4ratpVcrf9ivaI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqYJeAX6DVR/E74RaBE/8XJiaMvco9GQEYH8S5Z
 U0SZu9jqhWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCamCXgAAKCRAEWL7uWMY5
 Rq82D/oCHfytgelXyIx257zT84fG2/eTfdDWd4it5XMDtY0dMiYjFLlFBHipSRlmIK2u8uvCvim
 ZAkcQ62b4I49SxJ4vzjNuxN5IVT4HHjnROuNm47BzT3/I4N2s/FOXHSA6v7CuIHRDL3BhGm83++
 mjAojGoYq3Pwzwxrmcrp/yLLEWK1mRcHIN3Ni/qejAGIlvO0KjGJVbHQxuk24V7sIeCnNXheFMS
 Oy7TSyxMw7sFlT5c77fIO/2hvyZX96XpBNn5mGqLFExyd4p8wDGEe0L+OpjuslL/4/Ho/n6G+ph
 waeCspNbiA4ElMdRIXBZOVNYA5RJIM5pa+qh6rxGoqeWAxYUhLVtys6hbHGeHWnQ3FK1XYQ39g9
 dfZ6mVhl9cxtHbL9RqyZDrlQNdqW3QBaCQK1/ghbp1DZu8zcwNyR2hojcwRESJhAMUW+lqEsW3X
 iir9aErhwO5Dp/d1swbEREU3bmpnnrfamue/HBj3IvfOqAqhsI8IlZ9LEAINCKjyTBZNBP44QDz
 j55iXSsrdO6sncnUmAjIwYydHcvRAQ8TSvzvOXxlp2jHGVOyusczR2UJ/9GyO33kOTWril6tuP9
 N4cszZxvLwcPWMJlZUvxTEvYuqZjipVAMNLmmxxWngckKemiu9NcTDRwbUIMTlzQ4qNDnYVr420 t6ayYwNOUHFK+Jw==
X-Mailer: b4 0.14.3
Message-ID: <20260722-pr-ratelimited-v3-2-57faa37fdfbd@google.com>
Subject: [PATCH v3 2/5] rust: sync: add const constructor for raw_spinlock_t
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The abstractions for pr_*_ratelimited! need to construct a global
`struct ratelimit_state`, which contains a `raw_spinlock_t` field. Thus,
add a const constructor for the `raw_spinlock_t` type.

The SPINLOCK_OWNER_INIT constant isn't mirrored via a const helper
because bindgen generates a 'static mut' instead of a constant from the
pointer constant.,

The __ARCH_SPIN_LOCK_UNLOCKED constant cannot be translated by bindgen
because it's a define for a struct without type annotations, so it's
explicitly declared in Rust.

Reviewed-by: Boqun Feng <boqun@kernel.org>
Reviewed-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 include/linux/spinlock_types_raw.h |  4 ++++
 rust/bindings/lib.rs               | 24 ++++++++++++++++++++++++
 rust/kernel/sync/lock/spinlock.rs  | 31 +++++++++++++++++++++++++++++++
 rust/kernel/sync/lockdep.rs        | 22 ++++++++++++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/include/linux/spinlock_types_raw.h b/include/linux/spinlock_types_raw.h
index e5644ab2161f..942c229c90bb 100644
--- a/include/linux/spinlock_types_raw.h
+++ b/include/linux/spinlock_types_raw.h
@@ -11,6 +11,10 @@
 
 #include <linux/lockdep_types.h>
 
+/*
+ * Keep in sync with rust/kernel/sync/lock/spinlock.rs
+ */
+
 context_lock_struct(raw_spinlock) {
 	arch_spinlock_t raw_lock;
 #ifdef CONFIG_DEBUG_SPINLOCK
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 854e7c471434..adde41e41edc 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -77,3 +77,27 @@ mod bindings_helper {
         None
     }
 };
+
+// Explicitly list architectures where this logic is checked correct.
+#[cfg(any(
+    CONFIG_ARM,
+    CONFIG_ARM64,
+    CONFIG_LOONGARCH,
+    CONFIG_PPC,
+    CONFIG_RISCV,
+    CONFIG_S390,
+    CONFIG_X86,
+))]
+pub const __ARCH_SPIN_LOCK_UNLOCKED: arch_spinlock_t = {
+    // SAFETY: The `arch_spinlock_t` type can be zeroed.
+    #[allow(unused_mut)]
+    let mut lock: arch_spinlock_t = unsafe { core::mem::zeroed() };
+
+    #[cfg(not(CONFIG_SMP))]
+    #[cfg(CONFIG_DEBUG_SPINLOCK)]
+    {
+        lock.slock = 1;
+    }
+
+    lock
+};
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index ef76fa07ca3a..697efa7e04c6 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -4,6 +4,8 @@
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
 
+use kernel::prelude::*;
+
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///
 /// It uses the name if one is given, otherwise it generates one based on the file name and line
@@ -144,3 +146,32 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
         unsafe { bindings::spin_assert_is_held(ptr) }
     }
 }
+
+/// Helper for creating a raw unlocked `bindings::raw_spinlock_t`.
+///
+/// For use in statics containing raw spinlocks.
+#[doc(alias("__SPIN_LOCK_UNLOCKED", "DEFINE_SPINLOCK"))]
+#[expect(dead_code)]
+pub(crate) const fn raw_spin_lock_unlocked(name: &'static CStr) -> bindings::raw_spinlock_t {
+    // Silence unused variable warnings.
+    #[cfg(not(CONFIG_DEBUG_LOCK_ALLOC))]
+    let _ = name;
+
+    bindings::raw_spinlock_t {
+        raw_lock: bindings::__ARCH_SPIN_LOCK_UNLOCKED,
+
+        #[cfg(CONFIG_DEBUG_SPINLOCK)]
+        magic: bindings::SPINLOCK_MAGIC,
+        #[cfg(CONFIG_DEBUG_SPINLOCK)]
+        owner_cpu: u32::MAX,
+        #[cfg(CONFIG_DEBUG_SPINLOCK)]
+        owner: usize::MAX as *mut c_void,
+
+        #[cfg(CONFIG_DEBUG_LOCK_ALLOC)]
+        dep_map: kernel::sync::lockdep::raw_lockdep_map(
+            name,
+            kernel::sync::lockdep::LD_WAIT_SPIN,
+            kernel::sync::lockdep::LD_WAIT_INV,
+        ),
+    }
+}
diff --git a/rust/kernel/sync/lockdep.rs b/rust/kernel/sync/lockdep.rs
index 784821cc2a39..d9222be0fb29 100644
--- a/rust/kernel/sync/lockdep.rs
+++ b/rust/kernel/sync/lockdep.rs
@@ -137,3 +137,25 @@ macro_rules! optional_name {
         $crate::c_str!($name)
     };
 }
+
+/// Not checked, catch all.
+pub const LD_WAIT_INV: u8 = bindings::lockdep_wait_type_LD_WAIT_INV as u8;
+/// Spin loops, `raw_spinlock_t` etc
+pub const LD_WAIT_SPIN: u8 = bindings::lockdep_wait_type_LD_WAIT_SPIN as u8;
+
+/// Helper for declaring a raw `struct lockdep_map` for locks in statics.
+///
+/// It's up to the caller to use the returned `struct lockdep_map` correctly.
+#[cfg(CONFIG_DEBUG_LOCK_ALLOC)]
+pub(crate) const fn raw_lockdep_map(
+    name: &'static CStr,
+    wait_type_inner: u8,
+    wait_type_outer: u8,
+) -> bindings::lockdep_map {
+    // SAFETY: All zeros is valid for this type.
+    let mut map: bindings::lockdep_map = unsafe { core::mem::zeroed() };
+    map.name = kernel::str::as_char_ptr_in_const_context(name);
+    map.wait_type_inner = wait_type_inner;
+    map.wait_type_outer = wait_type_outer;
+    map
+}

-- 
2.55.0.229.g6434b31f56-goog

