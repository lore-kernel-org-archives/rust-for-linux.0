Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396018;
	b=ZsMD46uP5wyqU2AfpaYlRbrJPTgB+SlOhSHo/rVwTloxdxeUitqtf5+BYFxywNRf9NJg
	 dZYqvbHwZ6knRkx1Z7wAmQOFm+V6rcwJscm9h1K3sWVIiEkIzyq+1UtbzsobaCM4zQuF/
	 Teo07Ub3bGpPCbf762VfNhe+OpncAgbZEX7y258TuZsuwAbyQ/gbRkeg92q9ClbUlVPSK
	 SmakvfPQTQcY4Q+0IsDfIf4H+NvOlu7a25xohxry3lmXFfQMI3sNKCWjsEx9PD/WkZdAO
	 8XCgPR1ahYu3y9VIkIBuVrREKRAMdaA+JtunZV0O8qiPH+qaSMS5aS0KQVcILAG2ICg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kk1s82CtUNmO2iiWD/0nnFEsWGck88S3i8ao4k82+pM=;
	b=p/QftBmrzh+B/s/hg/Am2QUiOL/sNxEENbEo47+AMEXxdg9mFYuMgY3b3FF42wio/do7
	 SN20nFhNZcPM0AgaC2xpRqtWarWCI08nPK+gSTZGk7i1RKXr/zqx1CGFfp7nYjsMdXsNd
	 oJA+ngKv3pTDBQCaJ5FqNu5PEHh91+bGrgQqkIXZKhW3enkj5WGXZzcN+At+kOoKFP0N8
	 9FUFWUxZ8VSMYYmGBfX6RRwjXp2pErScUfAcY1IBXeefyn8mVoLpRYjyqPwdQrPuNW/4v
	 Xd+/Izz2gKZcfNDVpkTy4joonMVNEUfpqv8N/Dw8pQwMJlQ1GquTt5QEDwd1lnqPqqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OlSbhFtt;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8969C606A320
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 01:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8969C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OlSbhFtt
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3acd523a802so24756041fa.2
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 17:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396016; x=1796000816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kk1s82CtUNmO2iiWD/0nnFEsWGck88S3i8ao4k82+pM=;
        b=OlSbhFtttnKwHgbjQnKp4M9p2xHVTqq1DUDsqk2QeCiNZ5wnzOC3NqSVCRNmW5jyoV
         ycTHzTZ1bPnJJgObQwWFc1r6riBqcIJQf8hKI10LNyV9XhQHWr4DeQlleSuISwekljtv
         pHDp4rmd4uuv3FrFUwmAosSWStYS3NJse+U9gWOGL+5crFKffnH4qU3XMT0ilcChIsKG
         XhWfQj2m17sI/j1k3iap65eZgTevbO5KGYsSW57ecznmiLXTxoCWqpP/Qb/XZX4vZFLI
         pZzXLjPnx5uBdUPYoVcLuImMjrvjHFwPdZxWR8tJVW528R0PQJ90ibwyrUAWuDHRlJtx
         u9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396016; x=1796000816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kk1s82CtUNmO2iiWD/0nnFEsWGck88S3i8ao4k82+pM=;
        b=COA0oyqyp4KpuvhNUw9W7vgLvyPqjRAUbxHWjatRIzmuTMecm7Jo5K+vFrovT24mUY
         xjPnapnhp+fyZQh0Gh0f1x+JA8GeuVrh2sfDOn8uTPIbZ6+3CvaSU2StSbF8BlMYVe9u
         7eX7+SVcSRsMCPtW7U+lX1vGNfsRZoUYgOAs+vtiZK9jJjAh19djdTVOI/pgm5338FBZ
         /K2o0HBdPddG0kmWONlYpEBFkpAs/sxQmoau3A3T/A0yUVgSHJkL95mgnTAuSA9kfzY+
         jUoF84zQazzSvQ2APVK8EwOzPKU/pjxwVozjRoAORQ09kBVaWYHa9/rU9SXwg0MkM7rT
         4bsw==
X-Forwarded-Encrypted: i=1; AL+hErEaWgLRJCFjhX5t4cCpH3w3T8ExF/ul2b/HFlnBJs51g0+YuIfHA+y84439tSWGKIPR7gwIw4w251Mnyiv6WA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MrpNCjODAYA64WS7BnDY85MuzwCTIsVz2qVUyU+ZWhHL0UZro
	iOxUQCJAfEudkW5Y3HKpHuf06qqrGYX4cIvjncBsck/X21bEo2eg46la
X-Gm-Gg: AZFdTZcPxS1U/4PxBRxUFLan1FEir3PV4tYH5X/8nPjhUQFTbbXjogd5qxFzMlYc+mz
	MDFECdDGxBkA40GhMVg1XKMETqqnGfoAaJia5L22eDZIsRZJNAYmkQ10QiLEHgJ7B1Vc2j890K8
	dYlrXf5zdkSVzIS8Jb8an3D8N327Ruwv9sl4XEdo5Y3ot8/pbGSEMfqp3NKZDYPIKcVuyCb12gY
	sPXvBrd84EZ2mPCgvKQV3AAaN39NbVs7j+Wchk730n+4x/48rtBUzD/qKIxGPYaAZxVCC1pinZt
	9x5v0nqmo9PvM8siyAWB8g0e2ykSn/47TEmNzvDSRJiKYdcfUWrNsfVsoC/S90wyXYELfpAomnt
	kwzgeyfzUo6V+zZFLyujUZh5K4uXulNs7eUdxNvXgnibghWJ7XGOSqtMAbfEfj3bWaxEx6vXwdA
	uaPARYSJ6ib3fdjrqNbEcMp0O4Latu8jOp8RVeaORVuOFb2aDr2uDpkm5OfYJoM/n1FtqPbr/YG
	ytuKatyfUxnEbMWjxlYvJTSYffHAS5QilKKbqioksJ2I36fIRTPz/zZ2UIP4lonDrYDYoD++qOu
	oMHkXfREEMWX5JzkJhMxIQ7jwORlTK7e
X-Received: by 2002:a05:651c:a144:b0:3a9:a1ed:634a with SMTP id 38308e7fff4ca-3ae7fa3d16emr24469201fa.21.1795396015482;
        Sun, 22 Nov 2026 17:06:55 -0800 (PST)
Received: from Swift-SFG16-72 ([141.105.129.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805751f4sm29257771fa.40.2026.11.22.17.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:06:53 -0800 (PST)
From: Ivan Borovyk <saref012@gmail.com>
To: dakr@kernel.org,
	ojeda@kernel.org
Cc: abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivan Borovyk <saref012@gmail.com>
Subject: [PATCH] samples: rust_dma: add missing newline in dev_info! call
Date: Mon, 23 Nov 2026 03:04:30 +0200
Message-ID: <20261123010430.365536-1-saref012@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The dev_info! call in the probe function lacks a trailing newline in
its format string, which makes the message run together with the next
line in the kernel log. Add the missing newline.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Ivan Borovyk <saref012@gmail.com>
---
 samples/rust/rust_dma.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index ffb693544673..b4b161896517 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -129,7 +129,7 @@ fn drop(self: Pin<&mut Self>) {
         for (i, entry) in self.sgt.iter().enumerate() {
             dev_info!(
                 self.pdev,
-                "Entry[{}]: DMA address: {:#x}",
+                "Entry[{}]: DMA address: {:#x}\n",
                 i,
                 entry.dma_address(),
             );
-- 
2.53.0

