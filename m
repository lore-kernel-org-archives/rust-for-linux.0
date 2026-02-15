Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F513BB4A;
	Sun, 15 Feb 2026 20:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771186570; cv=none; b=iK+HiGMtOjjXlebFwa2PBxTwxAy0vsYPWyqQV3J5aOs16Z8kLHNYaPD8i94GmLnPICMTISGON0y3cN+FDV9e692aFaZdmVA7Zgy3bq+ghY4CQBP79K042ztYROWpixQEtvrPFG8LKtd2gGUFjbfmdfVN4lFfNnlOa2JJ8zqHEkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771186570; c=relaxed/simple;
	bh=NxSUHptN1Z+yOvBDI2TPjKfUqELGTqO1roisNh8BODA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fos6UVIufWrS8/iW/VFkYU4hnBvQ+szf4jWA2lqWJuTa+WHrRfqntIKoHzpSO/v5uER2A4eKPvUJec3dA1RTBTjAwZwJfmMHhPpqQuy5xJvHVLI4SGSwgJsk64o8LFM9RILWrzWWrcS8SZtmbXKcxR3zw5bEA5di5rTUI0Uvhno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zk5q51uR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zk5q51uR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B17C4CEF7;
	Sun, 15 Feb 2026 20:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771186569;
	bh=NxSUHptN1Z+yOvBDI2TPjKfUqELGTqO1roisNh8BODA=;
	h=From:Date:Subject:To:Cc:From;
	b=Zk5q51uRDkbnMGTywbRoHBXfWGK6GVKBf8C/OWmR9Kg86LbaDZQ3sxZD/IcZu04nS
	 Y8DROLc6RAYpWdNAJwOOJvAr35MiVvuWoRK3q9OD6Xjwrxga4uImH0J8WovwP/+1dc
	 fqUxFo4AZ3yekyqa39dr7yJvnXNjHQDkwEPtTjJTbWw/Dh2pU+829qmkA6Dj/QM08X
	 o6KNMjHQ/i/u3aC4QqRf7ErlzDIzPG7SPWShOjGn+oOJVkvtB60736HQ66JGQP4OTI
	 Cvp6ZOTNIshAYkuW8bzTJkBetAe9umtQzyn/Jf/L9s3+0xyZrie5WM1+gIztq+xp/f
	 N5RLIgXl/FUDQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 21:15:59 +0100
Subject: [PATCH] rust: sync: export lock::do_unlocked
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-export-do-unlocked-v1-1-f5cd2203b20f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAH4pkmkC/x3MQQqAIBBA0avErBtQK6OuEi1EpxoKDa0IorsnL
 d/i/wcSRaYEffFApIsTB58hywLsYvxMyC4blFBaKNkg3XuIB7qAp9+CXcmhEEYb21Vt5WrI4R5
 p4vufDuP7fsJ4endkAAAA
X-Change-ID: 20260215-export-do-unlocked-00a6ac9373d4
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Waiman Long <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1931; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=NxSUHptN1Z+yOvBDI2TPjKfUqELGTqO1roisNh8BODA=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkil/PbO0r0AYCgJWBnOfOzGhV66I27RudiSFQ
 wmcbf6v8UCJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZIpfwAKCRDhuBo+eShj
 d182EACH6Vo975Q6wkOzDgJg2pXzmPJOZrfb3uOXO0BTfDvzapbN8ofUc2eaO6Spnm5HJSRWkBM
 f3BQqhpNeboCqzcPTMDN2KQE1pr9WVnIQmPJghLHilffljw2dRUJva+K1uc2CDO4TLaAEU9Tq/d
 /qQVQTqZdddg9L3awpgU4QTfgOv7k1b0yFSq5MbcMaUvMEamZwAG+NHIirw7qQVOQqqqDRQoj2L
 JtOYCkscaXaU5slBs9oycJ13dLSedBExoE/GqWkzXQQI+WxssOjQF8xU+mByJAGUjzszlJJo8H/
 HUURgaz881bMQE0xOYlN3HBKZdXWR3uoREP8dWrsTeDm2TbLuy7wYhB6fPergRG8Ui93TBInm6K
 pxXk/clJKvCqDBEpd/t/CMdspM/wXT6+w9lfmGlEbYZ6FCGD6MkS2mihvM54Q9XJfkD7tWZUZmJ
 4ozbdXCXGzvVIj11+K1jzZl2CzCywa5UGuD7/8yfmDZC5uC8SI0aokz5liXXQqp8iMqPTOxjpVR
 jk+gn79ZuvQz8Z7qW60zCzMB11QWvBHLsuAKPsotcf1zp5645Ksdblzlov83Cy9y9Ahl/0N8/NJ
 KAJfjgB4L9/IkH+vR1oxkt1WZtJbbJZpD2aq/sHexDCifF1xiATMGrM1lLm/dFsx63fBWbsPH0v
 hsWwodwXaB9Dqdw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Export lock::do_unlocked publicly. Add documentation for the method.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/lock.rs | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 46a57d1fc309d..f390cd7ba0762 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -235,7 +235,31 @@ pub fn lock_ref(&self) -> &'a Lock<T, B> {
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
+    /// # use kernel::{new_spinlock, prelude::*};
+    /// # use pin_init::stack_pin_init;
+    ///
+    /// stack_pin_init!{
+    ///     let lock = new_spinlock!(())
+    /// }
+    ///
+    /// let mut guard = lock.lock();
+    /// let mut buffer = KVec::new();
+    /// // Temporarily unlock to allocate memory, which should not be done while holding a spinlock.
+    ///  guard.do_unlocked(|| {
+    ///     buffer.push(5u32, GFP_KERNEL)
+    /// })?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
         // SAFETY: The caller owns the lock, so it is safe to unlock it.
         unsafe { B::unlock(self.lock.state.get(), &self.state) };
 

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260215-export-do-unlocked-00a6ac9373d4

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


