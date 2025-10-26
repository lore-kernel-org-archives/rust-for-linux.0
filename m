Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21912E06ED
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761483332; cv=none; b=dpn7k6tsz64FeQrqKtzyILQRl7ZJ7MBhKy1MpBcUAmkPedC/hx3XBfxNFdvQVjqW8HQMOdo4aey3mWSyruvFb/ScKtL6kFrVeCqcbzNI9pJ3WsmDckxfZJbRbRhKa0fdJmYw5u5kpHKu0G+u7+F3IZELnOupAUVXRfQeuEK7zVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761483332; c=relaxed/simple;
	bh=BQH7hgD7+xt4W7z/S368Lm76rShNO58wKexO34QQko8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gB1qj+YNNc8nnLWg4zmLY0NL4E48TR2MThGtaDiwFATdJgPFnsLRN26bt6Hlwyt0M+QHlMhXUgh2pYSyrMTnVpIf1ZdcGVJ/81shUhbFNC1PqtaFRbxjvDTqlTqTT72Rhcfb5fgJovNI/hMy19zq8XbWbCawF8cWEYTS+SJLhrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJkZvO94; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJkZvO94"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b6a73db16efso3491199a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761483330; x=1762088130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpL5GRYYewBmCb3HYHj7NyzEFHr83PdgBMD+j8Wif4Y=;
        b=AJkZvO9483JwtKIc9EPOy0w5aYFQiuH3yJ2EqdHKKpXaTikU4mJ1S8ZX9Jm6t55WYa
         iPvCixebq8mm+LX5BURYFz6vbhnmhI0kHKZef8fkEPeQ5cFYLxxNrpo+8iB90QTNv8d+
         6HduCaucLIlnsxeT59Vk0YhktEDL4K7WLbz06GMhu1O60d+dz2bSltHflb5RNbQomjAT
         8nh/TqXCeHtxYpaF20OkC2VOe3u5xf3xjiZrMkXYtmDvlr5L1MGdgjAQmPwHC+cJ3G//
         zt5hvRpjA+FbaRbkcBSza99FvIYhutYQ/QNuSmvXlW1cLaGzT0QFhqM8KPIZOS3/8eYZ
         Dm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761483330; x=1762088130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpL5GRYYewBmCb3HYHj7NyzEFHr83PdgBMD+j8Wif4Y=;
        b=C7FL1iJ2O3MYN1ntiE03VgpPABdtyQVZNbW02HLEPaRRC9sK1QFpxzT/DDVrBVFFu4
         tt+Af17Jl1Djy3ul1z5OrhOuD/RlwmYtEGfXjKhbpwvQMT3vI7HuOJPTFVyR6TBwnjku
         hqsoSbs3KxT7JDb4TsbcZnxAS48lQlz3woMp8Mu5A+OwyY19vWyY9oqMImxr0puTohWi
         teCpE4ZQTdAr5EgJew6oQUPI4eglaCgrAMU+i9JwAA7ed/DQwYLCQ43ZHHRn3GGuz5sF
         0mxXfXZJNeMYBuC25vAoPR5aTX2ILV/0lO1GDTufu+IGk+y3DleLoXehNtZKQLYC1di0
         H0Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUMhFOO1gqthJWMPrGw/QaZ2iZA77RFpI6HxdUpZzsxH0CnA/F1Oz4gBGTq3un7YI4nhNb9IEjj17Y5eabKJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEQLW3VqfOPhDw8/awdW9DjTJ5duL7hQY5GClQ2y0ugnm01cw7
	xpcZQWUgip2yyTKsFtZPwpzs2HGZGFEDUxvddXAVEK/Sh+76/yTYXwG+
