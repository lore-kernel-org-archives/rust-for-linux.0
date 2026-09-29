Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B747D538D7A;
	Tue, 29 Sep 2026 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693149; cv=none; b=go1ac8qfzCR+ZyK3RQbBq2F+uqWncqPqF8t62GT9Th/lPMlxzcYf9yUgvb028Pmr2tDIZFxIDKsDGMsL+9vo1zNUnJo2b3G76AnKgv4EeqL5uvsnJ/VtmQotm4bA+es+laG7Cla2IANM91a4RxtLEuVB8w1T4hY0Pf4OMO5iAqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693149; c=relaxed/simple;
	bh=G91rNyoqBpxf08LDwH67RhsTWv9rePfgNtcjClFw7H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fXSsPdLPb2zgmmrUREtePAG+toPm+X3afd86XUYTg3JfWqAg2eAmQCCGpNgxLxELGL0VYYp96WjWIBpTynx6lXQSEPSKNZ4YjLNlPi9PLNaQAhpDIq+uNDrpCrz8xI//qRFreNtRsVezWhG2cPY5W8YgPhWALdifIpJ+WfJ5L9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlWT7mKO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlWT7mKO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCB71F000FF;
	Tue, 29 Sep 2026 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790693139;
	bh=x2Ec6DrSeH/lKq1xJVwJgp4V44WP6XHNTIGQy7e1Jfg=;
	h=From:Date:Subject:To:Cc;
	b=RlWT7mKOYIXteLARQGOOneJmGbeWwnYFiF1nc9Ui70apfY7Nn1LOniUQ8DTphFQWS
	 Xyny8Prl85Hjw1S0S+9AvgQKxwetyuNmGNIKDK92SqxrLEIKDVkZIw5KHD/5TTwaSl
	 9kFo02sajc+zdeFf0hERpvd1RfEpYZ5+hEBjeBoECHDXy0PCgu6nHjozrNU8+8nQhK
	 bfaChe2EK8oKabTLuH051UuE46L99BnBnV4E9AgGoKem+KIHsyCdJp46tg/Pu5yYkt
	 oIQ/3cXqHgobAAFZSK1qmBHk77+R4bR/KzrOFfI8VAnIO7dm1m32iMlkvCdrlwUewP
	 hzRGlQSmVIMCA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 29 Sep 2026 16:45:13 +0200
Subject: [PATCH v3] rust: sync: export lock::do_unlocked
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-export-do-unlocked-v3-1-f7000684178f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPjOu2oC/33NQQqDMBCF4atI1k2ZTKrFrnqP0kWajBqURBIbL
 OLdG92UQunyfzDfLCxSsBTZpVhYoGSj9S6HPBRMd8q1xK3JzRCwAhQlp3n0YeLG86cbvO7JcAB
 VKV3LszQnlg/HQI2dd/R2z93ZOPnw2n8ksa1/uSS44E2pDSLIB0Jz7Sk4Go4+tGzzEn6MCn4bm
 A1CCSBkDSjFl7Gu6xumYMBT+QAAAA==
X-Change-ID: 20260215-export-do-unlocked-00a6ac9373d4
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>, 
 Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=G91rNyoqBpxf08LDwH67RhsTWv9rePfgNtcjClFw7H8=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqu88Hum2oj3sESGvTUOKhZBF0FLbPmrGlnt2n+
 6GIRGkir/OJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCarvPBwAKCRD6UCkIqsW9
 0LpQD/wKyeuc2Zx/i/aXGDxWPEUCMmltRR8gpsMWXhlMzPA04lfNyLWkkrZQcI5GCzDOUh4splq
 Trptz4H+fkxccu/Pyk3VPlLGlRsgUUkpoaIZb4vEtpDLLccmyj8rNXzjiVq2RPJB+50eow+oQ05
 Py6sUIcULp1AU3EV5VgIo/y4aPLO32D2NhsSy3p9H3TWPHjpVfweBpiAThTrJP9spjLBeSn7sad
 Jfrodtki8+rkMBwNJWR31zE3s7cpN0VzwsG8tuWOp0KTIsfiLzm6FAaGbl0BqvfdtQguMNoBns+
 cRUs6+pNgIu8g1uHF/a/px6Ho/Dk6eFYJJQlbeLXnLCYiUuBC0cP1y4Q76kDl7zxYa2tgixb5X9
 LxBO3jpiJDp62lqFdFms5x3CPGZFObCoLVGOxfOlsoDIQhw7hT+ez+Fgul0dBAFPf65/j2dSWXZ
 T20A1qe5SfWxJP9qGLA03CetOPv1y4F8NEFLo6MoWdqUC5bQNR9YXqZiBJ7VMGv/XbI2/tM30Lx
 eR0mWhfl5zgCZFEjjNnC2ev28pQL6dslgj40PY3CO/MrQzhTwJBpMmRe57LTJjhAbhurl0kHCVp
 mwJv/DnusG2u6POcnU9E5edL9imUUNQoY69wXD0iOrtG61Usc5oY9gm1xnBEwASjfPhgFRKJzjH
 5Z1lX9KushWY4Eg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Export lock::do_unlocked publicly. Add documentation for the method.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v3:
- Rebase on v7.3-rc5.
- Do not import prelude in example (Alice).
- Link to v2: https://msgid.link/20260605-export-do-unlocked-v2-1-e23001390231@kernel.org

Changes in v2:
- Drop spurious space before `guard.do_unlocked` in the doc example (Benno).
- Un-hide the imports in the doc example so the rendered docs no longer have a spurious blank line after them (Alice).
- Link to v1: https://msgid.link/20260215-export-do-unlocked-v1-1-f5cd2203b20f@kernel.org
---
 rust/kernel/sync/lock.rs | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..edfff9e10199 100644
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
+    /// use kernel::new_spinlock;
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
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260215-export-do-unlocked-00a6ac9373d4

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


