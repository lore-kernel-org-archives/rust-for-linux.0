Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A260A2FDC2E
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 12:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755867399; cv=none; b=RRx3pvVZ7RCcYg2+97lyGhHj4jQaGlZB6wgvXPLzsdF4hFgQqGqByOmNZoPAHpGUT++G1kegf4UJFROk/HttISwMXamLpk8GlxM9FS0N+4Y58YaS6yfJ7839VwDAMNNSID/4U8jhzMIlTa1gMLimLis3m8ON2X/2SEWtlaM1/j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755867399; c=relaxed/simple;
	bh=2p8LG69KmCVA8ZLTUV6rgT5Wy5/pv1AhMG9wpLxMJIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paMuQboToiCTehdtkx32ow8/5QVjPQys91X4pMyY88ZkjNNKC0jD14oqckT+B8cg23aOUlV/CXfczQn62NmRkBO30flhFfKI+/eQkb8whLp+UhGHpRou0owZhl0rNjpefHLkD9wXs1XTQ8e5gbXezYEwPNV48QRz0Stx6X8q7Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=QAuNGGSP; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="QAuNGGSP"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2ea94c7cso1955104b3a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 05:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1755867398; x=1756472198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8fwNJeHNHWIWunBevE6xxfqz+V4AStymQDWUp+Nzso=;
        b=QAuNGGSP0ojjaY4qas+ib2P3xKaP0KlZxo0Mkc7/aOaHvUbtVAKBQTEKEYP6WUZf2U
         5zE61e8nwoVb6zR9o2wvyoaWdvf0vnzk6Wl+EXSsbV7+y207FcKbqAXhMcx2jXURHEMy
         3dDiFoAFGabwz9w8srf+x7zObFXNYgcQwfIWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755867398; x=1756472198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8fwNJeHNHWIWunBevE6xxfqz+V4AStymQDWUp+Nzso=;
        b=Cr/XPBtPDNewefkllkylut4go11/qE82PReaDvc4U9VJ21Zkzvjf7cUJsm55Yl9NXc
         h82ffHPgVFOj/iI0Cvg4zh0syY96FsX+RtXFIq4oZRiw+bVlwFRVs3GFu8BXCGIOl8SU
         fo2CCNDcJtku32u6haGEo/Z/xuZmRQw74yAGmCkotgrB41Y6aNwSSFy0Oc1MVogX7XlZ
         IZqsR3m54e+81lIKkawFruSpCt1NbbknmyUw4xKVNvh08byo3zwuTN2avCsH1l+ZxO5C
         9is/xGyx9N3fc1sgQQ016c5gvPhV2AMw4PFdX+nyX++AcIXvw4cEVUrwFtGRo8fCSXPf
         hN7w==
X-Forwarded-Encrypted: i=1; AJvYcCXOWmCV6cqlYzdv3jvDPq/nP0s8cSB40wtsPLQePbOOYiBhNZNBBYtO9Xg5Xdql9VK6NoQcWNaJSPSiKfrbkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiebuzyltPnm9d9AgYf4Mt9GZiWHfs9/UlTRcIctGQKSkeGNo3
	tDLkKXfJv4JyAcgTblT56OzsfoqRqGPVJ1kzkaPmoMfKPz6E9ra8BVY63buObpDa3R4=
X-Gm-Gg: ASbGncsscK3LKtxCyJbIZnbAe8O3g7A6S5/I7kMTTl//p4fp/CRoZcx+yNKFNgfPJBz
	eNysoEwcOkigNKmFFCVo7PkuD8rNggUcBmNxFf3e2UcorDpOTk4Ahbhxc9Nv0JMOON+6s8AnIbg
	Jw87N0hX2HhIsdkFEaf8BY5WB1VRZfoZI+ljtfeECCDq4/XfQXg1DDI5wagPfe6b3q9h2vUMQDM
	qiHiPpYqmTg7Ppr2dGDmtKHWBf/IMKBTwU31AIhTPoaJ99Ru8ca3Lmuivz9ZPUKNzUnCH9Vtbgu
	xwq2yN89qTuMCw+pTXsDRBBgmNst7FAG1g3Hnbolq1oek1aK/1lpcW0kiJD9luydy/Olmr86hZG
	d4w60qAAn3diaosIsfiTZXerd/i+7yjPFidx4Y8+5m/N0bhOFuMqA4HbuxuiXfianhBb/I23j
X-Google-Smtp-Source: AGHT+IHDhJuu9+cO4uxsw6AoUa51QjPpNUdCs5GI2HWZsOmJ82BW0DSG2NIaLQoRPu3I8EhQjTg/gQ==
X-Received: by 2002:a05:6a20:430d:b0:23d:9cca:e710 with SMTP id adf61e73a8af0-24340de334bmr4095404637.44.1755867397819;
        Fri, 22 Aug 2025 05:56:37 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4764003537sm7194544a12.25.2025.08.22.05.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:56:37 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Jens Axboe <axboe@kernel.dk>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [RFC PATCH v3 1/5] rust: bindings: add io_uring headers in bindings_helper.h
Date: Fri, 22 Aug 2025 12:55:51 +0000
Message-ID: <20250822125555.8620-2-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822125555.8620-1-sidong.yang@furiosa.ai>
References: <20250822125555.8620-1-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds two headers io_uring.h io_uring/cmd.h in bindings_helper
for implementing rust io_uring abstraction.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 rust/bindings/bindings_helper.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 84d60635e8a9..96beaea73755 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -75,6 +75,8 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <linux/xarray.h>
+#include <linux/io_uring.h>
+#include <linux/io_uring/cmd.h>
 #include <trace/events/rust_sample.h>
 
 #if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
-- 
2.43.0

