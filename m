Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD5C2E718D
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 12:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761483336; cv=none; b=noe4BIHVEJ352sOqJh8N/weOWrC7WnJpOgDVKEVcHB6jwi8MS5cYGOUq2IHAAG3dDqDdr6ovZ59FAXYGtXNlGNrEiIw7NqPD6FPip4kaMdhEK6FbFd9LjTenWzNrZD3Wpf85kUiOOiLUgdQtXiWUtv9otjyYg1UReysiLRqv+6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761483336; c=relaxed/simple;
	bh=ga/2Ql3JpoWfmrFHfn50pQoQySYcTifPzY8FBOMDrWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyvGe35tbrW/pHIuIRAb9s+qF/n+o9rwcNtKzefpiUlEUTOjVbU7HHDOD8X6fPnOskbbfax+ViPJT4TJ7EcitUgbS47my9KHe3Uv2C3q+LT2bcX6F9Fc3cOym/+P3rwhocPGe/dfxUGR5bVIYKrU5C/QljZ3cdjUVhSl+61CBdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnpQIUnB; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnpQIUnB"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-339e71ccf48so4799821a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 05:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761483334; x=1762088134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CAzZXd4A3lF4KIIahj6WEixTTC+T0E5VAC/UV75Tc8=;
        b=fnpQIUnBCpFjd2zqIvrtqTrB1OkiyRzsAjMhd7HwNhrXBJ1qjstAqCumalTsXE4l0L
         atydmeuTQEJx27Uduf6GUcNjYrlamS6S9eVkNmiUTbjnn+MpIiiYV2pQShsBoqLOZSQZ
         1IyNYjhnqMv4nuFxDBWRtrMN34o5APdkClvzm42hYlYRT4gge2fGOlNKPzFfac/uN0Th
         SrbqHADzNfwG83tyHWBclKvnoJZ2ivkZBNAT6VhBN2YdN6eozg/zaEIU3jkLbJOFF52G
         AJ9jQFadKDR1uB8iR4R6slyXV3+L1SwAgjQbWCDkOu4e0K5/6p6ElLLRUyqCjYmpSW3q
         0gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761483334; x=1762088134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CAzZXd4A3lF4KIIahj6WEixTTC+T0E5VAC/UV75Tc8=;
        b=XpJ+T97qISl9tQ9q8T3g6mEH/QPYmIecx/ejogbWaFj/r0sI8xw9lxa5xbuwH+jmt9
         G+XJ46n+zDhy6VO/fp2gWsVE0ZaksFNeBCrC4RHwGsTG/lm97eIQqGKzoxnLlib4nBXA
         XO8RUTg2/6Eh/WACKV7p+AIlUZDfFb3ei5vfcCC/ICZnPVkyJRFg41F9Hdz2H5wkAKKc
         8lyO8SHmSMyJKEdHKu+7GpVJzIzckzECyImZlV9ElVrt/1BTqfUmQiBIA+vSbq/wmUSJ
         JmwKGOBlkcJtE4iLXnUrH3+XmCukY8TSbPZuq2HwRMw+EK6uqJzwYGrF8Sm1wpaYaw0N
         4x6A==
X-Forwarded-Encrypted: i=1; AJvYcCVTk782i2BpmbdsY4pJk2tl5L5k5nEoOk61JjygeUdkdyW+M8NhEwWh4kM9t428FZSgkXecpby+X75LCEy8dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz35/Djhme5UCQTbhVo36hsioApPx7W8tlQnxx2qCWdwTvxuhTh
	/KUqVjuuEawp2X+/olnl0smEuOiBPzqmqiTJqciUWjXz6Gh301bFQx0h
