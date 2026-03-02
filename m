Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D7032D452
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 23:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772493734; cv=none; b=TTUfPWbEFMTGlBz/kk/h94PxGLHPHfUVpVN9UjcmetTqviNsk20KLMqF8beNkU04vVdf0lj6qUHhtRn8Uruaiyulm7Q5JyCRw4t26TsgKbs3J/fDuIgBD+mm1B5HiPpy8QXezBUzVUAnYBftmXHgGxPqtujVMu/FBw2lbM6TImU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772493734; c=relaxed/simple;
	bh=bvCr0Saitthxj2ep+wh5L/uK1km7wUmINqCqZdFngSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=GHjE3RoUmL0wezLouIZoJOvbxpOrHrxG1X3EGmGx4ySFJuqRf+GYfXMaZQBWckPTEq4l9Pj8yf/3a7kNnjTCNFUY4cbBkrhz98+iERyVP6EYLSgHGsA1gP3taKEhcYYkI8VPxhbGahYuTi5Go+6ZpWxcim08t5IGNIdqvfogLVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YQNxL8bW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YQNxL8bW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772493732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cw1104JwFhpiodp1jbnaW3D6iNV0JBRJeYkCVp6AF2w=;
	b=YQNxL8bW7xZdvUaQ8c2z18QbbPwC5Vlgl/ibcd7QIKJlxJlBw9C2hKvDJFOPs/4QtG6S97
	//ZXYGUJWNdA/lk0iRUC4yr2pxUe6/izv4iARrIbBxJlC/mRJzeUUcHrXYUBBfO0ER2RPF
	CfJenuCknWcEmgG99r3u6usW6X25T10=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-5A9awEesNkyHbHOJqxfVgg-1; Mon,
 02 Mar 2026 18:22:11 -0500
X-MC-Unique: 5A9awEesNkyHbHOJqxfVgg-1
X-Mimecast-MFC-AGG-ID: 5A9awEesNkyHbHOJqxfVgg_1772493729
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D2BF195609D;
	Mon,  2 Mar 2026 23:22:09 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.90.7])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DF9A01800296;
	Mon,  2 Mar 2026 23:22:05 +0000 (UTC)
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
Subject: [PATCH v19 2/5] rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers
Date: Mon,  2 Mar 2026 18:16:45 -0500
Message-ID: <20260302232154.861916-3-lyude@redhat.com>
In-Reply-To: <20260302232154.861916-1-lyude@redhat.com>
References: <20260302232154.861916-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: NZnnhyx2kZcKNpfZtDRbSN_Z3WSuTfeeP6UUOTqTcx4_1772493729
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Boqun Feng <boqun.feng@gmail.com>

spin_lock_irq_disable() and spin_unlock_irq_enable() are inline
functions, to use them in Rust, helpers are introduced. This is for
interrupt disabling lock abstraction in Rust.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>

---
V18:
* Add missing __rust_helper annotations

 rust/helpers/spinlock.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
index 4d13062cf253e..d53400c150227 100644
--- a/rust/helpers/spinlock.c
+++ b/rust/helpers/spinlock.c
@@ -36,3 +36,18 @@ __rust_helper void rust_helper_spin_assert_is_held(spinlock_t *lock)
 {
 	lockdep_assert_held(lock);
 }
+
+__rust_helper void rust_helper_spin_lock_irq_disable(spinlock_t *lock)
+{
+	spin_lock_irq_disable(lock);
+}
+
+__rust_helper void rust_helper_spin_unlock_irq_enable(spinlock_t *lock)
+{
+	spin_unlock_irq_enable(lock);
+}
+
+__rust_helper int rust_helper_spin_trylock_irq_disable(spinlock_t *lock)
+{
+	return spin_trylock_irq_disable(lock);
+}
-- 
2.53.0

