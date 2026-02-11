Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0475B344050
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 03:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780772; cv=none; b=RgZTx1GMQKRPebrHqFl9NKq/MB28iplwg3Gzm/zirzBITmzRjvlFlyYXYFERgCSYMIw+j1Hf3a5LahJR5lS66UAN3/jBw21t8E5YKJtoiGkoIr9+okEfw/KRe3o3Q0khZkpESYQDjd7p5Fvr//vIfhL9wIKftQ7Lo/PHgnoEt+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780772; c=relaxed/simple;
	bh=vSBHsAMqmP0mTWh5XLC6s4jgQYugzTdX4cOLY716pds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qa+oWy0tPH4i0TOnq3xHjtXMx88uiZIKOSbnPCnSjfhLxW/38NRBHYvUZ7Yl8L/QsBbzRu24dy40H6ha+4V5AE0R8kI2cSEka0uxNtLkm+0t6mx/uo+yDDtuLF/6LMWgga2QkqephrmkA4abK1alxxcxL3/f4S7T6fMQXEGEzqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zox2dZZa; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zox2dZZa"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-823081bb15fso2474548b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 19:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770780770; x=1771385570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF6bX/QVONfWDQrBCiwnvcbeLdCbDl1IQ4EC8a9rjVk=;
        b=Zox2dZZaeOEmRU3KE/QgDrV8zctrDPtHoKmPoXeYbu8I+pDBVaZ2Rwjsxmlcm4JNmQ
         33Lm13+sbsQ940Ul/9B3K5eilSYAz5awblnZHWIeIP+SDidJ9NWUB8I+geJmpdXmuEpX
         CD7517TXo/+KS9H9Zs5vKiUWvR3V0NjdWBYbI/Qf3JSVdoTK9/EXIgxtR688mxpssVOq
         mcgl8FLgt4A2vcz5oN17PIYVv/3tFCu0d3EM+FVdFcDGmjXAW3IVKRuzt0c53RFydqFA
         91nMutKIqVSASx/S0ku4ISfmrSxa3gmYFD2wReracFk62e89Meuhdd9YYtV/aJzOt6CN
         lFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780770; x=1771385570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dF6bX/QVONfWDQrBCiwnvcbeLdCbDl1IQ4EC8a9rjVk=;
        b=rCqZfnAg7evblApaYUHom5FO5TYP04gui8vYS0NZG35tZoUKOFJ1vfW29Vl/DYHbp0
         gGKu9XrtRbQJKrlXHbFqgx4q3WufsVb02vb/m6wM75EKcp8Af3E7Ddny5B/e+Twfsixl
         m9MM92+ClTrAt8kt7KOtufuc9e8AoOlRbPG3Q+SInCM1uHBfUNNJRuJAmerZpByRYgdn
         TpuN2tbicZufMucTxVTdZI/bFdWZ5/6IwlK0+jYBDaIqoRmef+7iSE6kzxI1mA+HPKG3
         TYBKA7i8LlskcdegX+hB9kWrmOTvbokCaEs393NbV3sKa+SHPV0+W5eNStKbfONnzcLM
         zebg==
X-Forwarded-Encrypted: i=1; AJvYcCXuKPJY6ZUC1mUKVrNwx8b1OXzIfb88u3KrN/0+0iXtT8w01mgUMQ5imEM3n0wluFKA0jWa6x6U6nI0QVm0Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaNFrj3uS1AMnJRwjpekQiFBuvLd5qKoFvNBS2DvnUYx/dlej6
	UWyqw6wIvKfOQsdVy8MZg9ePDsreIaQ5aYPQ20rdl4MInhUx3j4xFKzf
X-Gm-Gg: AZuq6aJTOIKxF8ergdgd1ZHO4vAaIw8cqG5epdquJSCOAxfi9Cx+7gs8sRnFjYg/pU9
	yB/5PucZE+R66UPQn60NRlkguWXeHehyFE2CsoBiguhD/RywKfAMulpdVUw22wfs7NCjS4XbZMU
	+jYmBbg5WKpZyWUgSJTZJcVtxzmY2hNApOGNCMG94W8UfGOCjSJ/TdldloAo7I/zrsdjDdxonZH
	CEdAVvqLPcPzzMFLjijqcBgPPkZUhOIsMj3BzFBubCk/hzCAY9a8w2yJGNclf7MUty1nT8mU8ow
	sG7vbo9WgxTy1OA0irB+bOQDrpeev6/DLEX7WjZIJ4ttPL7ma4RNrQQNXTctlbZU/gu0aOO1gUP
	lYjrlwvhcRRR0NzkcpKRTY4UU7jtL2iM/bPBqOrUyBgzU3zKCPZm09Yt9CxtlMTFzK39DQNr3tu
	6+e0KmgpPSun3SdoMfomWCDClu5sjb5CIGXdh5nkKtFw==
X-Received: by 2002:a05:6a20:9f86:b0:35d:d477:a7d6 with SMTP id adf61e73a8af0-3942e35f73cmr1201854637.13.1770780770454;
        Tue, 10 Feb 2026 19:32:50 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d63c9sm464856a12.20.2026.02.10.19.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:32:49 -0800 (PST)
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
Subject: [RFC v3 26/27] rust: add bindings for hash_info
Date: Wed, 11 Feb 2026 13:29:33 +1000
Message-ID: <20260211032935.2705841-27-alistair.francis@wdc.com>
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

C code can get the hash_digest_size by indexing into the global
hash_digest_size array. We can't do that in the Rust code, so let's add
a Rust helper function to allow us to get the hash_digest_size.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/helpers/hash_info.c | 8 ++++++++
 rust/helpers/helpers.c   | 1 +
 2 files changed, 9 insertions(+)
 create mode 100644 rust/helpers/hash_info.c

diff --git a/rust/helpers/hash_info.c b/rust/helpers/hash_info.c
new file mode 100644
index 000000000000..d2cbc08b57d1
--- /dev/null
+++ b/rust/helpers/hash_info.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <crypto/hash_info.h>
+
+int rust_helper_get_hash_digest_size(uint32_t offset)
+{
+	return hash_digest_size[offset];
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 4b08b4f1d3a3..34db9eb5e43e 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -31,6 +31,7 @@
 #include "drm.c"
 #include "err.c"
 #include "hash.c"
+#include "hash_info.c"
 #include "irq.c"
 #include "fs.c"
 #include "io.c"
-- 
2.52.0

