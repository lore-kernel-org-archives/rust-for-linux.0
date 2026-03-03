Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7874DBD8E;
	Tue,  3 Mar 2026 20:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569046; cv=none; b=XoVXm62wZYhm6o+Ql+sL1yVVdsD7UCUHCySu6zDg21rkhmXaymGQLMuAAtK5b8RwjOPan1hPZQYnALeeteU1c0JWABsWl9DhlGiQLCAIuoLIist5RIT9qUwggAn81RIh3wbk/FZcr5PCM7g3JRIdBZ6lamM/sy8ljllkZUevC9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569046; c=relaxed/simple;
	bh=dLnkIdEJOXGQHNKxguIz3N79Ge336E+VQxQBEIeBeHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=no7EmpDR/BWuLugvoo/bwg5f1Duil3K7qh1mv/j3E6HtMqwTKqQXT+nin73MecB+TkdiWKQR7gsyywSti2hAsu5I+NlJSbffXk0T183Q7WATd/zCUKDJZPsQtjAWpWmh6+O0o6QHuhtFSKo0C0DfrEw+raUOxegHXs8zNxcvneM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/uKoGNS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/uKoGNS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA4BC116C6;
	Tue,  3 Mar 2026 20:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772569046;
	bh=dLnkIdEJOXGQHNKxguIz3N79Ge336E+VQxQBEIeBeHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j/uKoGNScNegwxeeYadQUC3xPccyi09CeJe+Zu4lFSjfFjL0+yhPhrniwlvXe6Ck0
	 YfMNLTfZGSHdSb7cfaVIXC5M/spouWonoenRjCJD5KrK9J03BnS83uvs4auTTngjjg
	 EItyV6K7reJhzfP8uK33mGHmiyD/4nduYKlj/xU0v+rQ8FWoSlUgaKtAs92oJO1fdA
	 0PIAE50Dxan6pjWQbaEMDIMFvpgHgId78TvdO7Ja8P+ILhfyho/yHow3ZSJlFaQecM
	 bmUdWIAz/eDxu1XnCZL1QjsXYlADFWcXnl+ydhLuYO4fl4woi6ayfOXO9u7C3f3FW6
	 CIj3bVzcPdaTw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id E9D5AF4006A;
	Tue,  3 Mar 2026 15:17:24 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 03 Mar 2026 15:17:24 -0500
X-ME-Sender: <xms:1EGnaRFFj0ykXXQVaHFW0cAe7TQZ6PUYQuvfx2k5_JB7C6xgBgTK-Q>
    <xme:1EGnafv5H4zPdHlWZJdjFnlmt2eAMb4rRujA2k4BpboxL7Kg6W746Guq4EljYhm0C
    haGwRoKkIXPkTgwLpGn0FFQmioDYubnWkLjXvDiwV7sQLypKI9qZA>
X-ME-Received: <xmr:1EGnabovmFFgi6K4vfV7RZOJfYY9qHIXMWiywjTjih_paQLgckoQZCFGaCBMO0PeYZpBav1QgMDxsImgx-hZlXJo4fHkyQWO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekieffgeevhefgudffveffheettdfgkeeilefhhfduhedugedvhedtteegvdeugfenucff
    ohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepudenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgr
    rhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpg
    hghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:1EGnaWnsXQCD1NJeZ4y_8itSqoTXhkOIjhT1bSKSlz7mEzK16bUPXA>
    <xmx:1EGnaYgE3We4rticbPIgmEzTKgqeWB1DO-ImGoJdAPVo4Zmze1TN8w>
    <xmx:1EGnadXnDpaImkax2MIEooFL9tKhv_8GWq8TWasInQbhN6CEtVJbeg>
    <xmx:1EGnaRu283AnxpctnLb7YGPL7AEG-2vdcM9w84f7OMATtT8sGphMpA>
    <xmx:1EGnaWaKiaHWSRkzA1KjPkfw6Hv29y03alZ72qB0yU2Crs2i_CPuB_bw>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 15:17:24 -0500 (EST)
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
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 10/13] rust: sync: atomic: Add atomic operation helpers over raw pointers
Date: Tue,  3 Mar 2026 12:16:58 -0800
Message-ID: <20260303201701.12204-11-boqun@kernel.org>
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

