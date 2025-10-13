Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913D130F953
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 15:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370896; cv=none; b=VSNfkLmw5BjzGm4sDd6G7F5wQq4JtyMtIgDux7lVSmpCnT8Nmw/r/VVLLNFJLn8tonKAAmyLb4j8HaPjW8lWphQaUJ0gPnsswfFHAd4XBYqjTYQOmuaFwBXtRkP6cuq+NlyKpc7sWNvb0fwA7tXdClS+BnqjrnufC3OqUXUjFc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370896; c=relaxed/simple;
	bh=TW7CS6Qsw+aLPc6lMbQGdFy69oe9GTP0J1/W+/vIvvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJWJChXVKvdKg3YIQyIOr14bSDmlEh9EWBVuD1awsymxvuk8q6GOWnKwaG8v34gEBZvCp4sVOiOY0NcF/lm1lQ660j7Kpp7HTGCz4lEjWHMhNVs9H5/eZBirhkQYG6/VmUoxVcVAyIItmlfJshnQY0ORRdQd4PcH7DyPYp0EHlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MRNRmXzB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MRNRmXzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760370893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yYVXlVAo1VL3f8OamE57FZQqo5mYq7IRNQ67P7LbgHk=;
	b=MRNRmXzBNtC24bWWFp4GwwTl5yQXjZTjv5eKJXEBMyMbPULV2nieK6LRJ3xFqWKc+gf+4X
	of27KRBOd+//mchFme/JPi3kao/jAjUUpMVZLxQi2CxSvh27iN07tePfBfeTu0886KCj8K
	+VMqfcQL8nrPgKc0RP0hl/2Lchv6SAg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-efPyUXQaMpiV_Q4bukenUw-1; Mon,
 13 Oct 2025 11:54:51 -0400
X-MC-Unique: efPyUXQaMpiV_Q4bukenUw-1
X-Mimecast-MFC-AGG-ID: efPyUXQaMpiV_Q4bukenUw_1760370889
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1E5AD18004D4;
	Mon, 13 Oct 2025 15:54:49 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.81.1])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2E48E3000383;
	Mon, 13 Oct 2025 15:54:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH v13 14/17] rust: sync: Expose lock::Backend
Date: Mon, 13 Oct 2025 11:48:16 -0400
Message-ID: <20251013155205.2004838-15-lyude@redhat.com>
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
index f293bbe13e855..795cbf3fc10f7 100644
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
2.51.0

