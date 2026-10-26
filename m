Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995329;
	b=WBLdRdSyP6G/Y/HLLXqsZBUMGeqq3FiIxmfSmd9SQRobckGA5PLCFsGs3CD6Sxmiu5Th
	 nMBgAAq1X0dHv7+9eYY0LdDd7zNwM0RM1k1+zi60R4fFBfFw6IDVjs+LL5uZjg2qYrcJ3
	 Q44WN5O00AEYl9BIvDV8zzlQkhXeyx5JDLch2YfVGx7B5Q0g/BSd6PRGaOVNNySepSh84
	 gJe+J2mBdEtLPm8wNxxxDBmTfkErJBVi+qwYlANRjTupeFA5zizvV2N+878A/vJjo9Dk0
	 //yD1Cyhc6qw791SzvZ8RXwxvI0UT0BehSRjpYamY5g/O1Uxuiba5qELVpeKWy4ybKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995329;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YJ9sOA8Nsg+qQDQcZZMvUJPFoEFL6QU2tHu4ECQIv8I=;
	b=C0WuQrzo8nIk1XNV33kvFsbXgeOtAkuwls7KSjTPcJumJIvWV8UP6zgWTQoKJekP+y7u
	 wD/g6A18bVLIr+prSGpBrkWRzBFojp8gx0kStIdySyrCduaGDukuCgC11hMiIaKxm9XHS
	 9llBiEVKzVceJ2PUdKhkPJBob2TSS2SGhj4Y3WrBFO0cHUQ5KsJTmMhCwXt8ZTVaCyeNU
	 LazoUK9VfgHSTAEDfrace6l/qii/xSyNeAyCPyIz0qHIUVXRn13oVDXdD2PKR3Sn0E8kv
	 S80QnqaCd5RODUzYK1vmWjlL86x8FutLYWSEd8mnyqLKCpX7+D/hO1gAYxtNsP/Dy5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=yFNlVgmM;
	arc=none smtp.remote-ip=162.62.57.137
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA09606A33C;
	Mon, 26 Oct 2026 06:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CA09606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=yFNlVgmM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792995316; bh=YJ9sOA8Nsg+qQDQcZZMvUJPFoEFL6QU2tHu4ECQIv8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=yFNlVgmMY0VqWBjG+XUyjPaTVxP9UgUO96zPJw09YBMiR8Ts3pqSyZabqHEqjfGn6
	 vsmueXKUz8U7DD7aI81Az5AWW2O5FVjC92o/1gcrdnLK8STKs4HF3N5Oa/serWn5hC
	 ayxjwRja2CcV1kbR+f5TJJY8tgTCjge2F3XPg8oA=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.198])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 3CC94AE4; Mon, 26 Oct 2026 14:15:12 +0800
