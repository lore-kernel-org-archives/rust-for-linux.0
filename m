Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF4F22F172
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767419; cv=none; b=jKjjR9OPmYhJ47Xl7lguf5VmC7kq9pYtoN1D5fFa6+8niDQfhZ0av4kzRil/T0DFY2A154SSjJSBcvh6jHcfbZW9ArSfGCwyUZmOKfEvwpCgwqm7pL2Rc63hGcJoeQ7oC/TUjps+ojpEmkQ63EDYtoqgWsX0ksEXTvcEUmeuNO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767419; c=relaxed/simple;
	bh=t2NVGvjKSZ8jGPHeqUP8byps2cHUv/LlWtK1ugt6aZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WvcyZ4NoivXmIoVouTe555PWPnT8L38CHh7z3lBTtYT9bHkth8Do6pBMwyo2TAHhi1R7Wza/KTJul0VLBaKHWQNDqvXcpfmOp2QnoWRBHT3nCGXc6vLZSAHykCqi6AVKaDGmJx12bhAzlpabuoUHgy0A2+ftmgZQtKPZv/P0L0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qAZOIls4; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qAZOIls4"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21628b3fe7dso67886885ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 03:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736767417; x=1737372217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkWjr0H8S/ljloJuoBCwCDqimDzQkeaXdlPta4A4wUg=;
        b=qAZOIls4V5W4SGXSvGGSzTWCW01R/F5//n8XhLzEJHp5pl3QruA6InJ50MzRrpkqe4
         hHVFk4nBLYFBExWQi5EW1Zl55depgJDw+UdT3MPfatamxzC8wA1E1/03Na80nFupocYG
         uuBFKDKj17lpSxU28XSOVh2+HBX5LbV7pZMmPz8SEw/BTNXFq0E8H1JAbj8qnbtMIlFU
         aISjzuOyB5AmagXhv5lYG50psmI3eFwl6aUkuCZo9DhTEyqy4nwQ+fT5W4lREyySEUeK
         wScldyIdpZEYwX7cgaYVJ687nb/mcDk5oBm3wuehCbpwp5+d9LcGvc8nibECkdE+AvCG
         850A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767417; x=1737372217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkWjr0H8S/ljloJuoBCwCDqimDzQkeaXdlPta4A4wUg=;
        b=LmOQG2QCuuga85wyzgSYl4i1aYDIuRReLgclZlmGHrPvBwAQ4KZax8Kd+jI/LrDIKS
         g4/nCrlW4VD8j53lAKU0etIdqH0CHsYRfxVt/dRsIL5BwCWJr54BWIPHktEg+2dp+Y/K
         RxtF5Px55ySyPXmGVlBUDpdetFF6G2oh1DKeB1WlqXGhmU3ghnqra+De1LwXPT7fOoKX
         TiPGj/fvBysIod57160i0V/qJFT7JlICqWnl8wLqm2+g9H8wDaTvrmRRTfi26aJtPCBC
         qBiU0iDy+gUkhpLEtZnCmq4bEbNazzp7eTMZVmQOD8ptciupulXs/IGt+TgQWPVXYYhn
         Lr5A==
X-Forwarded-Encrypted: i=1; AJvYcCW1R2vSTPk8lcU1URHy9a8rN+QWJaclkhnFeb+BDNI60uk/bJgB3ShmeI/pR6Zi+YsGSsF9VMfdcNol0L75Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyygXMzYvptbYw+Gypakbrp6rUgqhGqJBrLgPgrwHkM6Mrk06N
	g/q+ZMSMcDRxZpDGM4+WZnAimmf1ttVG8Kil/9gbwnJFuTzGakHMialSYOQZ17Y=
X-Gm-Gg: ASbGncsSJ+Y0l6/xBcbPvOu1WIsGZkxncbCRUYs1uDN7rCEGHMbsGQlFvCUSw/VyFap
	GGfheSJtbKyv+6JzVzUqLPcnnpuD8RyqCsyZBmefiOCtzHZ1ACYxS1fLOXgbweKjDqFNC573wcu
	hVOj+1T/rQHvKFMcekNWi84OMOfAx9JDe++4DMbxG1iCUJ9C264RyVPsdz+rgi2rMEWnDmznrDT
	kj5SAQ8zRidhc4HNqiVRWtkmM136fAvwttM2wpgLzA7YqmIwp3Jicj1fRk=
X-Google-Smtp-Source: AGHT+IER2IavZa5iXzD4g2K372L5f9GipR0r5PB88XAPUzM7jWJLtQOWBOiD/bbJYuu6z8pO19v2iw==
X-Received: by 2002:a05:6a00:846:b0:725:df1a:285 with SMTP id d2e1a72fcca58-72d21f476b9mr26557791b3a.12.1736767416693;
        Mon, 13 Jan 2025 03:23:36 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d406587a1sm5844149b3a.105.2025.01.13.03.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 03:23:36 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
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
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH V7 01/16] cpufreq: Use enum for cpufreq flags that use BIT()
Date: Mon, 13 Jan 2025 16:52:56 +0530
Message-Id: <2916658cf432f924661121a91c3269354dc41853.1736766672.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1736766672.git.viresh.kumar@linaro.org>
References: <cover.1736766672.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BIT() macro is too complex for Rust's bindgen to interpret as
integer constants. This results in many of the cpufreq macros being
undefined in Rust auto-generated bindings. By replacing the "#define"
macros with an "enum", we ensure that bindgen can properly evaluate
these values, enabling their seamless use in Rust code.

