Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86B5216386
	for <rust-for-linux@vger.kernel.org>; Thu,  8 May 2025 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693351; cv=none; b=UJDeI1lZhL6x7Rnt5WJI9MFGZCjXFy6+qTU48CQWcHmFGuahgnbG+fv80yUq18NoYqewhlULqncLBEtWoqXEElwDF1gYsBnUyySkKdE1+2ybQ5p606Q2dDmsF7jpEFkxgol5d34gteFUZWO+hduCQ53be9+ni0L6KxqAkvkWAsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693351; c=relaxed/simple;
	bh=Uh1NArOYUAC3TlqO+VPf/FI5Pvemo476r7ffqTqb5pw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U2uGC0b/rspvLkh4EYB9P4hHh6Fkaq93ZuyD09iJenzS3U5T5QAHTtvu2G4oIkEebESqIqpS8e7IfgLJKRWSyTOdx48jt6Gm/Bco9ogc9j/G11tFte9mx+wDt+TfRunKqGN9mjDQ+sLThlYSk9qAHtGH5/htO8gXPzcHpK6Ib5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lJZRLf6K; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lJZRLf6K"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso4721665e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 08 May 2025 01:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746693348; x=1747298148; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y39kGSmrbFFJXQ9cglJvPZRgr0LsdhME9Unh1ejxyj0=;
        b=lJZRLf6K43E+vMNgREbcJ/a3ke2XJ7PBYUz+OL64r4LEL3RVJotWHSWGYaqupaovs7
         vdlOzR/lACND6SVFe97+I6nRjOrjnC5h8Sijo6mSM4JJpxr/3TNhUAMt9AUHX670M5e4
         H2vsHb1iTQ4LBn9lfwU01WpbVGB4gVGoSGoTjXtHEJVZPcFPxwXUvXLbO6z1fHxsnyro
         hvr0XdGU2sNuGrw/De5keaeqZfPU5xNmTS6xv9g9rVRlrgSWdtUsskrtG1kthoDliqr2
         1tc09Y7QKd07p6MijHrmeCVDczKP9IHc4+3Pm56GhDQgWhCBRwLOEBhYZKQwJ3XbiHK9
         bvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693348; x=1747298148;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y39kGSmrbFFJXQ9cglJvPZRgr0LsdhME9Unh1ejxyj0=;
        b=HiFb+3edGkJtqUYQtK3mEiVKgNTiVyhZHPTCiZ8WoOMq9hWcJ1jeDlRvWA+b9yclY2
         k2SXf7bMJJRzmuyE7WcX1WJwJ/5Icqu6B0GpLBmDmYQOXae4KiI47zNf8feuT/ewFKZQ
         qAMuWQ63IbNfzY9T0ifgj0Cfhb1b2st7dviv7DdkLuhMcrQQnHLxV6kug4F4eu0WfArj
         Z9TZCCZuU/jRKP1PDRCOVh9nEgUP0ipWkEMyps6EnBCQzcLak6DyJiZLkLjH+YT5y73X
         uEhBox6BpEi1pIYS3BGq+i6HxFkYZOEpHXDwC0/auBlJ3SUpSBjLBP4OVObhPWfJIM43
         mW1A==
X-Forwarded-Encrypted: i=1; AJvYcCUxsbqIZY7GuTrMOt3j8Kz1f8BqaeT63pzWR+ADUb/ilGjl62q6Od/33h3zQpDbpUpDwv+MNh8nFyt5r0hwPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyggwXTsC9d1pVGKcnHLAAk5od8vDHoGDEQegopvTnHvFhugjSx
	dPJINR5ZCQKfwf0iYWUPZq5YzZdeL6JAF5oUc5b288ZMaHksU4vB38Q8COGjgEDkGqLwS09LTdK
	UjjB8wvroHv7ATw==
