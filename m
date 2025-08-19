Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC84343D66
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 20:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755634468; cv=none; b=XWpRyUqCAR8DwFUBtthJcHdt5VxgZQSe2jfU//moGi8JboDfnoHdCAKQuqhQ40WJ1ZbjDPJ9v1Sbgd+LBVBdU3v8mGDu8/zEo90a8/RSJXsncWRjb90X/wsc+LkFW7wl5liMkW95yTbhVZ5DxCk74dlp4SIGrOabn9unKDAlP4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755634468; c=relaxed/simple;
	bh=JcG8AO1bHRvEK0uCkPbFr4Yzn72QSE/1a/I9KFT6zpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlqD/7KzwgOoUOLnjRbemmh3jjU1vHIw4CSBRZGK/1l7MzagaqQ31mp3Q10Lu0EYbPTgcLjULV8+pDrvPoCIgVabsLTa42W+lgK95IVwl4Uqsaakhc3Js25WfhoD/U0yvfsZIxYHttVLncfUdDB13humOlaAuQFGGuQerZnv4mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NnLXciYN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NnLXciYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755634466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDxx71q3MVhyRyVcbCfH/wubs1F7yPIXcuCK3By5m/4=;
	b=NnLXciYNGmSf94gmeev6rAwO+2JXH8/ZmJPonbin9oeSiJlJhAQTvrJ162D0+shvDik/ip
	61ZKuF3YkQ0v2224zsjguawe7DsPHs+LeIbmRW33XTWODV8LwzoNaNjgiFp9NCerOy4XcN
	jWvxunR9C5zBMo58Wv/vg9MUFSshWv4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-298-ssaWOvdYMI2VVfIdHjYDCg-1; Tue,
 19 Aug 2025 16:14:23 -0400
X-MC-Unique: ssaWOvdYMI2VVfIdHjYDCg-1
X-Mimecast-MFC-AGG-ID: ssaWOvdYMI2VVfIdHjYDCg_1755634460
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5A94F1954228;
	Tue, 19 Aug 2025 20:14:20 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.81.238])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D414D19560B2;
	Tue, 19 Aug 2025 20:14:16 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
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
Subject: [PATCH v8 6/7] rust: time: Add Instant::from_ktime()
Date: Tue, 19 Aug 2025 16:05:57 -0400
Message-ID: <20250819201334.545001-7-lyude@redhat.com>
In-Reply-To: <20250819201334.545001-1-lyude@redhat.com>
References: <20250819201334.545001-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

For implementing Rust bindings which can return a point in time.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V4:
* Turn from_nanos() into an unsafe function in order to ensure that we
  uphold the invariants of Instant
V5:
* Add debug_assert!() to from_nanos
V8:
* Change name of function from Instant::from_nanos() to
  Instant::from_ktime()

 rust/kernel/time.rs | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 64c8dcf548d63..5c40ebe096357 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -200,6 +200,29 @@ pub fn elapsed(&self) -> Delta {
     pub(crate) fn as_nanos(&self) -> i64 {
         self.inner
     }
+
+    /// Create an [`Instant`] from a `ktime_t` without checking if it is non-negative.
+    ///
+    /// # Panics
+    ///
+    /// On debug builds, this function will panic if `nanos` is not in the range from 0 to
+    /// `KTIME_MAX`.
+    ///
+    /// # Safety
+    ///
+    /// The caller promises that `nanos` is in the range from 0 to `KTIME_MAX`.
+    #[expect(unused)]
+    #[inline]
+    pub(crate) unsafe fn from_ktime(ktime: bindings::ktime_t) -> Self {
+        debug_assert!(ktime >= 0);
+
+        // INVARIANT: Our safety contract ensures that `nanos` is in the range from 0 to
+        // `KTIME_MAX`.
+        Self {
+            inner: ktime,
+            _c: PhantomData,
+        }
+    }
 }
 
 impl<C: ClockSource> core::ops::Sub for Instant<C> {
-- 
2.50.0

