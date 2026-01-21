Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A425544BC8C
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 22:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769035233; cv=none; b=GrgeZpM+lssvZejt+qBGenZpoFNprKbXETRv3sapIVYThf797amoJlMmTidrw1QHYrRcKYxjjMRk5cL6DWoDenhMUgUugrxBqtJP0VsOkF685rktEHVwcCQtoau7CYwLTOsgMNLhgBHUgUxsn39+yHW9hQA2Nv1TV+EGStuJnrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769035233; c=relaxed/simple;
	bh=Z0piJ2uMHqJvLowyoCX36ouM9fy0bcmA2oM/iZMlUr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbz8cNlH45voKhA/+b4U+maLospEYXp93ukt0AuWTXs/0mwCD767Uf3oonCXQVGfcay1vuPAJBjxXOSQBqRRYzs6h2i8VZ7NE3nmDp9jBx6zDMwDZ/NDdMC7Mp/ou+2lKQO+u3n1JUjYtj+aTbR6TTu0rMEQ2N4eOv1xixLQwQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jVZq9cxk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jVZq9cxk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769035224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ctsqKiNbu9tw0Co3r3NlUOa+U4FB32iqwclFHrHc7RQ=;
	b=jVZq9cxkj1iKRlXgV1zhbvwV1gsa9sRTFCEjPhnmCbTu5JyyBAT0YfcS6+PmgSVsGjxcYe
	IQqGC++Oo2Fb4DMPIeDE5VazV+SIDyXkCUg5H4H6taWwBRMS665KmfqusUNbjBEX4699yK
	HGau1RJIQD/iMFIWu+EkwYlCQGBKm7Y=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-458-XohwArc_PB6s9h9FGNmWrQ-1; Wed,
 21 Jan 2026 17:40:20 -0500
X-MC-Unique: XohwArc_PB6s9h9FGNmWrQ-1
X-Mimecast-MFC-AGG-ID: XohwArc_PB6s9h9FGNmWrQ_1769035217
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE3C31954234;
	Wed, 21 Jan 2026 22:40:17 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E361619560AB;
	Wed, 21 Jan 2026 22:40:14 +0000 (UTC)
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
Subject: [PATCH v17 08/16] rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers
Date: Wed, 21 Jan 2026 17:39:11 -0500
Message-ID: <20260121223933.1568682-9-lyude@redhat.com>
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

From: Boqun Feng <boqun.feng@gmail.com>

spin_lock_irq_disable() and spin_unlock_irq_enable() are inline
functions, to use them in Rust, helpers are introduced. This is for
interrupt disabling lock abstraction in Rust.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/helpers/spinlock.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
index 42c4bf01a23e4..d4e61057c2a7a 100644
--- a/rust/helpers/spinlock.c
+++ b/rust/helpers/spinlock.c
@@ -35,3 +35,18 @@ void rust_helper_spin_assert_is_held(spinlock_t *lock)
 {
 	lockdep_assert_held(lock);
 }
+
+void rust_helper_spin_lock_irq_disable(spinlock_t *lock)
+{
+	spin_lock_irq_disable(lock);
+}
+
+void rust_helper_spin_unlock_irq_enable(spinlock_t *lock)
+{
+	spin_unlock_irq_enable(lock);
+}
+
+int rust_helper_spin_trylock_irq_disable(spinlock_t *lock)
+{
+	return spin_trylock_irq_disable(lock);
+}
-- 
2.52.0

