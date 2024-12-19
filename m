Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3AB1D7996;
	Thu, 19 Dec 2024 21:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642529; cv=none; b=PPZDFQp7mb1n3t2EBDhUD4aUkVJ/zjoLMnKjV0CPzi99nS0H6KR1W7v+jvJFEVsis6/QFjRc7rLRYBP+3OfFwBAxf7zGxYIylfW2JZlJBW4COjP3VjnNxz0eOjRoYfIBn6rPjmJv49UTW9rR9S+svrznSmq2i98wbbCQbD5+l8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642529; c=relaxed/simple;
	bh=/ikI70Vx9VTFvUYOPIJla9o/5OEbZwWpK+cUvQgY7gU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PkiZnSE7SLNMrARpBxhpk0xRBbcP289k/ThhdhiesrIgWJ7PMtpceFPHFJZnZmEO9BVTNDBDK2WdyX5JxzDy6wtn5PwiaFw0kSHqxeCH47gdz7suHqZRlVShXGzDP7CNR00yk/P/+FK8n2B3fUML4q5O7TWKH7NzTF77bUGFqMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jej0g/nl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jej0g/nl"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-216426b0865so11705105ad.0;
        Thu, 19 Dec 2024 13:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734642527; x=1735247327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9QXxVgtSe8H/UdvxZZA8sF6VvONdQXEw9VUMmlZNJA=;
        b=jej0g/nlx/WfXOxl70GbhSNx7SMkpRb0gLLtlvFo7ZTYjIoIkpsKGREbVW/+ibktj9
         jNsQyYReJXKUfoGeacAXBkW2Kp9eFRGPn2b90lGVqiVrdfm5VCd/nRhcq2sMXQTPqB/D
         pEmLp/D3jrb8F8kd0QEwwy0S+m3egfChubsZiCdhBW6myXbus+LiPdDUh/pJQRZdvuQ8
         wcVmvfpSJbn2P8LDVMahMR3LtxUFZFr8JYB/q+WEHRpwfPj1kYbGyyX/UexEpMCm1WQh
         T4LlzmPDxNOOq4kaewU8HW8AqDiEdo0gF+cwsLGU7x4GbPBT0ztOBlMe7konx5W5gVqU
         4HNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642527; x=1735247327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9QXxVgtSe8H/UdvxZZA8sF6VvONdQXEw9VUMmlZNJA=;
        b=J1SOucft28O01RSV7KvjkZnYFM70RyWVnJeV/Q6FuwAmoD/JZAuhl7/bx/j3njE1FB
         vhm3JHlPtyfjqjxpAiSP1EuzH2/rfLEZQoV4GWFihcnH9SBoeKfOkPeUO5k3WePlZ/Cs
         9L26xfj/vGBIujO6HIf2D03SmKsca8epvUn52ociX1muhKFapUInhG1h7ewUCrcBXdHn
         CZMAQz3FfDhVuYY6MlVKo3YLbA/kcfBCJ6JBpzHgD7pXOI+5UikU7rUEvQn0Ne81bo4r
         8h+ZWh2rzH/wI3rcixb4qYb4Mu4CjB7M3aQeC190mwLbfv5CRxtQNfHRPICTjnoqoB4E
         Y6WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwy8JI/teGj8165gf2xy9UdeGwE5K81oy3Qvqf5K05BoVUhfCegNtT9sKCDyawQ6u5XDq7lNa+46GHY68SyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6EYQcGSzjVNZgUBSLVXopneZQX2O6MZNi+/Jp2P0FP57BfvGg
	d7QdBd7LVTWcwhjO8b8hGm7hQL203XxIsw1UQBL8Aqa0W1UjhPOB
