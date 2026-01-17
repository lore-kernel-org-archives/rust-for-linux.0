Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132B19AD5C
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768652591; cv=none; b=KJFfTK8gjfsS6IE6NfNm6R+kmwA7nvDP8jELyFnBO8M/DigpgNe5f4b5EOzRI2deJ8TgAM65y02duGt4Z5RtiT/DrQ88ZgSvRHKkDz/CRufWVF+XH7XuNoUUdQCb+087/Z0xtTA2Lo6DadTi6zIK7YyEQEi6M9eNNWL6+/fltf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768652591; c=relaxed/simple;
	bh=V5rA4Ne6UgNwYNUm7jyPdhZ3jQMnmk3tK3I6DZnhgU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOdZyHgZk+nL9IZSS8juUZvoxBz5bciyjhwhZ9P/n9S/ublTXTjswQ6tyUHof4AsAJjftv+yGthiH6/9qQND4TZ5JRkqLeUKuDOpSTEa7HrcMTn8AGKtXri7erU/7vpX+OeKGA2R268/S/Ui6TmCe53/0BJ7DVfjXCKBxRHD55g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ykh+AuQY; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ykh+AuQY"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8c69ffb226eso343222685a.1
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 04:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768652589; x=1769257389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i1mr2kwBbNejDsJIhqZMH0e65CT0fSdHoMoFoGTkVbU=;
        b=Ykh+AuQYH/1v8qwXPhfet0kfxhZGjFyQwM7E3mlxYlSLVinBGPB445IrHiQU2hW9VH
         evWkgDfsQPq4YwwQzBF+8c1hpG6CD8LJ99VXcssN74Fw7PsYxpZSgnWkXnddDzKkKKZL
         M/PFOKxTKnPzmvI/EqlQS8WRWKsg4una2x+ImRtWXk7b21R9gAg1uLugf92xlZp9NTjs
         48wZM1FlwceDIt+oc+NR2EV5J7uyT8Gt6+J0z9bosNqZLRDyTEp3vZHOKioPacmotZp7
         F7p5b9eQkd3HpBLKsmBKv9Q9+JWSCRAaPL3z7a4pcTkNgmTX5HZh75pc/TALivSFhtxH
         k5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768652589; x=1769257389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1mr2kwBbNejDsJIhqZMH0e65CT0fSdHoMoFoGTkVbU=;
        b=gTZT0M9iNqdj3+mKrnWS1x+zjVxPsEkimbp7yfHPfneqDDn8tg2iCSf5xI8YN7sYi3
         8ckX6T2CJ0ea7WAISzlUm5B28ZZA3GBRA3xAZN1kMC+qbqmXymZIR4VgLhxjCYJ+KArl
         L6Usn1TAVirGQNopgHxNid4aV8zrVsLXCBxlfCff2p/uT2+wBZfz+6fw/DVMHZ6Py9Qi
         PZoUP9O2760w4Zj3EMA/i/JaiDyCm8Q+T3CE7h0dtiVloj9xI8VdE5/m3GX0oTC6by9Y
         oKtpXVI/Za+tTbu3Nt11VQ44BeKFWTWGMfHI6RGwK5kf3p6DavaKaRhZEhuH541gupE/
         TWuw==
X-Gm-Message-State: AOJu0Yz8HE8/Jip7eN9mFha5Y/G4ftm3g6YNdTZ0S+LikqEEToiTe++H
	We8TURgiRrXQT3/s31eikPJHDPqhFml4HZ8eIFzwcXYVpgMMktRVQSnG