X-Gm-Gg: ASbGncsZWkelAn8uw5IzAbFho/IGH5lKR/VloZZbQJlV767XykOrqqAM9e2F/yM3mMb
	9bpLybyF+k+inxBAGUmnz9P4zJYt/fAhs7g4QzaHOZpxdgrjbIoo252EjzptZSLQz9X9ECahPc3
	muAPFMhmxS4NJSKdzTOaKuYfgtPvGjGLBOcf1SlyzCiP8BzVBggSHwFyoD4XfViHILE3rq7GQFK
	J8FqlnbeYa6f8/whU/Diauoc2IWogAEwIWNDElaihg2Bt/FpC9PO/kM9rY1P2q0zoxTX6rG/p5e
	W/t0sQiEpVi7Oh+YfurCQdZdmCmpx5Uhg9KB0Qwdck26biHwW1TqILw40/uVBZn350vp5On5XR8
	yqsNqrVhjv/zVRo71cK+jgS0f6eUeda5yHrf/Pny5c02s34CsSzv6mbsWXIdhoEBqhpU8wQ55MS
	/XzUgKsJ5pa74a/IVyiLehq6D1or+gddSPsvq0KzYCUnEJancn
X-Google-Smtp-Source: AGHT+IGbWGIIOzAhr1d2Z5UjYERrsJ5I4YvcxAZSP1AAcn2uDneNWiOnjZDQ7TMXZAuZy/JTyzooJw==
X-Received: by 2002:a17:902:dac3:b0:277:3488:787e with SMTP id d9443c01a7336-2948b95c1f5mr102003455ad.12.1761483329901;
        Sun, 26 Oct 2025 05:55:29 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bdb2dsm4641759a12.5.2025.10.26.05.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 05:55:29 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	ojeda@kernel.org
Cc: anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu
Subject: [PATCH v3 1/2] rust: add udelay() function
Date: Sun, 26 Oct 2025 21:54:57 +0900
Message-ID: <20251026125458.2772103-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251026125458.2772103-1-fujita.tomonori@gmail.com>
References: <20251026125458.2772103-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add udelay() function, inserts a delay based on microseconds with busy
waiting, in preparation for supporting read_poll_timeout_atomic().

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/time.c       |  5 +++++
 rust/kernel/time/delay.rs | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index a318e9fa4408..67a36ccc3ec4 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -33,3 +33,8 @@ s64 rust_helper_ktime_to_ms(const ktime_t kt)
 {
 	return ktime_to_ms(kt);
 }
+
+void rust_helper_udelay(unsigned long usec)
+{
+	udelay(usec);
+}
diff --git a/rust/kernel/time/delay.rs b/rust/kernel/time/delay.rs
index eb8838da62bc..0739b75fb9c3 100644
--- a/rust/kernel/time/delay.rs
+++ b/rust/kernel/time/delay.rs
@@ -47,3 +47,42 @@ pub fn fsleep(delta: Delta) {
         bindings::fsleep(delta.as_micros_ceil() as c_ulong)
     }
 }
+
+/// Inserts a delay based on microseconds with busy waiting.
+///
+/// Equivalent to the C side [`udelay()`], which delays in microseconds.
+///
+/// `delta` must be within `[0, `MAX_UDELAY_MS`]` in milliseconds;
+/// otherwise, it is erroneous behavior. That is, it is considered a bug to
+/// call this function with an out-of-range value, in which case the function
+/// will insert a delay for at least the maximum value in the range and
+/// may warn in the future.
+///
+/// The behavior above differs from the C side [`udelay()`] for which out-of-range
+/// values could lead to an overflow and unexpected behavior.
+///
+/// [`udelay()`]: https://docs.kernel.org/timers/delay_sleep_functions.html#c.udelay
+pub fn udelay(delta: Delta) {
+    const MAX_UDELAY_DELTA: Delta = Delta::from_millis(bindings::MAX_UDELAY_MS as i64);
+
+    debug_assert!(delta.as_nanos() >= 0);
+    debug_assert!(delta <= MAX_UDELAY_DELTA);
+
+    let delta = if (Delta::ZERO..=MAX_UDELAY_DELTA).contains(&delta) {
+        delta
+    } else {
+        MAX_UDELAY_DELTA
+    };
+
+    // SAFETY: It is always safe to call `udelay()` with any duration.
+    // Note that the kernel is compiled with `-fno-strict-overflow`
+    // so any out-of-range value could lead to unexpected behavior
+    // but won't lead to undefined behavior.
+    unsafe {
+        // Convert the duration to microseconds and round up to preserve
+        // the guarantee; `udelay()` inserts a delay for at least
+        // the provided duration, but that it may delay for longer
+        // under some circumstances.
+        bindings::udelay(delta.as_micros_ceil() as c_ulong)
+    }
+}
-- 
2.43.0