X-Google-Smtp-Source: AGHT+IHzNP7lTCzCxxkMhTarqSxvPayOcSb979nRWV5zQLcu44NC9oFhQVYlK37EbJfT3y9zfOdO/eu7s3jPHH8=
X-Received: from wmsp33.prod.google.com ([2002:a05:600c:1da1:b0:441:b607:4ec0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4020:b0:39c:266c:12a5 with SMTP id ffacd0b85a97d-3a0ba09c701mr1767344f8f.13.1746693348329;
 Thu, 08 May 2025 01:35:48 -0700 (PDT)
Date: Thu,  8 May 2025 08:35:40 +0000
In-Reply-To: <202505072116.eSYC8igT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <202505072116.eSYC8igT-lkp@intel.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6334; i=aliceryhl@google.com;
 h=from:subject; bh=Uh1NArOYUAC3TlqO+VPf/FI5Pvemo476r7ffqTqb5pw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoHGxQA1pQnh6YV2mpEhk1Er0ppFu+B/v1k0t2K
 zavlZ5cmmOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBxsUAAKCRAEWL7uWMY5
 Rid3EACQuxDA3bntKDj7yEG1zaFLSEBIEDVusxzcJeLV303vBCCUpk8sm/Wx+hLE+6/K91zbBHb
 LIJkBJRl/zKFvDwY8uSWe4hdJGheh/lUDnlf983GxsSnCE8NW3R0w29kgM16lOIKHegihPJVrkv
 drkgI7NaVZJFsiG7hxCQOJ9PUH026HXFRT4GEyi0URUeKuYBAwn1u1r5XukD0J82iUY2xeWcNLz
 xsyZk1vktzGvVpagBdDcMt9kFKcb8lpMq235Eq0lzYFY1SdoGcEsZr+BlSFXMEWHYX1PGXjEaMu
 jTq0e/vjMbLmzcWlr20hcZHqCjlN7QrLCmwRWgfIjwAgadEevD7NIjGF3xb9v4igg0yB5E6WLDW
 pnYFlky88120QCVMx15jpNWws5rZQ2tlCp41wFxY5hFMxukEZIsAXiVcNCDJ9Lon/GI4FXxsB6T
 TVUgK5R/UiV4PjazFyQY38zjn9IdXzVxvBEgZD33zpDUFBq5kPVCpL180BmiAscfsXNnwzTDDH3
 ZJrIUnmGzSgDqCYeVqBl1x9bFHqaEX/jkyAl3tbSJowbbYpmi5mOyT8vSGmzZ1KQMMoBKR2bP7r
 4hSoJHpS7pbxqzyX6Has3PNQ4oqaFgKohEyy3FIU8AJdQgta6ndXuQpxHIEU7N1sP+BSwT214LR CJbQbZy3Gg1RfFg==
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250508083540.3832900-1-aliceryhl@google.com>
Subject: [PATCH] mm: rust: make CONFIG_MMU ifdefs more narrow
From: Alice Ryhl <aliceryhl@google.com>
To: lkp@intel.com, akpm@linux-foundation.org
Cc: a.hindborg@kernel.org, aliceryhl@google.com, boqun.feng@gmail.com, 
	gary@garyguo.net, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Currently the entire kernel::mm module is ifdef'd out when CONFIG_MMU=n.
However, there are some downstream users of the module in
rust/kernel/task.rs and rust/kernel/miscdevice.rs. Thus, update the cfgs
so that only MmWithUserAsync is removed with CONFIG_MMU=n.

The code is moved into a new file, since the #[cfg()] annotation
otherwise has to be duplicated several times.

Closes: https://lore.kernel.org/all/202505071753.kldNHYVQ-lkp@intel.com/
Closes: https://lore.kernel.org/all/202505072116.eSYC8igT-lkp@intel.com/
Fixes: 3ca414d725d6 ("mm: rust: add abstraction for struct mm_struct")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/mm.rs             | 56 +++--------------------------
 rust/kernel/mm/mmput_async.rs | 68 +++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 52 deletions(-)
 create mode 100644 rust/kernel/mm/mmput_async.rs

diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 615907a0f3b4..43f525c0d16c 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -10,7 +10,6 @@
 //! control what happens when userspace reads or writes to that region of memory.
 //!
 //! C header: [`include/linux/mm.h`](srctree/include/linux/mm.h)
-#![cfg(CONFIG_MMU)]
 
 use crate::{
     bindings,
@@ -21,6 +20,10 @@
 pub mod virt;
 use virt::VmaRef;
 
+#[cfg(CONFIG_MMU)]
+pub use mmput_async::MmWithUserAsync;
+mod mmput_async;
+
 /// A wrapper for the kernel's `struct mm_struct`.
 ///
 /// This represents the address space of a userspace process, so each process has one `Mm`
@@ -111,50 +114,6 @@ fn deref(&self) -> &Mm {
     }
 }
 
-/// A wrapper for the kernel's `struct mm_struct`.
-///
-/// This type is identical to `MmWithUser` except that it uses `mmput_async` when dropping a
-/// refcount. This means that the destructor of `ARef<MmWithUserAsync>` is safe to call in atomic
-/// context.
-///
-/// # Invariants
-///
-/// Values of this type are always refcounted using `mmget`. The value of `mm_users` is non-zero.
-#[repr(transparent)]
-pub struct MmWithUserAsync {
-    mm: MmWithUser,
-}
-
-// SAFETY: It is safe to call `mmput_async` on another thread than where `mmget` was called.
-unsafe impl Send for MmWithUserAsync {}
-// SAFETY: All methods on `MmWithUserAsync` can be called in parallel from several threads.
-unsafe impl Sync for MmWithUserAsync {}
-
-// SAFETY: By the type invariants, this type is always refcounted.
-unsafe impl AlwaysRefCounted for MmWithUserAsync {
-    #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The pointer is valid since self is a reference.
-        unsafe { bindings::mmget(self.as_raw()) };
-    }
-
-    #[inline]
-    unsafe fn dec_ref(obj: NonNull<Self>) {
-        // SAFETY: The caller is giving up their refcount.
-        unsafe { bindings::mmput_async(obj.cast().as_ptr()) };
-    }
-}
-
-// Make all `MmWithUser` methods available on `MmWithUserAsync`.
-impl Deref for MmWithUserAsync {
-    type Target = MmWithUser;
-
-    #[inline]
-    fn deref(&self) -> &MmWithUser {
-        &self.mm
-    }
-}
-
 // These methods are safe to call even if `mm_users` is zero.
 impl Mm {
     /// Returns a raw pointer to the inner `mm_struct`.
@@ -206,13 +165,6 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
         unsafe { &*ptr.cast() }
     }
 
-    /// Use `mmput_async` when dropping this refcount.
-    #[inline]
-    pub fn into_mmput_async(me: ARef<MmWithUser>) -> ARef<MmWithUserAsync> {
-        // SAFETY: The layouts and invariants are compatible.
-        unsafe { ARef::from_raw(ARef::into_raw(me).cast()) }
-    }
-
     /// Attempt to access a vma using the vma read lock.
     ///
     /// This is an optimistic trylock operation, so it may fail if there is contention. In that
diff --git a/rust/kernel/mm/mmput_async.rs b/rust/kernel/mm/mmput_async.rs
new file mode 100644
index 000000000000..9289e05f7a67
--- /dev/null
+++ b/rust/kernel/mm/mmput_async.rs
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Version of `MmWithUser` using `mmput_async`.
+//!
+//! This is a separate file from `mm.rs` due to the dependency on `CONFIG_MMU=y`.
+#![cfg(CONFIG_MMU)]
+
+use crate::{
+    bindings,
+    mm::MmWithUser,
+    types::{ARef, AlwaysRefCounted},
+};
+use core::{ops::Deref, ptr::NonNull};
+
+/// A wrapper for the kernel's `struct mm_struct`.
+///
+/// This type is identical to `MmWithUser` except that it uses `mmput_async` when dropping a
+/// refcount. This means that the destructor of `ARef<MmWithUserAsync>` is safe to call in atomic
+/// context.
+///
+/// # Invariants
+///
+/// Values of this type are always refcounted using `mmget`. The value of `mm_users` is non-zero.
+#[repr(transparent)]
+pub struct MmWithUserAsync {
+    mm: MmWithUser,
+}
+
+// SAFETY: It is safe to call `mmput_async` on another thread than where `mmget` was called.
+unsafe impl Send for MmWithUserAsync {}
+// SAFETY: All methods on `MmWithUserAsync` can be called in parallel from several threads.
+unsafe impl Sync for MmWithUserAsync {}
+
+// SAFETY: By the type invariants, this type is always refcounted.
+unsafe impl AlwaysRefCounted for MmWithUserAsync {
+    #[inline]
+    fn inc_ref(&self) {
+        // SAFETY: The pointer is valid since self is a reference.
+        unsafe { bindings::mmget(self.as_raw()) };
+    }
+
+    #[inline]
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The caller is giving up their refcount.
+        unsafe { bindings::mmput_async(obj.cast().as_ptr()) };
+    }
+}
+
+// Make all `MmWithUser` methods available on `MmWithUserAsync`.
+impl Deref for MmWithUserAsync {
+    type Target = MmWithUser;
+
+    #[inline]
+    fn deref(&self) -> &MmWithUser {
+        &self.mm
+    }
+}
+
+impl MmWithUser {
+    /// Use `mmput_async` when dropping this refcount.
+    #[inline]
+    pub fn into_mmput_async(me: ARef<MmWithUser>) -> ARef<MmWithUserAsync> {
+        // SAFETY: The layouts and invariants are compatible.
+        unsafe { ARef::from_raw(ARef::into_raw(me).cast()) }
+    }
+}

base-commit: 03be7043bbae0380e3e314cde042e4bb5c63b48c
-- 
2.49.0.987.g0cc8ee98dc-goog