X-QQ-mid: xmsmtpt1792995314twn62apv3
Message-ID: <tencent_934C4C7A02D17D453A99A5537EA029087705@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XBgDD11X1S9C3DFH/ftqgDZ7zN7+1EomdZZ1o/UKrqXIxGrZWRn
	 T706Fk0FwpE9GQdwTXwF3Fy4xLOGZVIgt4OSMl+zBqUrv+GyCDTDsgVrcPka80S0f6m3HvNJrFrt
	 GO1gbAeUq7yMo7dbU9YDJNYznbkN9AiGDyRzAGcMhDr0Y7yF6TloQrjHlE4CgPibj/0Wff4acJIk
	 2bEdbzF6xyujM8bFI/DqCzv/tOjNIhQC+IhNBBJykhj5txKrzYXCOS8U0kie6fS2r4kGgVPluX0y
	 2xR8Sf28CPI14IRAjSi1ZZ6E4DccvOnzEdjclo95P7oc1UNIfPzdR8bjNMVMKXa7xHCxvYQD537V
	 uFdjUPTiQs8mCZtWrTXWsRYxwt3i4BiOBIuwGJwKEcVSIl9Cz3bx0uiqq8k1czIVj5kV1DRKDOXW
	 ZegeJ2/w+cthnPG+fLwjI985wvP8nenqimkbp/KMlNpHPzRDLPrlGt7zhzx6maTXHuvqiyHMZcPS
	 OX+ayyFzY4Yc/m2uxORCUzLIPHAY0pLrKkJqdTyRewKC74A/HeC8Pfb8Kcjn6riyMp4kLsG+5170
	 1YmjD5/oTU4d4cJqoBw5R7rggHcT5620wu6zpeHBfBwMyUBla7tWzgVk5X5bzCs0I3vdQ7xZZRje
	 e5PqF7DKuzzpsRIKHmqu78M81HwAQjA2Dd8GumN+pyomdUTkHn2yQ1Rl4hxO0tnAvDeporC/7i4x
	 qkq68pNIQyzd5/7OdtAPjSqPZCayJs48JD80oFia7zy38AM2wyjLzG2Sptz5CgqhZ1k8NlManLOt
	 Z+Wu1PGTcwfSJ0zoUgjaP+53zx6x6r7idcGMouOIRLwAlZLa9owOVCmvKa1jCbioxuARNkgkvXor
	 vy2zmlfwnxfjpYyCqYSGoOlpF5CTZogL8vPobB3pkYRtdtO6KWgaWQFR5atPzX3pNF5KZ/XBFKPA
	 7R9HKPySY7gLfYxXAYWSWJl/KuxI99yiaiNbdASQy4c1xaJvJbOC/Z9/PZuxgykkgPhKtEhDllxl
	 5N7TEwHJNTMZvEFU5Yw1osSY0NWLRyB4qjiTfBlWtEGGUCbIHRQZy9wsI/lsA=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Shuai Liu <847807867@qq.com>
To: spi-devel-general@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: broonie@kernel.org,
	ojeda@kernel.org,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH 1/3] rust: helpers: add SPI helpers
Date: Mon, 26 Oct 2026 14:15:10 +0800
X-OQ-MSGID: <20261026061512.4180202-2-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026061512.4180202-1-847807867@qq.com>
References: <20261026061512.4180202-1-847807867@qq.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add C helpers for the SPI functions that are `static inline` in C and
therefore cannot be accessed from Rust directly: spi_unregister_driver(),
spi_write() and spi_read().

Also include <linux/spi/spi.h> in the bindgen bindings helper, so that
the Rust side can access the SPI data types.

Signed-off-by: Shuai Liu <847807867@qq.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/helpers.c          |  1 +
 rust/helpers/spi.c              | 21 +++++++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 rust/helpers/spi.c

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index c706dda5b5ca..c9062aae959a 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -88,6 +88,7 @@
 #include <linux/security.h>
 #include <linux/serdev.h>
 #include <linux/slab.h>
+#include <linux/spi/spi.h>
 #include <linux/sys_soc.h>
 #include <linux/task_work.h>
 #include <linux/tracepoint.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 9bb850294a2f..6b0f50c12f9c 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -96,6 +96,7 @@
 #include "serdev.c"
 #include "signal.c"
 #include "slab.c"
+#include "spi.c"
 #include "spinlock.c"
 #include "string.c"
 #include "srcu.c"
diff --git a/rust/helpers/spi.c b/rust/helpers/spi.c
new file mode 100644
index 000000000000..5046ddd1a2a9
--- /dev/null
+++ b/rust/helpers/spi.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/spi/spi.h>
+
+__rust_helper
+void rust_helper_spi_unregister_driver(struct spi_driver *sdrv)
+{
+	spi_unregister_driver(sdrv);
+}
+
+__rust_helper
+int rust_helper_spi_write(struct spi_device *spi, const void *buf, size_t len)
+{
+	return spi_write(spi, buf, len);
+}
+
+__rust_helper
+int rust_helper_spi_read(struct spi_device *spi, void *buf, size_t len)
+{
+	return spi_read(spi, buf, len);
+}
-- 
2.43.0

