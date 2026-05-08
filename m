Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3787833AD9A
	for <rust-for-linux@vger.kernel.org>; Fri,  8 May 2026 17:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261921; cv=none; b=pvrdGseh0OSjmqnvhjS17teaRAryNjr7wDhHmwWEXUupml3nrplN34peJoL9xSbgM+WSTRFDBMRZAugbbM1XgV/htoUfjOIY4v8xV1Sd/QUoaTyvxHsSJb6PcJoa7x7Pwa2nC1RtP6plhUuGGflgi5CFc5RgJreL6anE54YzF1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261921; c=relaxed/simple;
	bh=y63FwEc6e5O/OQqoOWxtxmSmkrlPNEs23WJhFryQqPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K2ds5vempC1vyMMNVR6dPTxg9Hir006euqhA03bpCqAur+bdx1n8H6oyqlTf5HV4iEK16oX/GXRCSr0MYzjgfNJ8HA2kZu3qn+PZFFSQz3MAIqulOQ3MVkynGkU6n0UvEn7io3a5bDMxHdP33+55CRsDbpEbooVA5lsih8r9UFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdTehjGa; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdTehjGa"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso943457a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 08 May 2026 10:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778261919; x=1778866719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3JNNXs2NA8EE1B8e6oKGwMIwDAqDM6lxHHOQuakr9io=;
        b=fdTehjGa4GeT2hqKCIRrbFIK0Wq99inML7cpiZMxNUrHYSRaO2Q9iHuYYc2t+zHtGO
         wr25Jt0oshLbmPUHMLp5tUOnX/SHOS9dxQq9ggQJNvMaFpKq/D5H3NQ6HrTFxUWYzAzG
         F9ui02zEsO2UjeovP9IGpwrL3VJz/zHYLr2dcFkgsdwTGwDyCD34OWURIbxu1H33OoaV
         +WXFA9IaWA/UXjyzQp+qiA08V/2XGJPLkUnEz0+yDfmMnSpaE2JlZZPsa5sGGZpfoZ1T
         w7FGQxBS55XlrG2yz39vOe6nKtjbYW/4+EPl2NklyL2EQcPkjgmDLlfLvgphk9x2b73z
         c+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778261919; x=1778866719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JNNXs2NA8EE1B8e6oKGwMIwDAqDM6lxHHOQuakr9io=;
        b=qpxwm1o1gdBD6xVXIQxvmh/cQ8hMN0ZPZlefsH+j6ehS3veeJD5qw66xWUefwPO8Au
         rjGYvqBMdzAOXiuGXRTcv0tzZCPNtS/JDHSwzvhwEFNAqeXetbGZ5o4arf4jp+8OGDRB
         IoJ15yRSf13878l9bMnoG4SAOeGddRy8ppNFSODi8otxUONXbi323x9sKubxMJBRPZhI
         YFQlm//6tsOMxTQWXRdJlyYKN9KAHyE6UmnCfMQxGOKSOIyaeJSCTWgFtgki4PVA8+hW
         xSP1JpnBgECilUBwRZMK9okUb1JWQoV3qe2D+ky6HDZPdP49VDiDpmzLWxJ8hdUks94J
         AYAg==
X-Gm-Message-State: AOJu0Yw/RX1Gxih+WD+Qm5XJqYjPKgkZqXqZxdXiLTnTN3RRbZoWGx+z
	ViqjhKHHqPAK5SqUExeaEzKMjsywZQbpAJHjgqazVEqYq+LumGGPLH2f
X-Gm-Gg: AeBDieumh0v+TKqglrm/IeyWhmB5ClXjB80YOH1T5JFmD7mXHSLvij1pnPbL1+Xjn8M
	54ggFbIBmvx/kf1W/71wrgVCyRzHP5aaAYXJFGVuoXvKidr+omQCvBLeM5W4JjUdgyGjYXCQPdY
	TR/cBzBAFP989Avi6XeghT71A+W7D4HfdZKxz5IDAHdebwv+Vg+e5sOAmD/uolbmNcWsFxAAudx
	KGi8rjf/3tMtKVHj/SsrQdJHG3Qbe/HGLzTY3qoech9Fnr+WilAwJx2wJZ/crwFLsHDqhIBCSBh
	pWujZsBiJkyw0r+w9aQMwrxeL+YK3v7KAiTPPV5Ck71oc59HrFDbpWZwekUjRJuiX+FpJ7ddmZw
	9iDI4DuXRtI+jzWxUbNKhEEOvVRqQmjwygwagLJ760rsCwtK1xqEny6I6H569lunwlrpJ9DXa/H
	SgHI8BmJPEb1b4cjebIF3i73+L+i6R
X-Received: by 2002:a05:6300:210f:b0:3a2:dc51:449 with SMTP id adf61e73a8af0-3aab1331df0mr4341024637.12.1778261919212;
        Fri, 08 May 2026 10:38:39 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826767e677sm2476579a12.4.2026.05.08.10.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 10:38:38 -0700 (PDT)
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
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH] rust: time: add debug assertions for out-of-range input in fsleep()
Date: Sat,  9 May 2026 02:38:27 +0900
Message-ID: <20260508173827.1123011-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsleep() documents out-of-range input as a bug but does not check
it, unlike udelay(). Add `debug_assert!` calls to catch it in
debug builds.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
Hello,

I found this small inconsistency while reading the code. The same
check was applied to udelay() [1] but does not seem to have been
extended to fsleep(). Please let me know if I have misunderstood
anything.

[1] https://lore.kernel.org/all/20251103112958.2961517-2-fujita.tomonori@gmail.com

Best Regards,
Sang-Heon Jeon
---
 rust/kernel/time/delay.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/time/delay.rs b/rust/kernel/time/delay.rs
index b5b1b42797a0..1e699fe647ff 100644
--- a/rust/kernel/time/delay.rs
+++ b/rust/kernel/time/delay.rs
@@ -32,6 +32,9 @@ pub fn fsleep(delta: Delta) {
     // overflow inside fsleep, which could lead to unintentional infinite sleep.
     const MAX_DELTA: Delta = Delta::from_micros(i32::MAX as i64);
 
+    debug_assert!(delta.as_nanos() >= 0);
+    debug_assert!(delta <= MAX_DELTA);
+
     let delta = if (Delta::ZERO..=MAX_DELTA).contains(&delta) {
         delta
     } else {
-- 
2.43.0