X-Gm-Gg: ASbGnctLc/CPEVnQxoB+dtIfAzKQx9Nmk1i5wwiK19jOPR0+F00yY6Y+b38ynNeI407
	2xdvFbnG6nQevUR7UMmXxnzRN77SS1IgZqVKMZfOUVSJseXYop5wq1uDOeEGkhYB59qjh/VnqWX
	2Zb9dn+G/xBvU0BHEH8YrHzWt6GiUdAFWkqBGP3D7lbQJ6o00W2kdNXbtdcNlLMZUlyhmXfBJv5
	sp6LNYdaD01BqdH0o4pwJ/fXMYcZLzooXVVffo0oV4IzzdGNkOiHv+Qj6bhQ7ZdLQ==
X-Google-Smtp-Source: AGHT+IGz0Q+3DpfXii21esDiAC06Fva51alHJG6cESFMtMV5fGT0zFttkPVJt7mH0xNMF9ojhQsEbA==
X-Received: by 2002:a17:902:f607:b0:212:5786:7bbe with SMTP id d9443c01a7336-219e6ea1baamr2967705ad.24.1734642527196;
        Thu, 19 Dec 2024 13:08:47 -0800 (PST)
Received: from mitchelllevy. ([174.127.224.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962cc3sm16831755ad.28.2024.12.19.13.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 13:08:46 -0800 (PST)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Thu, 19 Dec 2024 13:08:26 -0800
Subject: [PATCH RFC 1/3] rust: percpu: introduce a rust API for per-CPU
 variables
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-rust-percpu-v1-1-209117e822b1@gmail.com>
References: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com>
In-Reply-To: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734642524; l=9725;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=/ikI70Vx9VTFvUYOPIJla9o/5OEbZwWpK+cUvQgY7gU=;
 b=xAlZKloO7jsOKjUts/I2F2rmsZdyqA6z5zN+M95gp6DPAS4r3zekMmTKtwUJ4JUDfydbIxXyf
 1eSJ1IX89SzAF7KNMdQ14WNrPwGjDOzG/6mUKhoDSddY6GeZ337Ivqm
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Add a CpuGuard type that disables preemption for its lifetime. Add a
PerCpuVariable type used for declaring per-CPU variables and a
declare_per_cpu! macro for its use. Add a PerCpuRef that allows actual
use of the per-CPU variable and an usafe_get_per_cpu_ref! helper macro
to convert PerCpuVariable to PerCpuRef.

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/helpers/helpers.c          |   1 +
 rust/helpers/preempt.c          |  14 ++++
 rust/kernel/lib.rs              |   3 +
 rust/kernel/percpu.rs           | 161 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/percpu/cpu_guard.rs |  29 ++++++++
 5 files changed, 208 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index dcf827a61b52..1db0dcd8f11f 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -19,6 +19,7 @@
 #include "mutex.c"
 #include "page.c"
 #include "pid_namespace.c"
+#include "preempt.c"
 #include "rbtree.c"
 #include "refcount.c"
 #include "security.c"
diff --git a/rust/helpers/preempt.c b/rust/helpers/preempt.c
new file mode 100644
index 000000000000..2c7529528ddd
--- /dev/null
+++ b/rust/helpers/preempt.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/preempt.h>
+
+void rust_helper_preempt_disable(void)
+{
+	preempt_disable();
+}
+
+void rust_helper_preempt_enable(void)
+{
+	preempt_enable();
+}
+
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e1065a7551a3..3634e1412d60 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -49,6 +49,9 @@
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod page;
+// Only x86_64 is supported by percpu for now
+#[cfg(CONFIG_X86_64)]
+pub mod percpu;
 pub mod pid_namespace;
 pub mod prelude;
 pub mod print;
diff --git a/rust/kernel/percpu.rs b/rust/kernel/percpu.rs
new file mode 100644
index 000000000000..08fcc8797078
--- /dev/null
+++ b/rust/kernel/percpu.rs
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0
+//! This module contains abstractions for creating and using per-CPU variables from Rust. In
+//! particular, see the define_per_cpu! and unsafe_get_per_cpu_ref! macros.
+pub mod cpu_guard;
+
+use crate::percpu::cpu_guard::CpuGuard;
+use crate::unsafe_get_per_cpu_ref;
+
+use core::arch::asm;
+use core::marker::PhantomData;
+use core::ops::{Deref, DerefMut};
+
+/// A PerCpuRef is obtained by the unsafe_get_per_cpu_ref! macro used on a PerCpuVariable defined
+/// via the define_per_cpu! macro.
+///
+/// This type will transparently deref(mut) into a &(mut) T referencing this CPU's instance of the
+/// underlying variable.
+pub struct PerCpuRef<T> {
+    offset: usize,
+    deref_type: PhantomData<T>,
+    _guard: CpuGuard,
+}
+
+/// A wrapper used for declaring static per-cpu variables. These symbols are "virtual" in that the
+/// linker uses them to generate offsets into each cpu's per-cpu area, but shouldn't be read
+/// from/written to directly. The fact that the statics are immutable prevents them being written
+/// to (generally), this struct having _val be non-public prevents reading from them.
+///
+/// The end-user of the per-CPU API should make use of the define_per_cpu! macro instead of
+/// declaring variables of this type directly.
+#[repr(transparent)]
+pub struct PerCpuVariable<T> {
+    _val: T, // generate a correctly sized type
+}
+
+impl<T> PerCpuRef<T> {
+    /// You should be using the unsafe_get_per_cpu! macro instead
+    ///
+    /// # Safety
+    /// offset must be a valid offset into the per cpu area
+    pub unsafe fn new(offset: usize, guard: CpuGuard) -> Self {
+        PerCpuRef {
+            offset,
+            deref_type: PhantomData,
+            _guard: guard,
+        }
+    }
+
+    /// Computes this_cpu_ptr as a usize, ignoring issues of ownership and borrowing
+    fn this_cpu_ptr_usize(&self) -> usize {
+        // SAFETY: this_cpu_off is read only as soon as the per-CPU subsystem is initialized
+        let off: PerCpuRef<u64> = unsafe { unsafe_get_per_cpu_ref!(this_cpu_off, CpuGuard::new()) };
+        let mut this_cpu_area: usize;
+        // SAFETY: gs + off_val is guaranteed to be a valid pointer by the per-CPU subsystem and
+        // the invariants guaranteed by PerCpuRef (i.e., off.offset is valid)
+        unsafe {
+            asm!(
+                // For some reason, the asm! parser doesn't like
+                //     mov {out}, [gs:{off_val}]
+                // so we use the less intuitive prefix version instead
+                "gs mov {out}, [{off_val}]",
+                off_val = in(reg) off.offset,
+                out = out(reg) this_cpu_area,
+            )
+        };
+        this_cpu_area + self.offset
+    }
+
+    /// Returns a pointer to self's associated per-CPU variable. Logically equivalent to C's
+    /// this_cpu_ptr
+    pub fn this_cpu_ptr(&self) -> *const T {
+        self.this_cpu_ptr_usize() as *const T
+    }
+
+    /// Returns a mut pointer to self's associated per-CPU variable. Logically equivalent to C's
+    /// this_cpu_ptr
+    pub fn this_cpu_ptr_mut(&mut self) -> *mut T {
+        self.this_cpu_ptr_usize() as *mut T
+    }
+}
+
+impl<T> Deref for PerCpuRef<T> {
+    type Target = T;
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: By the contract of unsafe_get_per_cpu_ref!, we know that self is the only
+        // PerCpuRef associated with the underlying per-CPU variable and that the underlying
+        // variable is not mutated outside of rust.
+        unsafe { &*(self.this_cpu_ptr()) }
+    }
+}
+
+impl<T> DerefMut for PerCpuRef<T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: By the contract of unsafe_get_per_cpu_ref!, we know that self is the only
+        // PerCpuRef associated with the underlying per-CPU variable and that the underlying
+        // variable is not mutated outside of rust.
+        unsafe { &mut *(self.this_cpu_ptr_mut()) }
+    }
+}
+
+/// define_per_cpu! is analogous to the C DEFINE_PER_CPU macro in that it lets you create a
+/// statically allocated per-CPU variable.
+///
+/// # Example
+/// ```
+/// use kernel::define_per_cpu;
+/// use kernel::percpu::PerCpuVariable;
+///
+/// define_per_cpu!(pub MY_PERCPU: u64 = 0);
+/// ```
+#[macro_export]
+macro_rules! define_per_cpu {
+    ($vis:vis $id:ident: $ty:ty = $expr:expr) => {
+        $crate::macros::paste! {
+            // Expand $expr outside of the unsafe block to avoid silently allowing unsafe code to be
+            // used without a user-facing unsafe block
+            static [<__init_ $id>]: $ty = $expr;
+
+            // SAFETY: PerCpuVariable<T> is #[repr(transparent)], so we can freely convert from T
+            #[link_section = ".data..percpu"]
+            $vis static $id: PerCpuVariable<$ty> = unsafe {
+                core::mem::transmute::<$ty, PerCpuVariable<$ty>>([<__init_ $id>])
+            };
+        }
+    };
+}
+
+/// Goes from a PerCpuVariable to a usable PerCpuRef. $id is the identifier of the PerCpuVariable
+/// and $guard is an expression that evaluates to a CpuGuard.
+///
+/// # Safety
+/// Don't create two PerCpuRef that point at the same per-cpu variable, as this would allow you to
+/// accidentally break aliasing rules. Unless T is Sync, the returned PerCpuRef should not be used
+/// from interrupt contexts.
+///
+/// If $id is `extern "C"` (i.e., declared via declare_extern_per_cpu!) then the underlying per-CPU
+/// variable must not be written from C code while a PerCpuRef exists in Rust. That is, the
+/// underlying per-CPU variable must not be written in any IRQ context (unless the user ensures
+/// IRQs are disabled) and no FFI calls can be made to C functions that may write the per-CPU
+/// variable. The underlying PerCpuVariable created via declare_extern_per_cpu must also have the
+/// correct type.
+#[macro_export]
+macro_rules! unsafe_get_per_cpu_ref {
+    ($id:ident, $guard:expr) => {{
+        let off = core::ptr::addr_of!($id);
+        PerCpuRef::new(off as usize, $guard)
+    }};
+}
+
+/// Declares a PerCpuVariable corresponding to a per-CPU variable defined in C. Be sure to read the
+/// safety requirements of unsafe_get_per_cpu_ref!.
+#[macro_export]
+macro_rules! declare_extern_per_cpu {
+    ($id:ident: $ty:ty) => {
+        extern "C" {
+            static $id: PerCpuVariable<$ty>;
+        }
+    };
+}
+
+declare_extern_per_cpu!(this_cpu_off: u64);
diff --git a/rust/kernel/percpu/cpu_guard.rs b/rust/kernel/percpu/cpu_guard.rs
new file mode 100644
index 000000000000..6f7d320a5c9a
--- /dev/null
+++ b/rust/kernel/percpu/cpu_guard.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+//! Contains abstractions for disabling CPU preemption. See CpuGuard.
+
+/// A RAII guard for bindings::preempt_disable and bindings::preempt_enable. Guarantees preemption
+/// is disabled for as long as this object exists.
+pub struct CpuGuard {
+    // Don't make one without using new()
+    _phantom: (),
+}
+
+impl CpuGuard {
+    /// Create a new CpuGuard. Disables preemption for its lifetime.
+    pub fn new() -> Self {
+        // SAFETY: There are no preconditions required to call preempt_disable
+        unsafe {
+            bindings::preempt_disable();
+        }
+        CpuGuard { _phantom: () }
+    }
+}
+
+impl Drop for CpuGuard {
+    fn drop(&mut self) {
+        // SAFETY: There are no preconditions required to call preempt_enable
+        unsafe {
+            bindings::preempt_enable();
+        }
+    }
+}

-- 
2.34.1

