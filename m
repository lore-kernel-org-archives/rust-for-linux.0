Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86763EB0EB
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 23:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784331351; cv=none; b=BFG6B+KLSOilhWYe6cv2+xbzSFBTlVPxaxu3K5QjcDsE4OL7hG+Gfz0t1IlLRKb8tyFKGBVK9Ai4mLQ/hA3wxV41kIT7SlkmSAQ5ZVWTXJjrfn8fwDYCAXgBk1+litZa5ek1hF+tNFyS4ASXRPtXYyBS7TBllAfxATXRngGua84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784331351; c=relaxed/simple;
	bh=ZYC0BVHUA9DWfLjamDlXvQyBTsc6cWZh1kFesOJmelU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I6i18mNIRYD0P70yk6emb64LqZ3squb/fepJbaV2NLq/bqQJX02JbekXfeEq4L88PXn5IsS2xlrrhClUa8OD2Tb7d34TIE/BL6qaMs/kp7huUciiHGwEZiunRlyGvsUSgY7ibIjT76jh2916cYExMzm44G4jBfangTPSL63G+Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=Gdhwan7a; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="Gdhwan7a"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caea3f742bso102236075ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 16:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1784331337; x=1784936137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkcgPCrUKntk778Bux9cr0o5ER0XvmXk7Las59gJH7A=;
        b=Gdhwan7ah7qV9FRNIrNUWw0NG7kE8pTu2D21dokCq8eQwY1LiuZyf6kromHTu+/gS7
         4X7RuN1mhgQbbrb5Fp8umHDMrjRlaQNlSV5PkOXHjlMrQA4976xiVOr6sHeyRBT7dhmU
         UGpQj/wOZMIxURdOTLGz8FP3HDIXApqKXlj/EpsSd7Dcmo7baEMruhCQ7+OsCLc5M7bc
         mTSZdNn38InygPegO3B0O2Y8xGms0fO2O0FH+X9zEvhb/OZntv9hx8EE6ieAolo0yVso
         VW3nU9oD5jyuXjkmgKhERPJOZvRiFYdb28aukgG4fSjCgSVjv6odUvcR1HXugt9a868m
         npwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784331337; x=1784936137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkcgPCrUKntk778Bux9cr0o5ER0XvmXk7Las59gJH7A=;
        b=InGMDOvKzzcLQMkOiJbBkbiV6JteNS6pnwy3EsVIbDiymeLIOeESfHFr+M+w7IAkU+
         7CJbzFutfCz2Ps2B9pIKvOyC1XueOkowYlWm3iQk8LhAgCbokNU8jL8fuFmyDn1pWIuY
         elod8FmkvslyxL8PhzpvymdhR5HL789eMerQDlsnuQIg1mYH2UwMMfl8nxUawsqntB5d
         EhQyv6h3Ek7sQmtqnr2OXDupvzM857i/7wKqj95iVfJVp6b4NTdlD6o1reutzawbwJw5
         pGW3zISiXKakqBPrjvA1iqZkEUR4SH2gDnTEGXvIVQnhM8nLUa2ioMGA8ZPy56dVol6X
         FqkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEiXMG745OWZljK98Cu3dy/oZIUdUVhgG5gVk9dUEsIzH6Kd0U848AYEn0v2JjOgiIib3OCQb0Cq6JH9A4AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl9mWkJi8B89NnedMqlP8BlkECdZqGcxpvbO5Darba8xeGmPkh
	GNsnBAWvyZKpFKUbI4s1PLfvg1kGVFH0TdHel2FAF2xLKLcHsRbyRc95Lu/M+vtTp5w=
