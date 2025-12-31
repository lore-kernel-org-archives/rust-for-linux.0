Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F0A19067C
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 04:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767157071; cv=none; b=MwarPZ1UOhRuwGL1Xmrr71S++povyk4O0jiNIWMZKFzncqzk4x3Q/aX36AIhjFyUppLXEi7duoip1MzfuiMTUxhZ1Oa6QjYdHeDfhhuZWWTEr8CmEgikHhrTCXqXNHE5ezwRXGBVqepMO9fURZ3Me4SUse31sVJuAulGK0qDCXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767157071; c=relaxed/simple;
	bh=Ab/obAWdICZd1dySJKaFiwY9lVELG4QbN5wQQjNF4oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DNAMBWvbtOqiSL5viddN5R40Av7IzEdLUA+xiu/U/J1tPkw+hGOxhRkG1iooi/FzRciC6bzLHN1LY4g4XPSvkTQcxkDNZOA/KXq4dm17g4pC3Wzo2dZSRT4QWXeNE0zr47U2jTE2iWMGoevYR92RyHzu4BNTXsXbbtynkKswG2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONJDqMMq; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONJDqMMq"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso110024565ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 20:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767157066; x=1767761866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVSIHigCZ4SH+++13L3EOXjGXktDO/VGYx6uT1JX5mw=;
        b=ONJDqMMqDkZxvJjEp/SAmi3pQ2pk9tl9yLwB280O3CP0ZXlI55zkQFYa3OUddCd1R4
         baAdgcq27W0O6y07TXcvzLDUKM0iQhzWF6tC8vuVybNPsJhwADx7Fmoxn3XfxG0c7lKZ
         X9AJ8+bEVjZ8nGWn+Lb6UxlwcdlfT0vej/lj+UfjI8Damh+EsPvsLz6ilSk4ddF3rq6i
         htGq4YLr3spDanEDx4ho5b2XuUOdsuo4sR+E3EdpNLOPLupRXXzav93DGvv++OAf4RRy
         3W6MadICr+oG/w1AaipnQt7vn6A/tV6TXymK6+RrBqs+CMG5EHh8YQpuPLNzDr5i9ygY
         K7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767157066; x=1767761866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVSIHigCZ4SH+++13L3EOXjGXktDO/VGYx6uT1JX5mw=;
        b=k90uTnYqZIOm482BO8LmGgJlRzgoJhV2uT7zOXWcbYuBjf76xKBuLYbOIM+99XXYh3
         BOUtDEIMifPeOn/RPgiIZX5LKTOI4fVlDp13igu9NMDWswWYA937ekfLOKbFAKAtjnYP
         r8tlVkzuhQRPRvXSULpXii1H/auYcLphv946IM8sXpfYJedzOejZP9BnVA7Xet5MQ0wa
         d73zC7ZGLQuQUzdUbM6JY+tNXj5785UDRr4YM5z1mmsRB1Bw+UJ5n96heDui5yNut1oG
         YINuUVC5TTeu6iueu/pmVWoG4UHZTAD7yYzdUVH0IjYazWId+5UWeRDL5fOcOCQXyy/v
         lE0A==
X-Forwarded-Encrypted: i=1; AJvYcCWv4O5SWfjVR+ElOznscnt3lvbUFBTJz8XNGmhAB6ebStudfa1odncDR4F6Ke/NxGClAtYaqKyVOY7Tk5/rhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaCPYkuY0wXEAvWvzrR0IvUOgJTHHI66E7LKpXmaSqEtgJdOO5
	wV6MYyNBTesK5DmpxitgvG2U3sSXqUQkLpHVaHwWFNaxsgpBKDRyRjXd
X-Gm-Gg: AY/fxX7YZQ0gbJHM2RlyhhlGrZzGiR64NRlWOS6mM5dLjW4EdxHYzuHAbeN1R6LKMam
	xs2z40FYZZJfOUUTTOOUIB7X032LEtO+iNCQc+8BW2eAZzhUidBAF3btsr5YTiTlrylkflgvWtP
	DxcwyqMyW24R7q5VcWn0UXuo4t9wnWXlI836lRxjOgNvTVTfPmGaR1vaeqQ0GaapW2AeCin54K3
	/Ss7gJG0fs0kfWzcjRhj/BskOBc8V/g6N9zOnza9TcDueDBkOQUmuEIl1HmC74P9Y1XFeiTXns1
	fwu6FJBPIBxVMcwQpck1TWaaqaW8yuaSF0cWSLdv2XQ+83TCbNsQJKAK6GNLY3Pm5cL/zBWS156
	uCei5vxhvIQW0l3dVJpvB+weqcUELi69gtgWsxaOiizkZpnlxYZ7yQVqpsGExXM0FRTgGfQd1yJ
	bZL1sfQsXcTm5EAvvXaDd15kD8KYZCW0HYoy8gdRL75wfPaOjV+9n98pfjnYMGaA==
X-Google-Smtp-Source: AGHT+IG7Yj1i4eoRCUUjv6qpPWYt8lbl6w8yMSkEuD/HG9OCeGD0a5KEFXGf5zNz5gHO8ydPI+RzqQ==
X-Received: by 2002:a17:902:f542:b0:2a0:d596:a88d with SMTP id d9443c01a7336-2a2f2427138mr327893555ad.26.1767157066140;
        Tue, 30 Dec 2025 20:57:46 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c74490sm310580525ad.5.2025.12.30.20.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 20:57:45 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: dakr@kernel.org,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	rafael@kernel.org,
	aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	abdiel.janulgue@gmail.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	robin.murphy@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 1/2] rust: dma: fix broken intra-doc links
Date: Wed, 31 Dec 2025 13:57:27 +0900
Message-ID: <20251231045728.1912024-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

The `pci` module is conditional on CONFIG_PCI. When it's disabled, the
intra-doc like to `pci::Device` cause rustdoc warnings:

warning: unresolved link to `::kernel::pci::Device`
  --> rust/kernel/dma.rs:30:70
   |
30 | /// where the underlying bus is DMA capable, such as [`pci::Device`](::kernel::pci::Device) or
   |                                                                      ^^^^^^^^^^^^^^^^^^^^^ no item named `pci` in module `kernel`

Fix this by making the documentation conditional on CONFIG_PCI.

Fixes: d06d5f66f549 ("rust: dma: implement `dma::Device` trait")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/dma.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 2ac107d8f7b7..42542203b037 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -27,8 +27,9 @@
 /// Trait to be implemented by DMA capable bus devices.
 ///
 /// The [`dma::Device`](Device) trait should be implemented by bus specific device representations,
-/// where the underlying bus is DMA capable, such as [`pci::Device`](::kernel::pci::Device) or
-/// [`platform::Device`](::kernel::platform::Device).
+/// where the underlying bus is DMA capable:
+#[cfg_attr(CONFIG_PCI, doc = "* [`pci::Device`](kernel::pci::Device)")]
+/// * [`platform::Device`](::kernel::platform::Device)
 pub trait Device: AsRef<device::Device<Core>> {
     /// Set up the device's DMA streaming addressing capabilities.
     ///

base-commit: 4c9f6a782f6078dc94450fcb22e65d520bfa0775
-- 
2.43.0

