Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA5B2848A6
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 08:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755678946; cv=none; b=Oi9QcaaJN1l0R/2O78c2sNNt+AdKcKFI2f8Qvu72O8XGFXM8Ew5w1Ur+aNVHsq7NuFNfkDg+csuCTouq5+zhMqVzi4VsMifKtwXUBApKJ3fRIkd6eyOKCBrXPmQQ3EAlXtMaqKrGCPxiehRpHpcb3/XtTF/ydsfC6x1JOa9i9NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755678946; c=relaxed/simple;
	bh=278j51yge04XOJmKtiSj3zXumTS//6Z3tuLMY8BE6iM=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=g6HgQ3aqPsEBwYBFbOLAHBZeioMybUn2MWA/bRNnVBbMjD4DmXxvjfRdgw7fVKN4OVMKwpcjeXJpZL6uNpceLOFh4VzZnxjadV/BeXNkLsu11GsJkbjVF4pMbJ+7rBSqI/Yvpm1VkbI4A9ZhbpQtVaT+onIzxYo7sVlcmlp+r8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WQ5mRwGD; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WQ5mRwGD"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250820083541euoutp016a1cbda7231b9b65b54fac559778ed4e~dbLIVh2_j1804018040euoutp01x
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 08:35:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250820083541euoutp016a1cbda7231b9b65b54fac559778ed4e~dbLIVh2_j1804018040euoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755678941;
	bh=6iiEvUCRFtFK7DqM8g315/TTGl9FgUVC8GFQ/o9G3Hk=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=WQ5mRwGD7rW46UInbJIDy7zI5XY5SYvg8BFCLoyAXChvso6MRxuiEBX0FQn21H1Q+
	 qe+b7/lKowraEg98G/ZPpjW0eDlls0kWTF931jCH3LQhXgyYQbdLiKC4RaZj/F/Qqk
	 iG3veOSfec6DUaDNIiOs9JZGQDiyyeFPOBN5Xw1A=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9~dbLHuSde72603926039eucas1p2c;
	Wed, 20 Aug 2025 08:35:41 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250820083540eusmtip271037063dd315265e69eb937ff57049d~dbLGpKgbq0492104921eusmtip2W;
	Wed, 20 Aug 2025 08:35:40 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 20 Aug 2025 10:35:36 +0200
Subject: [PATCH v14 1/7] pwm: Export `pwmchip_release` for external use
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-rust-next-pwm-working-fan-for-sending-v14-1-df2191621429@samsung.com>
In-Reply-To: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,  Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Benno Lossin <lossin@kernel.org>,  Michael
	Turquette <mturquette@baylibre.com>,  Drew Fustini <fustini@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>,  Benno Lossin
	<lossin@kernel.org>, Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9
X-EPHeader: CA
X-CMS-RootMailID: 20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
	<CGME20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9@eucas1p2.samsung.com>

The upcoming Rust abstraction layer for the PWM subsystem uses a custom
`dev->release` handler to safely manage the lifetime of its driver
data.

To prevent leaking the memory of the `struct pwm_chip` (allocated by
`pwmchip_alloc`), this custom handler must also call the original
`pwmchip_release` function to complete the cleanup.

Make `pwmchip_release` a global, exported function so that it can be
called from the Rust FFI bridge. This involves removing the `static`
keyword, adding a prototype to the public header, and exporting the
symbol.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/pwm/core.c  | 3 ++-
 include/linux/pwm.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 0d66376a83ec350e0c3718959f4d794efd71595a..a33da3dff608fdff91251e5fd07b0dbd295be022 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -1600,12 +1600,13 @@ void pwmchip_put(struct pwm_chip *chip)
 }
 EXPORT_SYMBOL_GPL(pwmchip_put);
 
-static void pwmchip_release(struct device *pwmchip_dev)
+void pwmchip_release(struct device *pwmchip_dev)
 {
 	struct pwm_chip *chip = pwmchip_from_dev(pwmchip_dev);
 
 	kfree(chip);
 }
+EXPORT_SYMBOL_GPL(pwmchip_release);
 
 struct pwm_chip *pwmchip_alloc(struct device *parent, unsigned int npwm, size_t sizeof_priv)
 {
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 8cafc483db53addf95591d1ac74287532c0fa0ee..d86061024b52172edf3845bf9252a966f120e365 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -485,6 +485,12 @@ int __pwmchip_add(struct pwm_chip *chip, struct module *owner);
 #define pwmchip_add(chip) __pwmchip_add(chip, THIS_MODULE)
 void pwmchip_remove(struct pwm_chip *chip);
 
+/*
+ * For FFI wrapper use only:
+ * The Rust PWM abstraction needs this to properly free the pwm_chip.
+ */
+void pwmchip_release(struct device *dev);
+
 int __devm_pwmchip_add(struct device *dev, struct pwm_chip *chip, struct module *owner);
 #define devm_pwmchip_add(dev, chip) __devm_pwmchip_add(dev, chip, THIS_MODULE)
 

-- 
2.34.1

