Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AA23750CF
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 20:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569048; cv=none; b=NFe7wzpolgi0CMUZV8AxGHoA/KnO71hX1eLAq/owpbpMo9Jvqtq5XN4oOxnyBKWQw9BMIv6sHh/bGnvxDFDuJfgh3c9lbK/r5MNaFRQ8mS6Wvo2KXGhNXISErGcjQptv8xgMNMFTGGpGfC4zDgzvInHGpjpP5pIXe2pC+LW8Vd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569048; c=relaxed/simple;
	bh=b4ArQEY3Yk/tGpc2ZlJRwpS7ku9RWoJvrxkS87D+f6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCAD4Ethtt/XIr0SxUgE992cTQl1kuvTb7KAiLm7iAkQ7vldimolT6wbc4uX78Vhp4eVwlo3YmkdDkaHoS3LC30a+4CHh7j86rW2SfpbVWAxiXYQQfS1c8XcZ2WFEd9neK8UM52sLwbEGqt2Ztu3M5+QpOM6IN4b4TZfXe6EvsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeNyX/o1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeNyX/o1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3472EC4AF09;
	Tue,  3 Mar 2026 20:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772569047;
	bh=b4ArQEY3Yk/tGpc2ZlJRwpS7ku9RWoJvrxkS87D+f6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PeNyX/o1ZKVgysgXsitm3xxnnNqOFKP44oyJRL9SCSlNb8oHcxzCc6QulcsWuJox2
	 +Qzhed8/ZDBh+ny08BhLzNi9qer9FaVvXdoJ+HqlARzSpr54HoJ9q+M9o0acmiMoJZ
	 ZRdzHouKISQAGnicB2lSqkuWi2pt21kMy1UZM+PxdYJWi1rKtv0DBUuXzQ5MAQVF1d
	 wo1+cSK4ERXSGoJNTT0t5ugfM5Jm5x4LA2e9oYYR7gevo/7qHRXqNbs7ydPVkqur4R
	 L/lB2MlUewDdAliO54otzKHOa6C2qe2O5dTszW51CL3Ol49ExFf4f7nThLKWfj7LvF
	 0oQyTX/L60cvA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5B469F40068;
	Tue,  3 Mar 2026 15:17:26 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 03 Mar 2026 15:17:26 -0500
X-ME-Sender: <xms:1kGnaT26yJaqg6RyB9YurdgmtjmL_lRw9vP1VT9qpj8R782yCuRIxA>
    <xme:1kGnaZrpl3flYGPOEJcixyquHcgeDJjZ9r8KfVLYpRR3goGaMAJc0rhO0ASmUkMGS
    xKsNLVaOkHZJwQmBicfISZXBO_AKBadIdcxNMJvNWFCYN7ThvvKqkU>
X-ME-Received: <xmr:1kGnaTjdMWiPgTrVkNG0NajINWhR09PNVCKptKwLqcNCI7B0W-hq-aB1SH16ZS1yhhLQ3O4wGjxkqdLkvMQKdwuTIFh7Wnr1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekieffgeevhefgudffveffheettdfgkeeilefhhfduhedugedvhedtteegvdeugfenucff
    ohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepudenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudeipdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgr
    rhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpg
    hghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:1kGnaVngTl3_6SGcpQtMG9HHWvCOpFXRfSFxzDTiSWtu-jgxowhhHg>
    <xmx:1kGnacoDg6z6iXOWWTyNaiGr1cthBYbKngUaosIYDrt8UgkP9zdevA>
    <xmx:1kGnaRJX7rITmEo8QsO5OXlG4wf79OaEyFrchSR0u-iGvnWI585-Ag>
    <xmx:1kGnaYBaSagb5Qc1ZCbSfLF9XibckcUBFeDk1f8xxm8QmFJ5dm6yVQ>
    <xmx:1kGnaT7U8M3bopq1zB-rzQnx24-NqWR3a_nrsG4E-XgLPWMiP_663MQP>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 15:17:25 -0500 (EST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] rust: sync: atomic: Add fetch_sub()
Date: Tue,  3 Mar 2026 12:16:59 -0800
Message-ID: <20260303201701.12204-12-boqun@kernel.org>
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

From: Andreas Hindborg <a.hindborg@kernel.org>

Add `Atomic::fetch_sub()` with implementation and documentation in line
with existing `Atomic::fetch_add()` implementation.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260220-atomic-sub-v3-1-e63cbed1d2aa@kernel.org
---
 rust/kernel/sync/atomic.rs          | 43 +++++++++++++++++++++++++++++
 rust/kernel/sync/atomic/internal.rs |  5 ++++
 2 files changed, 48 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 1bb1fc2be177..545a8d37ba78 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -577,6 +577,49 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
         // SAFETY: `ret` comes from reading `self.0`, which is a valid `T` per type invariants.
         unsafe { from_repr(ret) }
     }
+
+    /// Atomic fetch and subtract.
+    ///
+    /// Atomically updates `*self` to `(*self).wrapping_sub(v)`, and returns the value of `*self`
+    /// before the update.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::sync::atomic::{Atomic, Acquire, Full, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    /// assert_eq!(42, x.load(Relaxed));
+    /// assert_eq!(42, x.fetch_sub(12, Acquire));
+    /// assert_eq!(30, x.load(Relaxed));
+    ///
+    /// let x = Atomic::new(42);
+    /// assert_eq!(42, x.load(Relaxed));
+    /// assert_eq!(42, x.fetch_sub(12, Full));
+    /// assert_eq!(30, x.load(Relaxed));
+    /// ```
+    #[inline(always)]
+    pub fn fetch_sub<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering) -> T
+    where
+        // Types that support addition also support subtraction.
+        T: AtomicAdd<Rhs>,
+    {
+        let v = T::rhs_into_delta(v);
+
+        // INVARIANT: `self.0` is a valid `T` after `atomic_fetch_sub*()` due to safety requirement
+        // of `AtomicAdd`.
+        let ret = {
+            match Ordering::TYPE {
+                OrderingType::Full => T::Repr::atomic_fetch_sub(&self.0, v),
+                OrderingType::Acquire => T::Repr::atomic_fetch_sub_acquire(&self.0, v),
+                OrderingType::Release => T::Repr::atomic_fetch_sub_release(&self.0, v),
+                OrderingType::Relaxed => T::Repr::atomic_fetch_sub_relaxed(&self.0, v),
+            }
+        };
+
+        // SAFETY: `ret` comes from reading `self.0`, which is a valid `T` per type invariants.
+        unsafe { from_repr(ret) }
+    }
 }
 
 #[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index e301db4eaf91..b762dbdf6d18 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -340,5 +340,10 @@ fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) ->
             // SAFETY: `a.as_ptr()` is valid and properly aligned.
             unsafe { bindings::#call(v, a.as_ptr().cast()) }
         }
+
+        fn fetch_sub[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) -> Self {
+            // SAFETY: `a.as_ptr()` guarantees the returned pointer is valid and properly aligned.
+            unsafe { bindings::#call(v, a.as_ptr().cast()) }
+        }
     }
 );
-- 
2.50.1 (Apple Git-155)

