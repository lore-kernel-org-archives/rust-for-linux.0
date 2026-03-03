Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24BB3C3BFA
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 20:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569042; cv=none; b=NKzsZVknU1xbP7Ja04Vm5Bq/FPuWFxbhEUlMU5Dq7ZuNVZGgvuSrViDpdBP+EBmhkQUfwoDAP5CakiJuYcDxVCYsi53JjDQmB09LmnzVGklPa5wNHc6+FRuMTOvEEwXa1slISVFTwSerXNDTuFPtNNAMBSWBgJgRtDek9Y8zVM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569042; c=relaxed/simple;
	bh=sHM6W/LqksUaM7Fdg8zJQYbG5VmPLmHJKmZT8ses/r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sfbWHqya+HN1S3Wf+/iOA2pgDUJkjg6UplG+BUEFEIsuASLNbODwioVImx+UXKtmi2/X7lktuT34ecFXKRHmRoJHMf0qJiDoZdiqgWMkjoEBqPlW6dW7I1dbvLLtTscbSiah9vZ1ScDm4tX2nk8fMqUlxnVlks12cVrWzIIkkr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcEhFFbN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcEhFFbN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659FEC4AF09;
	Tue,  3 Mar 2026 20:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772569041;
	bh=sHM6W/LqksUaM7Fdg8zJQYbG5VmPLmHJKmZT8ses/r8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jcEhFFbNSQ/FD9XiyK0XwTb7B5aGRwsgkQJBMUXxJRpLqjkRoHDUcw/Mv5VwxquTK
	 9FRjqjTXCn8/pYttJgyxuJ2vxJSe+JcDizdXy8QHoYGsdCnCkwfr2V/FJRUsa0wow4
	 r6ChObvoVD/Hm/gYqsk77jU26txTiGMuYAbOjb8OvK73x7YLtdINjciZChNDRgl9iS
	 F0EyX7tzOi/T48zTLHA5GLuxs9Z6IJ1klhopwH+vdQeb9/fIPpQnlKpv3N9nwnnHdh
	 otBJAEuEZaIktwVPwFGQsiH7rn6yoeozjbA5vzYi3EPFTCJsJrMdjLclvT83d6ki0C
	 JLMYtdpc4X3UA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8E0D6F40068;
	Tue,  3 Mar 2026 15:17:20 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 03 Mar 2026 15:17:20 -0500
X-ME-Sender: <xms:0EGnaUhrmofGatjM6TZwCSFjeDkRLPxV4E7vskdGMKmAZLIDBWl1ig>
    <xme:0EGnaY8cxxiH2Lny_vU28i2MZyHWe2uiToB3MsLVhq6umV96CFlFbiDl9OybWz5ob
    2qb8zmULZ9fY5TOVaH2a4uAw7tVYpaIRNRl2wH3dWEoyHOCvDWwqA>
X-ME-Received: <xmr:0EGnaSM_JYnKZKc5Bz83d1S905-jhVFQ7ywKjVUGkhhrd4AsotqJF2nYqQrTzTYRGlyJ4T6WDR_MRSCVPJNUdFiIcKm43jdn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekieffgeevhefgudffveffheettdfgkeeilefhhfduhedugedvhedtteegvdeugfenucff
    ohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudekpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgr
    rhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpg
    hghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:0EGnabosf4xd67xiYCnN_tdCuzLdI5trFJrQKeqgzxyuyaAORKC0SQ>
    <xmx:0EGnaf7ZjKjcisFziZew064p9Rjx8CUrXHzDkMy3LOjqDt6wGFQqjQ>
    <xmx:0EGnadqgIyeKMJ9o5ILUmAwQ6ZUYDBTPpQBrwPmTYwj8Wd16d-wd4g>
    <xmx:0EGnaVJ4RkwLSk14o_-MEYuiKmdpwclHnUetLR3y5Mtncj_ZB28-JA>
    <xmx:0EGnaSh-zTMzcwysm1UsC5Fc7ca2E1YKrRTwd0vR8meOPcT6gNipTu87>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 15:17:20 -0500 (EST)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 07/13] rust: sync: atomic: Add Atomic<*{mut,const} T> support
Date: Tue,  3 Mar 2026 12:16:55 -0800
Message-ID: <20260303201701.12204-8-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260303201701.12204-1-boqun@kernel.org>
References: <20260303201701.12204-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Boqun Feng <boqun.feng@gmail.com>

Atomic pointer support is an important piece of synchronization
algorithm, e.g. RCU, hence provide the support for that.

