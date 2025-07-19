Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCBF79CD
	for <rust-for-linux@vger.kernel.org>; Sat, 19 Jul 2025 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752935653; cv=none; b=O0Auz5OOJlgf+38MwRBqDTylpsEl3TC1dqjeeL1HlQSeKN5gLgM3Jk42PB3QMgGLYVFBNVbwgAsEu+OAhtcf73XTzzKI5IQ01nFErTpTwesKMsk1y0S7M9ILe5vjkn8u6styCT5Shoxvkssfl3rS25hc0OXOShhpsxPugpxIEEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752935653; c=relaxed/simple;
	bh=H4aHIJOV1TJAq6ZuusFg9Zqr2Br14ng8uZtfr3ysksQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cbHKxEO6F8AarwiWzB1FivbcCqqP3aiHqXXDm2iBoZiJ1b8sfthxiaqfHwvBFLtqCJxOBZHsJPd/c/Vp9HrG28pmRrJKdZsnHGR9+h9HyXJnw+p/kPAi7AXR2Hi6RFjCqqSo0GNUcPfyDsERxyMyY1mqX9mgJWiOvZxOYRGjxfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=LVAHdl1W; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="LVAHdl1W"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b321bd36a41so2378185a12.2
        for <rust-for-linux@vger.kernel.org>; Sat, 19 Jul 2025 07:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1752935651; x=1753540451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkIl0Ng87tj2Fj8IQfRrJkmK5nZP9FIei480gavcNNA=;
        b=LVAHdl1Wrq0uawe3y/ixfQc3yT6BbiwWtht0+RGCFhvZFl04LGSg35NAT9ETQYSSIc
         eRM78ss+P/L8QQxPEu199EbTHs/EQ9g3YV4dr3LiQM0BxAbwQ1RHRazR6lk4ixQh2zw9
         6o3GqZIh3A/YNGjwytyV0iLgE2VyEjzUW+KbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752935651; x=1753540451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkIl0Ng87tj2Fj8IQfRrJkmK5nZP9FIei480gavcNNA=;
        b=hlYXFmArqRwrcyT14ZciNyus0P8X3mb4ptzJeHBAgpwzpbBzGZNKBqqFw54tcTQRHI
         77+tpoYTkkPptuZGApQgj6KdrbCFr0njgaLRiPdojW1LvSAKvUEoQd1Ypoi/6ttQnz0Z
         owYEjrSvHudQbpbOoYAUXkrStKz0BjpeXs59a5UcFNSucbh0lWlelR/zUiOkRcs80JrT
         cj2XPfDPfzuS0st0WiPq5B4+4nUbYVXPpeQEKp7XoOZPa7ZqekT0GGOMgdprDHVT2nLY
         49upW6NLMwMRz7Ogkfbk947C8LT/31uoy7ISSYllyJj5JQFgw+7FqXn6roadRq6lT34+
         VNzA==
X-Gm-Message-State: AOJu0Yzbaz3hH3fg0bxjpYEEOY/fSkqFEQjKQqRYWggpHNFifwvkIFHB
	dKEf4/6rrwOo5zezxOYKQTytTavY03fPhur6OVpSobR10OZ5CQOqhuSDiXiT8kfc6Os=
X-Gm-Gg: ASbGnctan/0hB4cfStrPZ0TGba+/3mcNQrsxS2oF6aNmkW3TbOwLl17613d9utcZ3dh
	O/vMpMkNsj4G7eNt53aF90G5Kp5t3AUuzsIxaclXM7yVasodSFDgfimew90giW3Uwp1Cz9IElv1
	Zu0yIl/WncPjP43BENPGOR+RBSLGRojPpXs5B4ydsbY9IM3/feVtKfAPT0BApZ03Fxc1fzCQT54
	HRmfgg2Bms2C4VbD6xbfd1E4HcdW3lqxj9llOUOv1yCLTBM637A9BaUqIzTlxLxODG4XvHnwVKW
	WOs8PzFS59ooID0FZoi1nRysFTzzEbqcfgkfxzjvZB+lurxsDGn2t6Xkpjly5DSYBhR/E7qwsmK
	qK1P+YGGnpcZOLAUEfpjo7H1TmRfHkwvgAZqBGBJ9Z5TQj6X5+pWfqvlRxCQ=
X-Google-Smtp-Source: AGHT+IGpEs8uiBA7/aVMtHrt52Qtzk5GqQnPoy335qfDXK4TTerS+kRTHT4TOUh64k+czliVVMOb7A==
X-Received: by 2002:a17:902:e88d:b0:234:ed31:fc96 with SMTP id d9443c01a7336-23e2572fbc3mr200769665ad.26.1752935651099;
        Sat, 19 Jul 2025 07:34:11 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3d4esm30017525ad.23.2025.07.19.07.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 07:34:10 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH 1/4] rust: bindings: add io_uring headers in bindings_helper.h
Date: Sat, 19 Jul 2025 14:33:55 +0000
Message-ID: <20250719143358.22363-2-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250719143358.22363-1-sidong.yang@furiosa.ai>
References: <20250719143358.22363-1-sidong.yang@furiosa.ai>
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
index 8cbb660e2ec2..a41205e2b8b8 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -72,6 +72,8 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <linux/xarray.h>
+#include <linux/io_uring.h>
+#include <linux/io_uring/cmd.h>
 #include <trace/events/rust_sample.h>
 
 #if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
-- 
2.43.0

