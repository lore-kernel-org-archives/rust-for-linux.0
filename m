Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C98F2FE074
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 22:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755125012; cv=none; b=Gb1zhUa0SvFpHfoG1djNOLYb7H4tCCONK2vwmauQSbVrLx99IuhzNDmvY1C/TVHrY7nBL9zsOucCVTbCm8pDGZZARohdIdQZS6LQ+kbno1PAUbukFF0erQVV8RJEeIvZJRnpsNrHhOhY0+1cb6cf8ZkTUEz0fau5aCFrRg/jsyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755125012; c=relaxed/simple;
	bh=YK0ho87O0mYnaGZ8BiewUHNbR5/VNJClhk7oxU+qJeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtDyzm8kD9Pw2PWiPYob7c03o1SfNf+Wo1cdTU7zkYrkuEUz75Nxw19YGI8p5pbjN6vkYuDl+GpUfSCUMhHAi/mffjQ24IRjM+MOaO4EihFbwLzpUXH4e0cXzWD0w0bRSwFucUkUVAZd0lvFTO2k1XVB0VSlcg0hLT+H/cW7gU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S7v9lKKU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S7v9lKKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755125010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ux39uZmkbHeNw02CB9I+BW9qm3yblDKIUXvHRPVmBm0=;
	b=S7v9lKKUvP+z82QCw7ShmlFTauRQwvRgLDCQx7luEQTG15voDof60RXx8gZkrpbPOBEnkh
	hqOIHpUkhpihyjxfyf/cPC9UQvWAe0XWWQhoa0O1UpkcriNzVUtsxGAyVog3hqsXnLnCVE
	w+76SKoeZKxfFiirmjFHb/eb1v0GJjA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-306-EhLTdoRCN-Knff4nU5OXoA-1; Wed,
 13 Aug 2025 18:43:28 -0400
X-MC-Unique: EhLTdoRCN-Knff4nU5OXoA-1
X-Mimecast-MFC-AGG-ID: EhLTdoRCN-Knff4nU5OXoA_1755125006
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E0CD18003FC;
	Wed, 13 Aug 2025 22:43:26 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.64.13])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 531E930001A1;
	Wed, 13 Aug 2025 22:43:22 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Boqun Feng <boqun.feng@gmail.com>,
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
Subject: [PATCH v7 6/7] rust: time: Add Instant::from_nanos()
Date: Wed, 13 Aug 2025 18:42:21 -0400
Message-ID: <20250813224240.3799325-7-lyude@redhat.com>
In-Reply-To: <20250813224240.3799325-1-lyude@redhat.com>
References: <20250813224240.3799325-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

For implementing Rust bindings which can return a point in time.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

---
V4:
* Turn from_nanos() into an unsafe function in order to ensure that we
  uphold the invariants of Instant
V5:
* Add debug_assert!() to from_nanos

 rust/kernel/time.rs | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 64c8dcf548d63..75088d080b834 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -200,6 +200,29 @@ pub fn elapsed(&self) -> Delta {
     pub(crate) fn as_nanos(&self) -> i64 {
         self.inner
     }
+
+    /// Create an [`Instant`] from a time duration specified in nanoseconds without checking if it
+    /// is positive.
+    ///
+    /// # Panics
+    ///
+    /// On debug builds, this function will panic if `nanos` violates our safety contract.
+    ///
+    /// # Safety
+    ///
+    /// The caller promises that `nanos` is in the range from 0 to `KTIME_MAX`.
+    #[expect(unused)]
+    #[inline]
+    pub(crate) unsafe fn from_nanos(nanos: i64) -> Self {
+        debug_assert!(nanos >= 0);
+
+        // INVARIANT: Our safety contract ensures that `nanos` is in the range from 0 to
+        // `KTIME_MAX`.
+        Self {
+            inner: nanos as bindings::ktime_t,
+            _c: PhantomData,
+        }
+    }
 }
 
 impl<C: ClockSource> core::ops::Sub for Instant<C> {
-- 
2.50.0

