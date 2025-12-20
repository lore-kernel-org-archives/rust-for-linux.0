Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9182609E3
	for <rust-for-linux@vger.kernel.org>; Sat, 20 Dec 2025 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766225710; cv=none; b=gxIFcXUr87tOVqSpXJYJDjseVvBSFHOlQNw7QzIbx92/cYh5g7Rp4v06u8T0qUFlSsYJZeAzhkwXqQerLb4p0JsTlLiuoTh2OkV/lnFVCqNkR0JaM5lBTcGzzchpAUHm+LLhLi3cyEnEpK0ZMWOiS37bTKn73wt1l270yu1EhV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766225710; c=relaxed/simple;
	bh=XgPO0hAsWNCQiOjQGczv4sLfVnUly85+ZcGG2sJfq5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OubsCRDEL4FXVJkGbJvgsnYc4nUdrhA2i88y2yg64yAhvlqa5JeX2HwCBeiYj+b/I2Mp88s6kf5HEIStN9KHuaZ1fTIssabLmxYkx8oYs+OoG8Bua+bgTKn/jF6z7dU2NtdcO4FjHnY8H4HxMgNBnCwuJhcyqGoFQbWzZFhxWBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRefPVZ7; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRefPVZ7"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b7a72874af1so452414566b.3
        for <rust-for-linux@vger.kernel.org>; Sat, 20 Dec 2025 02:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766225706; x=1766830506; darn=vger.kernel.org;
        h=content-transfer-encoding:signed-off-by:mime-version:message-id
         :date:subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fVHxDEzXbk/Xf2kRxSmDqk5Pb7kP0hbOsktvoPVjFl0=;
        b=XRefPVZ7549Z4a9pCfAt38/Om8xRiOnkpQK5jVAHzxNFaLyZp45kegdVa7RBcUTk2/
         kb6PnpnKX/QZDQulgsDfklnFyvM5Hhyhi7UMGr7mtqHHTMlc357TfCe5Qu1356b4sgK1
         x4w9hAn6/npZ8jPhZiDwFLD4ToPfNLRcCVgyYBkrtNHhjcv8A5Xw/3IfHB6q8QbwCBLY
         xpKdyrI4NJOEN6BGnvA4HbeGih27aPHhC7f/lMH61b/nojvPiqxllgbR/JiWLJqb7QJy
         Xt5/qVRfDa7OHehvUUJEDDXr0nq01lJLazUzQGPsbjNqSwrgb/+rkaSwxovaNRoDMCbT
         ZQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766225706; x=1766830506;
        h=content-transfer-encoding:signed-off-by:mime-version:message-id
         :date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVHxDEzXbk/Xf2kRxSmDqk5Pb7kP0hbOsktvoPVjFl0=;
        b=g8HjwsRRyDGaMttoQKrqDtj18Cr4ok++VZUiMIBcoHRv3MMFtafJzth3ijZ4WHB9Tv
         SjFbV5ne2gy9mayQjzPT2ABRHRAL+SA3I/ER/jHU+cx4vqP4amlF9bHxft0HRWv1PAg8
         lsJxq0lW0eQoG+FW1Gg2y4mgHt2MZTkUEFGm+UhCp0Mtm7zXGjV6dBbou2e4F+fdYMie
         fySmVZ3pFNaIGtAXvuGmra6AVLNw/xNtFiRb8Kn/2gCHPED20OQsA1BLL9mPaBP/WWJm
         OEZb12g8SihvJRDBoURyCC31ixCEqlYHZ6RKD6mJtFZ/OAuUinLZcijNkdlqKHrDh529
         rJ/w==
X-Gm-Message-State: AOJu0Yx/nJqLH+FDDUsSg2Spvmo2S79rJJZB2Uml0zUOg2ryZatvGK/S
	exTKHdTUZ2EZMrxKhq05c97I/U2TFjpS2foc8R2McEO1bbyRNAclgbhA1rCxVPl2B/l0Jg==
X-Gm-Gg: AY/fxX7KqAAmq/w+/MWiRCIhwfPOa5Vv9leMs9xvICozjLdhtYL7MLnzKhYkV+M9jJx
	gFRaeXGHSK4csCccN/zWNOu0lmAMsJH5FVIorQNsrwOhcXRT26Y6UTCCWh7KcRQFeev6d33uUBG
	+FigsnIhmf44MIzOZdoBrOC90usGiWDbOHsHD1ehMxJaaf7xqayj6uBd2VOVOhCmcWBC870vprQ
	1E1ZWS35Gl05vXLGiANOjhkyUU3aN4K+cXSkk02tuHNNw0Ss4KUOEOVwznb8zk5odUoJy3m52zD
	JlGD1GppUw8oL7JotYF1Ib1dJ1fTfq6LxdQV9oee67+HdEzg2rs1JI7vFmWAYEp4nUY6YA1qSRA
	gaxUuLHOi7I+0+AnkzT2QB9eRrGwAdiDAQo7KYL5cTuxgIv27olVt8Ixg7hBByOPbYh/OxlmE49
	GjOCbVQDr3PIAbsV379ynXKg1NW+E2eBAOR8Is1YrKWAbhRAMKWosakC89MHT7uo/Blhm6zsiJZ
	8IJzVio3GZMvqeC
X-Google-Smtp-Source: AGHT+IE5eTGJkJjpHeunWxKzrqAV6uc97/1/8sX1iJS8ACI3ylfEhFjHzFzmRsnWx2fjyuCekSXZNA==
X-Received: by 2002:a17:906:4fd0:b0:b70:b700:df98 with SMTP id a640c23a62f3a-b8036ebbe4amr537935266b.5.1766225705290;
        Sat, 20 Dec 2025 02:15:05 -0800 (PST)
Received: from codespaces-4ad828.m1k4x3cq3poebda54cltipn05g.ax.internal.cloudapp.net ([4.210.177.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ebbasm457683066b.55.2025.12.20.02.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 02:15:04 -0800 (PST)
From: Riccardo <riccioadami@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Riccardo Adami <riccioadami@gmail.com>
Subject: [PATCH] rust: document safety requirements for fmt::Arguments dereference
Date: Sat, 20 Dec 2025 10:14:01 +0000
Message-ID: <20251220101401.25361-1-riccioadami@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Signed-off-by: Riccardo Adami <riccioadami@gmail.com>
Content-Transfer-Encoding: 8bit

From: Riccardo Adami <riccioadami@gmail.com>

This patch documents the safety requirements for dereferencing
`fmt::Arguments` in the kernel's `vsnprintf` formatting path. This
clarifies why it is safe to perform the unsafe dereference in
`rust_fmt_argument` and helps future maintainers understand the
invariants, reducing the risk of incorrect modifications.

---
 rust/kernel/print.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 899bed9c08fd..5f54be97a6a0 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -25,10 +25,10 @@
     // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
     //SAFETY: `ptr` is provided by the kernel formatting path for the `%pA`
-// specifier during `vsnprintf` processing and always points to a valid
-// `fmt::Arguments` value created by the caller. The value lives at least
-// for the duration of this call and is only read here. It is not stored
-// or accessed after returning, so dereferencing it is safe.
+    // specifier during `vsnprintf` processing and always points to a valid
+    // `fmt::Arguments` value created by the caller. The value lives at least
+    // for the duration of this call and is only read here. It is not stored
+    // or accessed after returning, so dereferencing it is safe.
 
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
-- 
2.52.0