In order to synchronize with C or external memory, atomic operations
over raw pointers are need. Although there is already an
`Atomic::from_ptr()` to provide a `&Atomic<T>`, it's more convenient to
have helpers that directly perform atomic operations on raw pointers.
Hence a few are added, which are basically an `Atomic::from_ptr().op()`
wrapper.

Note: for naming, since `atomic_xchg()` and `atomic_cmpxchg()` have a
conflict naming to 32bit C atomic xchg/cmpxchg, hence the helpers are
just named as `xchg()` and `cmpxchg()`. For `atomic_load()` and
`atomic_store()`, their 32bit C counterparts are `atomic_read()` and
`atomic_set()`, so keep the `atomic_` prefix.

[boqun: Fix typo spotted by Alice and fix broken sentence spotted by
Gary]

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260120115207.55318-3-boqun.feng@gmail.com
---
 rust/kernel/sync/atomic.rs           | 104 +++++++++++++++++++++++++++
 rust/kernel/sync/atomic/predefine.rs |  46 ++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index f80cebce5bc1..1bb1fc2be177 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -703,3 +703,107 @@ pub fn cmpxchg<Ordering: ordering::Ordering>(
         }
     }
 }
+
+/// Atomic load over raw pointers.
+///
+/// This function provides a short-cut of `Atomic::from_ptr().load(..)`, and can be used to work
+/// with C side on synchronizations:
+///
+/// - `atomic_load(.., Relaxed)` maps to `READ_ONCE()` when used for inter-thread communication.
+/// - `atomic_load(.., Acquire)` maps to `smp_load_acquire()`.
+///
+/// # Safety
+///
+/// - `ptr` is a valid pointer to `T` and aligned to `align_of::<T>()`.
+/// - If there is a concurrent store from kernel (C or Rust), it has to be atomic.
+#[doc(alias("READ_ONCE", "smp_load_acquire"))]
+#[inline(always)]
+pub unsafe fn atomic_load<T: AtomicType, Ordering: ordering::AcquireOrRelaxed>(
+    ptr: *mut T,
+    o: Ordering,
+) -> T
+where
+    T::Repr: AtomicBasicOps,
+{
+    // SAFETY: Per the function safety requirement, `ptr` is valid and aligned to
+    // `align_of::<T>()`, and all concurrent stores from kernel are atomic, hence no data race per
+    // LKMM.
+    unsafe { Atomic::from_ptr(ptr) }.load(o)
+}
+
+/// Atomic store over raw pointers.
+///
+/// This function provides a short-cut of `Atomic::from_ptr().load(..)`, and can be used to work
+/// with C side on synchronizations:
+///
+/// - `atomic_store(.., Relaxed)` maps to `WRITE_ONCE()` when used for inter-thread communication.
+/// - `atomic_load(.., Release)` maps to `smp_store_release()`.
+///
+/// # Safety
+///
+/// - `ptr` is a valid pointer to `T` and aligned to `align_of::<T>()`.
+/// - If there is a concurrent access from kernel (C or Rust), it has to be atomic.
+#[doc(alias("WRITE_ONCE", "smp_store_release"))]
+#[inline(always)]
+pub unsafe fn atomic_store<T: AtomicType, Ordering: ordering::ReleaseOrRelaxed>(
+    ptr: *mut T,
+    v: T,
+    o: Ordering,
+) where
+    T::Repr: AtomicBasicOps,
+{
+    // SAFETY: Per the function safety requirement, `ptr` is valid and aligned to
+    // `align_of::<T>()`, and all concurrent accesses from kernel are atomic, hence no data race
+    // per LKMM.
+    unsafe { Atomic::from_ptr(ptr) }.store(v, o);
+}
+
+/// Atomic exchange over raw pointers.
+///
+/// This function provides a short-cut of `Atomic::from_ptr().xchg(..)`, and can be used to work
+/// with C side on synchronizations.
+///
+/// # Safety
+///
+/// - `ptr` is a valid pointer to `T` and aligned to `align_of::<T>()`.
+/// - If there is a concurrent access from kernel (C or Rust), it has to be atomic.
+#[inline(always)]
+pub unsafe fn xchg<T: AtomicType, Ordering: ordering::Ordering>(
+    ptr: *mut T,
+    new: T,
+    o: Ordering,
+) -> T
+where
+    T::Repr: AtomicExchangeOps,
+{
+    // SAFETY: Per the function safety requirement, `ptr` is valid and aligned to
+    // `align_of::<T>()`, and all concurrent accesses from kernel are atomic, hence no data race
+    // per LKMM.
+    unsafe { Atomic::from_ptr(ptr) }.xchg(new, o)
+}
+
+/// Atomic compare and exchange over raw pointers.
+///
+/// This function provides a short-cut of `Atomic::from_ptr().cmpxchg(..)`, and can be used to work
+/// with C side on synchronizations.
+///
+/// # Safety
+///
+/// - `ptr` is a valid pointer to `T` and aligned to `align_of::<T>()`.
+/// - If there is a concurrent access from kernel (C or Rust), it has to be atomic.
+#[doc(alias("try_cmpxchg"))]
+#[inline(always)]
+pub unsafe fn cmpxchg<T: AtomicType, Ordering: ordering::Ordering>(
+    ptr: *mut T,
+    old: T,
+    new: T,
+    o: Ordering,
+) -> Result<T, T>
+where
+    T::Repr: AtomicExchangeOps,
+{
+    // SAFETY: Per the function safety requirement, `ptr` is valid and aligned to
+    // `align_of::<T>()`, and all concurrent accesses from kernel are atomic, hence no data race
+    // per LKMM.
+    unsafe { Atomic::from_ptr(ptr) }.cmpxchg(old, new, o)
+}
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index ceb3caed9784..1d53834fcb12 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -178,6 +178,14 @@ fn atomic_basic_tests() {
 
             assert_eq!(v, x.load(Relaxed));
         });
