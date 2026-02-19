Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BC8C2FF;
	Thu, 19 Feb 2026 12:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771503621; cv=none; b=tmAEc6CBeFkAVKjMHvQ8lFpW84Dt592RQHwDsdMNncslCrtZbyg4PWxzaXsI0xfShs1t9WBTJ0nCw+F3e1J9khpQYvioE9rh0qSB4GWqkZer4plgxMHGV/shtbvQXwFLdR6NwQUPIDmXXJSGup3it7VenfBHN8C00vvxqopxywQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771503621; c=relaxed/simple;
	bh=XsWEzvzb57TvlQzTtZWNmidUcSKMJKtA/m2Kmmb0uhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IDQ8ETmAkJ+xc1GfUi8RzM6efq5+gGBG+uof/OcR/VbC1Fff+xabtM8m9WLlvfUnuHzQJlN1G226y9ZfV/imWEN+M2bhdaoiAYY75RxzgWapaWJh5NuA2zB/DGc60tbg9wMQnBoI8A9lF6+ruJk0yFgl/LYwI9PA1VbDsFUZv+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zemx/y/n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zemx/y/n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C740C4CEF7;
	Thu, 19 Feb 2026 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771503621;
	bh=XsWEzvzb57TvlQzTtZWNmidUcSKMJKtA/m2Kmmb0uhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zemx/y/nW1fPpj4Yqn4moh/EW7jB/1Mi+04SU/hqyco/h3dmCtr3ZelgJ7Iuxq/5Q
	 stHLmadwkNG0z4HefbvDLrTCCstLTjV4lRGvbrhvCTqsL7QcyEr+4emECoTHtI9390
	 hHp1z1vsEn5OENbwVa+PNtmU7p0aMmn2HiQMJJjRGKZd67Rbqz5azDmdJW2XOct9UX
	 z3EwfgMuHFV57pHAKTqGS39RrIN1X+yqAgohHzxCFqX4HRuMQQ85sUnrjHW9hJtira
	 6qPFXt+H1CXt7gCjUuPyV9zhQTHIf0K885br1/NQRUH53e7oqRHs/j05f076TBU2mE
	 B+4Ke4VP8gTew==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 19 Feb 2026 13:20:09 +0100
Subject: [PATCH v2 1/2] rust: atomic: add fetch_sub
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-atomic-sub-v2-1-8bd99cadf26d@kernel.org>
References: <20260219-atomic-sub-v2-0-8bd99cadf26d@kernel.org>
In-Reply-To: <20260219-atomic-sub-v2-0-8bd99cadf26d@kernel.org>
To: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=XsWEzvzb57TvlQzTtZWNmidUcSKMJKtA/m2Kmmb0uhk=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBplv/61sNywcGwm8GZSlnDcvdg1gaiuZQQyytnA
 SLWKdfNmnKJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZb/+gAKCRDhuBo+eShj
 dyqOEACj7QH+77pj4RA7Nky+7A+hK0wUH4Ci/wfrs7vJnR/0R/d8QcKICVRDc8qKURTZUWJY05C
 A7zsBzwGJwbQtQT90oh1Eo13Ppve9sIo2Fk7HtKIkLtNtEKhOC7VfzKZJ2h9SG1OV8gBDEFIf34
 5yU+etWVeucoaDm2IEidQ6e05HjnibK+Mjk5plwg4CdM5XM2RhMV5DW7jhwZJPDVRLSH1awVDXc
 /izswEvVPrBdvfEhhSY4M+pSfRbFdye1QN6kEqcSYO45Nr8W4Bk7b4pZGxlvbA9UYz9NC7uz+vx
 IWFPEYljnzWyx57eflpw5NRzleyx6gKY62SFfO8f6VuqkQ+SvZKGrM5PcMIXBy76d8KNrajB7if
 IWYWKO6BaD5mfOmajT75iGp9ckJ40Nf1Svw08qra0cwBJLyd1iZMuk8AoxgECouNXToIQaNj4PU
 8xuDyqG3ZmP6zpi3fOjLiO1Ece4E93SXPbu64WkU0uzIn4UNh9W3XOQ3RLAmMIy9wksJY7AdBYd
 Ybt44c0yiTjGuSa0Gu3E/Tp/0G22+02Htu/fDM136NOVO/2RCvVdW7aH+qCds5NbPqDmcxUfcRn
 xIZMDWDaEzvtfWempObGWJTwAbK2HLlML9DUiw57iJN5RkOkFSr3qM85Yo6bZtbXyGEWN/ossA5
 IKaGZsHEJaoAAlw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add `Atomic::fetch_sub` with implementation and documentation in line with
existing `Atomic::fetch_add` implementation.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/atomic.rs          | 43 +++++++++++++++++++++++++++++++++++++
 rust/kernel/sync/atomic/internal.rs |  5 +++++
 2 files changed, 48 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 4aebeacb961a2..83e03bb7ecd24 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -559,4 +559,47 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
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
diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index 6fdd8e59f45be..7eed8c66efff8 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -261,5 +261,10 @@ fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) ->
             // SAFETY: `a.as_ptr()` is valid and properly aligned.
             unsafe { bindings::#call(v, a.as_ptr().cast()) }
         }
+
+        fn fetch_sub[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) -> Self {
+            // SAFETY: `a.as_ptr()` is valid and properly aligned.
+            unsafe { bindings::#call(v, a.as_ptr().cast()) }
+        }
     }
 );

-- 
2.51.2


