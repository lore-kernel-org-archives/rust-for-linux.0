Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078800;
	b=Wl6dfcry84eL4N5ygeuyfg/skJmuYNx4mB4syjl+vTJLem2w8CJEZEMIRbyIh5WP03x1
	 9VyPtnJvvN6+zonNT3oEUNhd/LMyOwwaVaBvp+eJ1EF62TTXiiDCDGJnp/G6WYBVGDI2N
	 Qr3/0InzZFosYxXGTcHj1DmmukAphNtPzCKNIPUuab4RE0pZ/8yvTIllKxzOx1XTlxspQ
	 afx/opAAZz7KmdYOkPhSrKNf/hf5gEcpGYoGyZGshht4Pje5fT5f1yKeIYWyFiSiqzfGh
	 tYRDOpxHGs1/uYepS4/rn8tTXSnw68MMZat8mup7ysVIDP63KWO/hGq04MAhCNCkT5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0x6mTxkP4nBs1deJf2I2SUu12QHLK1lhJg3onPx8YVk=;
	b=fF0RXW0VZntQpiLccLPzkbsDEIrSRrjYR9fR//4Nxz/txvFuesHB75drhHpaKpaMlbwc
	 jn6+DMTZ+hceu4qT2I0IVOySTMa0vHx8xHrfrp6i0DX+nqWC8mG0oM4Nnngu0VimgAllo
	 qs5iN4aNv4Grci8eDv+72GjG2afQbhsLipNRjYJVad8oesgwM6Q9b0gnr1rLnka2Oe3ae
	 WAxJ+lxyHBfMlXh7m0rmCpQ+BKsbqlO0n6SWI0RaM3/uj6AgTx9bUeSgvxAwIdiPzuu3+
	 a6cMUHrcgpkm0EtOPW/Ruh+Q9rZUt75yBWPwXL2WdppA7iqzs2BtUkb2FfEbi0YLVEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Ghwts+3/";
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2213606A324
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 05:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2213606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ghwts+3/
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9cf928dc9so2588935ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 22:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078799; x=1793683599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0x6mTxkP4nBs1deJf2I2SUu12QHLK1lhJg3onPx8YVk=;
        b=Ghwts+3/hrGnnAzwWpysKTB0hd2asbwn/FondnpQC/sUw0xIjOVjhFF0wm2h4+l9gp
         sPRtbxsmY/EyoJkhZl1vLxdsnp0D8G0TMs2AFYXw5ecowDoGCO5LphDoFPKGwGrNq103
         pFBFIoKYQgOQy7lbkYEPy3zS+4TzoeMU9Y1KKn/yro9QDnvolQV2aJQ6W5gexYqglT2o
         58tX26UzbtduhhMjUBofOx/nRAOsSCtFyMhOk/m47o1Ddgb9e7JgJuck3DDpNs+311iD
         uITJl0bAiZRyUun61ZziSK9euut3tVMF52n2IITtzTEV5lIHjff16P2x13v775iQxx3p
         OcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078799; x=1793683599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0x6mTxkP4nBs1deJf2I2SUu12QHLK1lhJg3onPx8YVk=;
        b=mGTwYlz8jDGW/eJaUQOtC0xVbiiGlxLRCAcjiSK81xhWVGJ58hlUUTLoDNb7GMxjky
         5UuCfBnhTBsWEYTu1c5wVWL4bxAa/K4b5R73UrSQSe92zDeY7DDjTFvSp6OYnPTwQgSE
         AVDOdom6EBrQsxrB4a7hY2n+AHn58FfSsb+zcZBLkTyeMTf0hC0tU08xxXHg1RrDe5CA
         67wpmimQG7vIIFZb7ID/S0lDgLGLtRE1zm29WX9JXFROv2gjRd4erYKDQepW4lS7HUCk
         r908Ix4mFoHSUJvOEOrjaBNgC97w0NnZQUIOwqOZNZ4AKj31uoYuAmLZPn3lcBa77JEw
         9S1g==
