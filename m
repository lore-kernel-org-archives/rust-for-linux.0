Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A9D2D192B
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 14:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767450704; cv=none; b=Ue0NSxH92H/24pMN8GFUP06Vd5WWObm65DCevP2cyBdJ/GPLhpz1s1rRrQY/1YDDRykE2iVywuLJyzQ60qiPPIzO/nZVYJL01esuVfQfdpLivhhBL3HrfBuJrXKLhB3X/0/GH+SVi3Ca/pdbxLC2k7gVPD73V+aUj5zydBSrWV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767450704; c=relaxed/simple;
	bh=Yo9NiJnTxJkwwB8eCcyZ5gF6vklgPfAHnzpS9T2+4BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BG6O6diSuRpHUnY1KjTE9Y4ealwATxJdoX86SHNERzrceYqm/xLyZHlkmDxc6q90RYQhze5d3QwI/kzd6NlV8KBcbQ5gjlx9q6jC6d5Ntwc2hmDtIHo5cEdxfSKUtFlulJBfPDT60wz47yVW71Y/sGN2jsrO4wyXbQ4qBCBHCoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info; spf=pass smtp.mailfrom=markoturk.info; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=markoturk.info
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7277324204so1854879566b.0
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 06:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767450701; x=1768055501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeXK/uLet5xBMYnQch/F6aurpQjuvhTk9qorMiPAHMo=;
        b=aQGn3fSXMfxsW/Vy8fxS+zAvLvhzASO4TeRfF5yV7VayelMwMAOHOnQTROd64f7irA
         RWIsUNTQVxl1KWL36FOHTFGk3UvpQ9iX9AWu25D7ZqH65j5ZCRuhI9xrMnpcBYAwe6OU
         XiSA6A3JOllay/QqCkHWrsbZs5j2rlzhbn588FM+9986BPih2fa20YQmiRR0UySf+up8
         vuoiV3Ksgr65NLI7ZsiSMb/hSoKkPEhNPo5t1BbUWCRbfvOZCAi7HBXkIiQ5ArhMGL7H
         ub92FNtSza+pGOkLLaqHXysnT6kdBr4y6f0N3tblCZ/KHNFJMmiq6ofW5Wz6LZnqrbxU
         QIsA==
X-Forwarded-Encrypted: i=1; AJvYcCWoNv8DSso1DkkRmmtjfoUxbg887FtWfhFx6sTOS/lc4CRX4WEHph54p0BjRUnQ986X9rQV9tCTJTpRMi7p2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ4ybgqMl0eHW+ts2rYAQhZYq1pxvn9c3UDGxd8YCtmFVrIn1u
	wQer+8OkjFDSXcJ58T0zNZ+FNWtVLHYPIYt6i/Jm5ifOsBgsM0EUbwn+H/uH3URj8jE=
X-Gm-Gg: AY/fxX6+fE2KHrSO8TH1nvafJitJolpx4VVTv9EaSrYVPsPb9dwB9F8K/n+WVKENpW1
	w4K+AbNSh+gAAeyIIn4vO+JTjHK8lNGVvfSumDRpUcv1Dw1yGBGrXvyM/QKvHwOvgW2jqAiounH
	u1TwIQdzkmnKTiUI1iybKuyt/2OQiGCR2TFxItIQXC0Fxkuqtue1o6rcpH8EhkRdv5fvCVGvi1p
	0JSK0DtRlMEk3+RS3kNNszBIMhae4BuSiw6b5mN20Ntl40G7cS1X6OvRdhKC6lUooLcmx34dLoP
	N+0j/ppapYi1RAupWdkIYwezKFK3pt4DMCLe6Zp+M9G48mQjWKhe847xT/euCyuIOuvA22xpe2w
	PDMuYxhVY1EOftsUFvwstCAmuzYqQeitfgIqEqtzIG3jwjWiQOzmoxXOS/qUoAiHQr8KJk5VWOd
	IFcCmzg1G5A6w=
X-Google-Smtp-Source: AGHT+IENJSduuZRD1nBhGtGEJjleRZsqM+PDOV1UaW/DiyfEC1lIDZ+R5/jusjphWj25iRZFPeThfw==
X-Received: by 2002:a17:906:6a21:b0:b76:3399:457b with SMTP id a640c23a62f3a-b80371d8c90mr4327536266b.37.1767450700331;
        Sat, 03 Jan 2026 06:31:40 -0800 (PST)
Received: from vps.markoturk.info ([109.60.4.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f13847sm4772012366b.57.2026.01.03.06.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 06:31:39 -0800 (PST)
Date: Sat, 3 Jan 2026 15:31:38 +0100
From: Marko Turk <mt@markoturk.info>
To: dakr@kernel.org, dirk.behme@de.bosch.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	mt@markoturk.info
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Marko Turk <mt@markoturk.info>
Subject: [PATCH 2/2] rust: pci: fix typo in Bar struct's comment
Message-ID: <20260103143119.96095-2-mt@markoturk.info>
References: <20260103143119.96095-1-mt@markoturk.info>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103143119.96095-1-mt@markoturk.info>
X-Mailer: git-send-email 2.51.0

inststance -> instance

Signed-off-by: Marko Turk <mt@markoturk.info>
---
 rust/kernel/pci/io.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/pci/io.rs b/rust/kernel/pci/io.rs
index 0d55c3139b6f..fba746c4dc5d 100644
--- a/rust/kernel/pci/io.rs
+++ b/rust/kernel/pci/io.rs
@@ -20,7 +20,7 @@
 ///
 /// # Invariants
 ///
-/// `Bar` always holds an `IoRaw` inststance that holds a valid pointer to the start of the I/O
+/// `Bar` always holds an `IoRaw` instance that holds a valid pointer to the start of the I/O
 /// memory mapped PCI BAR and its size.
 pub struct Bar<const SIZE: usize = 0> {
     pdev: ARef<Device>,
-- 
2.51.0

