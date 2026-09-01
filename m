Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ABC399361
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 01:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224705; cv=none; b=cjvwnkwQOMc7vrvEodE9eTvfIZZMRNftUXeAqTzOgl3Gl17LBY31Ncj0LTZ+7mkkHqRSh43oI/FFMI5Mu01I9uyBRWGE2y+d9MRTnJAy5oF/1ZzOQdgzAjPxJRmG4IZuh0XlhrvAGevmSvsjdxrPAZKTg8pj3rozUDoGI94UIoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224705; c=relaxed/simple;
	bh=7H9GI30AsWmAlTdg30uohie4gLRcANCA6UmHmEupp3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GuwigwIR41xN4Gr08SQARvyCWKj1n3J59KS1ph12svtAd7Y2ntsRf2ACcIVj7JwLWmTuDmL6Nct/uBFKr/Eobsmds7xzAB52uW7+fFqTmJ8G17QnzrDdQ6M1WbaFBXaEFhg11fCMzG0EXnUJ5vcPHhjfXPNyq0pQCgl7vWZzjE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+YQ2TYC; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+YQ2TYC"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso272087a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 18:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788224702; x=1788829502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWbFM6ywa1yjj692OE0MrLQnEnm7JyCgqunSYul2orw=;
        b=d+YQ2TYCuKChwoPQfL5IsXw8KZDWudgQ5nl55KRLhDWcU/gJC7uZKUR3Rsa/hvrFIu
         1zjw7xN2aiWcDdflQlzlDhDMg77O2eY3YssOVRaf2XiZtm5rediRfOrjYTmzSJdEpWTP
         Etuy2TgNIKbTKKGOWNpne0L+sq8ENRQYtdnHtwvhCBmxZg6KB9F4g4A7X1n4M+PJpz9Y
         ILDCryRfLkRlNnRi8i7BYNjxR/d4/TkjfRKcXgwPLCXMbRaU/8yJHZzS4/uOnjuup5va
         Ww4MNUHPwhYNpt1U3+/xZ5Ou4r0FnLhO2m7lDhhLye1J9nQ4GWB69Gk2gc+HtyXqHFD8
         uxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788224702; x=1788829502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jWbFM6ywa1yjj692OE0MrLQnEnm7JyCgqunSYul2orw=;
        b=VD+JoGaThSeEvbT/EGbphcvbzWXps5l+1MYq4KCQBfoY6GONsixPPO14SLpsra2fWN
         w9rZkZYDYRRfMuFob+KxgbGVb44VfsDBESp+rM/aiipLdQnRkhJ17RUgM/4F5ANfh5Bm
         PkBEChXIlPN9dgCMgcBto0SaHNQ/LAQpgajssaKxx1TCB2LtFmcQT4rv5wjmZJ7vfZi+
         T3BJMch1QUuirlcwgDoknO+89+S4HrGFqPVttvpOpiwtQ6oSsakI2vq3NyexZO+uZeDL
         ym7HIIIzXbH0WxybalwYwzJMi3D5Ye6tKSXw93UOgV/8SZH5WXDpqABThgW/FWH95fgT
         ShKg==
X-Forwarded-Encrypted: i=1; AKwUvBwZO2nlZlT05hHHhNDUcD9P1GequBsXD1Zmc9kQ9Ro71gWSSIR85LfKHPPmMBPqlIYahpHjjQm9O9LXXwIE4g==@vger.kernel.org
X-Gm-Message-State: AFuF++lPM4xfYb4ncXDB7cUbiiijUNWom7d3Nk2+kobAFJggRynf2I68
	4U1tCB7rNgr5Fug2RgSQQzE0kDhSIVCErv7zb2Uiaav4Yu6m2YD9Vex3
X-Gm-Gg: AYBFou0I42EtdF/XuBS/nBtLMOM74FrIzAnjiNQsnv11g4W7j97KgJgJR7ZGNJ0UIBo
	qGn+vP6vdbJN4OkG2ccToZwtjbLKxLqDirISYDUjWXzniT9u3Xt2leeVWJ1YqHCwhC1mV1yPO7g
	TU4eWnqsdckYbqIBEUqX1AhYqdVLudLHhCp4M5m+Tx0xBggafWIfNDrAlbLwpUHbKw+MU4i/9MY
	EQ+KewFMUeT4yJLWv4tOZllTbgwQ8OfhUUGqg4cozdeUyX4cbSc9XRHEB8WJnY8JPRsHDcfMwgO
	hvHWBZdl02UECI49nZTrZeRbwFz78Q0x2N+TYtAoX3JDnHPMnPwG+Z8lvEoosWDnJV6EUksNFeS
	lYishcWpTidfn4PlMnnh0UFp5Xjim6UMtHrq+l8OlMiMstcD6q+XnDE//yKZfIZMmdS5ofoUpyK
	puwV5mTpMaD/fJbXE1i+E5KFZay7hlukjP0DfFYAJHXzk05MQ/PLszbjYD2jowpXfwgrZtJX0DR
	Y/9kQ==
X-Received: by 2002:a17:90b:164b:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-396d0c79e8amr44052502a91.0.1788224702403;
        Mon, 31 Aug 2026 18:05:02 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d49e9e0sm2372024a91.11.2026.08.31.18.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:05:01 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: linux-pci@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	djbw@kernel.org,
	rust-for-linux@vger.kernel.org,
	lukas@wunner.de,
	alistair@alistair23.me,
	jic23@kernel.org,
	linux-cxl@vger.kernel.org,
	bhelgaas@google.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: gary@garyguo.net,
	ojeda@kernel.org,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	alistair23@gmail.com,
	boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 07/21] rust: add bindings for hash.h
Date: Tue,  1 Sep 2026 11:03:33 +1000
Message-ID: <20260901010347.2614656-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901010347.2614656-1-alistair.francis@wdc.com>
References: <20260901010347.2614656-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Make the functions crypto_shash_descsize(), crypto_shash_digestsize()
and crypto_free_shash() available to Rust.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/hash.c             | 18 ++++++++++++++++++
 rust/helpers/helpers.c          |  1 +
 3 files changed, 20 insertions(+)
 create mode 100644 rust/helpers/hash.c

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 4b31aa7f432f..fd223b6c5aaf 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -30,6 +30,7 @@
 
 #include <linux/acpi.h>
 #include <linux/gpu_buddy.h>
+#include <crypto/hash.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
diff --git a/rust/helpers/hash.c b/rust/helpers/hash.c
new file mode 100644
index 000000000000..23a63618a370
--- /dev/null
+++ b/rust/helpers/hash.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <crypto/hash.h>
+
+__rust_helper unsigned int rust_helper_crypto_shash_descsize(struct crypto_shash *tfm)
+{
+	return crypto_shash_descsize(tfm);
+}
+
+__rust_helper unsigned int rust_helper_crypto_shash_digestsize(struct crypto_shash *tfm)
+{
+	return crypto_shash_digestsize(tfm);
+}
+
+__rust_helper void rust_helper_crypto_free_shash(struct crypto_shash *tfm)
+{
+	crypto_free_shash(tfm);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 440fb7638e3c..09ec69f736b1 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -66,6 +66,7 @@
 #include "fs.c"
 #include "fwctl.c"
 #include "gpu.c"
+#include "hash.c"
 #include "interrupt.c"
 #include "io.c"
 #include "irq.c"
-- 
2.55.0

