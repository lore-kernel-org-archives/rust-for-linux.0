Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A6A2628D
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 01:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881952; cv=none; b=RXndwPudJgEWopAotVlfmGrcAbS1KUXv9DnomGF2hIgLu67qd2Mc/yAGrxT/dLyUKcHWyRiRIoSBQWQ0wQpFxGHCXMF34Jjj2FMzRg44VmAcaZvUh1s+VWTYVQLIdvy42rtU0XW1xyj0Rt2I38JfYdGKgpK/1wyoWcQQtviKbBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881952; c=relaxed/simple;
	bh=cDXl9u4CuY/1+XKa+zRWdOwNjQ9DIY+bFbQam7r/xuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXkYBr/mONPdPLYmWX7s3yVaDs9/eyd/yvuJOfsVDZBdFFF00pw0olnokcNdvFTtjahCWQkr3vX1cNW75aVcnfqTdGxdT1rxgIpQ92XpIvXOH/LX2I2vKq4eGzqr7vMLwmVN6i1T5yqa8XNXIutjC37ufiuwmuFsQjWyKXrf6CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGpLbv78; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGpLbv78"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso624715a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 18:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787881946; x=1788486746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgRyTdTbwko1JdLbXQIFBmeYI8ONlsJWkwJx4wtdOdg=;
        b=bGpLbv78doRDyjJIM7bY21UT4VBRNxeAF2pq9+MJr1sOi8+kFamdLYtNtCFdb/YdFY
         j9NfvrHQg5b1y4opibxY5ONve+w5qtuBXwQXzqFfxZ5h8rjcg8MkQucdj3WXhd9YmBLM
         LATA0XT/DBCccxpNEdurFaFPRWbqoawI0J7T1eYtmkM5No2WWQhH1tk1hc5DMQrZXroH
         IMhQOyEUITYD1AKQjxd+OELVAl+D9d+k1Git3x67SCg7k7e9SeTJtqCAnzrzqYdpLBCh
         YUPiDxESjbrUq6YFvtfe7RiUpP5r6ilLpVxfy24Un9jkYG1otQ1D7JIPr/dm+ayzbY1Q
         TQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787881946; x=1788486746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgRyTdTbwko1JdLbXQIFBmeYI8ONlsJWkwJx4wtdOdg=;
        b=VFOedPgjB6IxAEjbHkL4Zk/EyuFS42g05PGOtTpudkzp+u8bA3qLGD8MvgO3W5ZNXk
         sEr+CPjY5jWTVhcLJbTseZHMbujMxn0tY48o1QOaRza8Un/DVVw6RKS9EzeMgrmdvQcE
         qxGmq+OcyW29HtkFtnCKCNKigsuaq/a7WVQSA7KLleGXbr1JH+9Y2hYwOFwPfONuiFFx
         vFLZmGkHypT8HHxvepYcttWi6wXj5I5G+y/EdZTV9/vg20kMlWjmL3rXD6sNPxlR3b1w
         ZEwGEqj75m3LFMfs54nTgM1+mHP2AM/u9ecPXHfIF91Hx6oeNcFJ3jornEOOVIAB6wbY
         GKFQ==
X-Gm-Message-State: AFuF++lTndKnMNcK0R9Fw3eXblg2Kx+SAyLidUwNSw+AgwCi+UmnBTB9
	aS08V49VKg8XkTdQmZXKvNTwNVYB6sYnZBJM4sCS6BpUrxRPENkj+8tH
X-Gm-Gg: AR+sD13IqGum86ePzdEUj1B3j00VgEuvWQrGJCtuoOHeh/IpruFCASGw8YuPKUur2jO
	qsN1vUEHJXFoIszA5EgxcznYiSzA+eTdXD+d1y/sEGo3v8eaRV+jnp2iwsmyfpkXoNzScH9oZzx
	ZTSDNH+dUFzUhxLgYPZPgGfLhLt1WCT/BQYrvkMGel7qVrLLjPe4uCkx9g7HVfbLD7Odtl0P6f8
	scbgM9IUikDajBAs3ND8oA98Dk8pGvarV1E7qPA3fXXnVzf/yTHdTPfTLRl3T+JSTbwjpFJ9o6h
	NH26JiTeobWQkCq3mbxMHUO6yhjTmYxD8jI7Ryn2OdSJW4jy+qm9yfaKPTKrZSZ4+ILGqVXg8RC
	1N1OcBN6mR4DCwFsLmL1EqlLYr4RpqKTzh4Jgo7iM3vvPvjb1/K/JaENlGLU5ovl+Jb761QLE/R
	wGJi0h9jTa8M/XcxuwzzyBgbWM3Vr+rv6bWIW9DI6qJfYtP5GXhAzS2r4sSwBULQmuJ54=
X-Received: by 2002:a17:90b:54c6:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-396d0e24bdamr7100016a91.1.1787881945898;
        Thu, 27 Aug 2026 18:52:25 -0700 (PDT)
Received: from main ([176.237.234.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d2316e21sm603674a91.2.2026.08.27.18.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 18:52:25 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Subject: [PATCH v1 2/3] dma-mapping: rust: samples: add missing newline in rust_dma
Date: Fri, 28 Aug 2026 04:50:21 +0300
Message-ID: <20260828015148.221737-3-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
References: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `dev_info!` call iterating over scatter-gather table entries in
`DmaSampleDriver::drop` is missing a trailing newline, causing the
printed message to not be properly line-terminated.

Add the missing `\n` to the format string.

Fixes: 5444799d701c ("samples: rust: dma: add sample code for SGTable")
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
---
 samples/rust/rust_dma.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index bd60034ded23..aa454e4841a7 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -125,7 +125,7 @@ fn drop(self: Pin<&mut Self>) {
         for (i, entry) in self.sgt.iter().enumerate() {
             dev_info!(
                 self.pdev,
-                "Entry[{}]: DMA address: {:#x}",
+                "Entry[{}]: DMA address: {:#x}\n",
                 i,
                 entry.dma_address(),
             );
-- 
2.55.0