X-Gm-Gg: AY/fxX52NW6rdlrNk3MIo5Dyi1Lwy75RkR6X+xmjjlDwjM068OM1aIE8cQfeQ7de3j+
	xOAlUqpDDnE/wOD7FE96JQxPkT7OwJ3wfWM5njCNly1tVW6hNodkrEKilMijptJjL4KKJvmJX+n
	BuDPoVwcDBBxv9wrvKmthW/B3UASSI2fkDtG6FA7XpM2JmZIHkDsLpsd+yLfX8fqS2MyTgyBsUR
	tO0c9KRqUbsJ0C/cg/qVdfVOJ8hRiNl3+cPpdLSLIJdJOpeOYOd2ltOEv0cLtCHgvk8s5yR3TCI
	M1SGA/c7D2P/o2DjlkrH4DQnUTLZHxfusbgnyJhlicXnGzXodPfKAXoTfmKHLBBLuak4l6Rn4uM
	hYHP5K3Z6Of5uDa3yNijOM/hZimG+dYqIp3N27mO2wZCoP0xZ8z5Okc4SDGJ1x6iSi+m8BtyykE
	vggX5xvUhKMw33DmNBT1a8/eV7sCe6H51NUtZ9tSzWli92LRGbMIcv3RdrUzjKhD//QM9j1T1PA
	ai3WJQwv3/W5bs=
X-Received: by 2002:a05:620a:1725:b0:8b3:3d62:67f5 with SMTP id af79cd13be357-8c6a68d359bmr808856085a.11.1768652588564;
        Sat, 17 Jan 2026 04:23:08 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72602fesm429329085a.41.2026.01.17.04.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 04:23:08 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 70CDEF4007E;
	Sat, 17 Jan 2026 07:23:07 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 17 Jan 2026 07:23:07 -0500
X-ME-Sender: <xms:K39racWL9tnP6QEWLur0-1jFJT4JMR8I1KXykfzVS7vpfOtisW8J1g>
    <xme:K39raZp2l1hUiFeIl1sCdd25im56Edb3t29ZNmKamPfJYmuTLKcbtU7NoYabX1YCC
    5jD5ibM0GVwlXXi9Zj801XYWcNs20KiCEuyhvqHFGrX4y8HGsc3FA>
X-ME-Received: <xmr:K39raZc4cLNmo7MGqzL9GUfck-SOUAPkEfUY6tCODolhFByy4tTZ8xiJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedukedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedugfevheekvdefveevleffheevgedufeettdejtdevheefjeduhefgleelffdv
    ieenucffohhmrghinheptghrrghtvghsrdhiohdpiihulhhiphgthhgrthdrtghomhdpgh
    hithhhuhgsrdgtohhmpdhkrghnghhrvghjohhsrdgtohhmpdhruhhsthdqlhgrnhhgrdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
    hoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieeg
    qddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigi
    hmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvghn
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
    dprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgt
    phhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinh
    gusghorhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:K39raXFBtnd9a1xk54nyM6ErpjM2wCLS5WPYKaRd0mYA_FJJzIaFbg>
    <xmx:K39raf1paWCdE7NJ_0nRGdp935ckSJkEFgWKWuhMruCvn_a8hthJBw>
    <xmx:K39rafIlCMWL3eHV7o307eScGS8KuR0qBrzRjnXoUkktlEZ3lk4DRw>
    <xmx:K39raS1pL0QyHyceU9cp-CJlNWCq5tW1z2RM3Xp8YikW4-6HGPioew>
    <xmx:K39raSh8BO_Jxw-wa9HIJS5Lw8dqx-FXAEkOtQQJD9hVwINvrUzU_Bo8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 07:23:06 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 5/5] rust: sync: rcu: Add RCU protected pointer
Date: Sat, 17 Jan 2026 20:22:43 +0800
Message-ID: <20260117122243.24404-6-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260117122243.24404-1-boqun.feng@gmail.com>
References: <20260117122243.24404-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RCU protected pointers are an atomic pointer that can be loaded and
dereferenced by mulitple RCU readers, but only one updater/writer can
change the value (following a read-copy-update pattern usually).

This is useful in the case where data is read-mostly. The rationale of
this patch is to provide a proof of concept on how RCU should be exposed
to the Rust world, and it also serves as an example for atomic usage.

