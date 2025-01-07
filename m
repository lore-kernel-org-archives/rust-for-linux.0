Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CC71EC014
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jan 2025 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736248943; cv=none; b=uJ717u1eRMEepbvPHfU6GAU1smmxfZwij/3BU4G8ZmKeFYgi5tPE10jk6Y5S29H1rrV/thk7aB7QYovvDAI8IZdW4Skj8vQSYPIxT2ZhXmGp4kRzStkUK5YWRsFaJOk0Fi8xYsYSB+sF1asBi7JDIfPP6BuMu9Y1AJfAZj27J9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736248943; c=relaxed/simple;
	bh=PccWBZudFGEFCQBLaRQhX5wve9pjKiNUCgjY0XQwRwM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OTCpDgqrRf89xsXDanMiGRXHqBo408RCQolyzmv0tP4Q4xHxh/NovR0nWx1L687C7bYutXuULs4xqQAwiJjy/r2FE+EHlhQhEVEwIS0CKGKKamHeRsW1blMTe9Q38iNry2vRKFPXFEURzY6i4dno9sas7Sel/Jv2YTsBiHd2Cr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wpUSMYfi; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wpUSMYfi"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2163dc5155fso221055365ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jan 2025 03:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736248939; x=1736853739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPLN3KOEBuhV1C8sKrsSSOzmgmHuWJIddO48GgL9uhs=;
        b=wpUSMYfiE8bwixCFFQeZxmeGfXM1oIU11h1f1GrrolYHRV76V5i/FYBAqi0gtot0KR
         25/trxvz5Q/pFrLAuJrjMY6XJBNcUEvSh75mBKAbZI4YQ95kuq7zrgh8cIU52c/F3eLT
         44V8hAUbRXtcbNUEZWQf/V4//Cts06nGClIGjzUpYBdBq9OEBJ8xMwQzYMWj+xBmeFXW
         cl/+coi0OAF/R1Nm3TSFndJ85oEFwMT9D+9lI2Efl5h53FnnXaYrXlE8eA7Bw0ZOBb8+
         +dW3WUyCdO8TfDZ0rJArXB/3pWPNQJ3FBcewBXYMt/yzpJkwvNxhC2mPOmY/1CcNxERe
         h2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736248939; x=1736853739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPLN3KOEBuhV1C8sKrsSSOzmgmHuWJIddO48GgL9uhs=;
        b=AHwpviBa8kIMWIPrs3MBfBrlI1ALly6NpMDDPJT/ttwoL1l0fbf/0awGeV7dMcpo7s
         FYK1YvZev9QFLKa22nz7k4UgODsL1fVpIJqGimZlaNwErStEnN7ZMzFz1DRdkC5sUzdW
         dOTsYTR66d2O6+idffFGiwZTJvSMn2LqrgHpMfAQqm4wttIWo1MTtpQJjR6VkujXY0xu
         xjNgpi/gU2d/u6B3v00sFljZUCi4V/x4SselzukON0qsFEw/PFTEf26BGQLtMJxdh7MI
         GXZv8kcQNA10XriiiHZFX8IhqfvEpo7VK1GDKfiE7u1GobklFAAzHBTKX9CxmjrB3Ko/
         HX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNGzelRaZMBqCwnBmxHJxfErN4WFnbtH32jBm87+2rcbGNYfc3og/3qPeod9cdp/tTwID/6M2wb0XmNy0PMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7c7WvfsEzDlBows3c69a9gXgBV6GM9YKuEPlg0xaWrs52MhUg
	yT8ATR1r69rJY6FTnhWJ+CXeMmfQRCm4yJY8aJI54MqD6/H8V7eHn8D4zhDw8SU=
X-Gm-Gg: ASbGnctNfm8eEP5uRls+wEF5wiyqnhR3KOyMu/0mYnpXwxPlbMiJVwBSCmVpekr2o6/
	00Dt770k3U/b7gWNiXDGWGZ9niRGfgwR8LIIOH6ohcqfZYIXSwlT7W1nadvK/EdKG0rM05K0htJ
	+qpw0xSd/98qJhbJhuh0p1aLswfoC4P2UhN/pGnhbC1AnAocC+DT1vActl+me7BfbQsEaIqHxWv
	6TpNk8biFqwqx1kp8QDy2RLdHA6DPlJCIEcxOzCY3b7ELmXfJmpyasEKmc=
