Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70131A9FAC
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 18:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763145754; cv=none; b=S9rIFDAo/vj9D4K7eDAtBFNhvoG9CQS9EvjAEH6hDWETS5sAJEOSNLdRRxDH2fb5K5vRGLWlNcQflNWYqB0kJJ1isdy9nen1xJ4ipUIds9SrjOsTF/eWm3dnH48gqlx+X6y93CyuC7Axxu1Z8nZp3nvWgAu11RevXSu9Uusi+58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763145754; c=relaxed/simple;
	bh=rYC/J+0lpRU2gIZ1N0X2FH4TFEHfo8RMopWLajIrywE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XgdcFdWxP64KBNFS/3FNebXf8Ts5I+2bsOc4t5MZb1GCYsAVRPOoAWltFiaAvl+Bs757LtWRBQAWY7oxlhtht+p20PDYejY4zq8p1MzUKRpk5tvSyaiaz0MUzRwjAoC/hxtWXSfu7zPQsc+xJWtg3hKiL3aXOt7KaIGCoYcITFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GPl81j+8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GPl81j+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763145748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EMzJpk1EESIo5B/osrj0QtvfRFhS7pW41NCs16h4Z/8=;
	b=GPl81j+8kRHmzN9invEAZV/AcIGLEutPy7gvuVYqYR/Nu00OpwzWgH+SjoFOWvGa/faqWD
	LwntX3YY4UEavHtJlpnyhqcJ/6B5XNKFj7Cf1ENCiisl29iBCMoCArJtxe9wFEixBJqTdz
	dnbXmMuG/dRof7pDaebpd3TI2qOZtBw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-i6B4MHnPN5CPNqfhmlGV1g-1; Fri,
 14 Nov 2025 13:42:23 -0500
X-MC-Unique: i6B4MHnPN5CPNqfhmlGV1g-1
X-Mimecast-MFC-AGG-ID: i6B4MHnPN5CPNqfhmlGV1g_1763145741
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BBF1518AB406;
	Fri, 14 Nov 2025 18:42:20 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.82.71])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CC0D31955F1B;
	Fri, 14 Nov 2025 18:42:16 +0000 (UTC)
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
Subject: [PATCH] rust/time: Add Delta::from_nanos()
Date: Fri, 14 Nov 2025 13:42:06 -0500
Message-ID: <20251114184207.459335-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Since rvkms is going to need to create its own Delta instances, and we
already have functions for creating Delta with every other unit of time.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 6ea98dfcd0278..2b096e5a61cda 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -363,6 +363,12 @@ impl Delta {
     /// A span of time equal to zero.
     pub const ZERO: Self = Self { nanos: 0 };
 
+    /// Create a new [`Delta`] from a number of nanoseconds.
+    #[inline]
+    pub const fn from_nanos(nanos: i64) -> Self {
+        Self { nanos }
+    }
+
     /// Create a new [`Delta`] from a number of microseconds.
     ///
     /// The `micros` can range from -9_223_372_036_854_775 to 9_223_372_036_854_775.

base-commit: 5935461b458463ee51aac8d95c25d7a5e1de8c4d
-- 
2.51.1

