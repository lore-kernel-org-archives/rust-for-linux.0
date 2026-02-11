Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EF7344D91
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 03:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780631; cv=none; b=mp+T2TwYg9wclUmbpP3R06ABs2FJmpWPTiqiyWAy3LiktsCY475FaOGrNlZt+1NUFYqZbHDXtwsf3un9O2k7rMcVGJ1puqnX6cvfjQOknZIJeIe9tswwHe7RmH/QUhVK+vqGe0uBG1V6dX9lFdvz4Iw158PbXpnmNGnmoI3LPJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780631; c=relaxed/simple;
	bh=3KwgssT0qLSW0xBZrdG5K1brZw1i/pcHLAEb0PzMGv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fXjfokY4oPflorKZpvSm5BX7GOMgJ/ndsXk5hUqLoObCYOR7/AUnuKpNiMRIvijtxl/eMiYTenFhG17ehK8W9no0pUV9crRSdnaGXbeZ5BDS/KiHO6e/63TCqqpDFVlX17SAXKXbR9oahrm0k0zQWwacVgeWM9dvlBv8FVRpcvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YquY9jk2; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YquY9jk2"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c47ee987401so196813a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 19:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770780630; x=1771385430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dg944eAYwPSQ7NjEWDDm+/KZG6xsl7b2l82fMEgSYcM=;
        b=YquY9jk2WfObP4B0UhrgKBsE5Xsdah95vDEj1c2QbseqZ5rmtp9Ay3OW1mcYUA7Hdw
         rjuskHzsqqCMLdDfMfYkkvT2ZxlTNfrLxie5R/ojvaeJrZ9IlME0s2peFAP79tBFIsQV
         MxxdnLJeDeU/D3CbQZDj3j0/9kHX1T4zGIx7otee6HZCiKaTBK0v/dszkhL1fuqxs/CX
         AxwzoHFnwj/0ib8X+DUFAKXzQSLEWNCFAUZwdSQYlySC4S7vIvjJUnypBnqAX/wMXNDL
         dd4WcAW1Bj9tufjzt5k1JSZ2CuFOCbAvxCp+5TwqbyZ/kUpXs3vY1Q2VqvNZ5tzeRy2T
         4N4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780630; x=1771385430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dg944eAYwPSQ7NjEWDDm+/KZG6xsl7b2l82fMEgSYcM=;
        b=vsR5ojKDKppEUDG4RJHjMl2Rou9/FuKzeqOdbXwpq2+orIh9RNDjnVXQ+YvGrPLw0p
         /oXT9b/FwayD96c5AupdVzZmXOUMgByPiL+18MZQ/py5cdcJZewzGB7Mg8YVP6Xtcag2
         dJRxCzbIZkNtQQ+3d4x0T4Sl3Eb/DGGCwwJ4ESyelmcZW5TCANzOag+54HBtkJJFmlwe
         e/I7nniUARYWIkYX/CRGxeIq9LqdyRNm9P0eW9go1IUavUSZa1HBjnT0NMYicpb7jLhP
         NIMCQbYlEHjrdbfLONwu1oE6+aNQYY5DSLSqecvXlriMgURQI1LidsoTQ2cNysgKLbAl
         8n+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLeFJKUadnxtQ2aWoP8GVrU60fDtoDM8d7s2i+dk9Nwy2kTHY0Q75do3RCJ6DHk7x/uGez3BaZN07V92V/6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXiOaH/LOMhOpjaT4pi2oJge6s//Ph3Nnot6OYEF4h3Xzi05aw
	m6MLeQw4N6V1k5VUvXL8OqZHFPzuCNwFp22BZV8Arszw18B5hBieIOIE
X-Gm-Gg: AZuq6aIUelw4cUqNM/0rLv0/XLBBmKIqZjyt23JQAXJ+fiynww8PKNs77F1LBCbgT1n
	bc4+UrPgDIeWqye/Uu4f9xD4cwf5FizuwnhKFBGVfi2CDRLHbThnwcCWSju1LcJZY96a2F3Ks17
	Pa0qKRZTwl6t2/PMPLkb7djNRCB/u6btpJyb3PY0jkAlQQUZWlXTYybBCRUqMlTTF7AUXu35jjR
	WZtQlR73fMGeRede5ZxXjSdyDdLIrcGx9/Cl5GXlGZ3vid5A1E9Q6JyHTzM2QVd0eJmrKMxSJWG
	f162llPBdG+X+rJjCLntq4zaejAcMPZfPh79oLFbyqonCJVyO/A2UyVFdmUdeb5gxJGbAFW5JDQ
	fsfu+xz9c4M0oA5prWPt1Jfyfl6gVRBQDeT/NowSpdhYbQNIWZTYsESy4NHyTzAaEGW2mb2ihR8
	tbeFbrDHuHaHd1jjQm357kjP7QOl3yHoSGHYil0J0Gaw==
X-Received: by 2002:a05:6a21:e58b:b0:375:4503:ef0e with SMTP id adf61e73a8af0-3941556bee6mr4592807637.14.1770780629942;
        Tue, 10 Feb 2026 19:30:29 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d63c9sm464856a12.20.2026.02.10.19.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:30:29 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	rust-for-linux@vger.kernel.org,
	akpm@linux-foundation.org,
	linux-pci@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alex.gaynor@gmail.com,
	benno.lossin@proton.me,
	boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	tmgross@umich.edu,
	alistair23@gmail.com,
	ojeda@kernel.org,
	wilfred.mallawa@wdc.com,
	aliceryhl@google.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC v3 06/27] rust: add bindings for hash.h
Date: Wed, 11 Feb 2026 13:29:13 +1000
Message-ID: <20260211032935.2705841-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211032935.2705841-1-alistair.francis@wdc.com>
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
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
 rust/bindings/bindings_helper.h |  2 ++
 rust/helpers/hash.c             | 18 ++++++++++++++++++
 rust/helpers/helpers.c          |  1 +
 3 files changed, 21 insertions(+)
 create mode 100644 rust/helpers/hash.c

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b42..0075c4b62c29 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -34,6 +34,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
+#include <crypto/hash.h>
 #include <kunit/test.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/bitmap.h>
@@ -60,6 +61,7 @@
 #include <linux/fs.h>
 #include <linux/i2c.h>
 #include <linux/ioport.h>
+#include <linux/hash.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
 #include <linux/mdio.h>
diff --git a/rust/helpers/hash.c b/rust/helpers/hash.c
new file mode 100644
index 000000000000..8ddb84668841
--- /dev/null
+++ b/rust/helpers/hash.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <crypto/hash.h>
+
+unsigned int rust_helper_crypto_shash_descsize(struct crypto_shash *tfm)
+{
+	return crypto_shash_descsize(tfm);
+}
+
+unsigned int rust_helper_crypto_shash_digestsize(struct crypto_shash *tfm)
+{
+	return crypto_shash_digestsize(tfm);
+}
+
+void rust_helper_crypto_free_shash(struct crypto_shash *tfm)
+{
+	crypto_free_shash(tfm);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index a3c42e51f00a..4b08b4f1d3a3 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -30,6 +30,7 @@
 #include "dma.c"
 #include "drm.c"
 #include "err.c"
+#include "hash.c"
 #include "irq.c"
 #include "fs.c"
 #include "io.c"
-- 
2.52.0

