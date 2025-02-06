Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C344E22D4F7
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Feb 2025 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834151; cv=none; b=ehSeatrEqeYOSI09ePBj/LeSSWCYzTJAdY1JzTQKAKl7Nr5mpVFItsGmtnpmNvELLMtF0qZnFLWkDXUKnCB0/oLX6rBcJGWz5EHscR+Nfz56ZvcccA3K/I5ubMJ7PgrqLYG7F0pmXikQXmuDPP8l3otc9pSVj+W4JblBHZFdaj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834151; c=relaxed/simple;
	bh=N5KuSHGuim/2ltuf1CgPtREiUHrSzunHBtCeRYx+xXs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nXPK9EvMEUiLJUAXdWYMvwFNS2h17Wo73zB3dpXGz6k2n6+UkprHPR+Na7RjSSgLlyZgFF/+mTWDUHz8qq2RR29lgMc3TqsFsm3hkPN7+7d1k+WB43rUsqA/nL/tpcsxNTmkC7hXPAEbShuJszs23w55NpLlLoOBjg7VM+/7gVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sc77Q82G; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sc77Q82G"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f16af1f71so10202285ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Feb 2025 01:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834149; x=1739438949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnnLlALAvod9HBe452p93Qf9oTal7xzFyAI477ScgZM=;
        b=sc77Q82GSplB60NLau89LR+M2b6Blb8An7/PuaqQytPQbrvV8RreaRXa3K4CrVrXwM
         EvLhxFhV1AjDeXHvFyCuTb8Pkysh3w1CFadPv1W8H+3NzekGaouLlP2zahkmqKNlaTAS
         aocz2PKJ5iJay0chM/YwdGJymhpNY6pa/fX3yB1c/r8OzDE5z8xbidnT8JsD/Y4tOcZ0
         fw5yzBx4LBxBs5MWz8LbkhVHlmh1W58mbZxbx9eFutpohMhSG9VAf6MAg3YlTqb1rZ6G
         XEw96wB30BNF5EUVrNUk8AmNThbXy5SdEDtxvwqdQwJnraN/AGCoup7954Nxc7C/gs2X
         3VhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834149; x=1739438949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnnLlALAvod9HBe452p93Qf9oTal7xzFyAI477ScgZM=;
        b=vbS/22w/v8cvJ4lA6dibSGfPr0a29nLUPdz4OFdvZ+Qyg4C9r15YtHAbwgV7FJPuI1
         83hkEQNsW+r2tsLjIldRXFBTyWZ91B3Q0hV8jDFEB6VsSedFKCwBcSfcXYf71m1wOau5
         99akUT8rA9sp+IvPw4KomiB33Yz7QTYxi8AieRcHl3DvK6nHUlnc3+650aXqkB59jIop
         Ot1Ar/vj+On5QjBz1SpZWsxreG3loydhWHnqDBJUDlOtCGqOU06p/9B6yO7UbFV/ubEv
         8e1Gau/ZAyVIMkFdDk+0G98wBn0FfB6H4rUr8OcI/mcN08NL63EHGd5d8gG0hpEsZM6O
         bIsw==
X-Forwarded-Encrypted: i=1; AJvYcCUGB9t9pI1GqwJTaIOkwNLQyzCf7ThsymLdf6UdfZE+z4tAItCUsYgJlXrBgZ4k/XnzQ5jdxHNLmGw5QOOikg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoA8p/yAqApfGGxQ7XG86YWJ1cp9QtO7zumTE/ZgT8kcOR9bR0
	/XTQiCUq6kyhN73P0N1QegJckThwOM48syhMhh1as9D6fFgF0MIi3pyIjTMpwP0=
X-Gm-Gg: ASbGnctzA4uy3vZMWfZPyCcGmHnl0bmT8uTF/QTggwExRPsUnDmM5rc9xMxIGcggmq9
	ercRZGQk1SB0SpKyIvqQiZ280K51DAzo1qphRSvQUBe29Wj2Z5jhRxo5XoIF4j+Tkloaibq1I1H
	Bz1ogyin5uz1S/5DL5n8hr+3oAcmfFD0dNmnMTZNa9Ah33/f6gbTDWphg+EeWkMXNCrvjBfpsF6
	jSeFVwzPtRiU9ehUsSxOe8g79C3jr7MqFLaoHeurhdF7W9ry7C5/M4q+UgQpLmJ1HkW431OJqr5
	FAqAxh9wMLDVGsayZQ==
X-Google-Smtp-Source: AGHT+IFhy+AgYokZxM3HWCBUPc9xYncGxlqmLNHYEWBcgsKtPNb/mhJ3KsrxJ6CgY09YEPKvYF5m8g==
X-Received: by 2002:a17:902:ce87:b0:215:5ea2:6544 with SMTP id d9443c01a7336-21f17dd685bmr96867085ad.7.1738834149070;
        Thu, 06 Feb 2025 01:29:09 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368ce622sm7994205ad.241.2025.02.06.01.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:29:08 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
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
Subject: [PATCH V8 04/14] rust: Add cpumask helpers
Date: Thu,  6 Feb 2025 14:58:25 +0530
Message-Id: <db0166341ce824c157d0c58c240b3efc6aec6f6e.1738832118.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1738832118.git.viresh.kumar@linaro.org>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to prepare for adding Rust abstractions for cpumask, this patch
adds cpumask helpers.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/cpumask.c          | 40 +++++++++++++++++++++++++++++++++
 rust/helpers/helpers.c          |  1 +
 4 files changed, 43 insertions(+)
 create mode 100644 rust/helpers/cpumask.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ee6709599df5..bfc1bf2ebd77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4021,6 +4021,7 @@ F:	lib/cpumask_kunit.c
 F:	lib/find_bit.c
 F:	lib/find_bit_benchmark.c
 F:	lib/test_bitmap.c
+F:	rust/helpers/cpumask.c
 F:	tools/include/linux/bitfield.h
 F:	tools/include/linux/bitmap.h
 F:	tools/include/linux/bits.h
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index fda1e0d8f376..59b4bc49d039 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -11,6 +11,7 @@
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
 #include <linux/cpu.h>
+#include <linux/cpumask.h>
 #include <linux/cred.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
new file mode 100644
index 000000000000..49267ad33b3c
--- /dev/null
+++ b/rust/helpers/cpumask.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/cpumask.h>
+
+void rust_helper_cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
+{
+	cpumask_set_cpu(cpu, dstp);
+}
+
+void rust_helper_cpumask_clear_cpu(int cpu, struct cpumask *dstp)
+{
+	cpumask_clear_cpu(cpu, dstp);
+}
+
+void rust_helper_cpumask_setall(struct cpumask *dstp)
+{
+	cpumask_setall(dstp);
+}
+
+unsigned int rust_helper_cpumask_weight(struct cpumask *srcp)
+{
+	return cpumask_weight(srcp);
+}
+
+void rust_helper_cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
+{
+	cpumask_copy(dstp, srcp);
+}
+
+bool rust_helper_zalloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
+{
+	return zalloc_cpumask_var(mask, flags);
+}
+
+#ifndef CONFIG_CPUMASK_OFFSTACK
+void rust_helper_free_cpumask_var(cpumask_var_t mask)
+{
+	free_cpumask_var(mask);
+}
+#endif
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0640b7e115be..de2341cfd917 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -11,6 +11,7 @@
 #include "bug.c"
 #include "build_assert.c"
 #include "build_bug.c"
+#include "cpumask.c"
 #include "cred.c"
 #include "device.c"
 #include "err.c"
-- 
2.31.1.272.g89b43f80a514

