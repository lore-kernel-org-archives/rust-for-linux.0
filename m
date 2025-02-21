Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225641FDA78
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 06:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740119637; cv=none; b=I8ZScdB1cVKDcairDCdjWvG8pTYYUrTrlOufcltig4VbFamq5AaQNq3msfZ/CJ1ZKNcGWwWEEjQh9kycn/rmCas0qnn8Popx/UiEynASZPnZ2hDZzuF54h8j5YbvFIoEdGxXNWSJdNuW1JmmCyRVWG5Wnq66MsX+0jOu2fISq1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740119637; c=relaxed/simple;
	bh=XfNumtN4pntiPXT3WjU9gI4RSXkCFWq44vGld0DYJV4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W1Qv5l1ZBr9xEZ/v/QkHXLlmXTcEuFPeaM06F58hkNQDpgfhmWgD2LmMX44rM3/A4voVYEBmlnrE00TPAczIrnLeY8NhYMAaXuyhIsHUewYhhtg78FP0m2zWgVHXFQGehhn+j6cDPwe56Ddz8rsQo7w7wPiK7jQ48OlDjiJ73YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KXF72MO5; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KXF72MO5"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so2831114a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Feb 2025 22:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740119635; x=1740724435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5JMkcIG3pfHnou11Qf01++3WTlk/gyrXuC/G/iyeFk=;
        b=KXF72MO588zZepgxPnbMpAl539iFBB8G8Kn1PC/DsqZqrHNCbaCY54JC4DV5jZCw1Q
         8qs2uRodHRhAp/1oITAW4vyIrCe74XnTPpExHRXAZIgWtDFNrgukeDRP/vwArKMFGfZE
         H7u3xug5uHrHry5RFqsaMo9eYi/KE52gZHnjJio+hvJtU2FZ/zxY5hdYh06s0UWXH3GP
         XOeP0aEA44IZxRhrFY36G5syY4w8ayAgthXGh889jYQqvMYp9LxpxkI97XJU4/6YMQc6
         XlmJMQSoFXLwZjzhuE0xJNnE5HfmT7eRcsO4GZJrbusPG0asAg1TZciXwcG3NB86JyFo
         xV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740119635; x=1740724435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5JMkcIG3pfHnou11Qf01++3WTlk/gyrXuC/G/iyeFk=;
        b=NbmvUjzXl82/PIRqnYw/vwu9YqJpRauRFdbBI5ld0xpi2HdUCk6H7L9tmdVfIEw/+k
         75JNttIyHz1lUpBh6TEvAElfKET0f4+OMM38Ux2u5f6HgVwD4NfAqa+Od4m9/WKuCZuI
         sM521P8J8/avXQEBUdSrQQeNmiR1Yw5DJOlu68trBgQVIUyYHzJWBVanKhYG0JBr8Qb+
         MYSEa5rjKeM91eFzE5Hz5JWVOOzfHtKl0bOLPa0zBTdMUdD47F8pgg0ClWFjqdQb518G
         AREkN68nFafy6eGFuWrGSGQYPwEunXWEhBOlUF5Ogp9t0RHunTixAHHkYQ7oAqlRCDrz
         hERA==
X-Forwarded-Encrypted: i=1; AJvYcCVyLzn+drSqX0wEm/dTUQsr6MLx8eFZd3L3Ep3Ru5HBW2kvI7MIeXsBSHXLtun7YTHRgMFts/tC+0ku5aB4tA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw871eXyrDR6Q3aDFo2sJfLzTvx8dUyeKKHfb1NobpRtm+F0mNn
	niZquhArxXEJH6hR3bEYxXEpSRH2mgAxTnnirYyRkXG1/7MlnQgEXIpzUjkE248=
