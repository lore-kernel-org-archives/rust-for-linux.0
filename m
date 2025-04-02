Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D601F3BA2
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Apr 2025 21:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743630087; cv=none; b=IK9FarvWTpCy8ON8fxbb18gJAJ5bgCDS5+t6tGyabVB8g3BS4bUMSBsQsD6hsBrm0GoIvCunyd/Y5iG0TvCRm9DRy7UggsV3ibLedhP1J5GMpAbZwyQZc+phG4Yr046Fx1dYMAmeo0pA20hdChARgmGnE9zqGQWWmtYya27BUuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743630087; c=relaxed/simple;
	bh=9webYGdM454gxtHw9y7UrGofp4nqbdgFdzB3cD24yeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTT717mRbTGBURgpJVEon0nPWDGgWDzo+0NkpoKLXfnGBKayEYlU5zjoipHgkB3Djh89dvX6POSQ3lMdOhoPd856J15usX6jg7fLBhT6G7pIWd/PUkfMkoJPHATTquU9ywiydl7dWp3AoXwr+JvwBQjfJt3FBo00A2YxVokJeWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QqK2Ypy9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QqK2Ypy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743630084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3S6L929NhUPmTnaNjv1n/DKXagAZ0HAL3Zw31NDUF20=;
	b=QqK2Ypy9slhk8EGilmOOdnIjeayNzi9qN7Div/le17g5i+xSf7YZh3KRS6dAbAdnNh2RfH
	TFHkjORGASb6ole2z0VcWjaRUX/iDZ40l53eh9zFIHJ7hHpni4cZqrpewWWEj1tGXdKRKn
	nb+4dzG5OXDp/Sr7r35krLYy564wRMM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-413-mcQub3grOKWXvSpXfTPCdg-1; Wed,
 02 Apr 2025 17:41:23 -0400
X-MC-Unique: mcQub3grOKWXvSpXfTPCdg-1
X-Mimecast-MFC-AGG-ID: mcQub3grOKWXvSpXfTPCdg_1743630081
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7EB2C195608B;
	Wed,  2 Apr 2025 21:41:21 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.80.95])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ABB1D3000704;
	Wed,  2 Apr 2025 21:41:18 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 1/6] rust: time: Add Ktime::from_ns()
Date: Wed,  2 Apr 2025 17:40:29 -0400
Message-ID: <20250402214109.653341-2-lyude@redhat.com>
In-Reply-To: <20250402214109.653341-1-lyude@redhat.com>
References: <20250402214109.653341-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

A simple function to turn the provided value in nanoseconds into a Ktime
value. We allow any type which implements Into<bindings::ktime_t>, which
resolves to Into<i64>.

This is useful for some of the older DRM APIs that never got moved to
Ktime.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index f509cb0eb71e0..c05afda07a05f 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -1,5 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
-
+// SPDX-License-Identifier: GPL-2.0 
 //! Time related primitives.
 //!
 //! This module contains the kernel APIs related to time and timers that
@@ -9,6 +8,7 @@
 //! C header: [`include/linux/ktime.h`](srctree/include/linux/ktime.h).
 
 pub mod hrtimer;
+use core::convert::Into;
 
 /// The number of nanoseconds per millisecond.
 pub const NSEC_PER_MSEC: i64 = bindings::NSEC_PER_MSEC as i64;
@@ -65,6 +65,12 @@ pub fn to_ns(self) -> i64 {
     pub fn to_ms(self) -> i64 {
         self.divns_constant::<NSEC_PER_MSEC>()
     }
+
+    /// Creates a new Ktime from the given duration in nanoseconds.
+    #[inline]
+    pub fn from_nanos(ns: impl Into<bindings::ktime_t>) -> Self {
+        Self { inner: ns.into() }
+    }
 }
 
 /// Returns the number of milliseconds between two ktimes.
-- 
2.48.1

