Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5326F32B9B6
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038884; cv=none; b=kgvO5HKEgN1b273sJkHY++bQtAgdpou6BxNQxe3FE4nDvZ0TdEGD1FfJ9Hq+G4z8vcARfPx7dtVSdhtMRdL1Ovt1j7JGWlHzaVYbGuk22tW2sKFU4t5ETgTiFZn3a2fic8esK5hSsRCGC8lpLOCW9BU64JoaLmZ2obvwkb1kEYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038884; c=relaxed/simple;
	bh=FFUbOLmpWiVq/OQnGPHbAXC9NvVSCCzyQElac8PiRN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fpIDS5dzAsKvJUrr5JpMSx+J3UoNrIvzCr1d47MwmGGypWe+PGXzPlp4NjTAQSbNmc6n+QYUl8qPip0BTKIhkpnipjk5EZIB8q8H4QpJrNcy4KCWAJrqHDgsBSV5TbHuiAw/xv5cZ88BV8wW2o07qowaX7/PzqCnd/lINVNGp64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8gmg47j; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8gmg47j"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so4353290b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 02:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761038881; x=1761643681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DP4fvZf3pq9SY9bqxcQGVH+sQa4EzI3l8Fc79jvogJY=;
        b=R8gmg47j1dWzGxsUhgK9IPgq67xahELp36WghPwP/648ej/hEVRigPP43HyFlrgZqS
         7vN0HJ5AKzqxvhgSAiqy67oVLECDp4qtHHTNbsnTWoeHzxwC3RwYtHxcGu7UmsXSiAbI
         S2nW30YOS2UZsw9+KGoybv+w4Kwb6OPuS0pdrDdOjlNMuH3Ibo2OWWW314OxmNJxp2Ez
         sktid0ks1BgNsp9Kto+FRm9zDeGIEXdOXn3515QlLTX4Aj7YDRJ0Ag3XtdUZLaxCYN0K
         3f18YkfIlbYvEnMAKlND8Ib+Tm8no61jCm/Bi/DmxgtDksrEC19JfoJFsrUS7uaM/MpY
         q/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761038881; x=1761643681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DP4fvZf3pq9SY9bqxcQGVH+sQa4EzI3l8Fc79jvogJY=;
        b=DB2oNRWEaqmA0OMPlI3V6IZbUDLWJM7Fcrm/VacC5c45bHOTwH+n+ZUSKRHc0DAjU0
         ZZUk+fstuMUJ22N8o83ujDAs53BeMQPdQKMNw3qy6aDn0RuaA2WbXvAgsC3g1yeK6vZF
         TL2pbs/58SMrXEY5oJBjlYRSJC4o/fYDm7vanScvmCqZT0J1it8eTLnDh8r2Y/VA0nl9
         rlcPLTpcWBMNSs43YC/METzGRaHh1JIZnT7qxjFTswWdBNwntsFv41bJ2H74tIAYlen8
         BeniA9v+6CAfdttygVYYfysjvpzKYj2TQKH/NBIIXVQWX/v++VY1zSeVwXrRh8NmkeEg
         sqHA==
X-Forwarded-Encrypted: i=1; AJvYcCUYHJKEu3q314JEXm1AhVDVJKwcyKJ475JI0iCJe8AZWOKSoFPktxImPpeRXr6lskKMPDnEzZiRDeYDptFBlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEh4Lle4DBct+xqp4LmxN/juxsGIxvkW2U/deuOjnhIohrTonN
	bM5hmJF0r8ixf8gOAjNWbrU675hSkCum4BKyyLbvurcCvb8v+z0f5CbM
X-Gm-Gg: ASbGncuwNgPDxevEnrs5u7XXuEbOnV5KVgPfIYHxK5IWjlagc7dv6sZIFFS+rzzvg7I
	QAo4+9Uaaa3BsfwBGpM5eOsnZXa4cUZ/hIZpn2vNbIK55q48Zuf6Yh8LMDufdkFVN3J+eGIHBkK
	Lf/IJOf7oqoxTD0zJ02iqWb76ixL34b1XdhNmt7bW/t0r0bVYXW+aMtT/pd9zbKCpl9tNdj0NI8
	8L17vfMlBGGB4ghmE6yS84kIBjLMeMEmTRVc9Lr5b6TP0u6wiETSeNvTlsBqqGl2Esy4Xfe/mEQ
	25gMW/HuLlfqnHOuDLRkGzEHjcVt/gJKQC3ElqYn1A+Wxv770oWzFgRP3PpsuvwY7bw4rBTYtwx
	gE6gZfmgohvQ0L3QZ30i4lwvFdN1oQi4CsFTuW1G0qsOfSMN8VK1z8ehYkm81knnf4ov1euuFXI
	LUCyzIHt9DdHaIxKOKEvip+WXZufXQCFE1dQdhO5xqjiE+xoJQ