Note that instead of relying on atomic_long or the implementation of
`Atomic<usize>`, a new set of helpers (atomic_ptr_*) is introduced for
atomic pointer specifically, this is because ptr2int casting would
lose the provenance of a pointer and even though in theory there are a
few tricks the provenance can be restored, it'll still be a simpler
implementation if C could provide atomic pointers directly. The side
effects of this approach are: we don't have the arithmetic and logical
operations for pointers yet and the current implementation only works
on ARCH_SUPPORTS_ATOMIC_RMW architectures, but these are implementation
issues and can be added later.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260120140503.62804-3-boqun.feng@gmail.com
---
 rust/helpers/atomic_ext.c            |  3 ++
 rust/kernel/sync/atomic.rs           | 12 +++++++-
 rust/kernel/sync/atomic/internal.rs  | 24 +++++++++------
 rust/kernel/sync/atomic/predefine.rs | 46 ++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+), 10 deletions(-)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 240218e2e708..c267d5190529 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -36,6 +36,7 @@ __rust_helper void rust_helper_atomic_##tname##_set_release(type *ptr, type val)
 
 GEN_READ_SET_HELPERS(i8, s8)
 GEN_READ_SET_HELPERS(i16, s16)
+GEN_READ_SET_HELPERS(ptr, const void *)
 
 /*
  * xchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
@@ -59,6 +60,7 @@ rust_helper_atomic_##tname##_xchg##suffix(type *ptr, type new)			\
 
 GEN_XCHG_HELPERS(i8, s8)
 GEN_XCHG_HELPERS(i16, s16)
+GEN_XCHG_HELPERS(ptr, const void *)
 
 /*
  * try_cmpxchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
@@ -82,3 +84,4 @@ rust_helper_atomic_##tname##_try_cmpxchg##suffix(type *ptr, type *old, type new)
 
 GEN_TRY_CMPXCHG_HELPERS(i8, s8)
 GEN_TRY_CMPXCHG_HELPERS(i16, s16)
+GEN_TRY_CMPXCHG_HELPERS(ptr, const void *)
diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index e262b0cb53ae..f4c3ab15c8a7 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -51,6 +51,10 @@
 #[repr(transparent)]
 pub struct Atomic<T: AtomicType>(AtomicRepr<T::Repr>);
 
+// SAFETY: `Atomic<T>` is safe to transfer between execution contexts because of the safety
+// requirement of `AtomicType`.
+unsafe impl<T: AtomicType> Send for Atomic<T> {}
+
 // SAFETY: `Atomic<T>` is safe to share among execution contexts because all accesses are atomic.
 unsafe impl<T: AtomicType> Sync for Atomic<T> {}
 
@@ -68,6 +72,11 @@ unsafe impl<T: AtomicType> Sync for Atomic<T> {}
 ///
 /// - [`Self`] must have the same size and alignment as [`Self::Repr`].
 /// - [`Self`] must be [round-trip transmutable] to  [`Self::Repr`].
+/// - [`Self`] must be safe to transfer between execution contexts, if it's [`Send`], this is
+///   automatically satisfied. The exception is pointer types that are even though marked as
+///   `!Send` (e.g. raw pointers and [`NonNull<T>`]) but requiring `unsafe` to do anything
+///   meaningful on them. This is because transferring pointer values between execution contexts is
+///   safe as long as the actual `unsafe` dereferencing is justified.
 ///
 /// Note that this is more relaxed than requiring the bi-directional transmutability (i.e.
 /// [`transmute()`] is always sound between `U` and `T`) because of the support for atomic
@@ -108,7 +117,8 @@ unsafe impl<T: AtomicType> Sync for Atomic<T> {}
 /// [`transmute()`]: core::mem::transmute
 /// [round-trip transmutable]: AtomicType#round-trip-transmutability
 /// [Examples]: AtomicType#examples
-pub unsafe trait AtomicType: Sized + Send + Copy {
+/// [`NonNull<T>`]: core::ptr::NonNull
+pub unsafe trait AtomicType: Sized + Copy {
     /// The backing atomic implementation type.
     type Repr: AtomicImpl;
 }
diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index ef516bcb02ee..e301db4eaf91 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -7,6 +7,7 @@
 use crate::bindings;
 use crate::macros::paste;
 use core::cell::UnsafeCell;
+use ffi::c_void;
 
 mod private {
     /// Sealed trait marker to disable customized impls on atomic implementation traits.
@@ -14,10 +15,11 @@ pub trait Sealed {}
 }
 
 // The C side supports atomic primitives only for `i32` and `i64` (`atomic_t` and `atomic64_t`),
-// while the Rust side also layers provides atomic support for `i8` and `i16`
-// on top of lower-level C primitives.
+// while the Rust side also provides atomic support for `i8`, `i16` and `*const c_void` on top of
+// lower-level C primitives.
 impl private::Sealed for i8 {}
 impl private::Sealed for i16 {}
+impl private::Sealed for *const c_void {}
 impl private::Sealed for i32 {}
 impl private::Sealed for i64 {}
 
@@ -26,10 +28,10 @@ impl private::Sealed for i64 {}
 /// This trait is sealed, and only types that map directly to the C side atomics
 /// or can be implemented with lower-level C primitives are allowed to implement this:
 ///
-/// - `i8` and `i16` are implemented with lower-level C primitives.
+/// - `i8`, `i16` and `*const c_void` are implemented with lower-level C primitives.
 /// - `i32` map to `atomic_t`
 /// - `i64` map to `atomic64_t`
-pub trait AtomicImpl: Sized + Send + Copy + private::Sealed {
+pub trait AtomicImpl: Sized + Copy + private::Sealed {
     /// The type of the delta in arithmetic or logical operations.
     ///
     /// For example, in `atomic_add(ptr, v)`, it's the type of `v`. Usually it's the same type of
@@ -37,9 +39,9 @@ pub trait AtomicImpl: Sized + Send + Copy + private::Sealed {
     type Delta;
 }
 
-// The current helpers of load/store of atomic `i8` and `i16` use `{WRITE,READ}_ONCE()` hence the
-// atomicity is only guaranteed against read-modify-write operations if the architecture supports
-// native atomic RmW.
+// The current helpers of load/store of atomic `i8`, `i16` and pointers use `{WRITE,READ}_ONCE()`
+// hence the atomicity is only guaranteed against read-modify-write operations if the architecture
+// supports native atomic RmW.
 //
 // In the future when a CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=n architecture plans to support Rust, the
 // load/store helpers that guarantee atomicity against RmW operations (usually via a lock) need to
@@ -58,6 +60,10 @@ impl AtomicImpl for i16 {
     type Delta = Self;
 }
 
+impl AtomicImpl for *const c_void {
+    type Delta = isize;
+}
+
 // `atomic_t` implements atomic operations on `i32`.
 impl AtomicImpl for i32 {
     type Delta = Self;
@@ -269,7 +275,7 @@ macro_rules! declare_and_impl_atomic_methods {
 }
 
 declare_and_impl_atomic_methods!(
-    [ i8 => atomic_i8, i16 => atomic_i16, i32 => atomic, i64 => atomic64 ]
+    [ i8 => atomic_i8, i16 => atomic_i16, *const c_void => atomic_ptr, i32 => atomic, i64 => atomic64 ]
     /// Basic atomic operations
     pub trait AtomicBasicOps {
         /// Atomic read (load).
@@ -287,7 +293,7 @@ fn set[release](a: &AtomicRepr<Self>, v: Self) {
 );
 
 declare_and_impl_atomic_methods!(
-    [ i8 => atomic_i8, i16 => atomic_i16, i32 => atomic, i64 => atomic64 ]
+    [ i8 => atomic_i8, i16 => atomic_i16, *const c_void => atomic_ptr, i32 => atomic, i64 => atomic64 ]
     /// Exchange and compare-and-exchange atomic operations
     pub trait AtomicExchangeOps {
         /// Atomic exchange.
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 67a0406d3ea4..6f2c60529b64 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -4,6 +4,7 @@
 
 use crate::static_assert;
 use core::mem::{align_of, size_of};
+use ffi::c_void;
 
 // Ensure size and alignment requirements are checked.
 static_assert!(size_of::<bool>() == size_of::<i8>());
@@ -28,6 +29,26 @@ unsafe impl super::AtomicType for i16 {
     type Repr = i16;
 }
 
+// SAFETY:
+//
+// - `*mut T` has the same size and alignment with `*const c_void`, and is round-trip
+//   transmutable to `*const c_void`.
+// - `*mut T` is safe to transfer between execution contexts. See the safety requirement of
+//   [`AtomicType`].
+unsafe impl<T: Sized> super::AtomicType for *mut T {
+    type Repr = *const c_void;
+}
+
+// SAFETY:
+//
+// - `*const T` has the same size and alignment with `*const c_void`, and is round-trip
+//   transmutable to `*const c_void`.
+// - `*const T` is safe to transfer between execution contexts. See the safety requirement of
+//   [`AtomicType`].
+unsafe impl<T: Sized> super::AtomicType for *const T {
+    type Repr = *const c_void;
+}
+
 // SAFETY: `i32` has the same size and alignment with itself, and is round-trip transmutable to
 // itself.
 unsafe impl super::AtomicType for i32 {
@@ -226,4 +247,29 @@ fn atomic_bool_tests() {
         assert_eq!(false, x.load(Relaxed));
         assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
     }
+
+    #[test]
+    fn atomic_ptr_tests() {
+        let mut v = 42;
+        let mut u = 43;
+        let x = Atomic::new(&raw mut v);
+
+        assert_eq!(x.load(Acquire), &raw mut v);
+        assert_eq!(x.cmpxchg(&raw mut u, &raw mut u, Relaxed), Err(&raw mut v));
+        assert_eq!(x.cmpxchg(&raw mut v, &raw mut u, Relaxed), Ok(&raw mut v));
+        assert_eq!(x.load(Relaxed), &raw mut u);
+
+        let x = Atomic::new(&raw const v);
+
+        assert_eq!(x.load(Acquire), &raw const v);
+        assert_eq!(
+            x.cmpxchg(&raw const u, &raw const u, Relaxed),
+            Err(&raw const v)
+        );
+        assert_eq!(
+            x.cmpxchg(&raw const v, &raw const u, Relaxed),
+            Ok(&raw const v)
+        );
+        assert_eq!(x.load(Relaxed), &raw const u);
+    }
 }
-- 
2.50.1 (Apple Git-155)

