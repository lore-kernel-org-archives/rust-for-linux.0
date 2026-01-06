Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2534A33
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 00:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767657831; cv=none; b=EPS9MzvoAB+XDuW/W73OQn388OQ/7FXrvVU12HN1AGqzAFoM2n7DhwOYv8NSu99pzgsqEDXlJBYSrEYDOb5flNu+u/DqlVjr/7y+Z8iOIpoPLeN+oxyFpSOU/2TxNqCNdF6RSaVe3VRMgvMmOYS0IxMne0uRfLYJopMjgcAyXC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767657831; c=relaxed/simple;
	bh=fyDzEmrc5FOsOFfGlpw38CPrsYF2UvV8elZMXi/HwNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c4x74rXgA51+vaunztE1bJrF0xSGcXxd9fbMBm6keP38vT2UWJUn/YpzjUnxbdCzStmHiX4lbwgVkaumFbKtR3kkkk6NW4ZsafLXqRFcaZGercjV70WhEidzem2j9uNwENBdXvIkpKMX8NsIcBPbR5v38k37vl4ndN3y3n7OCeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHuBiLY1; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHuBiLY1"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so353182b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 16:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767657829; x=1768262629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UxynDf4Ut6Lw3r7clwpRSAjPJJbeuJiSREhItHpLM78=;
        b=FHuBiLY1JBqMs4ZntZ3paVNSYzzROomTXyFe4s/7yC//fKl3UizQg2UApX+9b7LLzY
         fl8KXPwtt5MSk+cO1QuMN8N/oFLEnFNmuvTXCqaYMKjpWmNnuYqB7RDjzooliviUjuo1
         nkyccQTaqWsf2s30DqHiU/97j/pnsSapj540ImolIwDNz+eBohmGdx30ObIrBqisesiT
         O0R2j0H/OfSeloy65HyjJUA2daugzSAaVnfDrO9uQH0FLeKS81X5EPLKDI7SwHmMmzCH
         cfr0qVTtw+N9a9yB1dJFAUlbBibOMZRvN8WLU9N67HAEY/NQNZX8pIQQnZF+wLNI2nwR
         wAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767657829; x=1768262629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxynDf4Ut6Lw3r7clwpRSAjPJJbeuJiSREhItHpLM78=;
        b=hZYX+IxyJsJc5E/scqj0BBaRKSb/+wBh8dRCCDSHSdcV220fwmiL8aCFLrGjQhBWB5
         8CZU1FmzhnkuhiOnWgA3c+US2MIJaT6w1lUUuZsJDncIukwqWTQHiVB9862F3MhNx4o2
         Grl0rJOWZoKhaq6S7wn5t4Iau9IKEBMX5NqUAQ4L3Y2UZVm9TbkuIKXcTm5GnpgnUrZH
         aPkfm4nsEcvDr0W6ei/c/4ESPpoZJRgv4UAL8LtksacX71IFa1fyGtjDx2MRqRsqTOge
         73a//qvIoBcgV8vThJnsRSYcYg3vTMp96ZEkJNha2lQCOGCgcv6ZH2woA9s1UJxBe6dv
         Wn/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVphwTlbjXwW/pkoZsRgvuHLPcDSUl/liAVdA5J8vRTswinAZfb4UZnOSWdZ3V80T3caYdkKdatjbYJ5pve2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlnBxgRgdup9eFoHMTIoiSNT99qIb6Fc56G873y5eCoPGnnhEY
	gHd2vKzQrguoMDlemoI06uWFzasZZ24q/w3sivuVQbZE09O886EHMtBi
X-Gm-Gg: AY/fxX7EapgVuozMMM+8oNvmm+HLJJ/5JVD52+YPdZ11dZAJXDHGMoZD6sVAb60pBc2
	zBDGBcE3FlaXtE3J7Jp4ohtNESRbdifcnIHkBZIOjit4E8dnDfon3XtN/p1a9JmOTDyEN1qP6Wd
	P3pqokdOQjyaROL1WgDPe9Rl9GVsLqsMvwpDgjmmg2ybY3jW8t360fTi+vHMeEF6E0ky9OaP6lN
	lkDzvkRbWnMFhLnMXqa6xwEeid2Smsz31YtGp5FEj62Vn1T/CDqdz/APUAuyR3GCGxAOvtBuXr0
	uKurH98dEaHK6Ig8E1ubZcQaFc8ftF3HRWDnFlrIui8/mRTyL1jG0ovNZGvRx7jnM5q+Et2uEZ1
	NWqGyDqN8JOtzLjPhf5QQdF0/Jsgbc2+MOptOzg8b2out2mFicm/4bq1wlDp/lQXoWDf5dFe0P8
	U2c9/vaqggdACn7KhXp5y+mQpAQfiO2EU5qHeeU1LCtnPy1LXe6HEp5OgqePFyDA==
X-Google-Smtp-Source: AGHT+IFGqcSMRxbdVIhG40RIQroGjwjCRqklY28AntEYvlKz5loO6LBUWN6lqtm6f5rqirTTyH3I8Q==
X-Received: by 2002:a05:6300:218e:b0:366:14b2:31a with SMTP id adf61e73a8af0-389823cd64dmr910912637.77.1767657828941;
        Mon, 05 Jan 2026 16:03:48 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28ebe4sm476849a12.4.2026.01.05.16.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 16:03:48 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: dakr@kernel.org,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	rafael@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1] rust: device: Remove explicit import of CStrExt
Date: Tue,  6 Jan 2026 09:03:20 +0900
Message-ID: <20260106000320.2593800-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Remove the explicit import of CStrExt. When CONFIG_PRINTK is disabled
this import causes a build error:

error: unused import: `crate::str::CStrExt`
  --> rust/kernel/device.rs:17:5
   |
17 | use crate::str::CStrExt as _;
   |     ^^^^^^^^^^^^^^^^^^^
   |
   = note: `-D unused-imports` implied by `-D warnings`
   = help: to override `-D warnings` add `#[allow(unused_imports)]`

error: aborting due to 1 previous error

CStrExt is covered by prelude::* so the explicit import is redundant.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/device.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 5c2e1e0369e9..71b200df0f40 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -14,7 +14,6 @@
 
 #[cfg(CONFIG_PRINTK)]
 use crate::c_str;
-use crate::str::CStrExt as _;
 
 pub mod property;
 

base-commit: a9a42f0754b6c69525612d678b73da790e28b9fd
-- 
2.43.0