X-Google-Smtp-Source: AGHT+IFJK8eyMEu61rre8C/LpTf6jUk08Sq73gBJdPW1Iwy9OQYXQSpAG6l+R+aS9ebLvT8GdKxi7Q==
X-Received: by 2002:a17:903:2341:b0:215:9ea1:e95e with SMTP id d9443c01a7336-219e6ea1c17mr987978065ad.13.1736248939115;
        Tue, 07 Jan 2025 03:22:19 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962940sm307237985ad.34.2025.01.07.03.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:22:18 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V6 03/15] cpufreq: Rust implementation doesn't parse BIT() macro
Date: Tue,  7 Jan 2025 16:51:36 +0530
Message-Id: <9719ba8b3a921bd9f2cb7ebf902c54c708b5409d.1736248242.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1736248242.git.viresh.kumar@linaro.org>
References: <cover.1736248242.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust isn't able to parse the macro for now, avoid using it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/linux/cpufreq.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 6b882ff4dc24..aa7b105a952f 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -296,7 +296,7 @@ static inline void cpufreq_stats_record_transition(struct cpufreq_policy *policy
 #define CPUFREQ_RELATION_H 1  /* highest frequency below or at target */
 #define CPUFREQ_RELATION_C 2  /* closest frequency to target */
 /* relation flags */
-#define CPUFREQ_RELATION_E BIT(2) /* Get if possible an efficient frequency */
+#define CPUFREQ_RELATION_E (1 << 2) /* Get if possible an efficient frequency */
 
 #define CPUFREQ_RELATION_LE (CPUFREQ_RELATION_L | CPUFREQ_RELATION_E)
 #define CPUFREQ_RELATION_HE (CPUFREQ_RELATION_H | CPUFREQ_RELATION_E)
@@ -424,16 +424,16 @@ struct cpufreq_driver {
  * the diver if the target frequency does not change, but the policy min or max
  * may have changed.
  */
-#define CPUFREQ_NEED_UPDATE_LIMITS		BIT(0)
+#define CPUFREQ_NEED_UPDATE_LIMITS		(1 << 0)
 
 /* loops_per_jiffy or other kernel "constants" aren't affected by frequency transitions */
-#define CPUFREQ_CONST_LOOPS			BIT(1)
+#define CPUFREQ_CONST_LOOPS			(1 << 1)
 
 /*
  * Set by drivers that want the core to automatically register the cpufreq
  * driver as a thermal cooling device.
  */
-#define CPUFREQ_IS_COOLING_DEV			BIT(2)
+#define CPUFREQ_IS_COOLING_DEV			(1 << 2)
 
 /*
  * This should be set by platforms having multiple clock-domains, i.e.
@@ -441,14 +441,14 @@ struct cpufreq_driver {
  * be created in cpu/cpu<num>/cpufreq/ directory and so they can use the same
  * governor with different tunables for different clusters.
  */
-#define CPUFREQ_HAVE_GOVERNOR_PER_POLICY	BIT(3)
+#define CPUFREQ_HAVE_GOVERNOR_PER_POLICY	(1 << 3)
 
 /*
  * Driver will do POSTCHANGE notifications from outside of their ->target()
  * routine and so must set cpufreq_driver->flags with this flag, so that core
  * can handle them specially.
  */
-#define CPUFREQ_ASYNC_NOTIFICATION		BIT(4)
+#define CPUFREQ_ASYNC_NOTIFICATION		(1 << 4)
 
 /*
  * Set by drivers which want cpufreq core to check if CPU is running at a
@@ -457,13 +457,13 @@ struct cpufreq_driver {
  * from the table. And if that fails, we will stop further boot process by
  * issuing a BUG_ON().
  */
-#define CPUFREQ_NEED_INITIAL_FREQ_CHECK	BIT(5)
+#define CPUFREQ_NEED_INITIAL_FREQ_CHECK	(1 << 5)
 
 /*
  * Set by drivers to disallow use of governors with "dynamic_switching" flag
  * set.
  */
-#define CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING	BIT(6)
+#define CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING	(1 << 6)
 
 int cpufreq_register_driver(struct cpufreq_driver *driver_data);
 void cpufreq_unregister_driver(struct cpufreq_driver *driver_data);
-- 
2.31.1.272.g89b43f80a514

