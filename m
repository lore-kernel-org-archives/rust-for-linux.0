Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFE825178B
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746647; cv=none; b=b1JU7LapAwgc8sDUYt17Ox4iG3OpUvLy6X+6wDu1N52icDwTNcilDqmhMoLQK3zaIPncf7G/JHImHAtyDd3JcT7EmFNLY74CCF3JJFveQeT6CuOAr+xAyh8Abq9izQe5J0QamUscq0tSF+ycYbU3d/Cbv8XED4Habdf4PIQ92Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746647; c=relaxed/simple;
	bh=BbdWQ0YbkE2htZOld0PCHaFrACpyTKErMgewUedBg3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IYa4lzP3+BzyRqjgY6uaYXkVYbj9oywOXUb4lLnfyUFXlsIFaqmETN2XGfIpuyx43kFI8KdPDuyiT1mQYyx+pa6IMoCM8IGdgBTPESuoXXQdXRwYH+Ch/8s5XvqiuVWN1Nnh2pRYKSDFv63SCQ1HAmMMqDzkx5KklSF8+yoBClE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AkmZ82Ci; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AkmZ82Ci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744746645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9caeaEvOrQMjWI6dFVaM+47fZcpqeIYiQQAHDs+mWKA=;
	b=AkmZ82Ci4egzmcwcMQaRijfy68Jm8CvZd9XNb5LH44DnS298LKgd2M1IYgNzuDB5dfYqDG
	SDOzrY9EfUBLTw/wN/rBJWtYidLgVGoeSMjLx6hYGLpH3F25qTUCmZNLETH/ZECDMV3vKZ
	7Jm58DWCF67u+K67sSlF0Y4DUxcO0k0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-446-K2_kQgv8NMaDj3e4fNMfLw-1; Tue,
 15 Apr 2025 15:50:39 -0400
X-MC-Unique: K2_kQgv8NMaDj3e4fNMfLw-1
X-Mimecast-MFC-AGG-ID: K2_kQgv8NMaDj3e4fNMfLw_1744746637
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0C3D518007E1;
	Tue, 15 Apr 2025 19:50:37 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 924A519560AD;
	Tue, 15 Apr 2025 19:50:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Boqun Feng <boqun.feng@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 2/8] rust: hrtimer: Add HrTimer::raw_forward() and forward()
Date: Tue, 15 Apr 2025 15:48:23 -0400
Message-ID: <20250415195020.413478-3-lyude@redhat.com>
In-Reply-To: <20250415195020.413478-1-lyude@redhat.com>
References: <20250415195020.413478-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Within the hrtimer API there are quite a number of functions that can only
be safely called from one of two contexts:

* When we have exclusive access to the hrtimer and the timer is not active.
* When we're within the hrtimer's callback context as it is being executed.

This commit adds bindings for hrtimer_forward() for the first such context,
along with HrTimer::raw_forward() for later use in implementing the
hrtimer_forward() in the latter context.

Since we can only retrieve a &mut reference to an HrTimer<T> in contexts
where it is not possible for the timer to be accessed by others or
currently executing (e.g. a UniqueArc), a &mut is actually enough of a
guarantee to safely fulfill the C API requirements here.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index bfe0e25f5abd0..aadae8666f7ea 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -68,7 +68,11 @@
 //! `start` operation.
 
 use super::ClockId;
-use crate::{prelude::*, time::Instant, types::Opaque};
+use crate::{
+    prelude::*,
+    time::{Delta, Instant},
+    types::Opaque,
+};
 use core::marker::PhantomData;
 use pin_init::PinInit;
 
@@ -164,6 +168,36 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
         // handled on the C side.
         unsafe { bindings::hrtimer_cancel(c_timer_ptr) != 0 }
     }
+
+    /// Forward the timer expiry for a given timer pointer.
+    ///
+    /// # Safety
+    ///
+    /// `self_ptr` must point to a valid `Self`.
+    unsafe fn raw_forward(self_ptr: *mut Self, now: Instant, interval: Delta) -> u64 {
+        // SAFETY:
+        // * The C API requirements for this function are fulfilled by our safety contract.
+        // * `self_ptr` is guaranteed to point to a valid `Self` via our safety contract
+        unsafe {
+            bindings::hrtimer_forward(Self::raw_get(self_ptr), now.as_nanos(), interval.as_nanos())
+        }
+    }
+
+    /// Forward the timer expiry so it expires at `duration` after `now`.
+    ///
+    /// This is mainly useful for timer types that can start off providing a mutable reference (e.g.
+    /// `Pin<Box<…>>`) before the timer is started.
+    ///
+    /// Note that this does not requeue the timer, it simply updates its expiry value. It returns
+    /// the number of overruns that have occurred as a result of the expiry change.
+    pub fn forward(&mut self, now: Instant, duration: Delta) -> u64 {
+        // SAFETY:
+        // - Self is a mutable reference and thus always points to a valid `HrTimer`
+        // - The only way we could hold a mutable reference to a `HrTimer<T>` is if we have
+        //   exclusive access to it, which means the timer is either idle or we're within the
+        //   timer callback context - fulfilling the requirements of the C API.
+        unsafe { Self::raw_forward(self, now, duration) }
+    }
 }
 
 /// Implemented by pointer types that point to structs that contain a [`HrTimer`].
-- 
2.48.1

