Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32DF341ADA
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755634445; cv=none; b=q2TQdJRXa+q3EGi/c1wkMe0uiz2nPbCX9fcx5/XjDWLoRfJPxZPxaXlTX2bmZjl8ROgfma+nR9zzOECCY8yfuo3/lBMgjH18KcDgK9tfM1H6zlGuw9zskd4Rsq6rjsNEoYSXAoFavFDUfFrn2wF+zYYbMswI4YgiiMHv7wyxwL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755634445; c=relaxed/simple;
	bh=1namyJhBXNTlgxWA4Sts203ok2F3Onjou2+vIHGaWMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTnbxkgABBaIISw8CYo6tZ/jCH+wpytDy34gCHOSR/JlFDL2ROOqbxHfM8M+3otyuoBpEZhRG2rcWvVFPO+9rJMJOaqj96w7I4RJsRLBN01BwdNrHjKLNh3C88KLcoz2IPa9P+qk/l5BPkeupD1YMz+MwX5zlOBZ1IJiydwqOb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KKR64clm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KKR64clm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755634442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdZatwK7YZ40vNNmIn9rSFrBBk7bYVx1796BmwT3dbI=;
	b=KKR64clmAfiAHnlMS1cS7oPH3x+FJAYD+p8D18JAsHdiP/kqD5wnoWmQwvn9Q68iQVe+CW
	/D5/aC4VHTF3mFfQzcfXygWs7hxD+DakW4TKa++vubhZ7gaK4Qg+3/6olXlq7sKZQKCwL2
	rA4m1vBNx9460nGp3gdbjv7v8mnWmCA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-MlIwjDxdPEWfozbiMKVh_Q-1; Tue,
 19 Aug 2025 16:14:00 -0400
X-MC-Unique: MlIwjDxdPEWfozbiMKVh_Q-1
X-Mimecast-MFC-AGG-ID: MlIwjDxdPEWfozbiMKVh_Q_1755634438
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C42C11800294;
	Tue, 19 Aug 2025 20:13:57 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.81.238])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A830619560B2;
	Tue, 19 Aug 2025 20:13:53 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
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
Subject: [PATCH v8 3/7] rust: hrtimer: Add HrTimer::raw_forward() and forward()
Date: Tue, 19 Aug 2025 16:05:54 -0400
Message-ID: <20250819201334.545001-4-lyude@redhat.com>
In-Reply-To: <20250819201334.545001-1-lyude@redhat.com>
References: <20250819201334.545001-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Within the hrtimer API there are quite a number of functions that can only
be safely called from one of two contexts:

* When we have exclusive access to the hrtimer and the timer is not active.
* When we're within the hrtimer's callback context as it is being executed.

This commit adds bindings for hrtimer_forward() for the first such context,
along with HrTimer::raw_forward() for later use in implementing the
hrtimer_forward() in the latter context.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

---
V4:
* Fix the safety contract for raw_forward()
* Require Pin<&mut Self>, not &mut self
* Drop incorrect UniquePin example
* Rewrite documentation a bit (re: Andreas)
V6:
* Remove the reference to HrTimerCallbackContext::forward() until this
  function gets added.
V7
* Split up Timer::forward() a bit, apply Andreas's SAFETY comment
  recommendations

 rust/kernel/time/hrtimer.rs | 40 +++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index be1bad4aacaad..79fed14b2d98e 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -168,6 +168,46 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
         // handled on the C side.
         unsafe { bindings::hrtimer_cancel(c_timer_ptr) != 0 }
     }
+
+    /// Forward the timer expiry for a given timer pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `self_ptr` must point to a valid `Self`.
+    /// - The caller must either have exclusive access to the data pointed at by `self_ptr`, or be
+    ///   within the context of the timer callback.
+    #[inline]
+    unsafe fn raw_forward(self_ptr: *mut Self, now: HrTimerInstant<T>, interval: Delta) -> u64
+    where
+        T: HasHrTimer<T>,
+    {
+        // SAFETY:
+        // * The C API requirements for this function are fulfilled by our safety contract.
+        // * `self_ptr` is guaranteed to point to a valid `Self` via our safety contract
+        unsafe {
+            bindings::hrtimer_forward(Self::raw_get(self_ptr), now.as_nanos(), interval.as_nanos())
+        }
+    }
+
+    /// Conditionally forward the timer.
+    ///
+    /// If the timer expires after `now`, this function does nothing and returns 0. If the timer
+    /// expired at or before `now`, this function forwards the timer by `interval` until the timer
+    /// expires after `now` and then returns the number of times the timer was forwarded by
+    /// `interval`.
+    ///
+    /// Returns the number of overruns that occurred as a result of the timer expiry change.
+    pub fn forward(self: Pin<&mut Self>, now: HrTimerInstant<T>, interval: Delta) -> u64
+    where
+        T: HasHrTimer<T>,
+    {
+        // SAFETY: `raw_forward` does not move `Self`
+        let this = unsafe { self.get_unchecked_mut() };
+
+        // SAFETY: By existence of `Pin<&mut Self>`, the pointer passed to `raw_forward` points to a
+        // valid `Self` that we have exclusive access to.
+        unsafe { Self::raw_forward(this, now, interval) }
+    }
 }
 
 /// Implemented by pointer types that point to structs that contain a [`HrTimer`].
-- 
2.50.0