X-Gm-Gg: ASbGnctn27K0I0hvGLsj5r9MroQ3xLTNAPE/Wi4C6QOV+M8QTvoKwxffPZ6pljFCuuq
	yzOQqorEJhTxGgFl9G5KjnD9nd2QANe/X/tTz6MYtUaZITtFnlHmyjdcGZbizID84a8d1qK0y7s
	SluEdqpXLvDWJZ33iMC3KVCuc6hesuGj9mO8xMIcsRvCwLDM0X7K4bahcTau7d8EpbDtlaNI+gR
	2N6wKUMW9lCFN1+agQlaypy7UVEgHVwmQjuNtwOhyPL2dapHTFNHBdBn5c/RCLOhUwMOE7rH1OT
	8/wLT6JT8qyty5o97ZxdbDW/VG9d
X-Google-Smtp-Source: AGHT+IHFXK0jGPDKL1QAUurC6Uusa7DZsVN5fk1633DweZDhRI+yAiePHqHtVqL41XxmksffttTcAQ==
X-Received: by 2002:a17:90b:56cd:b0:2ee:af31:a7bd with SMTP id 98e67ed59e1d1-2fce789b251mr3297120a91.5.1740119635456;
        Thu, 20 Feb 2025 22:33:55 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb04bf4dsm521568a91.18.2025.02.20.22.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 22:33:54 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH V2 1/2] rust: Add clk helpers
Date: Fri, 21 Feb 2025 12:03:38 +0530
Message-Id: <7e4e95e221569070d72bb45ea0922e76be7db2a3.1740118863.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1740118863.git.viresh.kumar@linaro.org>
References: <cover.1740118863.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to prepare for adding Rust abstractions for the clock APIs,
this patch adds clock helpers required by the Rust implementation.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/clk.c              | 57 +++++++++++++++++++++++++++++++++
 rust/helpers/helpers.c          |  1 +
 4 files changed, 60 insertions(+)
 create mode 100644 rust/helpers/clk.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 25c86f47353d..726110d3c988 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5778,6 +5778,7 @@ F:	include/dt-bindings/clock/
 F:	include/linux/clk-pr*
 F:	include/linux/clk/
 F:	include/linux/of_clk.h
+F:	rust/helpers/clk.c
 X:	drivers/clk/clkdev.c
 
 COMMON INTERNET FILE SYSTEM CLIENT (CIFS and SMB3)
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 55354e4dec14..4e4e16c3b479 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
+#include <linux/clk.h>
 #include <linux/cred.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
diff --git a/rust/helpers/clk.c b/rust/helpers/clk.c
new file mode 100644
index 000000000000..3c63b50ad6fb
--- /dev/null
+++ b/rust/helpers/clk.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/clk.h>
+
+#ifndef CONFIG_HAVE_CLK
+struct clk *rust_helper_clk_get(struct device *dev, const char *id)
+{
+	return clk_get(dev, id);
+}
+
+void rust_helper_clk_put(struct clk *clk)
+{
+	clk_put(clk);
+}
+
+int rust_helper_clk_enable(struct clk *clk)
+{
+	return clk_enable(clk);
+}
+
+void rust_helper_clk_disable(struct clk *clk)
+{
+	clk_disable(clk);
+}
+
+unsigned long rust_helper_clk_get_rate(struct clk *clk)
+{
+	return clk_get_rate(clk);
+}
+
+int rust_helper_clk_set_rate(struct clk *clk, unsigned long rate)
+{
+	return clk_set_rate(clk, rate);
+}
+#endif
+
+#ifndef CONFIG_HAVE_CLK_PREPARE
+int rust_helper_clk_prepare(struct clk *clk)
+{
+	return clk_prepare(clk);
+}
+
+void rust_helper_clk_unprepare(struct clk *clk)
+{
+	clk_unprepare(clk);
+}
+#endif
+
+int rust_helper_clk_prepare_enable(struct clk *clk)
+{
+	return clk_prepare_enable(clk);
+}
+
+void rust_helper_clk_disable_unprepare(struct clk *clk)
+{
+	clk_disable_unprepare(clk);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0640b7e115be..4700ee7aaf85 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -11,6 +11,7 @@
 #include "bug.c"
 #include "build_assert.c"
 #include "build_bug.c"
+#include "clk.c"
 #include "cred.c"
 #include "device.c"
 #include "err.c"
-- 
2.31.1.272.g89b43f80a514

