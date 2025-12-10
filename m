Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3492FA0F5
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 11:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765365956; cv=none; b=Lr4MtbHQ5RGP4uwarKOEl2759YDaXieTCFjtoL2Jf8vCVqjnSu0aN9b7WscWRcf5mYc01/dsKN7im+CJiWHfyiq5JJXqx7Tde9Dfqdx7wbXFSUftGFVHqd5PTh1k66+vX9Dq5ctMQWxy2PAe/QrREq3hBcJ/YWczncnLDVvjVak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765365956; c=relaxed/simple;
	bh=NxaejPVy5zX3CAISSbHdAuh5rBKgsRi2//Wnojr6Zxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQulQakRmOUUJ7j9CaKeUGjOLPKrsTkFdc/1iN6mYerTuyr6R1qs47yGiKVKdCiMnUoo6UdYguH10p7fiRC3F/segCbzS09kQRKQqjs/JIn7/xQgn661cSDVgWgzyZ9UYFXgGiSPWhwA3IvH4fd9xClRuhpd2VDnESKv3UJ0oTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info; spf=pass smtp.mailfrom=markoturk.info; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=markoturk.info
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b75c7cb722aso1091353666b.1
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 03:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765365953; x=1765970753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KhKA/M8ILyto7eBkY1icHzY0SmIbHoLL7uqqcVLehkQ=;
        b=AY5jDX2NIxbTA1NKCz4Snh+fuYx/ZikrXm+X/Q5X/BbfWT8nu+64c8PoOm1rwdeDmQ
         0F8JO2qqhPtCcHcIQbU6uBzY9uWl5cEa3tLBgalBXg0g2x0siO7iZ2GkjZbtaheK/4DX
         dWG8a7Tzy44J6z9RI08XpbFr3kOmZlTooxZCqYER08uYWw66Z8SG/BBplZx/dgfSFsb1
         Wjr8marzEFVHoBccU3aWBhWiP7Kh3aY9p9pfDkDWvwXam7oT7SRQ2/jF2QMc2AIZJKAb
         fkptUU4VBjZrGmtvxQADFzp1yxPHlilb8iFhE6g1TipuuDWAt5b76ygXnU1y9SxOqJC8
         6Wpg==
X-Forwarded-Encrypted: i=1; AJvYcCX5XPuOAggvsg4ri3V08vsRcr1WJmN+etk4G1Q9WihkXLGl8q0C9OoGGqAh63l6rp3U9etm0jyu+Hv6Dz9mlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkLKPdnaMemkCZinipweJG/SbQg2XZJAkJxL7VkBtzoSsLmgMY
	2Yq5ZqWhLFaRqW8OW271kc9ojWPwFWmZybwsqx8UpZFuvLlDGS2S+SAdpo//yyaQpPKmLNxK0Yu
	mN2MX0+A=
X-Gm-Gg: ASbGncssbJOp40HfJS2+ZnpZXukqOrjUie9tw7MpEqc6VXZgON5ROCIh4dJpBeElmOv
	ReTbiog/oposu2OX/Ay9YzXwyJm9Ozml5MwfmEf25I2QrXPe/LmBbp/KAtpRbkOh/+nNlQKv0GC
	8nDCKIxJejyR20csRvk+banFlC2TPLwIdmLSlGUZz3y63OGdmkc1ckmoSPiYksXPWEca6kTzz1f
	ON86hC/LLu9zvK1yLltLn+SlvxPj6Ua846N9V/sbcVBfE7aFBnOKuHwbL1wssDVjQCyYetQTtwr
	vfkNVH9+NzBZk/+YWbdurzpPIPy3DjPVVEszP9xWqdLEhvx0i2+zjE1x4e8RKxZuqU+gb26PGH8
	O30xuTQQ2Ga4+6GEDXsm09Si0TV3ukei4eqZxEdyu4rt2H4aYLJofm3uj5f7mV1o9HH3b316SWT
	MjmKpnhHibsH5dkBLQ+Fs7FtEzBBWSRJpx34u9FGncPlk7apXo+70=
X-Google-Smtp-Source: AGHT+IENi1ktbPcvqm8o67r+a0ZkfTe1GJgMQHe0nCoe1GbJgKTbUpT8P6okldqfK7WtN9cYy2O6sQ==
X-Received: by 2002:a17:907:60cf:b0:b72:91bc:9b35 with SMTP id a640c23a62f3a-b7ce83c40b1mr202143966b.39.1765365953201;
        Wed, 10 Dec 2025 03:25:53 -0800 (PST)
Received: from vps.markoturk.info (cpe-109-60-37-145.st4.cable.xnet.hr. [109.60.37.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49d841bsm1657032766b.56.2025.12.10.03.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 03:25:52 -0800 (PST)
Date: Wed, 10 Dec 2025 12:25:51 +0100
From: Marko Turk <mt@markoturk.info>
To: dakr@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org,
	miguel.ojeda.sandonis@gmail.com, dirk.behme@de.bosch.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, mt@markoturk.info
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Marko Turk <mt@markoturk.info>
Subject: [PATCH 2/2] samples: rust: fix endianness issue in rust_driver_pci
Message-ID: <20251210112503.62925-2-mt@markoturk.info>
References: <20251210112503.62925-1-mt@markoturk.info>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210112503.62925-1-mt@markoturk.info>
X-Mailer: git-send-email 2.51.0

MMIO backend of PCI Bar always assumes little-endian devices and
will convert to CPU endianness automatically. Remove the u32::from_le
conversion which would cause a bug on big-endian machines.

Signed-off-by: Marko Turk <mt@markoturk.info>
Fixes: 685376d18e9a ("samples: rust: add Rust PCI sample driver")
---
 samples/rust/rust_driver_pci.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 5823787bea8e..fa677991a5c4 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -48,7 +48,7 @@ fn testdev(index: &TestIndex, bar: &Bar0) -> Result<u32> {
         // Select the test.
         bar.write8(index.0, Regs::TEST);
 
-        let offset = u32::from_le(bar.read32(Regs::OFFSET)) as usize;
+        let offset = bar.read32(Regs::OFFSET) as usize;
         let data = bar.read8(Regs::DATA);
 
         // Write `data` to `offset` to increase `count` by one.
-- 
2.51.0

