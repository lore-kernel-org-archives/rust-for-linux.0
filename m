Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C314886341
	for <rust-for-linux@vger.kernel.org>; Sun, 21 Jun 2026 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782039562; cv=none; b=J0R5sN88VpcIfV9B3Tx1Vop/coZnOdG4lsaOi/fC7wQqTdHsmgG2PzEOVUn0BDP2hdFPtnwq1G1O+kHoDg+UcKwWXXSsSi0QHk5a8kSpAvuN0w/7+CGWLXRR9c93WLsEpgHmKpfneQdlNrpvRUzZ2eLr6fczX14oCOuF9jrp0HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782039562; c=relaxed/simple;
	bh=6GYZ08HKfd4Lcf26wOp5Tq6WOULoABixtuDGc8VHKT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZgYvR71OojKwVV4aFBlU9n0+dblOuEBmTy3ecb9otamsgSOWiu+GAtl7/fFEosAhA/dUj2lukElTVSqSTou0VHY0tt4ywr9O0ljt6Ssh0uQ28+D1MFiO4BaKvabhoJ8/pQ6EocWG22IHsWmUpt2Ay4YS26UMfoEVfS5iyevWUhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OO69ZgZP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO69ZgZP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c3546924so25708115ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Jun 2026 03:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782039560; x=1782644360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5q5vcsnJ3qJN+m/x2wGeMkbdCC+Ak/eLWtF7tYaJoek=;
        b=OO69ZgZPbWBfmpJfpIhgZKbb4PiWgsW7EXRIzCiqGcKuOTERgyHJC3emTnCC0lO4kr
         Qv63vbIRObQChSvmZmM+iledmLQlByCGPXW5vDyh75Q4G0hGSRAchzF/FBP5968UGyqF
         274PsMARKMR/nvPMuC+HkTyaU1jAg4yfTk6FKvAV7nm+UwhxkBhEIlH4ML875GfhTIgv
         EagmYiRTOQdw5YpCvBatyrEDFtUPL5D1vfUXdJNvczrQeUk+zkKILCVcfYsCMNDVIdZz
         CAqFCxsClYOnVLeyINXBXBZCig0ntT6w3dq0gT5r+xZYwO0YLGnGKDyECbJidR1es6wn
         N68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782039560; x=1782644360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q5vcsnJ3qJN+m/x2wGeMkbdCC+Ak/eLWtF7tYaJoek=;
        b=fA+ugrtanw+3AnAHyE4KRw3QJMAWebo944t5tQFC/k9XJisqloC3n4m1UXKidjTiNs
         0vSKu45b2eUCMl/oTs1ShL+BD3k48OjfiUbW7XzcRbenIeStjbyB/zNNmG0P552NP+Rj
         fK1FRhQZKXOd3mRrvUSRubtpMsaZubGyGCs2+xgFPPJuNexA00grilk6vYYUJR5iCfhz
         QBGyyyiRN2SmC9z+0WoF0tuBQcYxofyCihpPpwM7rV7OXt6To1QZ8DUc2bCwNB1DnGGB
         2PgXpVIkxhimaFwYljQtWYBU6QchwdDOpyfxtR0nXCUres3UGDD048nlO5ZT/Q5CyU/1
         9nvw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1/DoZQz0+gmvoCrEC2JPxFv9jhqnVVeGUBuXPYHWzsqTc9kg7Oe7EavvonSCDzB/707VppfHHaCbkKenNCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJsUicmsl8FZ36Jf7e6FJkzJTkSjRrHKl4FySb8qvvs+vrXHAA
	nGKyodfAmFaRMC7yZKV5/vXJ8izhNDG429bJjQECXQbymcqFwTszX93p
