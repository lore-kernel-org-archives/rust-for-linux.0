Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4332379C22
	for <rust-for-linux@vger.kernel.org>; Fri, 22 May 2026 17:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470783; cv=none; b=tRrdEXrvlpG6FvYVr9PJdTiNU6n3rZcjvYu5G+fH0V6fOagAm2bjfYf8iH8BOUGFX4OjoGF8gscwUC/988L361Wr8pqp4QtMoj3vXzmmNnb5rUetWdRNrMTQPEY9X5uZLkFznRlrW4qaBleo8qHGOJ/omMfrfE2wApWVQKnn20c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470783; c=relaxed/simple;
	bh=G4yulZAh43nW+FY4rF8jRbLu0QG5e2+QrqfNaKNhG9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=stDs1gkzrZrD6v+xVzqJgjz6t1U02XSmLYTAwkoROdoFXbmxWOmgHi4hiWJobYZOl+YCfUFBzPWnLVWa5hYlhPvHQQjcCy4zPJBEdwWOmm4n5jW5EVzwTZ04JND32eQPNFAD6oIUN7oE4YO0/iLsamU7Xe5nnpXjf5UjK3N6Beg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fB8KoSQP; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fB8KoSQP"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3664df32e91so8469854a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 22 May 2026 10:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779470781; x=1780075581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Gm1k9/xmd0BmEkpNmb98ur1AE4EYqSK1UCjfJs6mWg=;
        b=fB8KoSQPjLj7rg32V0dpiEIY6lN3vCtCXlts7RlDHG7tJ9vwQmogmVM0rMvcmdbNsh
         5+I4pQSqI4r0jj6apt1zT/levVoKQyRPbBJLLYDjPN1x3JMYSUIRs9v2gK4bERqma50r
         bTE3fflwpKp7laoe9svmxHrzN6Fnmf83Go/ecq1xJ/JJM+GlUJo3pAB5MSqb83Rd3fMF
         at7MEdzOL4Jf2W2aASdMRHcCvkQwuJ8xkL7i6ExkQeHgArUX8Lnk0uTpugwd1SUKQfIm
         YVXgELynxmYQpEfeCZ6sj1N/rUcFoBoLUu7d6Fhc6NuxDcvaIjKzilnbyAI/EqwR5XMs
         0QQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470781; x=1780075581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Gm1k9/xmd0BmEkpNmb98ur1AE4EYqSK1UCjfJs6mWg=;
        b=OrLCmS3prU9/bTdXlejlooZ4oD1P8sWA+1JALpaNCKya0AUfr1ewTt5ITz53RwOudJ
         aEVrkkZvUkb03CAJMVzIzE8GoAVP5R4StxqNRKt4DMZlq/A3dnqKWDdu3/9dHBzxie1X
         J4IPUAEL/wheQprh3Lp1HjmW/DOIgyx1ePgd5BVeGcZ0cwMBR4j1ljovPDG+ce2C3ezN
         CAr+5D1RkprBtg94X/m1DggOoHHSKp4+91wZSfuz3uOY94xSwD8UkFlXNsJ5Jq+6fMk9
         fxXlegagz4OrDg3tjV0du1+1wHbq9EfxcU6pe5MNQ47BbsPm17RR8y1e6Y28btJQ9cq3
         27wQ==
X-Gm-Message-State: AOJu0Yw9TPQyzeM1fR2dSZ5s7ilstpFeiiNEcvxO65KH66rQfuBYlUOF
	Nc8Luzjn1lfPzm4ZhnBgEzCPSnXJjUxeFgZS4Qylzs2LobYZMK+2il/y
X-Gm-Gg: Acq92OHmQCP6Y/gR/cqFTikACg9EKz9gCYvtLwdS1P+oSJf962VYLbbTy0vDWbyJsLf
	HbHZWFhUI0oW0AbbPpRnnvpm2fZ1JgnMS2518F5JwOv9/+QuuJ900+qcW5zb7RBxFNxmgOcaFvi
	H7JAu1T4KWXAbtG2bK5+kTrwkmba9COa5wHxp4GMi3ypE/P6HZn3Zsc9wCCd5OiIHcSSHFVv2uk
	chDYCFnDhW+b6siBiYjIWYCauBDxvwy4vft6JSBcV4bKyjwmCWXEFbXqTAByDn++njy0Ac4RAdP
	2MCioNnJUhLEYV3QodO8aDc4KmoZHmJrtiAPXD0L/JO4TY1OQ2H41X43m6qPy6qELuUq8GpcLTj
	lFR9yfMPxn01fkFS2nmDXvF5/BqyFAgDSmi+Db9/0+VNDY8b61xpvAldiyRdAuB+AYzLdRmeBHj
	UnUoy7nDPYD6aMNXICOhqsTTtHQUau
