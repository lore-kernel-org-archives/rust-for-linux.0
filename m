Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D801F336EC2
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616969; cv=none; b=aH1m3aRGKdrqeUgRWVv1HWE0lehozu7Za4RZYsq0Hi0izFMz0/q8Kq4zEnBqbzHa5XHNW7vhvuWmsRSAwZVeBDoczYD+5Y5tvNRgNC92EJi0LFIFNT/gTTXAEMK2wF3WN8bQGnEjDmfVpgQLpcs8oxkaSDPNrf0xbHBG3FDkeDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616969; c=relaxed/simple;
	bh=7Mhi72A75wN7iG4R+NODbxoA0skgQofDw5GqDaK7dF8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H8VccV3qMgHrD3PbIe0un44OozC+F2NB1C9qSuW7gJ4FizaW4sZNj7cm5oas6y8EDZ7f5pkVIyzg/r5Wf6VgeDNg4FVX8zN8lcAjh+OOw3q8t5k5m0D5sWbyy2Yp6ES9x7MnGPx58WWCAOaQJXwUktmGaKEQlyoGZ4hBTKSOusc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zt+58vhN; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zt+58vhN"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47d3c9b8c56so94825785e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616966; x=1768221766; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JAAVBlQVWqYiEeKDUO/pC9NeXdefkrGjxSUeIkBLkEY=;
        b=zt+58vhNu3LqKIllD5U32c69iBmfL2kOAcfbr5dGrkfB7aXzX2bDwWHB7S4CrFN945
         BABohv5hl1dj0ItHXFKcv3k59RXkHD+mCNvamYm0YmAcQc7ktbjqhcgqPYtYBFNNcvbi
         ku0mrF28uyKo9B74Fsdt+fSFLw+SMmOBH4uByFgiJQuWSR07Zd5C9XASVyUTj56KhufC
         eGrbeqov5BJUqbsvK1kpeqywpTuSG8U9zpgQGGjdeIYp5Ek/zAkkLPphXZlCXY8iu2KL
         sBr0Q7DlDnighs1B5n5tiiVmyfS4logQaryI6BDizC/jZ8m0Q1rMd8U0NlJR6J8JtY38
         34/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616966; x=1768221766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JAAVBlQVWqYiEeKDUO/pC9NeXdefkrGjxSUeIkBLkEY=;
        b=D4m7ng9/O/exG306D+T5GJUnOs+88UCZgtO65jNd7ZqowDyZZ0gdWtl+An6X4Fw9CE
         MC+y8DWGQRuWAn7PSpxGYXJhcdV50h8R+/whKybzB2RWZAQ5Ps1dBaeWwAow0vpEhSpb
         cU2Vl0+XksWRFyFgT5EXjazGQRfA7WZPYrHlR2nqWkK6oCUAZ8eBA5FMb/KG4W2P/wjq
         ZRxEEaUPt4KvcBGNiVV+qfGfJiy7ksndiWTQ5UGLC2ZzBA6nkArTcihd6LlsIOD+VZ1/
         pT0+5bABVG4nZmOm7WdibP+JAZmGfYihoFzoPUyv+UVvX5nVJUGOMQXsd/GmeCNntLOr
         ID+Q==
X-Gm-Message-State: AOJu0YzNWzsH+GHEIxaR8A2ofSUoYM6yVMSheSygfht8/YtZyFQdcvP3
	ju8w4DKgyJJC7ciqFg7f9pZCMjg+ph4zRMpoU7QjT/ThSdSWKTf8vpjHiqJvwhg7GIXDnnZows/
	7G4aiiolKOpQ+PVoZDNbY/kG9YhPVE4AD8OK6N2xlduEFgKSp2i877aR+5/48MGcRVbVYcX2xZE
	lEDUDZDspKUMP8tbMloKIrJuq1dGI+BmjxmbRZu+K4R+GFkgksgpByerdLjCb6tIE=
X-Google-Smtp-Source: AGHT+IGNOvjPMf//08Ra3nBP4LEum3MAz9jpQRe1gsb4dkWUXJqU1psiGfsk7vhCEuzAT5TD+i2rVfNIIID3IAk=
X-Received: from wmbe21.prod.google.com ([2002:a05:600c:5915:b0:46e:1f26:9212])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19c6:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-47d195c201bmr655326535e9.33.1767616966423;
 Mon, 05 Jan 2026 04:42:46 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:19 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=822; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=7Mhi72A75wN7iG4R+NODbxoA0skgQofDw5GqDaK7dF8=;
 b=kA0DAAoBBFi+7ljGOUYByyZiAGlbsbvIKDfkMSCVNsfmHkUSp7M96NOo5SCt4Mo9c1hqHifm4
 4kCMwQAAQoAHRYhBIOSopRNZAcK8Ui9sgRYvu5YxjlGBQJpW7G7AAoJEARYvu5YxjlGrAEP/3OS
 CmlMi3EbOSyCWQRr8f2LfefWf4QO6l8lH8gVleX0aso3MevrZkJYyQCnlOGK2Av2my4pvBYIcyD
 kacXr3wEY3kqdUfC20FXD3MRw4sbKxBxolNkdR/v79YaR7QyhZrUDcUDu+i+2uhGnjiSADqOX7+
 K4Ina7tbJ68arI7+hp6GDCBWQV3PgFcx/91szcE8/d2sxK6Rs87FBVyYLrbXQB5NT4Rz/9xhpLq
 o0f3/PmrmtCeHwSKhx08EGUZBbZTJFbqA4MgHRi1cauCr1a8MBcxGvqWbLUZwuJjCqDF3O6Ds/M
 +GF4WSvszskYKJymXAxIHPZ4A6x5euvUFfa8xy8mtirirRVlM6P5JSY+hw6U6nNgAY3UU7/qU+B
 XCMnL4ERrfi2Yu62c7tuVyRCMKaTk8XJOL33tkJEC8FmBfDBYnVGAdHiw+RTtawz41W3zrrtPYY
 hyJNBvjWiX+xxhzTIWbqTFpLYE33pD+oIYJieNPNmrhbOccbOW71jDr0r6f0UHKOVIkMRH8M6Pd
 jvuBmhQBZudmCYZweUuSZfC/yPrYEj32tmcBZcCqbgYlJEwJkmEgVfa1GX8/78PpFVHG/iIV+y0
 deIeqaaeakdnvxY+JRe/BuXDwSWWQltOyVnBTAcvPzqWdvt505nVuB0SpDESZeclg1HnMrUZwus NglXp
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-6-51da5f454a67@google.com>
Subject: [PATCH v2 06/27] rust: cpu: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 rust/helpers/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/cpu.c b/rust/helpers/cpu.c
index 824e0adb19d4c988a6d5974f3ed94e6708dd534f..5759349b2c88b483f445ea03ed92d174e16b5959 100644
--- a/rust/helpers/cpu.c
+++ b/rust/helpers/cpu.c
@@ -2,7 +2,7 @@
 
 #include <linux/smp.h>
 
-unsigned int rust_helper_raw_smp_processor_id(void)
+__rust_helper unsigned int rust_helper_raw_smp_processor_id(void)
 {
 	return raw_smp_processor_id();
 }

-- 
2.52.0.351.gbe84eed79e-goog

