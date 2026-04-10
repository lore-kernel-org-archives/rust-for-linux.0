Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EA63DE42F
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 21:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856987; cv=none; b=NPr+PNmIqJx1ofpRT6nbQyofdpytFyT/nvsY5cSQKJRXoaEPVwU/PtppzkWdK1jTdqsaqLXso0d8ZbQJcjX6gPLVXikSbcG8yUVdGJ3LrKZoDeSEsmReIww69qph13kpRKDlg5oRFeioD+pMoE8Hz9MDcaqaUkQ2CZA0oYcEpYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856987; c=relaxed/simple;
	bh=6dJC9Y0VDh9MmHvE+5MiMl30etMsFxZyWjlJ75pGAVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJsVga4SLOzyqcE2P3OKT2c0K6dWBGNe6FLcEkMjMKRbtvQpvR/tYZxYhCP/MmdSxCTUwxeXQqTYr66jcML+UhuMpselYa3mzWOFDCBCXH7IQze6xMt2bo1PGJ5m9SR0dsVqNQc3z+lt0SPiNtoYhO0Pjjang+J07dvpbxFEICo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgcjWh3o; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgcjWh3o"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82d0b68837aso1518176b3a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 14:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775856985; x=1776461785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NpSBUaz10XvtM1OH6Hfiv98lv1+GV4Vrhyc5KaDfGM=;
        b=RgcjWh3o0icUmpR+KlLBP4A8yZlLS3uU3B2vXsNP3pd1k+4v6sEFmq/KTbZz1vS8xh
         64CGjw3i1q5HEw9anatG+pmuVYo9PRkSzYCFy9AFbaYVI6guz1h9mYQiOuEe1eQ923++
         mLaCiFhAeMP5KjKfP9PElHnLCTcdShBvfkam/tg2qkOe4QuQwNhCz2ESjj8FotZfEvbX
         EYtjke0ATyQh4PANvZO6Ahk3RwXYGyJXO2WDct65B6MiK4YuwTzN/0bLd7hBrnE6Y7In
         vVbSjVb5P+nVwKT3/IDnuN8ObDWRhsRhAz8PzPOrWxILfx2bT/y7k8liYiBSyRuWSl4X
         F7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775856985; x=1776461785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7NpSBUaz10XvtM1OH6Hfiv98lv1+GV4Vrhyc5KaDfGM=;
        b=Zq4pJg3ejN08Sqed7HITLbADswu6HX6FTqyo6zZKxnoyWVZufssWpbgdFBzY885BQ/
         rhd5hZdQLmvmjJqG14ZPLfYqnxjHnm0oA+CMLvWrKUzpNk0vFyOCliO2vDkWCDMQECMK
         C8ZEbQ/d99gbfyP53zhLi5VoyM7StQFaM10by5eWb445oObs7Ppo6czaTkyIcBllXb+F
         SvljBZY+PFRKfBRorH1eI8WkKgbUyirnkQrVz8ukWRRlNG8pe6f8cOXTl0RcSsDnT6Ju
         VKQ2sItLPWj558ag6v0t0LT6iXJeZk4XU/E0whHkDS1uKK5p4athyZL91wMINJfh2YUQ
         5Erw==
X-Forwarded-Encrypted: i=1; AJvYcCWfdmIUNFU/EEmovWJPHt3WrVao/yGL9n02/xjhlfUWx7MQeXBEKk/kSjEGtvVcHjT9wKGM/UbEhItk7J/+0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwePNpZGXZeWBP0+qlzjXxM7m4VsMV71um12jaxejh5QPUaCUS9
	CI0dbabd8qRT6HqjwMpCDkfTrB8HHiGVN5FG41m4Oah4sXV7ODJyEkhl
