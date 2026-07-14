Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC3E37E5D7
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 20:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784061001; cv=none; b=t+ZPcM8SH9r6Lwoqzr9b5TJ1nkoVAJE78aIaE6swjd08rv4QnMMMY/NOI928L3ju2x+y4dpw40aVwP+XswglxwpTfHON1+x1d8t0wP+4lpyq8GFAC+R0hayNC+V8plRXa8s0tmT+OR723oF0HWB3KmrDHchq4OFZpXx5IegI5I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784061001; c=relaxed/simple;
	bh=c9fdKBH/vtGepDnqpGKzq5maJ4MjTn1w47SwgHps2WQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FwQ6TLpYqHQStCJvVqtpn3i6JmFH9gWdphxYbZI+21gs5qQb5/gUEwjIcXke+H+HuwXfYO5I2sNU4VMbtHvKnLc3bOZ4t2XMMkge15oUAPyjpHX9+hjVPNr1Gyoy7tQn6f4nqLGMjRxypF+sKjxZCz4S9pHfpV3C4O/FJyBKcyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=I5eL31WS; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="I5eL31WS"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cea3004256so47255085ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 13:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1784060999; x=1784665799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZur0yFW9SBBqW/U3WR5hitjV9IhMqzRIOKDSAZ2zKs=;
        b=I5eL31WSRzu/bpJ6NltD6/s2BUh0iYjcl8SLFFijD/xcnSuiGG4MNhudaiRujQj+SN
         SSB5WZaTrlUSYegD+Z3PHkzACXyCRc9f3I3xITeBDgpAVpqHH8FGkFGY4i9vbhSSYRIf
         IIHS5goIB0lLdAZjHlr28MWuhHC+jvbK1Co1CNsDmvuyyGrwpbT6AksV+o56jFe7gc/s
         qNXLNteHLXlwg5E0lthHdEuyhpsE0EGro7mqkffMV6e2u1nQdsA9oQoNZMJP+Ada7NCa
         d0cAKLmxUgJ77QS8fsc13l+xWoIk9+9BMh2qpvhF2fKkNKJJTbPxj6Dz76LPV5chaJqw
         QsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784060999; x=1784665799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZur0yFW9SBBqW/U3WR5hitjV9IhMqzRIOKDSAZ2zKs=;
        b=fV+FUbvriztRQ04jk029kZqE1ucLdfg6sCBoBTeeLEIuLHO2qR/dACvUuuZWJXBlB/
         IK3VViBolHIL2X9yBhhTijy8qejyiyVN4aug2+yw0rgJ4Cx1W68071Xsn2Zf9H8o6v5/
         TsjynfOp/D7WgShVfGbwr44L1OQY7yVaMT7aV2LRTegXSvt8B5TJ9FYKcdXO4FOsyN43
         Em8AssQb0/UwJH0yDKq2E55E/WzGKo8m7ldSPMi+qh+0L1NgjZrElM0c4ileKm6awIKC
         88DMaShMnhAYOtA6CNxEm9bMqpIGYdkbP2+vnBX8f9p24EZrJXwSnfXs0m0FwDehtLP9
         c9+g==
X-Forwarded-Encrypted: i=1; AHgh+RqepYY/QjS3XL2B/bwyJR8A+wr4YSZVxAWm8MvLGNu7y34afqPBHaLtQl4HEcTxzrlNh9dGcGzjPuy6Ia+Sug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX0P2o0El9PkzFgxG0j9LhPIVvc9XX84Wks7WLp6CrhS2mXxfq
	LN1RdOxgUlCGOG/iUTcSwcPPap6Okckh7kgubECgdolm1K7zDVjAZ23FokLKPmlBQtg=
X-Gm-Gg: AfdE7cl73h6990twLlkBD3gO932Kn5Wrro/NiHAyqfLS+MkIdBmOjkwdccKX/uHwZUM
	wD/aYftcPosdclDBE1KHl6BdAw4dp6P66CSmB+EPomgBISm69lqV+Y/ucqN/1KKASjP5IKq/ps7
	Y7QnEjSUr+itfpETWW09osCdNZ0VgqB1QerOvJVDpSRkJp9gyVDFIxhtsIXxy2dbE0d/IrcrtGJ
	UYAOetoFzozfYC9/g+f8zBPAwLMIFYj9F+H928I6ttTk4/yvdUOk4Ua1Jdk1rMO3axhxi/n/7xh
	1ILzuPgqnujitSKQ7RHdOCyqsqhYCLqhCJ0ycCuRKPRcI7k5N4XIO5CxjAP7GdhHPIsIIPvrdRc
	vdNTurIy4yOhM48zq8O45lxrXICuNLvuwL2DQr7gnfyLOOmGJ3XakkMj10VZII6p9J0lrJhlXIe
	aeeSa0EanhMpr0PE3qDozD2ZJSLgZn5NfsesuOPX4WOYJnAuVZFA==
X-Received: by 2002:a05:6a20:d818:b0:3b4:e4f0:94e1 with SMTP id adf61e73a8af0-3c3571d0443mr4900580637.39.1784060998930;
        Tue, 14 Jul 2026 13:29:58 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm150647131c88.14.2026.07.14.13.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:29:58 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	ytan089@ucr.edu,
	pgovind2@uci.edu
Subject: [PATCH 1/1] rust: cpufreq: Add CPUFREQ_TABLE_END as last table entry in TableBuilder::to_table
Date: Tue, 14 Jul 2026 20:29:57 +0000
Message-Id: <833f1ca55f3709387804abe18e5759383ba7898b.1783548374.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1783548374.git.pgovind2@uci.edu>
References: <cover.1783548374.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `TableBuilder::to_table` function adds `Hertz(c_ulong::MAX).as_khz()` 
as the last frequency entry in the frequency table. 
But the C API expects the last entry to have frequency set to 
`CPUFREQ_TABLE_END` which is `~1u` as per include/linux/cpufreq.h.

Fix this by setting the last frequency entry to `CPUFREQ_TABLE_END` 
instead of `Hertz(c_ulong::MAX).as_khz()`.

---
Fixes: 2207856ff0bc8d953d6e89bda70b8978c2de8bab ("rust: cpufreq: Add initial abstractions for cpufreq framework")
Reported-by: Dylan Zueck<dzueck@uci.edu>
Reported-by: Yuan Tan<ytan089@ucr.edu>
Signed-off-by: Priya Bala Govindasamy<pgovind2@uci.edu>
Assisted-by: ChatGPT:gpt-5.4

 rust/kernel/cpufreq.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 58ac04c650a1..97ab97724931 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -377,8 +377,14 @@ pub fn add(&mut self, freq: Hertz, flags: u32, driver_data: u32) -> Result {
     /// Consumes the [`TableBuilder`] and returns [`TableBox`].
     pub fn to_table(mut self) -> Result<TableBox> {
         // Add last entry to the table.
-        self.add(Hertz(c_ulong::MAX), 0, 0)?;
-
+        self.entries.push(
+            bindings::cpufreq_frequency_table {
+                flags: 0,
+                driver_data: 0,
+                frequency: bindings::CPUFREQ_TABLE_END as u32,
+            },
+            GFP_KERNEL,
+        )?;
         TableBox::new(self.entries)
     }
 }
-- 
2.34.1