X-Forwarded-Encrypted: i=1; AKwUvByEh+Co1Z+cmgrp9KGusOaQ3S3DXvSBqFD0hWPEBxwnUktA3RQ1/TYsNiSLRnWmAyRSoDMMwKLO304+mnEP7w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIrJI0x7bJWZUNjvGU4boBlZbD9w1uuFdSPg/Pv2H/EyuSQX6sR
	FDQ3c4GIkAXzYptv28Llju2ZStgx96b0bXJ+KytdFGsBz1IcVNuZF21S
X-Gm-Gg: AYBFou1HpV6LSGZNXCxuKiSUtiTvF4M7DFJ9P6g3/pFT9uyr+M6QQg9CXADdQ2RSUxI
	k37+tMLF1PlQ8h0hrD/RI6feu55d8PEjdrUI4FTmDcbyluVHUM+zvsFsUBvBl0Wq9MdgVc7xOwy
	OUUvx0QjljXh4D3+g7L1C2pPVBVQOiPCs6fhbNSN9DcxQHCLc6eE5yguxra3fCWvJ5Fqqoo1Fla
	yKFJjX8mFRcdFOcdePmTHoArYBukOqe8czujJ1Y7Cl9L0JNPSvAO1XNBhJztxaUIo6LUkK3qVpF
	D4dmdArKxKL2QtcFheCdNIGkou2sfjCTpqS/dj2VCvFPlxAphyDvDEW646a+QEO4EZ+xCFpl2Nz
	ackuaWtH5MIYsvwqGn5PuRGK1o6rhAZCYF8swpG+8IknD/Ed+krz1y9PgtxoC3RqlZdPRYRV2EG
	pRQFH9ulqZ4+fLM39GLYDq0Dh98qqeV1mUVhwVm90ZnqZuTpqsrqoNFU7CF9jIzu4MmkWYOyKgj
	6dCZRk8g6/JqW4JhYxkRK5/HKqRIGf3GyJOiv8CVj1FwIHxOCxr2aykogAWldqy5kafUejUNY6J
	dYtyvPAU69CC6GpFdPg=
X-Received: by 2002:a17:902:e946:b0:2ea:dee6:d672 with SMTP id d9443c01a7336-2eae3ed93b0mr9549575ad.19.1793078799174;
        Mon, 26 Oct 2026 22:26:39 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:26:38 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	alistair@alistair23.me,
	rust-for-linux@vger.kernel.org,
	jic23@kernel.org
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	alistair23@gmail.com,
	wilfred.mallawa@wdc.com,
	bjorn3_gh@protonmail.com,
	gregkh@linuxfoundation.org,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	gary@garyguo.net,
	tmgross@umich.edu,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 07/23] rust: add bindings for hash.h
Date: Tue, 27 Oct 2026 15:25:20 +1000
Message-ID: <20261027052536.1722081-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027052536.1722081-1-alistair.francis@wdc.com>
References: <20261027052536.1722081-1-alistair.francis@wdc.com>
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

From: Alistair Francis <alistair.francis@wdc.com>

Make the functions crypto_shash_descsize(), crypto_shash_digestsize()
and crypto_free_shash() available to Rust.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/hash.c             | 22 ++++++++++++++++++++++
 rust/helpers/helpers.c          |  1 +
 3 files changed, 24 insertions(+)
 create mode 100644 rust/helpers/hash.c

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3791af0aadc73..4992bc3194e7e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -28,6 +28,7 @@
  */
 #include <linux/hrtimer_types.h>
 
+#include <crypto/hash.h>
 #include <linux/acpi.h>
 #include <linux/gpu_buddy.h>
 #include <drm/drm_device.h>
diff --git a/rust/helpers/hash.c b/rust/helpers/hash.c
new file mode 100644
index 0000000000000..0d88752084673
--- /dev/null
+++ b/rust/helpers/hash.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <crypto/hash.h>
+
+#ifdef CONFIG_CRYPTO
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
+
+#endif /* CONFIG_CRYPTO */
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index d62c7be1ca7bd..0dcdad905f0ef 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -67,6 +67,7 @@
 #include "fs.c"
 #include "fwctl.c"
 #include "gpu.c"
+#include "hash.c"
 #include "interrupt.c"
 #include "io.c"
 #include "irq.c"
-- 
2.56.0