X-Received: by 2002:a17:903:1447:b0:2bd:eb0d:efb7 with SMTP id d9443c01a7336-2beb0633f35mr48333745ad.1.1779470780696;
        Fri, 22 May 2026 10:26:20 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591d07fsm26708895ad.82.2026.05.22.10.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:26:20 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: a.hindborg@kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@kernel.org,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2] rust: time: warn and assert out-of-range input in fsleep() and udelay()
Date: Sat, 23 May 2026 02:25:58 +0900
Message-ID: <20260522172558.137415-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fsleep() documents out-of-range input as a bug but does not check
it, unlike udelay(). Add `debug_assert!` calls to catch it in
debug builds.

Also add `pr_warn_once!` calls in both fsleep() and udelay() so
the clamped path is observable at runtime.

Reviewed-by: Onur Özkan <work@onurozkan.dev>
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
Changes from v1 [1]
- Add pr_warn_once to fsleep() and udelay()
- Add reviewed-by tag by Onur

[1] https://lore.kernel.org/all/20260508173827.1123011-1-ekffu200098@gmail.com/
---
 rust/kernel/time/delay.rs | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/time/delay.rs b/rust/kernel/time/delay.rs
index b5b1b42797a0..557130ab84e6 100644
--- a/rust/kernel/time/delay.rs
+++ b/rust/kernel/time/delay.rs
@@ -8,6 +8,7 @@
 //! C header: [`include/linux/delay.h`](srctree/include/linux/delay.h).
 
 use super::Delta;
+use crate::pr_warn_once;
 use crate::prelude::*;
 
 /// Sleeps for a given duration at least.
@@ -18,8 +19,7 @@
 /// `delta` must be within `[0, i32::MAX]` microseconds;
 /// otherwise, it is erroneous behavior. That is, it is considered a bug
 /// to call this function with an out-of-range value, in which case the function
-/// will sleep for at least the maximum value in the range and may warn
-/// in the future.
+/// will sleep for at least the maximum value in the range and warns once.
 ///
 /// The behavior above differs from the C side [`fsleep()`] for which out-of-range
 /// values mean "infinite timeout" instead.
@@ -32,10 +32,13 @@ pub fn fsleep(delta: Delta) {
     // overflow inside fsleep, which could lead to unintentional infinite sleep.
     const MAX_DELTA: Delta = Delta::from_micros(i32::MAX as i64);
 
+    debug_assert!(delta.as_nanos() >= 0);
+    debug_assert!(delta <= MAX_DELTA);
+
     let delta = if (Delta::ZERO..=MAX_DELTA).contains(&delta) {
         delta
     } else {
-        // TODO: Add WARN_ONCE() when it's supported.
+        pr_warn_once!("attempted to fsleep() with out of range delta\n");
         MAX_DELTA
     };
 
@@ -54,7 +57,8 @@ pub fn fsleep(delta: Delta) {
 ///
 /// `delta` must be within `[0, MAX_UDELAY_MS]` in milliseconds;
 /// otherwise, it is erroneous behavior. That is, it is considered a bug to
-/// call this function with an out-of-range value.
+/// call this function with an out-of-range value, in which case the function
+/// will delay for at least the maximum value in the range and warns once.
 ///
 /// The behavior above differs from the C side [`udelay()`] for which out-of-range
 /// values could lead to an overflow and unexpected behavior.
@@ -69,6 +73,7 @@ pub fn udelay(delta: Delta) {
     let delta = if (Delta::ZERO..=MAX_UDELAY_DELTA).contains(&delta) {
         delta
     } else {
+        pr_warn_once!("attempted to udelay() with out of range delta\n");
         MAX_UDELAY_DELTA
     };
 
-- 
2.43.0

