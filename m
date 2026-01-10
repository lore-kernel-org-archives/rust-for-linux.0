Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5A233FE36
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 11:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768046346; cv=none; b=COzrsvJw1tAT1t/KEiY5iDmmRp8PnSyhGDrtZu6Fs9QMy7bj7wJJDZT1cB6/USHrSZDjesKi50sdqarpKAMobah0cyATc6eGxflsqzSB3//aQ7YGKr6VH+3YZFrypYKSqA7wFQ1h0w7kUk0p9WCtPFaqLQZ23qd1JZg+syPTLLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768046346; c=relaxed/simple;
	bh=UhbVMPRFiQTqCXLdIye1S0xYbgyzM2roj8jhKNwBUZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=plRDj0TSFdg0KYubQ+Gaj/tL7TIeJ6wOJLTebbQFJ390LSBX+McCovAZfAlZt3teOhxAe006r6pRofGzypeegD+VHt+pwtgE5WaP0B57xakXVY3QKbASHQtT8AL3I0BUEFde6Ky4Zrx01if3uoSEPLXhb/rNf8JxL9Nc9Wagtvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIIshU+L; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIIshU+L"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so2179891a12.3
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 03:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768046342; x=1768651142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxSuJwccsvaU5TI9v9x0V6y0M+w0NKTt2Mn5k9QlaNQ=;
        b=OIIshU+LDwBQKHZTv/fbW0JvaEBI2JLEeIPs54s4I9glZa4tmU8IzHN96JllrBZgm1
         ttdS3MTXWFvMKYo18FTpGz2WKuedu7iSyB+XmebXYXIUn4l/HZQOxiWGPDo4XtcEeI49
         Npycq960UDFrwFnHqKkhcOOTTGk0xLXEFo0TNVpVJ2LvlfcRcU/fl/o7pwnRxmFCoVIG
         +ksZmuOj4tXojEnf1jYo0KicKC8IwBMRkF4RysFMOmqX15cneOc7jBMgPw0b5n26eTvE
         wBx7fm/0XlnkNhMDOj9f0gi5Mq9ILCk5Yyek3C2j/uVKHZPubPbh+Wm7K2hFe7RvepYB
         r5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768046342; x=1768651142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxSuJwccsvaU5TI9v9x0V6y0M+w0NKTt2Mn5k9QlaNQ=;
        b=q6j7c4VMhQLprKAdwOqb5XWM9vaNkhE2Lo2Ff8Hk7VPTaA/P0g0v1Hwlk9PVLk+PYg
         fAEDzvZq0LapW3fyg6E6AysaCILNCEFN03J0aJUNigKCBr9tLvO/W5s/pGXEl34MqT90
         HMpdi7RXPvN9zNBU+NWgPmLfkuQdgG4olYUYtY8zK0CaqLPPYaqZOiy4URNZirq4ORyw
         MPngjmceW/1zrugLc4OY0m6Tf+Idq0bNSUqNcBG0U5v/jWr4B2rwGjrqLzdLDE/7Y4tb
         j5MmxfNbke7+q2e7vaxaYf54eMJsUHELStU1j2YuwezDJcKhzJ/szcFMAhnfBTnipzuD
         odIg==
X-Forwarded-Encrypted: i=1; AJvYcCXTrKqy+rW3ZhYj50ew/orgYTBUdHEpYeDCR8X9Xc7VZEc0KUdy6ho/Tebvqzu2zBJITprNURYE+5xMjFIMzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZB6v3Q49lGVuuDcY270qXccoCncLyFsGjT1VQWdCATcqsbd4
	rlmYW2JHA+ks5wZiY6DSM9hK1qily/+1PcvkvUsl89sshw0OnMfCioC2
X-Gm-Gg: AY/fxX5xTVCnPMBa66itPoqpb4XxYv2OGidYqiA4C8ZJ6duDuaHttOGUt1qJkfCr0g4
	7ncaLw+K8UtZHRVTmTBEHPC71YgQ2rFrZwlJtSj4QxyChS5e0z8kwVrHOXAUYKWTNSfy24PScKx
	o7XP1a0vAD38UF0fJxZmoeQBvXVVsGcHqYIs2Qjs+58MKUWNzX1E5ZpxaAy61OCYTouU92n/86e
	ppi1NTZ0wQ+IgwMLtZcheu9aq+yCFfpEqIrfz5YIesq35Ta0C0yJxIj3m/WBJ6CwWK0X2m3hCQe
	9XPlm5nkD3nqaehNzmYVm+Y8XtRsE9UEEEjNmXs6aagiJyvVRS6ZfOsP8qIUvqKQy0UNYHqRS5W
	pNtqhaDZoFIlJVjGaMZQDbW63M7UzO5uQJW/BMa6x2gpQn3oCA3oNk26Nooye7G7xabPD8ruiYZ
	bIdzk0QHO5wrjvTeyjBbyJWBM2Mb4nt6MHTl8ngjKQYpKt3lpxBfO6t02TqrwWRWrFFjWE7f21
