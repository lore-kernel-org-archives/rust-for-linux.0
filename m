Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6702DCC08
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 18:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764700106; cv=none; b=EOpBQosd/jHVE1FF0tUgFnsM9Y+5oZfbBg2smfFSrp63JErOa5NjnZA7wtH6DfHH6bgWsNKu8/ofF6m3LWenghJS3nDQX/diskK+sY7g9wHszos8Q2gT7GvdBdoNhir1MBO+3zdip+jJqSmPkCs4RSzaaMlQRgIp0ZhLEOzbG9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764700106; c=relaxed/simple;
	bh=nCFXarMFa586dGrcNAs0jKPT2h0FKQUvMN9FU4ejyb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIHWtN1qOkcabn5iU5P1R0nJAXtAmmYBILxRVMww64J7T2Jq29goqiVekKeenvS7RDQX6ngvQrFwuBWQSvI9fSBBMxbGjbUw6JUobnpM3En3V7p5ctlCvWkR3o66W+r+CIYgRP6Xdl5gv9j9LIa4fzw6VIyEaSr23HpPHQgEr3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dcqoT63z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dcqoT63z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764700104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tH4YX3T1TRr9YuPAznqrV8AK+8NwB79iZ5r++1p2W4k=;
	b=dcqoT63zhrLL64nw9kr/jroaGqyqx4WuJXaWfLB4iB1xMRDZajViIPKYt9GC/mXbQnwYRs
	RjwKb3IpEkvJ7TupIVdHRqZFmpdQZH96+MnIfkxLnURRkneRsrela7ZS1FBavjBInzrF1B
	5vgiTWsNkMq7Mxr0Znx0FP1ecy/VG0I=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-NYev_AMkMECMTpff8WUocg-1; Tue,
 02 Dec 2025 13:28:22 -0500
X-MC-Unique: NYev_AMkMECMTpff8WUocg-1
X-Mimecast-MFC-AGG-ID: NYev_AMkMECMTpff8WUocg_1764700099
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C45151956088;
	Tue,  2 Dec 2025 18:28:19 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.80.109])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3928219560A7;
	Tue,  2 Dec 2025 18:28:17 +0000 (UTC)
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
Subject: [PATCH v15 13/16] rust: sync: Expose lock::Backend
Date: Tue,  2 Dec 2025 13:24:21 -0500
Message-ID: <20251202182720.125884-14-lyude@redhat.com>
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

Due to the addition of sync::lock::Backend::Context, lock guards can be
returned with a different Backend than their respective lock. Since we'll
be adding a trait bound for Backend to GlobalGuard in order to support
this, users will need to be able to directly refer to Backend so that they
can use it in trait bounds.

So, let's make this easier for users and expose Backend in sync.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 847edd943c457..e4604d21c884a 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -29,6 +29,7 @@
 pub use lock::spinlock::{
     new_spinlock, new_spinlock_irq, SpinLock, SpinLockGuard, SpinLockIrq, SpinLockIrqGuard,
 };
+pub use lock::Backend;
 pub use locked_by::LockedBy;
 pub use refcount::Refcount;
 
-- 
2.52.0

