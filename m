Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB151C75E6
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 22:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732142111; cv=none; b=b9kUK4FhD06sbrrwYk+hP0fLpvyKPoCQzVdYL9FL8XpuXbHDUvHhQ+P5u+8WZOfbHZmCkHtDuo3qjMR7HZPkgdCQhMQThwb4qr3TWQfdUQwQKQeqrl7fGZlUAVKHGOpt+nFdwbwMH2kW/Tf8Pk9MEZylL0SpeUQJbfATXGk3tJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732142111; c=relaxed/simple;
	bh=AGuP6mqqY+U5SSoIM8xoU5UdQdxc7DGikyZUA1QDfq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WolqkLl9ipRg0xFYGEdV/VMH2/xw/bdveDqdLqSVemzLzK4Q3UMD0J+7N/4Fur2WOQwUH5qlxrZNV9QeJk/pXyytV3a7pD2CsmrvD6YRdWwXfZNAwF5Cq2ZEBtksgJ44CQe3HkBh+uLYdrPSVguMnSdP3LqNSobCB8odICduUXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MMux09Q/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MMux09Q/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732142109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TNvpkGFx/SLAIqcHoBd5o9UWLGuGk4c6Qh+E6yKcoe4=;
	b=MMux09Q/ILGOTcnGN9Kiyqt+dvvOGnuatZQMJS8bYHtlwrYif08BnLZ2bCkfi9eO1n2vaH
	1pGf0NGlit1wChh+EV/DMRMV1TgnrkAlXNQ+KeBUZ4W9tLnmekbMNfJ3xLWCr6VLK7HVOi
	39saeJRutAGji43surE6M5x2yRoQB0E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-301-6gnIxnq5Od6mkmVhuPlRZg-1; Wed,
 20 Nov 2024 17:35:05 -0500
X-MC-Unique: 6gnIxnq5Od6mkmVhuPlRZg-1
X-Mimecast-MFC-AGG-ID: 6gnIxnq5Od6mkmVhuPlRZg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E803A1956088;
	Wed, 20 Nov 2024 22:35:02 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.12])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C3200195E480;
	Wed, 20 Nov 2024 22:34:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Filipe Xavier <felipe_life@live.com>
Subject: [PATCH 2/3] rust: sync: Assert Lock::is_locked in Guard::new for debug builds
Date: Wed, 20 Nov 2024 17:30:42 -0500
Message-ID: <20241120223442.2491136-3-lyude@redhat.com>
In-Reply-To: <20241120223442.2491136-1-lyude@redhat.com>
References: <20241120223442.2491136-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Since we're allowing code to unsafely claim that it's acquired a lock
let's use the new Lock::is_locked() function so that when debug assertions
are enabled, we can verify that the lock has actually been acquired.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 542f846ac02b2..0a7f2ed767423 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -244,10 +244,17 @@ fn drop(&mut self) {
 impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
     /// Constructs a new immutable lock guard.
     ///
+    /// # Panics
+    ///
+    /// This function will panic if debug assertions are enabled and `lock` is not actually
+    /// acquired.
+    ///
     /// # Safety
     ///
     /// The caller must ensure that it owns the lock.
     pub unsafe fn new(lock: &'a Lock<T, B>, state: B::GuardState) -> Self {
+        debug_assert!(lock.is_locked());
+
         Self {
             lock,
             state,
-- 
2.47.0