Similar mechanisms like ArcSwap [1] are already widely used.

Provide a `Rcu<P>` type with an atomic pointer implementation. `P` has
to be a `ForeignOwnable`, which means the ownership of a object can be
represented by a pointer-size value.

`Rcu::dereference()` requires a RCU Guard, which means dereferencing is
only valid under RCU read lock protection.

`Rcu::copy_update()` is the operation for updaters, it requries a
`Pin<&mut Self>` for exclusive accesses, since RCU updaters are normally
exclusive with each other.

A lot of RCU functionalities including asynchronously free (call_rcu()
and kfree_rcu()) are still missing, and will be the future work.

Also, we still need language changes like field projection [2] to
provide better ergonomic.

Acknowledgment: this work is based on a lot of productive discussions
and hard work from others, these are the ones I can remember (sorry if I
forgot your contribution):

* Wedson started the work on RCU field projection and Benno followed it
  up and had been working on it as a more general language feature.
  Also, Gary's field-projection repo [3] has been used as an example for
  related discussions.

* During Kangrejos 2023 [4], Gary, Benno and Alice provided a lot of
  feedbacks on the talk from Paul and me: "If you want to use RCU in
  Rust for Linux kernel..."

* During a recent discussion among Benno, Paul and me, Benno suggested
  using `Pin<&mut>` to guarantee the exclusive access on updater
  operations.

Link: https://crates.io/crates/arc-swap [1]
Link: https://rust-lang.zulipchat.com/#narrow/channel/213817-t-lang/topic/Field.20Projections/near/474648059 [2]
Link: https://github.com/nbdd0121/field-projection [3]
Link: https://kangrejos.com/2023 [4]
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/rcu.rs | 326 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 325 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
index a32bef6e490b..28bbccaa2e5e 100644
--- a/rust/kernel/sync/rcu.rs
+++ b/rust/kernel/sync/rcu.rs
@@ -4,7 +4,23 @@
 //!
 //! C header: [`include/linux/rcupdate.h`](srctree/include/linux/rcupdate.h)
 
-use crate::{bindings, types::NotThreadSafe};
+use crate::bindings;
+use crate::{
+    sync::atomic::{
+        Atomic,
+        Relaxed,
+        Release, //
+    },
+    types::{
+        ForeignOwnable,
+        NotThreadSafe, //
+    },
+};
+use core::{
+    marker::PhantomData,
+    pin::Pin,
+    ptr::NonNull, //
+};
 
 /// Evidence that the RCU read side lock is held on the current thread/CPU.
 ///