X-Google-Smtp-Source: AGHT+IF7uNQlQx60VxuY/4vkMJx5kQH2Fl9qR73hXhH6ml9SwS2D1kJVI4vEX9WnryxiBax6hS4PCg==
X-Received: by 2002:a05:6a20:918d:b0:32b:7001:6601 with SMTP id adf61e73a8af0-334a8585a44mr22213945637.25.1761038881302;
        Tue, 21 Oct 2025 02:28:01 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a25f41ad15sm493996b3a.41.2025.10.21.02.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 02:28:01 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
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
Subject: [PATCH v2 2/2] rust: Add read_poll_count_atomic function
Date: Tue, 21 Oct 2025 16:11:46 +0900
Message-ID: <20251021071146.2357069-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021071146.2357069-1-fujita.tomonori@gmail.com>
References: <20251021071146.2357069-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add read_poll_count_atomic function which polls periodically until a
condition is met, an error occurs, or the attempt limit is reached.

The C's read_poll_timeout_atomic() is used for the similar purpose.
In atomic context the timekeeping infrastructure is unavailable, so
reliable time-based timeouts cannot be implemented. So instead, the
helper accepts a maximum number of attempts and busy-waits (udelay +
cpu_relax) between tries.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/io/poll.rs | 80 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/io/poll.rs b/rust/kernel/io/poll.rs
index 613eb25047ef..c7dd0816205f 100644
--- a/rust/kernel/io/poll.rs
+++ b/rust/kernel/io/poll.rs
@@ -8,7 +8,10 @@
     error::{code::*, Result},
     processor::cpu_relax,
     task::might_sleep,
-    time::{delay::fsleep, Delta, Instant, Monotonic},
+    time::{
+        delay::{fsleep, udelay},
+        Delta, Instant, Monotonic,
+    },
 };
 
 /// Polls periodically until a condition is met, an error occurs,
@@ -102,3 +105,78 @@ pub fn read_poll_timeout<Op, Cond, T>(
         cpu_relax();
     }
 }
+
+/// Polls periodically until a condition is met, an error occurs,
+/// or the attempt limit is reached.
+///
+/// The function repeatedly executes the given operation `op` closure and
+/// checks its result using the condition closure `cond`.
+///
+/// If `cond` returns `true`, the function returns successfully with the result of `op`.
+/// Otherwise, it performs a busy wait for a duration specified by `delay_delta`
+/// before executing `op` again.
+///
+/// This process continues until either `op` returns an error, `cond`
+/// returns `true`, or the attempt limit specified by `count` is reached.
+///
+/// # Errors
+///
+/// If `op` returns an error, then that error is returned directly.
+///
+/// If the attempt limit specified by `count` is reached, then
+/// `Err(ETIMEDOUT)` is returned.
+///
+/// # Examples
+///
+/// ```no_run
+/// use kernel::io::{Io, poll::read_poll_count_atomic};
+/// use kernel::time::Delta;
+///
+/// const HW_READY: u16 = 0x01;
+///
+/// fn wait_for_hardware<const SIZE: usize>(io: &Io<SIZE>) -> Result {
+///     match read_poll_count_atomic(
+///         // The `op` closure reads the value of a specific status register.
+///         || io.try_read16(0x1000),
+///         // The `cond` closure takes a reference to the value returned by `op`
+///         // and checks whether the hardware is ready.
+///         |val: &u16| *val == HW_READY,
+///         Delta::from_micros(50),
+///         1000,
+///     ) {
+///         Ok(_) => {
+///             // The hardware is ready. The returned value of the `op` closure
+///             // isn't used.
+///             Ok(())
+///         }
+///         Err(e) => Err(e),
+///     }
+/// }
+/// ```
+pub fn read_poll_count_atomic<Op, Cond, T>(
+    mut op: Op,
+    mut cond: Cond,
+    delay_delta: Delta,
+    count: usize,
+) -> Result<T>
+where
+    Op: FnMut() -> Result<T>,
+    Cond: FnMut(&T) -> bool,
+{
+    for _ in 0..count {
+        let val = op()?;
+        if cond(&val) {
+            // Unlike the C version, we immediately return.
+            // We know the condition is met so we don't need to check again.
+            return Ok(val);
+        }
+
+        if !delay_delta.is_zero() {
+            udelay(delay_delta);
+        }
+
+        cpu_relax();
+    }
+
+    Err(ETIMEDOUT)
+}
-- 
2.43.0