+
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
+            let x = Atomic::new(v);
+            let ptr = x.as_ptr();
+
+            // SAFETY: `ptr` is a valid pointer and no concurrent access.
+            assert_eq!(v, unsafe { atomic_load(ptr, Relaxed) });
+        });
     }
 
     #[test]
@@ -188,6 +196,17 @@ fn atomic_acquire_release_tests() {
             x.store(v, Release);
             assert_eq!(v, x.load(Acquire));
         });
+
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
+            let x = Atomic::new(0);
+            let ptr = x.as_ptr();
+
+            // SAFETY: `ptr` is a valid pointer and no concurrent access.
+            unsafe { atomic_store(ptr, v, Release) };
+
+            // SAFETY: `ptr` is a valid pointer and no concurrent access.
+            assert_eq!(v, unsafe { atomic_load(ptr, Acquire) });
+        });
     }
 
     #[test]
@@ -201,6 +220,18 @@ fn atomic_xchg_tests() {
             assert_eq!(old, x.xchg(new, Full));
             assert_eq!(new, x.load(Relaxed));
         });
+
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
+            let x = Atomic::new(v);
+            let ptr = x.as_ptr();
+
+            let old = v;
+            let new = v + 1;
+
+            // SAFETY: `ptr` is a valid pointer and no concurrent access.
+            assert_eq!(old, unsafe { xchg(ptr, new, Full) });
+            assert_eq!(new, x.load(Relaxed));
+        });
     }
 
     #[test]
@@ -216,6 +247,21 @@ fn atomic_cmpxchg_tests() {
             assert_eq!(Ok(old), x.cmpxchg(old, new, Relaxed));
             assert_eq!(new, x.load(Relaxed));
         });
+
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
+            let x = Atomic::new(v);
+            let ptr = x.as_ptr();
+
+            let old = v;
+            let new = v + 1;
+
+            // SAFETY: `ptr` is a valid pointer and no concurrent access.
+            assert_eq!(Err(old), unsafe { cmpxchg(ptr, new, new, Full) });
+            assert_eq!(old, x.load(Relaxed));
+            // SAFETY: `ptr` is a valid pointer and no concurrent access.
+            assert_eq!(Ok(old), unsafe { cmpxchg(ptr, old, new, Relaxed) });
+            assert_eq!(new, x.load(Relaxed));
+        });
     }
 
     #[test]
-- 
2.50.1 (Apple Git-155)