X-Gm-Gg: AfdE7clJExbH8lKb0n1mUw74dLKipewH/zFNiG9UGb6sxvKdpYF/GgsLrlEeDQpQ5nP
	fE0CRPkvryynCpvT5VGregZM8LDjN/HzGX9wuKkvZF59fMYG9eaNtSx9glVHR+jk/tO/JIVp68d
	1OPFRHQGDiYDBuov62baLXNprgV3cuA0fVLfD5Ns28FndiDiKqZmA1k93o8r4PsK9ehZ5OGY9Vr
	GJUCiJIkBJ0QQaxBi5UtkaPxKyq4VGGDZm6TPk/N7IKEmwskrxYdoIimCFhNEmB86HXSf7kFqyb
	mxN8smguELCRe2ewXxJLp9xdGRhz/iAZNPdYaJRgICLet2qes6v4zyOgujdFogP6qJ7mUEw+wrn
	oLtU2vLhT6Zi1hdHb8mbyYarX/tTOg9gAhptN3EVJQ6M/TEprhS2DSMAZiupxY9EoJJcOFMdQbM
	36K2lEoXYeeRrlZhCVMg==
X-Received: by 2002:a17:903:244e:b0:2c2:7e17:39f6 with SMTP id d9443c01a7336-2c719054d54mr114192965ad.36.1782039559816;
        Sun, 21 Jun 2026 03:59:19 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436ff3b1sm44776135ad.36.2026.06.21.03.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 03:59:19 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v3] rust: time: warn and assert out-of-range input in fsleep() and udelay()
Date: Sun, 21 Jun 2026 19:59:07 +0900
Message-ID: <20260621105909.4055210-1-ekffu200098@gmail.com>
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
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
Changes from v1 [1]
- Add pr_warn_once to fsleep() and udelay()
- Add reviewed-by tag by Onur

Changes from v2 [2]
- Fix import to follow kernel code guidelines
- Add reviewed-by tag by Andreas

[1] https://lore.kernel.org/all/20260508173827.1123011-1-ekffu200098@gmail.com/
[2] https://lore.kernel.org/all/20260522172558.137415-1-ekffu200098@gmail.com/

---
 rust/kernel/time/delay.rs | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/time/delay.rs b/rust/kernel/time/delay.rs
index b5b1b42797a0..4debe23731bf 100644
--- a/rust/kernel/time/delay.rs
+++ b/rust/kernel/time/delay.rs
@@ -8,7 +8,10 @@
 //! C header: [`include/linux/delay.h`](srctree/include/linux/delay.h).
 
 use super::Delta;
-use crate::prelude::*;
+use crate::{
+    pr_warn_once,
+    prelude::*, //
+};
 
 /// Sleeps for a given duration at least.
 ///
@@ -18,8 +21,7 @@
 /// `delta` must be within `[0, i32::MAX]` microseconds;
 /// otherwise, it is erroneous behavior. That is, it is considered a bug
 /// to call this function with an out-of-range value, in which case the function
-/// will sleep for at least the maximum value in the range and may warn
-/// in the future.
+/// will sleep for at least the maximum value in the range and warns once.
 ///
 /// The behavior above differs from the C side [`fsleep()`] for which out-of-range
 /// values mean "infinite timeout" instead.
@@ -32,10 +34,13 @@ pub fn fsleep(delta: Delta) {
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
 
@@ -54,7 +59,8 @@ pub fn fsleep(delta: Delta) {
 ///
 /// `delta` must be within `[0, MAX_UDELAY_MS]` in milliseconds;
 /// otherwise, it is erroneous behavior. That is, it is considered a bug to
-/// call this function with an out-of-range value.
+/// call this function with an out-of-range value, in which case the function
+/// will delay for at least the maximum value in the range and warns once.
 ///
 /// The behavior above differs from the C side [`udelay()`] for which out-of-range
 /// values could lead to an overflow and unexpected behavior.
@@ -69,6 +75,7 @@ pub fn udelay(delta: Delta) {
     let delta = if (Delta::ZERO..=MAX_UDELAY_DELTA).contains(&delta) {
         delta
     } else {
+        pr_warn_once!("attempted to udelay() with out of range delta\n");
         MAX_UDELAY_DELTA
     };
 
-- 
2.43.0