X-Gm-Gg: AeBDies6YCT/QUqg8DfOStQhafs+4+RlNGSe69/46SJ+TcY6nHZaxx8Hq221eHZcQoo
	TRjzghEmOKPM7D20V97l0Y1VBbIPpJ4Vb/mWXrHm6s4By1/nh1BQ3srf6QkTdbBtmXjT0JZcXO4
	4XIltKwMhCynMfEcpPF6++pqOPdo0uHsQJMi0GGadKq3PpQw8ATh9Da7Luh1UTmE+DUBxfk5kMM
	GOqRhhg6FxAHMjgPDxzll229SdZJQPHW4q71Xyik4cZQODyX4jW3qdHJa4l1pYesnoeXIkDLRQ5
	In/cvCYD5nNJQ4zO8nz6tFsELrBR6NJ7bB2k43DXLOpMvFea/l9cf7/Dl1cO11XdOuTPOU5HanY
	HVRUBc2IZDuQGouQB9PRsV7m5wWfFz95us4P6ZMVYZv22btfopZaJydpFBBmmdQmGRU4A7AB0iH
	M8CfJ5mudXd/jN06wm59GSKKDW5cp5PIEj+cJmLbQZkZc5
X-Received: by 2002:aa7:838a:0:b0:82f:1aeb:fd60 with SMTP id d2e1a72fcca58-82f1aec00c3mr1557684b3a.16.1775856984445;
        Fri, 10 Apr 2026 14:36:24 -0700 (PDT)
