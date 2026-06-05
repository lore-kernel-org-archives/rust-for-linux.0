Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE2F35E1D7;
	Fri,  5 Jun 2026 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664242; cv=none; b=P2RfSXqfPmDpJoeeeu3mO1nV99IGOCydmVPoIYKEx4K07GUCpe4BKy4ZFvPLy8eG+NKvScDU6wBm4bljD2Z1OnQeYSzooYLaBd1qCsKhn9Q6cSdPC8lkbh5nTl+3cuoq6dIOGvT2fHFy3N1NNEj7SuAuXmQXXUSAPZqkCbfvRjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664242; c=relaxed/simple;
	bh=Q9EZ3qPCUi3s0DK9Uw7pw9S0owGDYWwEJ6XikxfUdLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FNxas8rwY3Fmxv11kELHlddqtdIV2viF6UU78sAUWRfLEiMveVhPTLX0MlCq0utSxk8DvFKNKugy5z7SG/YHqxVpj8+dg1JbmNR2zItwUUpcJnNvdkFh1mjNI5f1ZEy83WI4Goxhd5Vn++214f92mqFaoalULpOJGx7OYX/hEOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hwwm9+4T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hwwm9+4T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FCE1F00898;
	Fri,  5 Jun 2026 12:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780664240;
	bh=rOeSBJOOlukMgbMbuUcAyCtu6L8oEpk9zjN7q/XIG84=;
	h=From:Date:Subject:To:Cc;
	b=Hwwm9+4TNI9nqllAV0j1xhrGMOMRlf7c3ay+3C49KGl3ASL97hrhltbNE6kOhr2KY
	 x8q+lI0OXpNQewi3zDSTyYy6ZJ0xbs2dguq/URCIMofg53WJW8JSYPTTVgRB1eDUts
	 zZEKXKgoDeybiP2x/EucKoil/nrbuUdqLGIvt5u5hewHlss01LYhQeRxL0SFY/l0ih
	 AZSx0sPAI1p/Sq8LSq+7iPwVQHfyyCLNKKqhAaUQ5/M97Rbtbx+AwfJ7fcMQqpErEI
	 Zf3PC6maqOOU2nQpV99UW5LL/gCcksf+psBDLVa5Cr/xqPPIWrX0XDkVfHhfLc/z/i
	 yf0zlU+d4Jyiw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 14:57:07 +0200
Subject: [PATCH v2] rust: sync: export lock::do_unlocked
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-export-do-unlocked-v2-1-e23001390231@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKLHImoC/32NQQ6CMBBFr0Jm7Zh2EIyuvIdhge0ADaQlUyQY0
 rtbOYDL95L//g6RxXGEe7GD8OqiCz4DnQowQ+t7RmczAymqFekKeZuDLGgDvv0UzMgWlWrr1tz
 Ka2kvkIezcOe2I/psMg8uLkE+x8eqf/ZvbtWosauMJVLli1T3GFk8T+cgPTQppS+yNJ9+tQAAA
 A==
X-Change-ID: 20260215-export-do-unlocked-00a6ac9373d4
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2861; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=Q9EZ3qPCUi3s0DK9Uw7pw9S0owGDYWwEJ6XikxfUdLA=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIselzUpoit1vKiHohMWyl6GcyffS+jtkdlk44
 01/lAer7SyJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiLHpQAKCRD6UCkIqsW9
 0AbCD/9ATSe3gA5LDO951K/MHc3ovW/Q6Kvfv3ay+oQ7GM9dSj1+hmzmkzCJlwnY1QJCXTi6RbM
 lvPqaRYu+p7SZ41jIUcbO0biDpDx6bTkjZwQAd3/YgcGu4h8KIhnJqjIO2xIZ0ssNkgNwRgopzr
 J0J45ALI1WOpYaLx4lrdxWRjW85875Ruth7JJkODRGqVtBANZT7enma+1d/hiJycp+yu/Kn4TSn
 /Swyx4+3AyN3HaKaOl15xIyhE0D4fmSmWrF5I4g0+JmyK4qXXmu77ptRgAjg06RyT9o5widVfaX
 sG7aNb3PsoCwSOal9aObzEwqhFByNLvnKEhDgQnkOIr+sSJahoTlrBVIGKF1Nj6Z0LmHQ7gzc9I
 TLdDGUb4M6k/I74tyj+XGjioyL/aA6KiVooY1WllLUtfLwcuAmmIbDUeTUJLmfPlDhKnUOEZssy
 zl0FXmLkhF5vXTRVqeB6ilg5ZdvwWsKJytEYjOEn8gOQSev/sKCvRg7+51+8FWq5HcWBdFXT6fl
 QPRCT5uyu3CsuAT77F9A1zLLEB8V3L4EHrU2yObfXsJiLuS8eO9RF3utBpi7oyBIsC/JHMjsi7u
 qluEnB3itExhXfj4Jgdkv55luXNt0s07dFWYXpL/nMBr8OM8nan1mxWGhzg7v8r8f0qfwBYDPWO
 1MFvCFh4IIZG0lw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Export lock::do_unlocked publicly. Add documentation for the method.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Drop spurious space before `guard.do_unlocked` in the doc example (Benno).
- Un-hide the imports in the doc example so the rendered docs no longer have a spurious blank line after them (Alice).
- Link to v1: https://msgid.link/20260215-export-do-unlocked-v1-1-f5cd2203b20f@kernel.org

To: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@redhat.com>
To: Will Deacon <will@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Waiman Long <longman@redhat.com>
To: Miguel Ojeda <ojeda@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
---
 rust/kernel/sync/lock.rs | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..9c549e469785 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -238,7 +238,31 @@ pub fn lock_ref(&self) -> &'a Lock<T, B> {
         self.lock
     }
 
-    pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
+    /// Temporarily unlock the lock to execute the given closure.
+    ///
+    /// This method unlocks the lock before calling the closure `cb`, and re-locks it afterwards.
+    /// This is useful when you need to perform operations that are not allowed while holding
+    /// certain locks, such as allocating memory (which is prohibited while holding a spinlock).
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::{new_spinlock, prelude::*};
+    /// use pin_init::stack_pin_init;
+    ///
+    /// stack_pin_init!{
+    ///     let lock = new_spinlock!(())
+    /// }
+    ///
+    /// let mut guard = lock.lock();
+    /// let mut buffer = KVec::new();
+    /// // Temporarily unlock to allocate memory, which should not be done while holding a spinlock.
+    /// guard.do_unlocked(|| {
+    ///     buffer.push(5u32, GFP_KERNEL)
+    /// })?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
         // SAFETY: The caller owns the lock, so it is safe to unlock it.
         unsafe { B::unlock(self.lock.state.get(), &self.state) };
 

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260215-export-do-unlocked-00a6ac9373d4

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


