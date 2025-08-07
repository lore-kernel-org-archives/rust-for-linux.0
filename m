Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439EF221D92
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Aug 2025 19:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754593623; cv=none; b=nsPdBGbttq+6XK/sB5CF4+vRKnEIOkv+pTHcDHwjQg/mmTHxKBJ3JKjZ9zETmEMg9ha7n1oSQLROKVRHhgEz+jCXu4XD7MkBgsibFrWGEFvnMufe9knN8lIE2GrsKAyT5yP1uDAu5ds1Fq8x13S+dAEOivHu/e/DZb3qkhJ0bcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754593623; c=relaxed/simple;
	bh=JRv4nrgdGhLehuyjTHexjywD6f3lkiNksui03JJIEOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ah4yHUsFBF1v02lbO/Ad9IKRSMOGazziz9p1jYe0uxOrqRbhNQuhPZehfUJIwRNOjlXxfiruHy7Vbhrtux4YQH+a9q1gHlwArO04bYgW8z5okztlSmPQXKs3w9kxNHrW0iW10DRVV+KG2OXlvrrpHZksuyQ6p+ky5xSKelXyzr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fm5mthug; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fm5mthug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754593621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=udS+b8WaaKH5KyymGeMqR5JdvGQCZoEkiopIPJzS+2Y=;
	b=fm5mthugjEBAT/XreTpDwd+xSPuLqJL3jZqtUbtzDe4KQp8Unmnb1cxDgEunUVw6IOesRb
	pjkpQu4ayoLmluanNv42P050STlke9ZqNNkirQEJ0pl9DlYlM00x0SBTMbFv3shwp4swqp
	QQxQBZPOVO94Wh6LItxMdcrhCR2j78g=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-146-VtzuOwOmNaOOVLXvzHL4oQ-1; Thu,
 07 Aug 2025 15:06:57 -0400
X-MC-Unique: VtzuOwOmNaOOVLXvzHL4oQ-1
X-Mimecast-MFC-AGG-ID: VtzuOwOmNaOOVLXvzHL4oQ_1754593615
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DFDD1195608A;
	Thu,  7 Aug 2025 19:06:54 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.65.111])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D54119560AD;
	Thu,  7 Aug 2025 19:06:51 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 1/2] rust: time: Implement Add<Delta>/Sub<Delta> for Instant
Date: Thu,  7 Aug 2025 15:06:35 -0400
Message-ID: <20250807190649.3078875-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

In order to maintain the invariants of Instant, we use saturating
addition/subtraction that is clamped to the valid value range for a
non-negative Ktime.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
* Change behavior in ops::{Add,Sub}<Delta> so that we panic on overflows
  under the same conditions that arithmetic operations in rust would panic
  by default.
---
 rust/kernel/time.rs | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 64c8dcf548d63..4bd7a8a009f3e 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -25,6 +25,7 @@
 //! C header: [`include/linux/ktime.h`](srctree/include/linux/ktime.h).
 
 use core::marker::PhantomData;
+use core::ops;
 
 pub mod delay;
 pub mod hrtimer;
@@ -202,7 +203,7 @@ pub(crate) fn as_nanos(&self) -> i64 {
     }
 }
 
-impl<C: ClockSource> core::ops::Sub for Instant<C> {
+impl<C: ClockSource> ops::Sub for Instant<C> {
     type Output = Delta;
 
     // By the type invariant, it never overflows.
@@ -214,6 +215,46 @@ fn sub(self, other: Instant<C>) -> Delta {
     }
 }
 
+impl<T: ClockSource> ops::Add<Delta> for Instant<T> {
+    type Output = Self;
+
+    #[inline]
+    fn add(self, rhs: Delta) -> Self::Output {
+        // INVARIANT: With arithmetic over/underflow checks enabled, this will panic if we overflow
+        // (e.g. go above `KTIME_MAX`)
+        let res = self.inner + rhs.nanos;
+
+        // INVARIANT: With overflow checks enabled, we verify here that the value is >= 0
+        #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
+        assert!(res >= 0);
+
+        Self {
+            inner: res,
+            _c: PhantomData,
+        }
+    }
+}
+
+impl<T: ClockSource> ops::Sub<Delta> for Instant<T> {
+    type Output = Self;
+
+    #[inline]
+    fn sub(self, rhs: Delta) -> Self::Output {
+        // INVARIANT: With arithmetic over/underflow checks enabled, this will panic if we overflow
+        // (e.g. go above `KTIME_MAX`)
+        let res = self.inner - rhs.nanos;
+
+        // INVARIANT: With overflow checks enabled, we verify here that the value is >= 0
+        #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
+        assert!(res >= 0);
+
+        Self {
+            inner: res,
+            _c: PhantomData,
+        }
+    }
+}
+
 /// A span of time.
 ///
 /// This struct represents a span of time, with its value stored as nanoseconds.

base-commit: 479058002c32b77acac43e883b92174e22c4be2d
-- 
2.50.0