No intentional functional impact.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/linux/cpufreq.h | 96 ++++++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 45 deletions(-)

diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 7fe0981a7e46..bd67728081ad 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -292,11 +292,12 @@ static inline void cpufreq_stats_record_transition(struct cpufreq_policy *policy
  *                      CPUFREQ DRIVER INTERFACE                     *
  *********************************************************************/
 
-#define CPUFREQ_RELATION_L 0  /* lowest frequency at or above target */
-#define CPUFREQ_RELATION_H 1  /* highest frequency below or at target */
-#define CPUFREQ_RELATION_C 2  /* closest frequency to target */
-/* relation flags */
-#define CPUFREQ_RELATION_E BIT(2) /* Get if possible an efficient frequency */
+enum {
+	CPUFREQ_RELATION_L = 0, /* lowest frequency at or above target */
+	CPUFREQ_RELATION_H = BIT(0), /* highest frequency below or at target */
+	CPUFREQ_RELATION_C = BIT(1), /* closest frequency to target */
+	CPUFREQ_RELATION_E = BIT(2), /* Get if possible an efficient frequency */
+};
 
 #define CPUFREQ_RELATION_LE (CPUFREQ_RELATION_L | CPUFREQ_RELATION_E)
 #define CPUFREQ_RELATION_HE (CPUFREQ_RELATION_H | CPUFREQ_RELATION_E)
@@ -418,52 +419,57 @@ struct cpufreq_driver {
 
 /* flags */
 
-/*
- * Set by drivers that need to update internal upper and lower boundaries along
- * with the target frequency and so the core and governors should also invoke
- * the diver if the target frequency does not change, but the policy min or max
- * may have changed.
- */
-#define CPUFREQ_NEED_UPDATE_LIMITS		BIT(0)
+enum {
+	/*
+	 * Set by drivers that need to update internal upper and lower
+	 * boundaries along with the target frequency and so the core and
+	 * governors should also invoke the diver if the target frequency does
+	 * not change, but the policy min or max may have changed.
+	 */
+	CPUFREQ_NEED_UPDATE_LIMITS		= BIT(0),
 
-/* loops_per_jiffy or other kernel "constants" aren't affected by frequency transitions */
-#define CPUFREQ_CONST_LOOPS			BIT(1)
+	/*
+	 * loops_per_jiffy or other kernel "constants" aren't affected by
+	 * frequency transitions.
+	 */
+	CPUFREQ_CONST_LOOPS			= BIT(1),
 
-/*
- * Set by drivers that want the core to automatically register the cpufreq
- * driver as a thermal cooling device.
- */
-#define CPUFREQ_IS_COOLING_DEV			BIT(2)
+	/*
+	 * Set by drivers that want the core to automatically register the
+	 * cpufreq driver as a thermal cooling device.
+	 */
+	CPUFREQ_IS_COOLING_DEV			= BIT(2),
 
-/*
- * This should be set by platforms having multiple clock-domains, i.e.
- * supporting multiple policies. With this sysfs directories of governor would
- * be created in cpu/cpu<num>/cpufreq/ directory and so they can use the same
- * governor with different tunables for different clusters.
- */
-#define CPUFREQ_HAVE_GOVERNOR_PER_POLICY	BIT(3)
+	/*
+	 * This should be set by platforms having multiple clock-domains, i.e.
+	 * supporting multiple policies. With this sysfs directories of governor
+	 * would be created in cpu/cpu<num>/cpufreq/ directory and so they can
+	 * use the same governor with different tunables for different clusters.
+	 */
+	CPUFREQ_HAVE_GOVERNOR_PER_POLICY	= BIT(3),
 
-/*
- * Driver will do POSTCHANGE notifications from outside of their ->target()
- * routine and so must set cpufreq_driver->flags with this flag, so that core
- * can handle them specially.
- */
-#define CPUFREQ_ASYNC_NOTIFICATION		BIT(4)
+	/*
+	 * Driver will do POSTCHANGE notifications from outside of their
+	 * ->target() routine and so must set cpufreq_driver->flags with this
+	 *  flag, so that core can handle them specially.
+	 */
+	CPUFREQ_ASYNC_NOTIFICATION		= BIT(4),
 
-/*
- * Set by drivers which want cpufreq core to check if CPU is running at a
- * frequency present in freq-table exposed by the driver. For these drivers if
- * CPU is found running at an out of table freq, we will try to set it to a freq
- * from the table. And if that fails, we will stop further boot process by
- * issuing a BUG_ON().
- */
-#define CPUFREQ_NEED_INITIAL_FREQ_CHECK	BIT(5)
+	/*
+	 * Set by drivers which want cpufreq core to check if CPU is running at
+	 * a frequency present in freq-table exposed by the driver. For these
+	 * drivers if CPU is found running at an out of table freq, we will try
+	 * to set it to a freq from the table. And if that fails, we will stop
+	 * further boot process by issuing a BUG_ON().
+	 */
+	CPUFREQ_NEED_INITIAL_FREQ_CHECK		= BIT(5),
 
-/*
- * Set by drivers to disallow use of governors with "dynamic_switching" flag
- * set.
- */
-#define CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING	BIT(6)
+	/*
+	 * Set by drivers to disallow use of governors with "dynamic_switching"
+	 * flag set.
+	 */
+	CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING	= BIT(6),
+};
 
 int cpufreq_register_driver(struct cpufreq_driver *driver_data);
 void cpufreq_unregister_driver(struct cpufreq_driver *driver_data);
-- 
2.31.1.272.g89b43f80a514

