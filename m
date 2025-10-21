Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7696932B997
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 09:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038880; cv=none; b=fHTOK7Muo+njhsGq0xeRENXKKc1P/CudFvR5TMHZuBbbsGmESrBieNqe4a0oDaRetOuS3d5GPlqRqeCEYbeDMeBU8imB5YVe6FzLy5WfKzVo8XC3Em5AEp1NiHO8cJ7bvmM9JBCS6aglmk78aJjv2R0EwvQOfnHKrLNdnHqgifg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038880; c=relaxed/simple;
	bh=3/K3GDSMOD+085rTVXVIBdxxT7kof4c6WZKbETezSt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egq0jnj26XtLBgS9RuAWXxL7AF2shutWcnzLyGW58HS9NWzXNbouD4Y9prE22FBNj290+2INAY8LhMCig0pB0L8qK6Zhah939tjWWKM8jAqtXeV3ws0YdVE44Nn96XVpemCZcbaNHxbrOiYBNnUK39vfj3g+sAv++hCtGB9eXZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiUJk9Mo; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiUJk9Mo"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77f67ba775aso6948563b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 02:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761038877; x=1761643677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2NlzGd5x98kMuQNMDYXrVfdPQkIyShWAfGfbxPh7uc=;
        b=QiUJk9MobWfmTaOyNULUITKOfyQNOg6x+qroulBGq+kwGEiCtYPNrq+PQ5b2jW8Wdh
         NxSoffCoXsDlKoK6/FNxczJ9WEshR8U4zvCeGz5Vh/RSMyFyocWKkhDnynfSEZt5Dpj2
         GhaCwxK2wF7tykBzxsvxfM3+ALfLNE3fQj/jmUAiyfXLLQLHvPDu9dyhYMEtW9fE9YB7
         KHcvy1VdkSAuUtemccCVEOzZoE8Z0N+64Pf/hAuRXLmjiHaerXKZHU02/gdVAd/zKpF2
         e5x5vndYRl2MxwiDOGagfakDN9ZNFuqwIarMRAj3fe5USi2flg2vDldYI0gMv2d+NQEC
         2G3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761038877; x=1761643677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2NlzGd5x98kMuQNMDYXrVfdPQkIyShWAfGfbxPh7uc=;
        b=XALjPRJU4Yfv92QfmWuxaWTnpBegxTi7i6DlBtJRewEK4LtTd0CY3KNfe1ny8Yr18J
         KRrHfl9rxQtCahUcaf7Roqu7WS7YxycubQlGcW2Z7lAprRI2OtO+8gjGNNcZ39Ybzmr/
         ptqSaQs4s/n93eYZoI/iwQs5b4Icnxu6Uj5TVT+qimhh0vABFw3rPNDsU0xu+ve2dhl8
         Y5wsoVcchJKlAr5AW+WbulLu6KJIA0ntkfzWp1kK5qAz3Z48JS6P4db5X6MAqN1+i4GF
         qwlfACz5llHNSUEYbEkjQFHnuIk2eoEtYSZkPqHdvcq8RVbI6w7v+4cnDYExNwYIwxwp
         UF5A==
X-Forwarded-Encrypted: i=1; AJvYcCWxs2z4qKkMbMdW6Tvohdvl2QjavAHp/JxVfGf+ab5mGv/MamvrThNbC+/AV7AdLifm14omkHbUqnukHN8ItQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyacVrxZ52EJ7BUB7FbZ658ORpFwrv+Yh+r4KESgSsemJLfvNz2
	WbUEEF46vIq7kL1hMFqqTJ3jIJ5bQ9KaWyWhhYSLnOH8RwiiXa0o4hX8
X-Gm-Gg: ASbGncsvRxcvHpRe/r+bUo47pu0UW/RbtufUCId6Qky63EYesT+J3TTZl9/gZQxOPqD
	zfPc7byKjR5hzBzR+WXCXnDQUifTu1r+jFY7UmKOgd/LaQQ4NRRI0VILkhN0e4cRqvJZS8KZY8q
	jQGabenxYG2tUzuVjWV03rJTglW/xr+3AnKpLfSaNg6xLBoxV7+M4vWfKQbe8emEIcZ4MDH0CRJ
	tEMQUHxpy0Ll7x9Yiy5Y+L8eHPKnb9b3pfpfajIayZQR4udEejhQWPIB1+E5AYPIC/WAJ+ING2A
	0BpR/tfc82bCtBYCYRk7O7hVhWsLWrOcaRoCxsKUyhzGgnY10E11EISUmZTzuJzp0i9bWrlZR5H
	zoPSFg5M5GNPreRAus18q4wQzGzDRmYJuZ4279F5YP5dB4HdPGxTgPTCNjj88/7CC9b/gRO9rr3
	G1tVNT+vPqBDMRuWisv1F0+Xhhe1nrz/frV5JwSeMsLfaGKdBBMsSDDdcm7aHeZMwmKggP6A==
X-Google-Smtp-Source: AGHT+IG84QcMXftLvNN2/W5AZW4r3LF5ogTWd+gpV80sFCmWfCriH0heSVLuZ3TAujgYHHi+0lrA+w==
X-Received: by 2002:a05:6a00:182a:b0:781:556:f41 with SMTP id d2e1a72fcca58-7a220b07183mr18510234b3a.19.1761038877219;
        Tue, 21 Oct 2025 02:27:57 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a25f41ad15sm493996b3a.41.2025.10.21.02.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 02:27:56 -0700 (PDT)
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
Subject: [PATCH v2 1/2] rust: add udelay() function
Date: Tue, 21 Oct 2025 16:11:45 +0900
Message-ID: <20251021071146.2357069-2-fujita.tomonori@gmail.com>
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

Add udelay() function, inserts a delay based on microseconds with busy
waiting, in preparation for supporting read_poll_count_atomic().

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/time.c       |  5 +++++
 rust/kernel/time/delay.rs | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

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
index eb8838da62bc..fb7c15dfe186 100644
--- a/rust/kernel/time/delay.rs
+++ b/rust/kernel/time/delay.rs
@@ -47,3 +47,40 @@ pub fn fsleep(delta: Delta) {
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
+    let delta = if (Delta::ZERO..=MAX_UDELAY_DELTA).contains(&delta) {
+        delta
+    } else {
+        // TODO: Add WARN_ONCE() when it's supported.
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

