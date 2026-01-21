Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1E544B660
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 22:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769035245; cv=none; b=TAeONsSRHwLIboFPVEC7RXhRCV6oCYUMRY92D8aLBE/TnlyojNfre/5uDNAGEOEH2JisIdJ29A6pVF8QEl4xrWtKA2qHanbQhBIAGAEMUYUyMxKrato76e6bIbLgETvePndjRI8eP/OFvFbstCTCPGc6McYFKMd8DOMZVWKTnZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769035245; c=relaxed/simple;
	bh=jYEhYiR53NTkASFrEoLvtRYV3OXJu419VRrXN2v20Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQEy8cpoYRhJvcceTPM86tEmZFtgiJ2iIQAAxfIyaMw+8Bk0bq5WqjlBPukAno2w3I/oVYMR6BGXJ/t1JeNmqIqkKrk+Lqaa8k6sgohLwSB6eDsCQcdNma224aOGEXZEeEkwbKJIqLVduuzFzQf8pgNbVyVMYCkiOVIljpaUIJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ixhcoXmc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ixhcoXmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769035232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=agOhoPMNGSPaudn75MF7RGkc647SmVXeIBBnTphmrDI=;
	b=ixhcoXmcIW20bn/w9cnl/4ki1SUQqWWsZ/KtAuL3+2vTKk/3S8imxbmeaOHDqw/TRDBlzy
	8g4ImvkyUgnbtaJXH2dUKu/Da+3KxFoikhf+svAbdq7Y8WzCBsdB2vMGhOetbyc85MosgL
	UONNDlN8i0ch1XmI5DwHKvNSWNEvbX4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-Bgp8SBuVMo2tjoWDnFLO6w-1; Wed,
 21 Jan 2026 17:40:28 -0500
X-MC-Unique: Bgp8SBuVMo2tjoWDnFLO6w-1
X-Mimecast-MFC-AGG-ID: Bgp8SBuVMo2tjoWDnFLO6w_1769035226
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D9A8D1955F34;
	Wed, 21 Jan 2026 22:40:25 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 583D219560AB;
	Wed, 21 Jan 2026 22:40:23 +0000 (UTC)
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
Subject: [PATCH v17 11/16] rust: sync: Expose lock::Backend
Date: Wed, 21 Jan 2026 17:39:14 -0500
Message-ID: <20260121223933.1568682-12-lyude@redhat.com>
In-Reply-To: <20260121223933.1568682-1-lyude@redhat.com>
References: <20260121223933.1568682-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

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
index 48a7cae86c50c..ce31154198cea 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -30,6 +30,7 @@
 pub use lock::spinlock::{
     new_spinlock, new_spinlock_irq, SpinLock, SpinLockGuard, SpinLockIrq, SpinLockIrqGuard,
 };
+pub use lock::Backend;
 pub use locked_by::LockedBy;
 pub use refcount::Refcount;
 pub use set_once::SetOnce;
-- 
2.52.0