X-Google-Smtp-Source: AGHT+IFQYAC4SLR7DWLAtIrYcl3jcFs69GoJHOdJQKSMkqfLKLr55d7JQe6xJeKgwQejkNVlx8iRgg==
X-Received: by 2002:a05:6a20:3d0c:b0:389:8e23:f43b with SMTP id adf61e73a8af0-3898fa1fef0mr11445752637.69.1768046341955;
        Sat, 10 Jan 2026 03:59:01 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d2952dsm223117a12.17.2026.01.10.03.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 03:59:01 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1] rust: hrtimer: Restrict expires() to safe contexts
Date: Sat, 10 Jan 2026 20:58:38 +0900
Message-ID: <20260110115838.3109895-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

HrTimer::expires() previously read node.expires via a volatile load, which
can race with C-side updates. Rework the API so it is only callable with
exclusive access or from the callback context.

Introduce raw_expires() with an explicit safety contract, switch
HrTimer::expires() to Pin<&mut Self>, add
HrTimerCallbackContext::expires(), and route the read through
hrtimer_get_expires() via a Rust helper.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/time.c         |  6 +++++
 rust/kernel/time/hrtimer.rs | 49 +++++++++++++++++++++++++++----------
 2 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index 67a36ccc3ec4..5be4170dc429 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -2,6 +2,7 @@
 
 #include <linux/delay.h>
 #include <linux/ktime.h>
+#include <linux/hrtimer.h>
 #include <linux/timekeeping.h>
 
 void rust_helper_fsleep(unsigned long usecs)
@@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
 {
 	udelay(usec);
 }
+
+__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
+{
+	return hrtimer_get_expires(timer);
+}
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 856d2d929a00..2c6340db1a09 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -224,27 +224,39 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
         self.forward(HrTimerInstant::<T>::now(), interval)
     }
 
+    /// Return the time expiry for this [`HrTimer`].
+    ///
+    /// # Safety
+    ///
+    /// - `self_ptr` must point to a valid `Self`.
+    /// - The caller must either have exclusive access to the data pointed at by `self_ptr`, or be
+    ///   within the context of the timer callback.
+    #[inline]
+    unsafe fn raw_expires(self_ptr: *const Self) -> HrTimerInstant<T>
+    where
+        T: HasHrTimer<T>,
+    {
+        // SAFETY:
+        // - The C API requirements for this function are fulfilled by our safety contract.
+        // - `self_ptr` is guaranteed to point to a valid `Self` via our safety contract.
+        // - Timers cannot have negative ktime_t values as their expiration time.
+        unsafe { Instant::from_ktime(bindings::hrtimer_get_expires(Self::raw_get(self_ptr))) }
+    }
+
     /// Return the time expiry for this [`HrTimer`].
     ///
     /// This value should only be used as a snapshot, as the actual expiry time could change after
     /// this function is called.
-    pub fn expires(&self) -> HrTimerInstant<T>
+    pub fn expires(self: Pin<&mut Self>) -> HrTimerInstant<T>
     where
         T: HasHrTimer<T>,
     {
-        // SAFETY: `self` is an immutable reference and thus always points to a valid `HrTimer`.
-        let c_timer_ptr = unsafe { HrTimer::raw_get(self) };
+        // SAFETY: `raw_expires` does not move `Self`
+        let this = unsafe { self.get_unchecked_mut() };
 
-        // SAFETY:
-        // - Timers cannot have negative ktime_t values as their expiration time.
-        // - There's no actual locking here, a racy read is fine and expected
-        unsafe {
-            Instant::from_ktime(
-                // This `read_volatile` is intended to correspond to a READ_ONCE call.
-                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
-            )
-        }
+        // SAFETY: By existence of `Pin<&mut Self>`, the pointer passed to `raw_expires` points to a
+        // valid `Self` that we have exclusive access to.
+        unsafe { Self::raw_expires(this) }
     }
 }
 
@@ -729,6 +741,17 @@ pub fn forward(&mut self, now: HrTimerInstant<T>, interval: Delta) -> u64 {
     pub fn forward_now(&mut self, duration: Delta) -> u64 {
         self.forward(HrTimerInstant::<T>::now(), duration)
     }
+
+    /// Return the time expiry for this [`HrTimer`].
+    ///
+    /// This function is identical to [`HrTimer::expires()`] except that it may only be used from
+    /// within the context of a [`HrTimer`] callback.
+    pub fn expires(&self) -> HrTimerInstant<T> {
+        // SAFETY:
+        // - We are guaranteed to be within the context of a timer callback by our type invariants.
+        // - By our type invariants, `self.0` always points to a valid `HrTimer<T>`.
+        unsafe { HrTimer::<T>::raw_expires(self.0.as_ptr()) }
+    }
 }
 
 /// Use to implement the [`HasHrTimer<T>`] trait.

base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
-- 
2.43.0

