Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B6A1EF39F
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 18:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753383182; cv=none; b=OISB2oFTVnK4L8cewKbIMHBxZVudmV7suALEJIwhAlegVJ7/6m5uPEQ456Rhw7Ab2fv/8wjWPeUjydwl5KZzqJpz8Zvmno4nWvRfKvFdiGRaAWA8bcSQwxmiS5HDZF198/gPmXbLVW4Sa6WkJIZWC/HcEeQHpmhvPjnoZhnK7iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753383182; c=relaxed/simple;
	bh=buq/LJ7NlW/eSGAnORvj1c33aVLpLK+UF8CGoiyYQKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BOPNwNVriszYjj3CwEKUSznxVlnmqGUnNXchsC65e3+8xfTG9DEFFVcx2ZbbNXYxY7dC8u1Ge/vxOKtr+bcXumqkFDMHnRYEL8hwcgz9DWGfhhtYRUYD7uQZ3qAjdHVW1SiYwqvsTlk4LDQCwkkyoHHQpT/K8ir9jG2QsIfIrmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wh2P2mBQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wh2P2mBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753383179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XMg+SaGb5U8haz1IPUXEUUgFHsFXFQTxpkFsDHgvE74=;
	b=Wh2P2mBQxJ4Lg1eFe7z0rZs6MWSjyCP8h8uk+7tBRue+Lhm78sCWulK5op4tRIrdtf+p4K
	nW2AYv/yxjcmkuUKewKm0Dil7tgq6GBrfRTChjOI+bkoc1VhaJVkmHSBQ7BXeHxNGP9Aih
	7mMWCjcwwlArEd07J2MFUtiP96VyFzk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-fRlSlkTtPuGT0v6azaEgVw-1; Thu,
 24 Jul 2025 14:52:54 -0400
X-MC-Unique: fRlSlkTtPuGT0v6azaEgVw-1
X-Mimecast-MFC-AGG-ID: fRlSlkTtPuGT0v6azaEgVw_1753383171
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0ADB01955D86;
	Thu, 24 Jul 2025 18:52:51 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.88.223])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D83311956096;
	Thu, 24 Jul 2025 18:52:47 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
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
Subject: [PATCH v6 2/7] rust: hrtimer: Add HrTimerInstant
Date: Thu, 24 Jul 2025 14:49:28 -0400
Message-ID: <20250724185236.556482-3-lyude@redhat.com>
In-Reply-To: <20250724185236.556482-1-lyude@redhat.com>
References: <20250724185236.556482-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Since we want to add HrTimer methods that can accept Instants, we will want
to make sure that for each method we are using the correct Clocksource for
the given HrTimer. This would get a bit overly-verbose, so add a simple
HrTimerInstant type-alias to handle this for us.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 6bfc0223f4f57..be1bad4aacaad 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -72,6 +72,11 @@
 use core::marker::PhantomData;
 use pin_init::PinInit;
 
+/// A type-alias to refer to the [`Instant<C>`] for a given `T` from [`HrTimer<T>`].
+///
+/// Where `C` is the [`ClockSource`] of the [`HrTimer`].
+pub type HrTimerInstant<T> = Instant<<<T as HasHrTimer<T>>::TimerMode as HrTimerMode>::Clock>;
+
 /// A timer backed by a C `struct hrtimer`.
 ///
 /// # Invariants
-- 
2.50.0

