Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFB7260578
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 18:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753383443; cv=none; b=Wu+RhZAxo8DH1mwK+4tVB++bgxw9cX8JuyS3TqYpFSI5mNld2MDcjpjRE9qMCGI3UU3aomw82qxhI2007Jt0EYdUqdICEH+rqCxTHy2xT2sny+MVrTgVdP4nzQpTPS9QyoDrknQr6TMKQJZ/to/UY0ha/QI8VR5S6hhzL6KALu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753383443; c=relaxed/simple;
	bh=WiRKoW3jEqRtZjwGPjsFDVXe43IHCEGeVUZFIvWIvuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lw5SS+H/8liI2z4gPvO4tl4ie4Cb4ZwqyWdh18EFhVEGkft9ohdX1mQjtWG248sKuHHXZhf7oIAXTNJ87dVq9QanI3+dnCAIrhPL1dbqy8kA4pLgAJg1GZ7CF/HHUsqq7MjsNDcgi/vQTt51YFTkojRj1LTdMwgEyB1Ffb9IscQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SvT7mjVc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SvT7mjVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753383441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4JYSxMYzK9rXZpTAuUNhhgT+UnDZ1iR5Hu7L994nIeI=;
	b=SvT7mjVcYY92wl/+atbdhtJLzyKKau6ZCldpbIvzH2PUcjDERjxJ4bqSSwYaEfH647wgxT
	9Vr9kigy1bJM/IaN3MOq1J/2OjQIwhNsva2mH+3BdGlexgphUT3QwaGwmxZOySrJ9hV3ay
	/Oz868RSXsSdkz3dGWqRbdap5gfKucY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-480-0CFra9ivPg-qFj64AQlijw-1; Thu,
 24 Jul 2025 14:57:17 -0400
X-MC-Unique: 0CFra9ivPg-qFj64AQlijw-1
X-Mimecast-MFC-AGG-ID: 0CFra9ivPg-qFj64AQlijw_1753383435
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2724F1800359;
	Thu, 24 Jul 2025 18:57:15 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.88.223])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 148CE195608D;
	Thu, 24 Jul 2025 18:57:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
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
Subject: [PATCH 1/2] rust: time: Implement Add<Delta>/Sub<Delta> for Instant
Date: Thu, 24 Jul 2025 14:54:06 -0400
Message-ID: <20250724185700.557505-2-lyude@redhat.com>
In-Reply-To: <20250724185700.557505-1-lyude@redhat.com>
References: <20250724185700.557505-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

In order to maintain the invariants of Instant, we use saturating
addition/subtraction that is clamped to the valid value range for a
non-negative Ktime.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time.rs | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 64c8dcf548d63..ac5cab62070c6 100644
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
@@ -214,6 +215,32 @@ fn sub(self, other: Instant<C>) -> Delta {
     }
 }
 
+impl<T: ClockSource> ops::Add<Delta> for Instant<T> {
+    type Output = Self;
+
+    #[inline]
+    fn add(self, rhs: Delta) -> Self::Output {
+        // INVARIANT: We clamp the resulting value to be between `0` and `KTIME_MAX`.
+        Self {
+            inner: self.inner.saturating_add(rhs.nanos).clamp(0, i64::MAX),
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
+        // INVARIANT: We clamp the resulting value to be between `0` and `KTIME_MAX`.
+        Self {
+            inner: self.inner.saturating_sub(rhs.nanos).clamp(0, i64::MAX),
+            _c: PhantomData,
+        }
+    }
+}
+
 /// A span of time.
 ///
 /// This struct represents a span of time, with its value stored as nanoseconds.
-- 
2.50.0