Received: from mitchelllevy.localdomain ([131.107.1.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4e3d41sm5111551b3a.48.2026.04.10.14.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:36:24 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Fri, 10 Apr 2026 14:35:34 -0700
Subject: [PATCH v5 4/8] rust: percpu: introduce a rust API for static
 per-CPU variables
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-rust-percpu-v5-4-4292380d7a41@gmail.com>
References: <20260410-rust-percpu-v5-0-4292380d7a41@gmail.com>
In-Reply-To: <20260410-rust-percpu-v5-0-4292380d7a41@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Boqun Feng <boqun@kernel.org>
Cc: Tyler Hicks <code@tyhicks.com>, Allen Pais <apais@linux.microsoft.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775856978; l=26404;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=6dJC9Y0VDh9MmHvE+5MiMl30etMsFxZyWjlJ75pGAVA=;
 b=o7d8Pz3fgF38hcNyFwdrEeLK1xxp+udnVZgwbjpV2TqsbjdeaV4de9aFiks1d6qZhstZS0s8x
 +L2I4cWbwwlBfHOni04owyA4SvAnsrsp5Ry91g2rQMEVykcmjQsTU/7
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Per-CPU variables are an important tool for reducing lock contention,
especially in systems with many processors. They also provide a
convenient way to handle data that are logically associated with a
particular CPU (e.g., the currently running task).

Therefore, add a Rust API to make use of statically-allocated per-CPU
variables. Add a RAII `CpuGuard` type for disabling CPU preemption.
Introduce unifying abstractions that can be reused for a Rust API for
dynamically-allocated per-CPU variables.

Co-developed-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
Using `rustc` 1.83.0, I can confirm that the symbols `__INIT_$id` are
optimized out by the compiler and do not appear in the final `.ko` file
when compiling `samples/rust/rust_percpu.rs` (introduced in a later
patch in this series).
---
 rust/kernel/lib.rs              |   3 +
 rust/kernel/percpu.rs           | 259 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/percpu/cpu_guard.rs |  48 ++++++++
 rust/kernel/percpu/static_.rs   | 218 +++++++++++++++++++++++++++++++++
 4 files changed, 528 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 0fa9d820fe7c..b54aca69289c 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -97,6 +97,9 @@
 pub mod page;
 #[cfg(CONFIG_PCI)]
 pub mod pci;
+// Only x86_64 is supported by percpu for now
+#[cfg(CONFIG_X86_64)]
+pub mod percpu;
 pub mod pid_namespace;
 pub mod platform;
 pub mod prelude;
diff --git a/rust/kernel/percpu.rs b/rust/kernel/percpu.rs
new file mode 100644
index 000000000000..615859d4daad
--- /dev/null
+++ b/rust/kernel/percpu.rs
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0
+//! Per-CPU variables.
+//!
+//! See the [`crate::define_per_cpu!`] macro and the [`PerCpu<T>`] trait.
+
+pub mod cpu_guard;
+mod static_;
+
+#[doc(inline)]
+pub use static_::*;
+
+use crate::{
+    declare_extern_per_cpu,
+    percpu::cpu_guard::CpuGuard,
+    types::Opaque, //
+};
+
+use core::{
+    arch::asm,
+    cell::{
+        Cell,
+        RefCell,
+        UnsafeCell, //
+    },
+    mem::MaybeUninit, //
+};
+
+use ffi::c_void;
+
+/// A per-CPU pointer; that is, an offset into the per-CPU area.
+///
+/// Note that this type is NOT a smart pointer, it does not manage the allocation.
+pub struct PerCpuPtr<T>(*mut MaybeUninit<T>);
+
+/// Represents exclusive access to the memory location pointed at by a particular [`PerCpu<T>`].
+pub struct PerCpuToken<'a, T> {
+    // INVARIANT: the current CPU's memory location associated with the per-CPU variable pointed at
+    // by `ptr` (i.e., the entry in the per-CPU area on the current CPU) has been initialized.
+    _guard: CpuGuard,
+    ptr: &'a PerCpuPtr<T>,
+}
+
+/// Represents access to the memory location pointed at by a particular [`PerCpu<T>`] where the
+/// type `T` manages access to the underlying memory to avoid aliasing troubles.
+///
+/// For example, `T` might be a [`Cell`] or [`RefCell`].
+pub struct CheckedPerCpuToken<'a, T> {
+    // INVARIANT: the current CPU's memory location associated with the per-CPU variable pointed at
+    // by `ptr` (i.e., the entry in the per-CPU area on the current CPU) has been initialized.
+    _guard: CpuGuard,
+    ptr: &'a PerCpuPtr<T>,
+}
+
+impl<T> PerCpuPtr<T> {
+    /// Makes a new [`PerCpuPtr`] from a raw per-CPU pointer.
+    ///
+    /// Note that the returned [`PerCpuPtr`] is valid only as long as the given pointer is. This
+    /// also requires that the allocation pointed to by `ptr` must be correctly sized and aligned
+    /// to hold a `T`.
+    pub fn new(ptr: *mut MaybeUninit<T>) -> Self {
+        Self(ptr)
+    }
+
+    /// Get a [`&mut MaybeUninit<T>`](MaybeUninit) to the per-CPU variable on the current CPU
+    /// represented by `&self`
+    ///
+    /// # Safety
+    ///
+    /// The returned `&mut MaybeUninit<T>` must follow Rust's aliasing rules. That is, no other
+    /// `&(mut) MaybeUninit<T>` may exist that points to the same location in memory. In practice,
+    /// this means that [`Self::get_ref`] and [`Self::get_mut_ref`] must not be called on another
+    /// [`PerCpuPtr<T>`] that is a copy/clone of `&self` for as long as the returned reference
+    /// lives. If the per-CPU variable represented by `&self` is available to C, the caller of this
+    /// function must ensure that the C code does not modify the variable for as long as this
+    /// reference lives.
+    ///
+    /// `self` must point to a live allocation correctly sized and aligned to hold a `T`.
+    ///
+    /// CPU preemption must be disabled before calling this function and for the lifetime of the
+    /// returned reference. Otherwise, the returned reference might end up being a reference to a
+    /// different CPU's per-CPU area, causing the potential for a data race.
+    #[allow(clippy::mut_from_ref)] // Safety requirements prevent aliasing issues
+    pub unsafe fn get_mut_ref(&self) -> &mut MaybeUninit<T> {
+        // SAFETY: `self.get_ptr()` returns a valid pointer to a `MaybeUninit<T>` by its contract,
+        // and the safety requirements of this function ensure that the returned reference is
+        // exclusive.
+        unsafe { &mut *(self.get_ptr()) }
+    }
+
+    /// Get a [`&MaybeUninit<T>`](MaybeUninit) to the per-CPU variable on the current CPU
+    /// represented by `&self`
+    ///
+    /// # Safety
+    ///
+    /// The returned [`&MaybeUninit<T>`](MaybeUninit) must follow Rust's aliasing rules. That is,
+    /// no `&mut MaybeUninit<T>` may exist that points to the same location in memory. In practice,
+    /// this means that [`Self::get_mut_ref`] must not be called on another [`PerCpuPtr<T>`] that
+    /// is a copy/clone of `&self` for as long as the returned reference lives. If the per-CPU
+    /// variable represented by `&self` is available to C, the caller of this function must ensure
+    /// that the C code does not modify the variable for as long as this reference lives.
+    ///
+    /// `self` must point to a live allocation correctly sized and aligned to hold a `T`.
+    ///
+    /// CPU preemption must be disabled before calling this function and for the lifetime of the
+    /// returned reference. Otherwise, the returned reference might end up being a reference to a
+    /// different CPU's per-CPU area, causing the potential for a data race.
+    pub unsafe fn get_ref(&self) -> &MaybeUninit<T> {
+        // SAFETY: `self.get_ptr()` returns a valid pointer to a `MaybeUninit<T>` by its contract.
+        // The safety requirements of this function ensure that the returned reference isn't
+        // aliased by a `&mut MaybeUninit<T>`.
+        unsafe { &*self.get_ptr() }
+    }
+
+    /// Get a [`*mut MaybeUninit<T>`](MaybeUninit) to the per-CPU variable on the current CPU
+    /// represented by `&self`. Note that if CPU preemption is not disabled before calling this
+    /// function, use of the returned pointer may cause a data race without some other
+    /// synchronization mechanism. Buyer beware!
+    pub fn get_ptr(&self) -> *mut MaybeUninit<T> {
+        let this_cpu_off_pcpu = ExternStaticPerCpuSymbol::ptr(&raw const this_cpu_off);
+        let mut this_cpu_area: *mut c_void;
+        // SAFETY: gs + this_cpu_off_pcpu is guaranteed to be a valid pointer because `gs` points
+        // to the per-CPU area and this_cpu_off_pcpu is a valid per-CPU allocation.
+        unsafe {
+            asm!(
+                "mov {out}, gs:[{off_val}]",
+                off_val = in(reg) this_cpu_off_pcpu.0,
+                out = out(reg) this_cpu_area,
+            )
+        };
+
+        // This_cpu_area + self.0 is guaranteed to be a valid pointer by the per-CPU subsystem and
+        // the invariant that self.0 is a valid offset into the per-CPU area.
+        (this_cpu_area).wrapping_add(self.0 as usize).cast()
+    }
+}
+
+// SAFETY: Sending a [`PerCpuPtr<T>`] to another thread is safe because as soon as it's sent, the
+// pointer is logically referring to a different place in memory in the other CPU's per-CPU area.
+// In particular, this means that there are no restrictions on the type `T`.
+unsafe impl<T> Send for PerCpuPtr<T> {}
+
+// SAFETY: Two threads concurrently making use of a [`PerCpuPtr<T>`] will each see the `T` in their
+// own per-CPU area, so there's no potential for a data race (regardless of whether `T` is itself
+// `Sync`).
+unsafe impl<T> Sync for PerCpuPtr<T> {}
+
+impl<T> Clone for PerCpuPtr<T> {
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+/// [`PerCpuPtr`] is just a wrapper around a pointer.
+impl<T> Copy for PerCpuPtr<T> {}
+
+/// A trait representing a per-CPU variable.
+///
+/// This is implemented for [`StaticPerCpu<T>`]. The main usage of this trait is to call
+/// [`Self::get_mut`] to get a [`PerCpuToken`] that can be used to access the underlying per-CPU
+/// variable.
+///
+/// See [`PerCpuToken::with`].
+pub trait PerCpu<T> {
+    /// Produces a token, asserting that the holder has exclusive access to the underlying memory
+    /// pointed to by `self`
+    ///
+    /// # Safety
+    ///
+    /// No other [`PerCpuToken`] or [`CheckedPerCpuToken`] may exist on the current CPU (which is a
+    /// sensible notion, since we keep a [`CpuGuard`] around) that is derived from the same
+    /// [`PerCpu<T>`] or a clone thereof.
+    unsafe fn get_mut(&mut self, guard: CpuGuard) -> PerCpuToken<'_, T>;
+}
+
+/// A marker trait for types that are interior mutable. Types that implement this trait can be used
+/// to create "checked" per-CPU variables. See [`CheckedPerCpu<T>`].
+pub trait InteriorMutable {}
+
+impl<T> InteriorMutable for Cell<T> {}
+impl<T> InteriorMutable for RefCell<T> {}
+impl<T> InteriorMutable for UnsafeCell<T> {}
+impl<T> InteriorMutable for Opaque<T> {}
+
+/// A trait representing a per-CPU variable that is usable via a `&T`.
+///
+/// The unsafety of [`PerCpu<T>`] stems from the fact that the holder of a [`PerCpuToken`] can use
+/// it to get a `&mut T` to the underlying per-CPU variable. This is problematic because the
+/// existence of aliasing `&mut T` is undefined behavior in Rust. This type avoids that issue by
+/// only allowing access via a `&T`, with the tradeoff that then `T` must be interior mutable or
+/// the underlying per-CPU variable must be a constant for the lifetime of any corresponding
+/// [`CheckedPerCpuToken<T>`].
+///
+/// Currently, only the case where `T` is interior mutable has first-class support, though a custom
+/// implementation of [`PerCpu<T>`]/[`CheckedPerCpu<T>`] could be created for the const case.
+pub trait CheckedPerCpu<T>: PerCpu<T> {
+    /// Produces a token via which the holder can access the underlying per-CPU variable.
+    fn get(&self, guard: CpuGuard) -> CheckedPerCpuToken<'_, T>;
+}
+
+impl<'a, T> PerCpuToken<'a, T> {
+    /// Asserts that the holder has exclusive access to the initialized underlying memory pointed
+    /// to by `ptr` on the current CPU, producing a token.
+    ///
+    /// # Safety
+    ///
+    /// No other [`PerCpuToken`] or [`CheckedPerCpuToken`] may exist on the current CPU (which is a
+    /// sensible notion, since we keep a `CpuGuard` around) that uses the same [`PerCpuPtr<T>`].
+    ///
+    /// The current CPU's memory location associated with the per-CPU variable pointed at by `ptr`
+    /// (i.e., the entry in the per-CPU area on this CPU) must be initialized; `ptr` must be valid
+    /// (that is, pointing at a live per-CPU allocation correctly sized and aligned to hold a `T`)
+    /// for `'a`.
+    pub unsafe fn new(guard: CpuGuard, ptr: &'a PerCpuPtr<T>) -> PerCpuToken<'a, T> {
+        Self { _guard: guard, ptr }
+    }
+
+    /// Immediately invokes `func` with a `&mut T` that points at the underlying per-CPU variable
+    /// that `&mut self` represents. Forwards the return of `func`.
+    pub fn with<U, V>(&mut self, func: U) -> V
+    where
+        U: FnOnce(&mut T) -> V,
+    {
+        // SAFETY: The existence of a PerCpuToken means that the requirements for get_mut_ref are
+        // satisfied. Likewise, the requirements for assume_init_mut are satisfied because the
+        // invariants of this type ensure that on the current CPU (which is a sensible notion
+        // because we have a CpuGuard), the memory location pointed to by `ptr` is initialized.
+        func(unsafe { self.ptr.get_mut_ref().assume_init_mut() })
+    }
+}
+
+impl<'a, T> CheckedPerCpuToken<'a, T> {
+    /// Asserts that the memory pointed to by `ptr` is initialized on the current CPU, producing a
+    /// token.
+    ///
+    /// # Safety
+    ///
+    /// The current CPU's memory location associated with the per-CPU variable pointed at by `ptr`
+    /// (i.e., the entry in the per-CPU area on this CPU) must be initialized; `ptr` must be valid
+    /// (that is, pointing at a live per-CPU allocation correctly sized and aligned to hold a `T`)
+    /// for `'a`.
+    pub unsafe fn new(guard: CpuGuard, ptr: &'a PerCpuPtr<T>) -> CheckedPerCpuToken<'a, T> {
+        Self { _guard: guard, ptr }
+    }
+
+    /// Immediately invokes `func` with a `&T` that points at the underlying per-CPU variable that
+    /// `&mut self` represents. Forwards the return of `func`.
+    pub fn with<U, V>(&self, func: U) -> V
+    where
+        U: FnOnce(&T) -> V,
+    {
+        // SAFETY: The existence of a CheckedPerCpuToken means that the requirements for get_ref
+        // are satisfied. Likewise, the requirements for assume_init_ref are satisfied because the
+        // invariants of this type ensure that on the current CPU (which is a sensible notion
+        // because we have a CpuGuard), the memory location pointed to by `ptr` is initialized.
+        func(unsafe { self.ptr.get_ref().assume_init_ref() })
+    }
+}
+
+declare_extern_per_cpu!(this_cpu_off: *mut c_void);
diff --git a/rust/kernel/percpu/cpu_guard.rs b/rust/kernel/percpu/cpu_guard.rs
new file mode 100644
index 000000000000..aba776b64bbc
--- /dev/null
+++ b/rust/kernel/percpu/cpu_guard.rs
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+//! Contains abstractions for disabling CPU preemption. See [`CpuGuard`].
+
+/// A RAII guard for `bindings::preempt_disable` and `bindings::preempt_enable`.
+///
+/// Guarantees preemption is disabled for as long as this object exists.
+pub struct CpuGuard {
+    // Don't make one without using new()
+    _phantom: (),
+    /// [`CpuGuard`] is not [`Send`]: moving it to another CPU would break its guarantees and also
+    /// leave the CPU it was created on with preemption disabled indefinitely.
+    ///
+    /// It is also not [`Sync`]: preemption being disabled on one CPU is not relevant to other
+    /// CPUs, so we shouldn't be able to share a `&CpuGuard` between threads.
+    _not_send_sync: core::marker::PhantomData<*const ()>,
+}
+
+impl CpuGuard {
+    /// Create a new [`CpuGuard`]. Disables preemption for its lifetime.
+    #[inline]
+    pub fn new() -> Self {
+        // SAFETY: There are no preconditions required to call preempt_disable
+        unsafe {
+            bindings::preempt_disable();
+        }
+        CpuGuard {
+            _phantom: (),
+            _not_send_sync: core::marker::PhantomData,
+        }
+    }
+}
+
+impl Default for CpuGuard {
+    #[inline]
+    fn default() -> Self {
+        Self::new()
+    }
+}
+
+impl Drop for CpuGuard {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: There are no preconditions required to call preempt_enable
+        unsafe {
+            bindings::preempt_enable();
+        }
+    }
+}
diff --git a/rust/kernel/percpu/static_.rs b/rust/kernel/percpu/static_.rs
new file mode 100644
index 000000000000..70aca55295ca
--- /dev/null
+++ b/rust/kernel/percpu/static_.rs
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+//! Statically allocated per-CPU variables.
+
+use super::*;
+
+/// A wrapper used for declaring static per-CPU variables.
+///
+/// These symbols are "virtual" in that the linker uses them to generate offsets into each CPU's
+/// per-CPU area, but shouldn't be read from/written to directly. The fact that the statics are
+/// immutable prevents them being written to (generally), this struct having _val be non-public
+/// prevents reading from them.
+///
+/// The end-user of the per-CPU API should make use of the [`crate::define_per_cpu!`] macro instead
+/// of declaring variables of this type directly. All instances of this type must be `static` and
+/// `#[link_section = ".data..percpu"]` (which the macro handles).
+#[repr(transparent)]
+pub struct StaticPerCpuSymbol<T> {
+    _val: T, // generate a correctly sized type
+}
+
+/// A wrapper for per-CPU variables declared in C.
+///
+/// As with [`StaticPerCpuSymbol`], this type should not be used directly. Instead, use the
+/// [`crate::declare_extern_per_cpu!`] macro.
+#[repr(transparent)]
+pub struct ExternStaticPerCpuSymbol<T>(StaticPerCpuSymbol<T>);
+
+/// Holds a statically-allocated per-CPU variable.
+#[derive(Clone)]
+pub struct StaticPerCpu<T>(pub(super) PerCpuPtr<T>);
+
+impl<T: PerCpuSyncMarkerType> StaticPerCpuSymbol<T> {
+    /// Removes the per-CPU marker type from a static per-CPU symbol.
+    ///
+    /// To declare a static per-CPU variable, Rust requires that the variable be `Sync`. However,
+    /// in the case of per-CPU variables, this is silly. See [`PerCpuSyncMarkerType`]. Thus, our
+    /// statics are actually of type `StaticPerCpuSymbol<PerCpuSyncMarkerType<T>>`, and this
+    /// produces a `StaticPerCpuSymbol<T>`.
+    pub fn forward(ptr: *const Self) -> *const StaticPerCpuSymbol<T::Inner> {
+        ptr.cast()
+    }
+}
+
+impl<T> ExternStaticPerCpuSymbol<T> {
+    /// Gets a [`PerCpuPtr`] to the per-CPU variable.
+    ///
+    /// Usage of this [`PerCpuPtr`] must be very careful to keep in mind what's happening in C. In
+    /// particular, the C code cannot modify the variable while any reference derived from the
+    /// returned pointer is live.
+    pub fn ptr(ptr: *const Self) -> PerCpuPtr<T> {
+        // These casts are OK because, ExternStaticPerCpuSymbol, StaticPerCpuSymbol, and
+        // MaybeUninit are transparent, everything is just a `T` from a memory layout perspective.
+        // Casting to `mut` is OK because any usage of the returned pointer must satisfy the
+        // soundness requirements for using it as such.
+        PerCpuPtr::new(ptr.cast::<StaticPerCpuSymbol<T>>().cast_mut().cast())
+    }
+}
+
+impl<T> StaticPerCpu<T> {
+    /// Creates a [`StaticPerCpu<T>`] from a [`StaticPerCpuSymbol<T>`].
+    ///
+    /// Users should probably declare static per-CPU variables with [`crate::define_per_cpu!`] and
+    /// then get instances of [`StaticPerCpu`] using [`crate::get_static_per_cpu!`].
+    ///
+    /// # Safety
+    /// You should probably be using [`crate::get_static_per_cpu!`] instead.
+    ///
+    /// `ptr` must be a valid offset into the per-CPU area, sized and aligned for access to a `T`;
+    /// typically this is the address of a static in the `.data..percpu` section, which is managed
+    /// by the per-CPU subsystem.
+    pub unsafe fn new(ptr: *const StaticPerCpuSymbol<T>) -> StaticPerCpu<T> {
+        let pcpu_ptr = PerCpuPtr::new(ptr.cast_mut().cast());
+        Self(pcpu_ptr)
+    }
+}
+
+impl<T> PerCpu<T> for StaticPerCpu<T> {
+    unsafe fn get_mut(&mut self, guard: CpuGuard) -> PerCpuToken<'_, T> {
+        // SAFETY:
+        // 1. By the requirements of `PerCpu::get_mut`, no other `[Checked]PerCpuToken` exists on
+        //    the current CPU.
+        // 2. The per-CPU subsystem guarantees that each CPU's instance of a statically allocated
+        //    variable begins with a copy of the contents of the corresponding symbol in
+        //    `.data..percpu` and is therefore initialized.
+        // 3. The per-CPU subsystem guarantees that `self.0` is correctly aligned for a `T`.
+        // 4. The per-CPU subsystem guarantees that `self.0` lives forever as a per-CPU allocation,
+        //    and that this allocation is the proper size for a `T`.
+        unsafe { PerCpuToken::new(guard, &self.0) }
+    }
+}
+
+impl<T: InteriorMutable> CheckedPerCpu<T> for StaticPerCpu<T> {
+    fn get(&self, guard: CpuGuard) -> CheckedPerCpuToken<'_, T> {
+        // SAFETY:
+        // 1. The per-CPU subsystem guarantees that each CPU's instance of a statically allocated
+        //    variable begins with a copy of the contents of the corresponding symbol in
+        //    `.data..percpu` and is therefore initialized.
+        // 2. The per-CPU subsystem guarantees that `self.0` is correctly aligned for a `T`.
+        // 3. The per-CPU subsystem guarantees that `self.0` lives forever as a per-CPU allocation,
+        //    and that this allocation is the proper size for a `T`.
+        unsafe { CheckedPerCpuToken::new(guard, &self.0) }
+    }
+}
+
+/// Gets a [`StaticPerCpu<T>`] from a symbol declared with [`crate::define_per_cpu!`].
+///
+/// # Arguments
+///
+/// * `ident` - The identifier declared
+#[macro_export]
+macro_rules! get_static_per_cpu {
+    ($id:ident) => {
+        unsafe {
+            // SAFETY: The signature of `StaticPerCpuSymbol::forward` guarantees that `&raw const
+            // $id` is a `*const StaticPerCpuSymbol<PerCpuSyncMarkerType<T>>` if the macro
+            // invocation compiles.
+            //
+            // Values of type `StaticPerCpuSymbol<T>` must be created via `define_per_cpu`, and so
+            // the per-CPU subsystem guarantees that the requirements for `StaticPerCpu::new` are
+            // satisfied.
+            $crate::percpu::StaticPerCpu::new($crate::percpu::StaticPerCpuSymbol::forward(
+                &raw const $id,
+            ))
+        }
+    };
+}
+
+/// Declares an [`ExternStaticPerCpuSymbol`] corresponding to a per-CPU variable defined in C.
+#[macro_export]
+macro_rules! declare_extern_per_cpu {
+    ($id:ident: $ty:ty) => {
+        extern "C" {
+            static $id: ExternStaticPerCpuSymbol<$ty>;
+        }
+    };
+}
+
+/// A trait implemented by static per-CPU wrapper types.
+///
+/// Internally, static per-CPU variables are declared as `static` variables. However, Rust doesn't
+/// allow you to declare statics of a `!Sync` type. This trait is implemented by the marker type
+/// that is declared as `Sync` and used to declare the static. See [`crate::define_per_cpu!`] for
+/// the gory details.
+///
+/// # Safety
+///
+/// Implementations must be `#[repr(transparent)]` wrappers around an `Inner`. This trait should
+/// only be used from the [`crate::define_per_cpu!`] macro.
+pub unsafe trait PerCpuSyncMarkerType {
+    /// The "true" type of the per-CPU variable. It must always be valid to cast a `*const Self` to
+    /// a `*const Self::Inner`, which is guaranteed by this trait's safety requirement.
+    type Inner;
+}
+
+/// Declares and initializes a static per-CPU variable.
+///
+/// Analogous to the C `DEFINE_PER_CPU` macro.
+///
+/// See also [`crate::get_static_per_cpu!`] for how to get a [`StaticPerCpu`] from this
+/// declaration.
+///
+/// # Example
+/// ```
+/// use kernel::define_per_cpu;
+///
+/// define_per_cpu!(pub MY_PERCPU: u64 = 0);
+/// ```
+#[macro_export]
+macro_rules! define_per_cpu {
+    ($vis:vis $id:ident: $ty:ty = $expr:expr) => {
+        $crate::macros::paste! {
+            // We might want to have a per-CPU variable that doesn't implement `Sync` (not paying
+            // sync overhead costs is part of the point), but Rust won't let us declare a static of
+            // a `!Sync` type. Of course, we don't actually have any synchronization issues, since
+            // each CPU will see its own copy of the variable, so we cheat a little bit and tell
+            // Rust it's fine.
+            #[doc(hidden)]
+            #[allow(non_camel_case_types)]
+            #[repr(transparent)] // It needs to be the same size as $ty
+            struct [<__PRIVATE_TYPE_ $id>]($ty);
+
+            // SAFETY: [<__PRIVATE_TYPE_ $id>] is a `#[repr(transparent)]` wrapper around a `$ty`.
+            unsafe impl $crate::percpu::PerCpuSyncMarkerType for [<__PRIVATE_TYPE_ $id>] {
+                type Inner = $ty;
+            }
+
+            impl [<__PRIVATE_TYPE_ $id>] {
+                #[doc(hidden)]
+                const fn new(val: $ty) -> Self {
+                    Self(val)
+                }
+            }
+
+            // Expand $expr outside of the unsafe block to avoid silently allowing unsafe code to be
+            // used without a user-facing unsafe block
+            #[doc(hidden)]
+            static [<__INIT_ $id>]: [<__PRIVATE_TYPE_ $id>] = [<__PRIVATE_TYPE_ $id>]::new($expr);
+
+            // SAFETY: This type will ONLY ever be used to declare a `StaticPerCpuSymbol`
+            // (which we then only ever use as input to `&raw`). Reading from the symbol is
+            // already UB, so we won't ever actually have any variables of this type where
+            // synchronization is a concern.
+            #[doc(hidden)]
+            unsafe impl Sync for [<__PRIVATE_TYPE_ $id>] {}
+
+            // SAFETY: StaticPerCpuSymbol<T> is #[repr(transparent)], so we can freely convert from
+            // [<__PRIVATE_TYPE_ $id>], which is also `#[repr(transparent)]` (i.e., everything is
+            // just a `$ty` from a memory layout perspective).
+            #[link_section = ".data..percpu"]
+            $vis static $id: $crate::percpu::StaticPerCpuSymbol<[<__PRIVATE_TYPE_ $id>]> = unsafe {
+                core::mem::transmute_copy::<
+                    [<__PRIVATE_TYPE_ $id>],
+                    $crate::percpu::StaticPerCpuSymbol<[<__PRIVATE_TYPE_ $id>]>
+                >(&[<__INIT_ $id>])
+            };
+        }
+    };
+}

-- 
2.34.1

