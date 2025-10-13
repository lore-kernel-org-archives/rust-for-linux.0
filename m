Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C0430FF21
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370906; cv=none; b=rhSwSFWrXx2W0go31Gel2FO/6N/s3mJ2/41REZr43T19mR6D3mt4PGBY4fucMgf1MorpE/7GtPTnmYfCnubr3MCi0uEdltETAVRBoVHS54ZbeB6qgij+m5oQ3Z2CTwS4ot7SToPOlZ2TK800uMWzu/CH6TUkozueFfq2pZVXETg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370906; c=relaxed/simple;
	bh=ph/JrEd4QQTEskma9qDgko7pFckjWIPHEyhpEe/ntWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKVxZaCkL1MlsQWiqwu22QddVN8TxX/PCGpgpyU9lUL2MmA7nPX2ufcB4PbUrxZAMgum1rhwkZswshZSutc8j0H6LmN9BwzXXEtWPkB49jHKt/tSsRNb23dUVpV7hFwCKYxYLxH38JF1aX6USlyg4NzkeRQsyDBiwv3e+qac0Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GrPe3sEb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GrPe3sEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760370902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CGWiDHXT406CGjkkYVuYWQ9EmOtFGOr3azcQz/D+icE=;
	b=GrPe3sEbqsx76FeXmzwGVNEvsOEj1a2Bs+EwF/yfHceWo/vKUDI6klJ4kJufXup/s+0r9W
	KfQSVk5Bvwq2T64m0lSLcPgnbaV0C+ppAhqR6H4no+31kwE0WC/tAJ5MtlTl4g23Pq4II/
	Cz3hINumueGuQJ5UtUvhW5z6Ay2H4Q0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-150-pZR5Qch2P3Ox7EqLzySHbg-1; Mon,
 13 Oct 2025 11:54:59 -0400
X-MC-Unique: pZR5Qch2P3Ox7EqLzySHbg-1
X-Mimecast-MFC-AGG-ID: pZR5Qch2P3Ox7EqLzySHbg_1760370897
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 03EA51955F2F;
	Mon, 13 Oct 2025 15:54:57 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.81.1])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A716C30002D0;
	Mon, 13 Oct 2025 15:54:53 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v13 16/17] rust: sync: lock/global: Add BackendInContext support to GlobalLock
Date: Mon, 13 Oct 2025 11:48:18 -0400
Message-ID: <20251013155205.2004838-17-lyude@redhat.com>
In-Reply-To: <20251013155205.2004838-1-lyude@redhat.com>
References: <20251013155205.2004838-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Now that we have the ability to provide an explicit lifetime for a
GlobalGuard and an explicit Backend for a GlobalGuard, we can finally
implement lock_with() and try_lock_with().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock/global.rs | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index f9a9c4bdc46b0..1f28bf5fc8851 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -89,6 +89,34 @@ pub fn try_lock(&'static self) -> Option<GlobalGuard<'static, G, G::Backend>> {
             inner: self.inner.try_lock()?,
         })
     }
+
+    /// Lock this global lock with the provided `context`.
+    pub fn lock_with<'a, B>(
+        &'static self,
+        context: <G::Backend as Backend>::Context<'a>,
+    ) -> GlobalGuard<'a, G, B>
+    where
+        G::Backend: Backend<BackendInContext = B>,
+        B: Backend,
+    {
+        GlobalGuard {
+            inner: self.inner.lock_with(context),
+        }
+    }
+
+    /// Try to lock this global lock with the provided `context`.
+    pub fn try_lock_with<'a, B>(
+        &'static self,
+        context: <G::Backend as Backend>::Context<'a>,
+    ) -> Option<GlobalGuard<'a, G, B>>
+    where
+        G::Backend: Backend<BackendInContext = B>,
+        B: Backend,
+    {
+        Some(GlobalGuard {
+            inner: self.inner.try_lock_with(context)?,
+        })
+    }
 }
 
 /// A guard for a [`GlobalLock`].
-- 
2.51.0

