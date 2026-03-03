Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DABE3C6A39;
	Tue,  3 Mar 2026 20:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569043; cv=none; b=dtdH5vjKRTW1Ig9tMpIlMSlr6WBbfeQX3GxhIsFsK1hHFntiVuJOOlp2SP14NhmKF4f0vet4C3bZfarifVipkvsg5Tj+hSq0dAMBPurUC6a2c5VHcoxsL+6V4FQXp2KXv1IlkNqXBJBy91oxeDZ2P3vOGudj9E/9AIk2oleI7j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569043; c=relaxed/simple;
	bh=W02O8Qa3Z89alga+TO7Bsq5JWOWWWfmN/Cdh6Uk+DRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XlWYlqBJdUuQ9ZHzedLy9JPD34839CUixgQ5Rp7xmh5cyfAPYbmVrVRZ5amI6Ex5hmftNsy4PqLowsiSmN7WdmSJnfMWMSzZZTL15rbuiY7g+K2y3mnKsPqUc5zBCSc8Va2WyGCJx+GxRGavt6WoVHnMEzXiKsfB9562A9vC8N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gktu7kfL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gktu7kfL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC15AC4AF09;
	Tue,  3 Mar 2026 20:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772569043;
	bh=W02O8Qa3Z89alga+TO7Bsq5JWOWWWfmN/Cdh6Uk+DRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gktu7kfL3NmKcV0vFXgPMH1YUBjrs/RcF900q5rhPvPbJ3DP4KLrpdWGJGmO4ny4Y
	 qMV5e4wxL7daB+FLIXhSwAT4OONc1cB/f7QdVcGpBqOy+c9mJojm6I1YppnhDSjbEV
	 ZJZfT8Ajdkb1GpY+ZGgIsR++xzfuVtdaSqLsCvC5ouOVT1uYG3ufFc89KewVJMGdHU
	 /eyisV2cR0t1hetX9lao4/7aZ2rfMFS5m94VVqG/DMtgPQ+uaEgWgMX+r/cw13oDQ2
	 qYhwWiLlNJk4yrNgmt+bo7BdaliJC++ymd70ygeRWSZAR9mzkuoZKuXd6SoqBItRYS
	 0c9TlkyE4BE6w==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0661FF40068;
	Tue,  3 Mar 2026 15:17:22 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 03 Mar 2026 15:17:22 -0500
X-ME-Sender: <xms:0UGnae7papoZiYUGGFXBwLDBsQscvacxzpb13cAr9Wm9XIQKjtwGcw>
    <xme:0UGnaTGsGKnJrjqToHr-F80vrowiyGSlZWS7ApO3PV8vHZtY7A_hAQd-w03WlN80L
    hRHv_htzRD0oP61p_oGW3tQg1U7ErWPojEQpXiNj72zdYTqEHhS>
X-ME-Received: <xmr:0UGnaRTVmaHHP3ms9HOovDfBLyuAYiGPPBi79Freta4XUb7AXYmBJUZCmo5Q9-4uRMTLHJEw96Cm_7vgsYK7HZFq2ikY1q5O>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekieffgeevhefgudffveffheettdfgkeeilefhhfduhedugedvhedtteegvdeugfenucff
    ohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
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
X-ME-Proxy: <xmx:0UGnaVe3DKldyKLYEXMgXJs7lB0KjHMCBEclymqK6xVqITTgj0QtWg>
    <xmx:0UGnafgD2IrGLyCS48n2o6MJBkuBN5YlChbKpFk0TcPgIvPPzGemIg>
    <xmx:0UGnaQIjIKT64yH32WufgX8HIY9dpq7oF3sBjWcO0VcaducDPbv6eQ>
    <xmx:0UGnacFyPwzpbD2vVd5dkmCCfyIm40XVyTAE1smOlIFOTvyvNQ53Ug>
    <xmx:0kGnaW3e6iI0ngDGCqxYMRd_yGfWCn1QUed_FRXxWXAjyZv2t_dCdojG>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 15:17:21 -0500 (EST)
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
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 08/13] rust: sync: atomic: Add performance-optimal Flag type for atomic booleans
Date: Tue,  3 Mar 2026 12:16:56 -0800
Message-ID: <20260303201701.12204-9-boqun@kernel.org>
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

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add AtomicFlag type for boolean flags.

Document when AtomicFlag is generally preferable to Atomic<bool>: in
particular, when RMW operations such as xchg()/cmpxchg() may be used
and minimizing memory usage is not the top priority. On some
architectures without byte-sized RMW instructions, Atomic<bool> can be
slower for RMW operations.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260129122622.3896144-2-tomo@aliasing.net
---
 rust/kernel/sync/atomic.rs           | 125 +++++++++++++++++++++++++++
 rust/kernel/sync/atomic/predefine.rs |  17 ++++
 2 files changed, 142 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index f4c3ab15c8a7..f80cebce5bc1 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -578,3 +578,128 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
         unsafe { from_repr(ret) }
     }
 }
