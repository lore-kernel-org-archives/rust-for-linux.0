Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE1E33C52E
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 23:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772493741; cv=none; b=DKwmqMlnpo9NuGTRO/7/NEz0Rg4dfbX/AcO0N89CQLDXq6rLIeYq87YAivMT71m2f4kzMV447eJ14UZlMg1UhKHfAcNtR3XS9FpDOenxQsWEB69DctA5QuKWsZthPECATxd+Dz4qosYFd45vpPldnN2vLDZbe460u+dfuQAfh5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772493741; c=relaxed/simple;
	bh=FtduPcQuN67B07mfoqCm2h8MmkILZqnYUbXUIOFxkeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Qloge5OoLOfv6sEJPZoJQ0e9bblvtA4XxC+idaVO/btswwcv08fUJjHN5i+NlKe5gpfLT9Y/WjcCS+WXfgbgQxsjgYd6si9J2NcsVN2IPJbekxG3fcPcnAfVYNJjilqwUaLt3YWBbDHTO4hUCfwG+/qLgl6wCKpZ3OH7ke3v8f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gpl2JtF5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gpl2JtF5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772493739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=queoB1KrTbfe6g6V6rjQDB/Y4vpoSbPxULqnvxPZ6I4=;
	b=Gpl2JtF5vnom8PL+pXtsnzDmS4BS2inkK/AUKDbQnnl5cJ1oHX/OweSMVcaSdOzSDArOAZ
	lIngtpCJ77Ri3xbI5OzsM3oNM08K0fqXZWuv9goS/Blgpe9b2gsKm7w4mR+hHoNDiB0VsR
	HMYpJgME41CJX9eOq5kQpgQ7/w+fi+s=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-214-L2dq22t9NPCVt_AJMh_udw-1; Mon,
 02 Mar 2026 18:22:14 -0500
X-MC-Unique: L2dq22t9NPCVt_AJMh_udw-1
X-Mimecast-MFC-AGG-ID: L2dq22t9NPCVt_AJMh_udw_1772493732
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 61D7919560B3;
	Mon,  2 Mar 2026 23:22:12 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.90.7])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 37EDA1800592;
	Mon,  2 Mar 2026 23:22:09 +0000 (UTC)
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
Subject: [PATCH v19 3/5] rust: sync: use super::* in spinlock.rs
Date: Mon,  2 Mar 2026 18:16:46 -0500
Message-ID: <20260302232154.861916-4-lyude@redhat.com>
In-Reply-To: <20260302232154.861916-1-lyude@redhat.com>
References: <20260302232154.861916-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: ps235ZC0lWrhrYdms3rOK6BhE9WWSn1_2AlwJ5T0toQ_1772493732
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

No functional changes.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock/spinlock.rs | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index ef76fa07ca3a2..d75af32218bae 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -3,6 +3,7 @@
 //! A kernel spinlock.
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
+use super::*;
 
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///
@@ -82,7 +83,7 @@ macro_rules! new_spinlock {
 /// ```
 ///
 /// [`spinlock_t`]: srctree/include/linux/spinlock.h
-pub type SpinLock<T> = super::Lock<T, SpinLockBackend>;
+pub type SpinLock<T> = Lock<T, SpinLockBackend>;
 
 /// A kernel `spinlock_t` lock backend.
 pub struct SpinLockBackend;
@@ -91,13 +92,11 @@ macro_rules! new_spinlock {
 ///
 /// This is simply a type alias for a [`Guard`] returned from locking a [`SpinLock`]. It will unlock
 /// the [`SpinLock`] upon being dropped.
-///
-/// [`Guard`]: super::Guard
-pub type SpinLockGuard<'a, T> = super::Guard<'a, T, SpinLockBackend>;
+pub type SpinLockGuard<'a, T> = Guard<'a, T, SpinLockBackend>;
 
 // SAFETY: The underlying kernel `spinlock_t` object ensures mutual exclusion. `relock` uses the
 // default implementation that always calls the same locking method.
-unsafe impl super::Backend for SpinLockBackend {
+unsafe impl Backend for SpinLockBackend {
     type State = bindings::spinlock_t;
     type GuardState = ();
 
-- 
2.53.0