X-Gm-Gg: ASbGnctwZdYM8NE20y77JoyNLBj2fNjYf6mtdm8fGsfWR88CRS8kt1i2gJxQDXGTkAy
	7NRI334Mv40jqCseK/Goah8Tpl2vMhO+b6Nla8RxJogOypyljVi24FHWo2UU2iRuZqae2AvDqOk
	ZdONhp6cNy8NI9MQI9LM2IBAufBhizeo7PDQbhSLsdWg2wQKPrx9/lhu1nZL79fCMG4PlMgCVw5
	qofBO3fYcwNvvvO97GrvQVZGK9j/1GEO/0ahYi+iZxwaldN22nqwMeE1ZGB7l0/eyt5BUPEv4R1
	sGymtus4jNNoU8Dc2wB/qAAulm6PM4BeQr1ipzI3Fc6gJlnoC0guaq4bLXPjzJu1jq7+G/uibnM
	bSrag2nYbnESjR1FUdksL/d01TJC6Kl/L+DbRcKiPe+RFijjS4Z6j2EhRT6F+/yOewGXC4+4Ptv
	hKVxShqURMSRGv8avXBndMlJenUP8z1qDZu1yfeLC7EsZXgNqb
X-Google-Smtp-Source: AGHT+IHZWhs/E+CtlUuWIrH5OJyrAhAoGqPWvwTTsxXtMWGAgRDVXQfA8CrHQP0ju6+3vvvAqTyMlA==
X-Received: by 2002:a17:90b:5105:b0:32e:e3af:45f6 with SMTP id 98e67ed59e1d1-33bcf87b6a4mr43304692a91.10.1761483334095;
        Sun, 26 Oct 2025 05:55:34 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bdb2dsm4641759a12.5.2025.10.26.05.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 05:55:33 -0700 (PDT)
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
Subject: [PATCH v3 2/2] rust: Add read_poll_timeout_atomic function
Date: Sun, 26 Oct 2025 21:54:58 +0900
Message-ID: <20251026125458.2772103-3-fujita.tomonori@gmail.com>
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

Add read_poll_timeout_atomic function which polls periodically until a
condition is met, an error occurs, or the attempt limit is reached.

The C's read_poll_timeout_atomic() is used for the similar purpose.
In atomic context the timekeeping infrastructure is unavailable, so
reliable time-based timeouts cannot be implemented. So instead, the
helper accepts a maximum number of attempts and busy-waits (udelay +
cpu_relax) between tries.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/io/poll.rs | 72 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/io/poll.rs b/rust/kernel/io/poll.rs
index 613eb25047ef..65c8ec3fb683 100644
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
@@ -102,3 +105,70 @@ pub fn read_poll_timeout<Op, Cond, T>(
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
+/// returns `true`, or the attempt limit specified by `retry` is reached.
+///
+/// # Errors
+///
+/// If `op` returns an error, then that error is returned directly.
+///
+/// If the attempt limit specified by `retry` is reached, then
+/// `Err(ETIMEDOUT)` is returned.
+///
+/// # Examples
+///
+/// ```no_run
+/// use kernel::io::{poll::read_poll_timeout_atomic, Io};
+/// use kernel::time::Delta;
+///
+/// const HW_READY: u16 = 0x01;
+///
+/// fn wait_for_hardware<const SIZE: usize>(io: &Io<SIZE>) -> Result {
+///     read_poll_timeout_atomic(
+///         // The `op` closure reads the value of a specific status register.
+///         || io.try_read16(0x1000),
+///         // The `cond` closure takes a reference to the value returned by `op`
+///         // and checks whether the hardware is ready.
+///         |val: &u16| *val == HW_READY,
+///         Delta::from_micros(50),
+///         1000,
+///     )?;
+///     Ok(())
+/// }
+/// ```
+pub fn read_poll_timeout_atomic<Op, Cond, T>(
+    mut op: Op,
+    mut cond: Cond,
+    delay_delta: Delta,
+    retry: usize,
+) -> Result<T>
+where
+    Op: FnMut() -> Result<T>,
+    Cond: FnMut(&T) -> bool,
+{
+    for _ in 0..retry {
+        let val = op()?;
+        if cond(&val) {
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

