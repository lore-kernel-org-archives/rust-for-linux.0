Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C731306B2C
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762169446; cv=none; b=HAvOqgfneIxrq03QBcmUcrE/RAatmtuADuIyyVDS2r1rKzo6lrV6YqYrdGj3nE/uEfyS17qIN5rPtYDKcQ3Y/vMn/0oGhgzrWUp/BFi1TajpVzVTpNGm6iMOqsNuCdUyO23EtaAHFnJTpo3MvK2JnzZy+HPGim42FhVCRvN+o5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762169446; c=relaxed/simple;
	bh=Qs7F9UIu6YqaEfJe3oGUDLwZfwqHWL3NgU5G+AF7xMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBo0qHPSqlpkbUSRgwu2qkKs36HXoTxM01SrJGKsxGAXNuS/ToIGEtJ7/yn9szw9El1EELIb1afd5+SRuhG7jQ2o91xrsfla6NOWgR6MK1dwOUocQ/DNmEKS65B4Z61U8Vn/TpDEuAejIXz9doOgaN0YkVfeLuCKFEXHneocyUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNwtr868; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNwtr868"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33db8fde85cso4191370a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Nov 2025 03:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762169445; x=1762774245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBtU3a0ysV2uBxdh/EjwzVIfbYaw1pOF5fN9hWc8SI0=;
        b=XNwtr868WMbh8gKTflU8Xv5ITDFXkiQTZr0Fe284+XtPqpoeTWnHFZ7lQ9eY0caTi/
         9QVd9DZ1ZLgFiO9eHN4gtDmz2jknOUgPn9+TrJUvo1JggD9Et22iaTlx8+F2oQflvva2
         z+izOuR5S7gMZQKQVsvxxqoQy76ix6/klCpkteeU8uOOJ7T6rb9YrRnrTSXMSabMawTT
         FKF85aSiNpnymGU+1HNj5rqJNmDoiwZpZX75Ok3UbCzoHmm5dy5hCOEfXJzFJU0xJ+qw
         2/fbHKkYNm2PzKM5oBo9Pv6mUmOTJT5M4+rNPZ/q9Dp9lr+GBfyz4XWE6TkQrsaubJwq
         aX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762169445; x=1762774245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBtU3a0ysV2uBxdh/EjwzVIfbYaw1pOF5fN9hWc8SI0=;
        b=rWANk0Y/VQnRSvt8jQwWPSkW0j8EchHXLTik2zS03TLaFlA4/VUgSkpl0uAS+5Veo5
         X7PUEeV1Yw7bfFrtlH5CnaSOKNkPaHIcokJDDhlFqgPVi1rOk0sTrlfj5U4Me0Viv7Kp
         AUyTuJ35+yNP5Xs/qpYXPD7KMsNaS5Vqa7L59ZYfQZHeL5s/YY2bUSNcufqRtnDafrSS
         RM3jNYeZYooEC9+xB+cd9RLhkTF+afahidEzsECub6ANL0fYKzmWvqNqdgB2m7u1mMUE
         qYgxTwD5cTPthSCBXHWN0JlArj+HTNisyTKwsgRAC1XUyNtcdTgctSJ86n0qWdG4U5f1
         ynQg==
X-Forwarded-Encrypted: i=1; AJvYcCVlYkrj1C69Hu0qoOiKurAodSIn2U1gXa6lYCC/y49m3/uYQT36t8IYOzKnfcZB8rTtJ2TOFcabi3ZVBNgTDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAfz3h6GHdARwEG6x5y1+DS97xj2sSsIPcd6ugsLSfJIgF/zWA
	5rZF3l+/dPLyI2tqNgSOQwkdGc+cfSCQEqQd25g7XE3Yq8oN8+ARtObv
X-Gm-Gg: ASbGncv7eFrUXFxwuhNb+CayTuWp5MZLKKeKzWvwJFIKVzhY29RsKk7nch6LW2WBPU9
	ymAmF7YCzLMYXZF81mRPXmXhsbj7DMBGbDc9uvf4IlPMlWCu07gD11Hcx+sIzI6lKxZw8rpaFul
	+t+qpoeHnl4+DR3qkT+RRFUGolrRSTgBCBNMFt8luD4WJgnOzQbdaFgcmy/b1NLbFVjvloILYaD
	jflC4XEq9+RbFs66qkMSa8GnND8QsZsl9CWTkGcW2Njb/9EXgkW/RMnbbtGTEyb5V6yubUJL4sa
	sIv5de37eWWYR1pFBGVwYHJLW0iRAUILmjZAW9V9xbuF5xjS4KrI7gyRvA1QsYDdkJlkRPMlTWj
	2hzcsEwh9DH4rdGBHGGOo9BJmV6w+GwtMnVS/lf1WZdUW/4KWS38aZhNYsJbiGd3TChQibcg32k
	LdiaYKVVRKvsrAlN9VQ/R3xwWjiVP145YmwJwosf9+Xb3QRziR
X-Google-Smtp-Source: AGHT+IHmOwyUcmyvsEy5tPHeBGjIMAhnC0ExrOtR/nmM8pCo5eJUoNeq+D7oFCJVNElcXl4sgNqsYw==
X-Received: by 2002:a17:90b:3fc6:b0:340:ca32:bcad with SMTP id 98e67ed59e1d1-340ca32bdadmr7979089a91.19.1762169444530;
        Mon, 03 Nov 2025 03:30:44 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d897c632sm11011033b3a.10.2025.11.03.03.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 03:30:44 -0800 (PST)
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
Subject: [PATCH v4 2/2] rust: Add read_poll_timeout_atomic function
Date: Mon,  3 Nov 2025 20:29:58 +0900
Message-ID: <20251103112958.2961517-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103112958.2961517-1-fujita.tomonori@gmail.com>
References: <20251103112958.2961517-1-fujita.tomonori@gmail.com>
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

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/io/poll.rs | 72 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/io/poll.rs b/rust/kernel/io/poll.rs
index 8f8886543f34..18bed3e78ef7 100644
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
@@ -96,3 +99,70 @@ pub fn read_poll_timeout<Op, Cond, T>(
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