+
+#[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
+#[repr(C)]
+#[derive(Clone, Copy)]
+struct Flag {
+    bool_field: bool,
+}
+
+/// # Invariants
+///
+/// `padding` must be all zeroes.
+#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
+#[repr(C, align(4))]
+#[derive(Clone, Copy)]
+struct Flag {
+    #[cfg(target_endian = "big")]
+    padding: [u8; 3],
+    bool_field: bool,
+    #[cfg(target_endian = "little")]
+    padding: [u8; 3],
+}
+
+impl Flag {
+    #[inline(always)]
+    const fn new(b: bool) -> Self {
+        // INVARIANT: `padding` is all zeroes.
+        Self {
+            bool_field: b,
+            #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
+            padding: [0; 3],
+        }
+    }
+}
+
+// SAFETY: `Flag` and `Repr` have the same size and alignment, and `Flag` is round-trip
+// transmutable to the selected representation (`i8` or `i32`).
+unsafe impl AtomicType for Flag {
+    #[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
+    type Repr = i8;
+    #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
+    type Repr = i32;
+}
+
+/// An atomic flag type intended to be backed by performance-optimal integer type.
+///
+/// The backing integer type is an implementation detail; it may vary by architecture and change
+/// in the future.
+///
+/// [`AtomicFlag`] is generally preferable to [`Atomic<bool>`] when you need read-modify-write
+/// (RMW) operations (e.g. [`Atomic::xchg()`]/[`Atomic::cmpxchg()`]) or when [`Atomic<bool>`] does
+/// not save memory due to padding. On some architectures that do not support byte-sized atomic
+/// RMW operations, RMW operations on [`Atomic<bool>`] are slower.
+///
+/// If you only use [`Atomic::load()`]/[`Atomic::store()`], [`Atomic<bool>`] is fine.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sync::atomic::{AtomicFlag, Relaxed};
+///
+/// let flag = AtomicFlag::new(false);
+/// assert_eq!(false, flag.load(Relaxed));
+/// flag.store(true, Relaxed);
+/// assert_eq!(true, flag.load(Relaxed));
+/// ```
+pub struct AtomicFlag(Atomic<Flag>);
+
+impl AtomicFlag {
+    /// Creates a new atomic flag.
+    #[inline(always)]
+    pub const fn new(b: bool) -> Self {
+        Self(Atomic::new(Flag::new(b)))
+    }
+
+    /// Returns a mutable reference to the underlying flag as a [`bool`].
+    ///
+    /// This is safe because the mutable reference of the atomic flag guarantees exclusive access.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::sync::atomic::{AtomicFlag, Relaxed};
+    ///
+    /// let mut atomic_flag = AtomicFlag::new(false);
+    /// assert_eq!(false, atomic_flag.load(Relaxed));
+    /// *atomic_flag.get_mut() = true;
+    /// assert_eq!(true, atomic_flag.load(Relaxed));
+    /// ```
+    #[inline(always)]
+    pub fn get_mut(&mut self) -> &mut bool {
+        &mut self.0.get_mut().bool_field
+    }
+
+    /// Loads the value from the atomic flag.
+    #[inline(always)]
+    pub fn load<Ordering: ordering::AcquireOrRelaxed>(&self, o: Ordering) -> bool {
+        self.0.load(o).bool_field
+    }
+
+    /// Stores a value to the atomic flag.
+    #[inline(always)]
+    pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, v: bool, o: Ordering) {
+        self.0.store(Flag::new(v), o);
+    }
+
+    /// Stores a value to the atomic flag and returns the previous value.
+    #[inline(always)]
+    pub fn xchg<Ordering: ordering::Ordering>(&self, new: bool, o: Ordering) -> bool {
+        self.0.xchg(Flag::new(new), o).bool_field
+    }
+
+    /// Store a value to the atomic flag if the current value is equal to `old`.
+    #[inline(always)]
+    pub fn cmpxchg<Ordering: ordering::Ordering>(
+        &self,
+        old: bool,
+        new: bool,
+        o: Ordering,
+    ) -> Result<bool, bool> {
+        match self.0.cmpxchg(Flag::new(old), Flag::new(new), o) {
+            Ok(_) => Ok(old),
+            Err(f) => Err(f.bool_field),
+        }
+    }
+}
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 6f2c60529b64..ceb3caed9784 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -272,4 +272,21 @@ fn atomic_ptr_tests() {
         );
         assert_eq!(x.load(Relaxed), &raw const u);
     }
+
+    #[test]
+    fn atomic_flag_tests() {
+        let mut flag = AtomicFlag::new(false);
+
+        assert_eq!(false, flag.load(Relaxed));
+
+        *flag.get_mut() = true;
+        assert_eq!(true, flag.load(Relaxed));
+
+        assert_eq!(true, flag.xchg(false, Relaxed));
+        assert_eq!(false, flag.load(Relaxed));
+
+        *flag.get_mut() = true;
+        assert_eq!(Ok(true), flag.cmpxchg(true, false, Full));
+        assert_eq!(false, flag.load(Relaxed));
+    }
 }
-- 
2.50.1 (Apple Git-155)

