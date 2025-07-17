Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C827B213254
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Jul 2025 18:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752777840; cv=none; b=MY9QKDvKNtEhRBoppAve9X6ZXYXAvtMudC27ro0y3/OuWXweXSFMAt2ImFx5hMTCbywwcRu7BfAJJicAAcEkFbhuUSs0V3oRs8aSxprF1Kj101UH9e5PFZ9whZffojhL4JeyRdf32X0lS9ATDfCycIlnECyhz7m+AidKFJdEVbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752777840; c=relaxed/simple;
	bh=Z/KsvQ6Y/wJKZS0BbwqV/seBZ03+nXz5MF2MZWzZ5v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EquTeOAavK0pPQf74RzUcZDwxyUlm3KcKaTJdfLZZKuo3AD3j5scUNOP/1QxInDyZykxMuQE0NTwb5H50KZ9c1LvbtPRrtCKciGksRsgLCXCgy3w4IFVk4QAuRdC38wCUqBWBebQcjD8+bIPKaLMXHn7CcWvw6LyeQcDNqt86/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C8q65SYr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C8q65SYr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752777838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jakQ+WDo02nJsU8eZCe9vTA6HfZAByvZlMl+Y4AFmA=;
	b=C8q65SYr/VE8h8zE7vYSaUHIb95zOL/mLnCw9Jc5vfjj5eofSOHei6VAugC709VAdwLYtX
	U36fU/IWQ0AU5Jl4ib7pO6zehzqsw+tt6aT4dvdggQFAihCzqMBfttMN7eUoeDlqhW1gqh
	65O+y1y5CLp3qNiL0wfXolr4Jq0LCZc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-rjP8F9YsMoCY8gWxuuR4mg-1; Thu,
 17 Jul 2025 14:43:52 -0400
X-MC-Unique: rjP8F9YsMoCY8gWxuuR4mg-1
X-Mimecast-MFC-AGG-ID: rjP8F9YsMoCY8gWxuuR4mg_1752777830
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 149B71800D82;
	Thu, 17 Jul 2025 18:43:50 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.66.69])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C8A431801712;
	Thu, 17 Jul 2025 18:43:46 +0000 (UTC)
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
	Viresh Kumar <viresh.kumar@linaro.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: [PATCH v11 11/14] rust: sync: Expose lock::Backend
Date: Thu, 17 Jul 2025 14:38:03 -0400
Message-ID: <20250717184055.2071216-12-lyude@redhat.com>
In-Reply-To: <20250717184055.2071216-1-lyude@redhat.com>
References: <20250717184055.2071216-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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
index f1e448e096ea9..ebf004193bca5 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -25,6 +25,7 @@
 pub use lock::spinlock::{
     new_spinlock, new_spinlock_irq, SpinLock, SpinLockGuard, SpinLockIrq, SpinLockIrqGuard,
 };
+pub use lock::Backend;
 pub use locked_by::LockedBy;
 
 /// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
-- 
2.50.0