@@ -50,3 +66,311 @@ fn drop(&mut self) {
 pub fn read_lock() -> Guard {
     Guard::new()
 }
+
+use crate::types::Opaque;
+
+/// A temporary `UnsafePinned` [1] that provides a way to opt-out typical alias rules for mutable
+/// references.
+///
+/// # Invariants
+///
+/// `self.0` is always properly initialized.
+///
+/// [1]: https://doc.rust-lang.org/std/pin/struct.UnsafePinned.html
+struct UnsafePinned<T>(Opaque<T>);
+
+impl<T> UnsafePinned<T> {
+    const fn new(value: T) -> Self {
+        // INVARIANTS: `value` is initialized.
+        Self(Opaque::new(value))
+    }
+
+    const fn get(&self) -> *mut T {
+        self.0.get()
+    }
+}
+
+// SAFETY: `UnsafePinned` is safe to transfer between execution contexts as long as `T` is `Send`.
+unsafe impl<T: Send> Send for UnsafePinned<T> {}
+// SAFETY: `UnsafePinned` is safe to shared between execution contexts as long as `T` is `Sync`.
+unsafe impl<T: Sync> Sync for UnsafePinned<T> {}
+
+/// An RCU protected pointer, the pointed object is protected by RCU.
+///
+/// # Invariants
+///
+/// Either the pointer is null, or it points to a return value of
+/// [`ForeignOwnable::into_foreign()`] and the atomic variable exclusively owns the pointer.
+pub struct Rcu<P: ForeignOwnable>(
+    UnsafePinned<Atomic<*mut crate::ffi::c_void>>,
+    PhantomData<P>,
+);
+
+/// A pointer that has been unpublished, but hasn't waited for a grace period yet.
+///
+/// The pointed object may still have an existing RCU reader. Therefore a grace period is needed to
+/// free the object.
+///
+/// # Invariants
+///
+/// The pointer has to be a return value of [`ForeignOwnable::into_foreign`] and [`Self`]
+/// exclusively owns the pointer.
+pub struct RcuOld<P: ForeignOwnable>(NonNull<crate::ffi::c_void>, PhantomData<P>);
+
+impl<P: ForeignOwnable> Drop for RcuOld<P> {
+    fn drop(&mut self) {
+        // SAFETY: As long as called in a sleepable context, which should be checked by klint,
+        // `synchronize_rcu()` is safe to call.
+        unsafe {
+            bindings::synchronize_rcu();
+        }
+
+        // SAFETY: `self.0` is a return value of `P::into_foreign()`, so it's safe to call
+        // `from_foreign()` on it. Plus, the above `synchronize_rcu()` guarantees no existing
+        // `ForeignOwnable::borrow()` anymore.
+        let p: P = unsafe { P::from_foreign(self.0.as_ptr()) };
+        drop(p);
+    }
+}
+
+impl<P: ForeignOwnable> Rcu<P> {
+    /// Creates a new RCU pointer.
+    pub fn new(p: P) -> Self {
+        // INVARIANTS: The return value of `p.into_foreign()` is directly stored in the atomic
+        // variable.
+        Self(
+            UnsafePinned::new(Atomic::new(p.into_foreign())),
+            PhantomData,
+        )
+    }
+
+    fn as_atomic(&self) -> &Atomic<*mut crate::ffi::c_void> {
+        // SAFETY: Per type invariants of `UnsafePinned`, `self.0.get()` points to an initialized
+        // `&Atomic`.
+        unsafe { &*self.0.get() }
+    }
+
+    fn as_atomic_mut_pinned(self: Pin<&mut Self>) -> &Atomic<*mut crate::ffi::c_void> {
+        self.into_ref().get_ref().as_atomic()
+    }
+
+    /// Dereferences the protected object.
+    ///
+    /// Returns `Some(b)`, where `b` is a reference-like borrowed type, if the pointer is not null,
+    /// otherwise returns `None`.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// # use kernel::alloc::{flags, KBox};
+    /// use kernel::sync::rcu::{self, Rcu};
+    ///
+    /// let x = Rcu::new(KBox::new(100i32, flags::GFP_KERNEL)?);
+    ///
+    /// let g = rcu::read_lock();
+    /// // Read in under RCU read lock protection.
+    /// let v = x.dereference(&g);
+    ///
+    /// assert_eq!(v, Some(&100i32));
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
+    ///
+    /// Note the borrowed access can outlive the reference of the [`Rcu<P>`], this is because as
+    /// long as the RCU read lock is held, the pointed object should remain valid.
+    ///
+    /// In the following case, the main thread is responsible for the ownership of `shared`, i.e. it
+    /// will drop it eventually, and a work item can temporarily access the `shared` via `cloned`,
+    /// but the use of the dereferenced object doesn't depend on `cloned`'s existence.
+    ///
+    /// ```rust
+    /// # use kernel::alloc::{flags, KBox};
+    /// # use kernel::workqueue::system;
+    /// # use kernel::sync::{Arc, atomic::{Atomic, Acquire, Release}};
+    /// use kernel::sync::rcu::{self, Rcu};
+    ///
+    /// struct Config {
+    ///     a: i32,
+    ///     b: i32,
+    ///     c: i32,
+    /// }
+    ///
+    /// let config = KBox::new(Config { a: 1, b: 2, c: 3 }, flags::GFP_KERNEL)?;
+    ///
+    /// let shared = Arc::new(Rcu::new(config), flags::GFP_KERNEL)?;
+    /// let cloned = shared.clone();
+    ///
+    /// // Use atomic to simulate a special refcounting.
+    /// static FLAG: Atomic<i32> = Atomic::new(0);
+    ///
+    /// system().try_spawn(flags::GFP_KERNEL, move || {
+    ///     let g = rcu::read_lock();
+    ///     let v = cloned.dereference(&g).unwrap();
+    ///     drop(cloned); // release reference to `shared`.
+    ///     FLAG.store(1, Release);
+    ///
+    ///     // but still need to access `v`.
+    ///     assert_eq!(v.a, 1);
+    ///     drop(g);
+    /// });
+    ///
+    /// // Wait until `cloned` dropped.
+    /// while FLAG.load(Acquire) == 0 {
+    ///     // SAFETY: Sleep should be safe.
+    ///     unsafe { kernel::bindings::schedule(); }
+    /// }
+    ///
+    /// drop(shared);
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn dereference<'rcu>(&self, _rcu_guard: &'rcu Guard) -> Option<P::Borrowed<'rcu>> {
+        // Ordering: Address dependency pairs with the `store(Release)` in copy_update().
+        let ptr = self.as_atomic().load(Relaxed);
+
+        if !ptr.is_null() {
+            // SAFETY:
+            // - Since `ptr` is not null, so it has to be a return value of `P::into_foreign()`.
+            // - The returned `Borrowed<'rcu>` cannot outlive the RCU Guar, this guarantees the
+            //   return value will only be used under RCU read lock, and the RCU read lock prevents
+            //   the pass of a grace period that the drop of `RcuOld` or `Rcu` is waiting for,
+            //   therefore no `from_foreign()` will be called for `ptr` as long as `Borrowed` exists.
+            //
+            //      CPU 0                                       CPU 1
+            //      =====                                       =====
+            //      { `x` is a reference to Rcu<Box<i32>> }
+            //      let g = rcu::read_lock();
+            //
+            //      if let Some(b) = x.dereference(&g) {
+            //      // drop(g); cannot be done, since `b` is still alive.
+            //
+            //                                              if let Some(old) = x.replace(...) {
+            //                                                  // `x` is null now.
+            //          println!("{}", b);
+            //      }
+            //                                                  drop(old):
+            //                                                    synchronize_rcu();
+            //      drop(g);
+            //                                                    // a grace period passed.
+            //                                                    // No `Borrowed` exists now.
+            //                                                    from_foreign(...);
+            //                                              }
+            Some(unsafe { P::borrow(ptr) })
+        } else {
+            None
+        }
+    }
+
+    /// Read, copy and update the pointer with new value.
+    ///
+    /// Returns `None` if the pointer's old value is null, otherwise returns `Some(old)`, where old
+    /// is a [`RcuOld`] which can be used to free the old object eventually.
+    ///
+    /// The `Pin<&mut Self>` is needed because this function needs the exclusive access to
+    /// [`Rcu<P>`], otherwise two `copy_update()`s may get the same old object and double free.
+    /// Using `Pin<&mut Self>` provides the exclusive access that C side requires with the type
+    /// system checking.
+    ///
+    /// Also this has to be `Pin` because a `&mut Self` may allow users to `swap()` safely, that
+    /// will break the atomicity. A [`Rcu<P>`] should be structurally pinned in the struct that
+    /// contains it.
+    ///
+    /// Note that `Pin<&mut Self>` cannot assume noalias on `self.0` here because of `self.0` is an
+    /// [`UnsafePinned`].
+    ///
+    /// [`UnsafePinned`]: https://doc.rust-lang.org/std/pin/struct.UnsafePinned.html
+    pub fn copy_update<F>(self: Pin<&mut Self>, f: F) -> Option<RcuOld<P>>
+    where
+        F: FnOnce(Option<P::Borrowed<'_>>) -> Option<P>,
+    {
+        let inner = self.as_atomic_mut_pinned();
+
+        // step 1: COPY, or more generally, initializing `new` based on `old`.
+        // Ordering: Address dependency pairs with the `store(Release)` in copy_update().
+        let old_ptr = NonNull::new(inner.load(Relaxed));
+
+        let old = old_ptr.map(|nonnull| {
+            // SAFETY: Per type invariants `old_ptr` has to be a value return by a previous
+            // `into_foreign()`, and the exclusive reference `self` guarantees that `from_foreign()`
+            // has not been called.
+            unsafe { P::borrow(nonnull.as_ptr()) }
+        });
+
+        let new = f(old);
+
+        // step 2: UPDATE.
+        if let Some(new) = new {
+            let new_ptr = new.into_foreign();
+            // Ordering: Pairs with the address dependency in `dereference()` and
+            // `copy_update()`.
+            // INVARIANTS: `new.into_foreign()` is directly store into the atomic variable.
+            inner.store(new_ptr, Release);
+        } else {
+            // Ordering: Setting to a null pointer doesn't need to be Release.
+            // INVARIANTS: The atomic variable is set to be null.
+            inner.store(core::ptr::null_mut(), Relaxed);
+        }
+
+        // INVARIANTS: The exclusive reference guarantess that the ownership of a previous
+        // `into_foreign()` transferred to the `RcuOld`.
+        Some(RcuOld(old_ptr?, PhantomData))
+    }
+
+    /// Replaces the pointer with new value.
+    ///
+    /// Returns `None` if the pointer's old value is null, otherwise returns `Some(old)`, where old
+    /// is a [`RcuOld`] which can be used to free the old object eventually.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use core::pin::pin;
+    /// # use kernel::alloc::{flags, KBox};
+    /// use kernel::sync::rcu::{self, Rcu};
+    ///
+    /// let mut x = pin!(Rcu::new(KBox::new(100i32, flags::GFP_KERNEL)?));
+    /// let q = KBox::new(101i32, flags::GFP_KERNEL)?;
+    ///
+    /// // Read in under RCU read lock protection.
+    /// let g = rcu::read_lock();
+    /// let v = x.dereference(&g);
+    ///
+    /// // Replace with a new object.
+    /// let old = x.as_mut().replace(q);
+    ///
+    /// assert!(old.is_some());
+    ///
+    /// // `v` should still read the old value.
+    /// assert_eq!(v, Some(&100i32));
+    ///
+    /// // New readers should get the new value.
+    /// assert_eq!(x.dereference(&g), Some(&101i32));
+    ///
+    /// drop(g);
+    ///
+    /// // Can free the object outside the read-side critical section.
+    /// drop(old);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn replace(self: Pin<&mut Self>, new: P) -> Option<RcuOld<P>> {
+        self.copy_update(|_| Some(new))
+    }
+}
+
+impl<P: ForeignOwnable> Drop for Rcu<P> {
+    fn drop(&mut self) {
+        let ptr = self.as_atomic().load(Relaxed);
+        if !ptr.is_null() {
+            // SAFETY: As long as called in a sleepable context, which should be checked by klint,
+            // `synchronize_rcu()` is safe to call.
+            unsafe {
+                bindings::synchronize_rcu();
+            }
+
+            // SAFETY: `self.0` is a return value of `P::into_foreign()`, so it's safe to call
+            // `from_foreign()` on it. Plus, the above `synchronize_rcu()` guarantees no existing
+            // `ForeignOwnable::borrow()` anymore.
+            drop(unsafe { P::from_foreign(ptr) });
+        }
+    }
+}
-- 
2.51.0