X-Gm-Gg: AfdE7cm7K+jOVMpTbpnmNTFpQRLd9yUtwoRz+GojcldzLTLczSMWc/HFm16JeHeauU5
	Mi9i1mPq4n1lnHpRcJS+fcem8qGX0RiHqOFuDdB+qDizn71hKSV6IY9wEch3h0+roNucc8B1//z
	JQ5x7XvTlB1lQ7RhuiseWdnr6F++rl1OZ/3btPLRgAxv94ZeUzlpl/wsZ2ua2Pp4A+RPuvsQkb3
	5IZyoN+iZNnhgbAakYFXopLvnWKTmnRLsV7ExYHkELTcAvBXdLSVAoQv5MMQvcX7F6GQPccwXuT
	PqTbOTgyB8LV0lbmAClKfDJAoDfVuvkhdMwDm85bbAHv5TNOYFN7CdoNwXG4RLySmbHBmiWYToI
	cRtCwyDO34u92pYKONYryDr2/kZGzXZucfe5KcHLTY/Efrdm2o5YWijyGxIiQyVfeMSoK5tYVEX
	8VE4MRiSnAk7AHK3RBaI6BWltnc8b/Ef9K79Cxpp4=
X-Received: by 2002:a17:90b:3851:b0:37c:774c:77ba with SMTP id 98e67ed59e1d1-38e4b516692mr4624630a91.21.1784331337502;
        Fri, 17 Jul 2026 16:35:37 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm20452266eec.21.2026.07.17.16.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:35:36 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	ojeda@kernel.org,
	aliceryhl@google.com,
	boqun@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	ytan089@ucr.edu,
	pgovind2@uci.edu
Subject: [PATCH v2] rust: cpufreq: Fix temporary write in Registration::bios_limit_callback
Date: Fri, 17 Jul 2026 23:35:35 +0000
Message-Id: <2fd4425697efb6d52459cd886115edd281bd5f44.1784155370.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In `Registration::bios_limit_callback`, the expression
`&mut (unsafe { *limit })` creates a reference to a temporary copy
of the value pointed to by `limit` on the stack.
Therefore, writes made by `T::bios_limit` go to this temporary
instead of the memory location pointed to by `limit`.

Additionally, `limit` may be uninitialized, such as when
`Registration::bios_limit_callback` is invoked by `show_bios_limit`
in drivers/cpufreq/cpufreq.c. Therefore dereferencing `limit` is
unsound.

Fix this by changing the signature of `T::bios_limit` to return the limit
value.
`Registration::bios_limit_callback` can then update `limit` directly.

Fixes: c6af9a1191d042839e56abff69e8b0302d117988 ("rust: cpufreq: Extend abstractions for driver registration")
Reported-by: Dylan Zueck<dzueck@uci.edu>
Reported-by: Yuan Tan<ytan089@ucr.edu>
Signed-off-by: Priya Bala Govindasamy<pgovind2@uci.edu>
Assisted-by: ChatGPT:gpt-5.4

changes in v2:
 - Change the signature of `T::bios_limit` and have
   `Registration::bios_limit_callback` write to `limit` directly instead of initializing `limit` to zero first and passing a mutable reference of `limit` to `T::bios_limit`
 - v1 Link: https://lore.kernel.org/rust-for-linux/cover.1783456063.git.pgovind2@uci.edu/T/#t
---
 rust/kernel/cpufreq.rs | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 58ac04c650a1..5dc09063f4e9 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -817,7 +817,9 @@ fn update_limits(_policy: &mut Policy) {
     }
 
     /// Driver's `bios_limit` callback.
-    fn bios_limit(_policy: &mut Policy, _limit: &mut u32) -> Result {
+    ///
+    /// Returns the limit
+    fn bios_limit(_policy: &mut Policy) -> Result<u32> {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
@@ -1352,9 +1354,10 @@ impl<T: Driver> Registration<T> {
 
         from_result(|| {
             let mut policy = PolicyCpu::from_cpu(cpu_id)?;
-
+            let val = T::bios_limit(&mut policy)?;
             // SAFETY: `limit` is guaranteed by the C code to be valid.
-            T::bios_limit(&mut policy, &mut (unsafe { *limit })).map(|()| 0)
+            unsafe { core::ptr::write(limit, val); }
+            Ok(0)
         })
     }
 
-- 
2.34.1

