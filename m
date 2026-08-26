Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0440449B3E
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761747; cv=none; b=TYJKk3G4Aji0FENe7GrybswSQLRjX55Dj6AEq3ns/LPnixXZUBOj7V/NJTFwnYCV+61RInBvJR3b4pqk9IKmykXA4w87c28gDNZFIPGXKkHVMeSeHsdM0fih5taAKTk0lRtDaTDZ7g1/tRK7iL8Ta/GsYagW0bG3ic87lNOofZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761747; c=relaxed/simple;
	bh=fTVvVk81ynAffc0k/k5/DCkE6DkwKY1g6XnSaPq0lz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPhtItgY52fg5wzrK5SwDdig26WZZjtyFFoMd1OL1HA08i2d++1V0zMDiLM5zXkJmHglf7Cwj6g8UHzGRTPXthjDa6jqv01PnxRY6kE93Qmd4ZIWAzsu3ZFHgPlbYvEZVkri7spxpuZ20oNFOU07AapHwSud5FEXv2fTMs327kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ON3iKcO7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ON3iKcO7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4957eefd361so7060175e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761744; x=1788366544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cNOKwZXAn5eEkB9XwdUz0WDi3fVIP35Kd00N6vEi/ws=;
        b=ON3iKcO73vVJf3FZmxfvDx3M4A3t8DrzzF7hAktPLuhuxKddP22nnVRPfTizAx29je
         rdx8QthsfSx3xeaQ846UxRhvoCKteqKQxptRY+K5eqO44GpaqlpIpyHX1soP3mkbI028
         xgq6/nrooGZcONY2Y1/Kf5cWSEFK5tBwoCm0zkR055ljNV0TADEXl6+uVFhadwkJNi00
         6BRD5iRfbk/+TdWIVxQhRXB1dGpROsL+2uztX23FovxwsM4sAvBsCkIlfhEW23VdFl5l
         VO30x+hZkAYKtSMW7DwTo9oOk4OsEstt9F70RqIdkjcB5oFjZiD0+2PBYcF8GFBt/J/I
         qrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761744; x=1788366544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cNOKwZXAn5eEkB9XwdUz0WDi3fVIP35Kd00N6vEi/ws=;
        b=QyhebHH8i781pFi0uoU106fJ0Y5WKNZFgntiLPVe3cnsC7AzQe62P+43w/TZwnEEur
         hHgkATAGdqT1x9WLRsc+IvwDDpuy9i5O+fDyFLMBPBd+8hyo+y7OLeXCIrK3k8t4/rI0
         db66PvhxBJrGjZXNPdcdmAC22+p5TGftEhlT1TEhuKVJR7vg2tGo3AWAOOwwYFZaMZBl
         nWiFiu4N5972Edrv6CF/wf6JGLP150fiMx0CUBPvaKD9ea73T/mtXRg9LnXtgepELVY+
         elphiW2JIB68WxaTNLLmC94LYQusIc+sOdOvQay0fEsa7yMzLibShv/GtKgC/o9pHuhj
         vPlg==
X-Gm-Message-State: AFuF++kOZhbzkgFJut8fTPkNbsimb6zjPSYKrFQxzEfCmby25ixBbmAe
	qHoOnQkitV4VvSf8i1OGjBHJP4S91+PJZH7Z9rzTbJpihEQQ9C7d+oYTnfvGwC07q7uSDscy5F0
	jQdijOpHP
X-Gm-Gg: AR+sD11XFPSuZCGn3YE57sCvBCSVRkfpQPbRJ0Fq4DEdILHOeMtBDOZGbT9FTeZioYA
	vs/izHP8YTuX97Lshjqs/gLV2TEynVBolZQXPCyM27Bfki6zpOg6naBi7BuKg1Yu4q4NMleiH7X
	KZ+c7T9nIUiRWBXonL3SoIaWXExC+HAwqsW3hTEkBOhj2PYeTJSRoHahNnXF48ZHs9LRAyvJeLK
	vQgNdvpjXnPDHYbx/UlkynclE93+IwOksSyZrvCOQ/Bu05/Z8mYyrtyzFlwA8M27GfxotYo7whX
	DpqflDBPk6qneNI74WhNKhm+/fFLmAiE52hd2Q+UmnhW4xcV6JWCCdcGs3A0piZ0HI8tUsmhwnr
	G+KfEAZlwtiO4KVCg4m/cLA5qu/6gIN04Sb8LhqEh8AZ8pe8jhH1ZhU0JL2GDxijfkcAeebjQMp
	Lk17m3t1OfZ54D6uNiTIJZQmmqlI6H7OJ5ttueGof/N/9S3XUsl7vDcU5LGlvb8uo2VsWkK6xBC
	trtxqDOzxVx7Lgcjg/eOAi0iCfNRjiJV4Uj
X-Received: by 2002:a05:600d:6401:10b0:499:9069:c2c9 with SMTP id 5b1f17b1804b1-499dc81cd82mr59940625e9.11.1787761743811;
        Wed, 26 Aug 2026 09:29:03 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:29:03 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] rust: hrtimer: add ArcHrTimerHandle::restart
Date: Wed, 26 Aug 2026 17:28:36 +0100
Message-ID: <20260826162851.2497-3-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162851.2497-1-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Restarting an already-started timer through the safe API means dropping
its handle and calling `HrTimerPointer::start()` again. Dropping the
handle cancels, and cancelling blocks until a running callback returns,
so this is unavailable to any caller that cannot sleep -- a driver
re-arming its timer from a callback invoked with interrupts disabled,
say. Such drivers fall back to the unsafe `HasHrTimer::start()`
on a raw pointer.

Add `restart()` on the handle. It re-queues the timer in place without
cancelling first. It is safe because the handle already owns the
`Arc` that keeps the timer alive and still cancels it on drop, which
is exactly what `HasHrTimer::start()` requires of its caller.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/time/hrtimer/arc.rs | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/rust/kernel/time/hrtimer/arc.rs b/rust/kernel/time/hrtimer/arc.rs
index 7be82bcb352a..f7cd46dbd3d3 100644
--- a/rust/kernel/time/hrtimer/arc.rs
+++ b/rust/kernel/time/hrtimer/arc.rs
@@ -39,6 +39,29 @@ fn cancel(&mut self) -> bool {
     }
 }
 
+impl<T> ArcHrTimerHandle<T>
+where
+    T: HasHrTimer<T>,
+{
+    /// Restart the timer with a new expiry time, without cancelling it first.
+    ///
+    /// If the timer is queued it is removed and re-inserted at the new expiry; if it has already
+    /// expired it is queued again. Unlike dropping the handle and calling
+    /// [`HrTimerPointer::start`] again, this never blocks waiting for a running callback, so it
+    /// can be used from contexts that cannot sleep -- re-arming a timer from a driver callback
+    /// invoked with interrupts disabled, for instance.
+    ///
+    /// This handle keeps its timer alive and still cancels it on drop, so the timer cannot outlive
+    /// the restart.
+    pub fn restart(&self, expires: <<T as HasHrTimer<T>>::TimerMode as HrTimerMode>::Expires) {
+        // SAFETY:
+        // - `self.inner` is a live `Arc<T>` held by this handle, so the pointer is valid.
+        // - The caller cannot leak past the timer's death: this handle owns the `Arc` and cancels
+        //   the timer when dropped, which is the requirement `HasHrTimer::start` places on us.
+        unsafe { T::start(Arc::as_ptr(&self.inner), expires) };
+    }
+}
+
 impl<T> Drop for ArcHrTimerHandle<T>
 where
     T: HasHrTimer<T>,
