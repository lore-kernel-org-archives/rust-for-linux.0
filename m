Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF282DEA86
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 18:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764700115; cv=none; b=q+n6EXo2ujS7kAHPWOceksIAHP6N80GdLyaPQG3suNQUXrKA8NhKRbVii2GaVaeFRiryyNyIrwWmPJJv1wO1J/pRIUF9Vy+TLOkcWEcATGbTwuSLeEsN5GaGnZF6wAnQRVbUCeCIL6zxxYn3mupVmG+LlRx2Xwiv7cY/hcBm1cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764700115; c=relaxed/simple;
	bh=3jXt/fS4SI88qMIEkOpFGKsFIYm7WnyWCeahW0qmUdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EyVMeP6Ex3hGU5REVaGAAyZ8AwdfdlRvXXsVdHpE7HZvjk6o92g6O2J3GE7epOdeBW88QIZpiUnsLHPu2fqOPe9u73mV1QBuU8pbA93ftuwfrCqAcII3wfD9uuTqpQdmLLS83Yvop+1MiQYscVWo0dMsGtYTyAosbFwBHeB0sxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JtSQqBRE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JtSQqBRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764700113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pnEYgNaFDB1k958f3dYNKjGG3prgj19hu0N27iWNaAM=;
	b=JtSQqBREpA6pySRFnHdZC3i0P7oUau42b+i/kZnNAB8BvLRsfEbTSFL1j+YtLAKQbSnhs5
	kO9qKncQ588qNrcZhIlomgC2RuISNfDDEH7jWgPKCq/KyURQpIpjZQJjsHrE/n7knmBILp
	FRhc63rfTwY/sVY27El8zWePnTnR42Y=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-248-OvAE50XNNZS94w93K49X-g-1; Tue,
 02 Dec 2025 13:28:28 -0500
X-MC-Unique: OvAE50XNNZS94w93K49X-g-1
X-Mimecast-MFC-AGG-ID: OvAE50XNNZS94w93K49X-g_1764700105
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7CFEB19560B2;
	Tue,  2 Dec 2025 18:28:25 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.80.109])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B23F419560A7;
	Tue,  2 Dec 2025 18:28:22 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v15 15/16] rust: sync: lock/global: Add BackendInContext support to GlobalLock
Date: Tue,  2 Dec 2025 13:24:23 -0500
Message-ID: <20251202182720.125884-16-lyude@redhat.com>
In-Reply-To: <20251202182720.125884-1-lyude@redhat.com>
References: <20251202182720.125884-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Now that we have the ability to provide an explicit lifetime for a
GlobalGuard and an explicit Backend for a GlobalGuard, we can finally
implement lock_with() and try_lock_with().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock/global.rs | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 31264b68086b3..20fbe11d1a04b 100644
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
2.52.0

