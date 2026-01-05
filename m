Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE31338587
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616972; cv=none; b=HiHVeaQ66UEn9kNnPSpG8W9JqUegbfLvWx4J67FU8kKfqEP4BFIlTwBqmziS4HLjFerK8Rk9ODPVfTr+UGtMexRLevP1D7HVk/RMe2rQRxEW/HyP9pBkerazE1Sdse56TqwnKF+7XL6VDFuHq5/NafGW9Fu3JHQUADBmS5VSPu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616972; c=relaxed/simple;
	bh=Sq3fGgcU07h8oT77q1FdlkaJ3IdYOyIidruPx9dNhA4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gS7uhdVWVVwr5wc/0NiHdouC1KEptdF6B4Qi8r9A0eyg9PsO8+01rFzdyvZReSEbolgRP9gPrVB2qrgB40ghD6fppmV3s2Wy4DzVgxyaxqeV+v8rnqsZjlCqBYnUGT8qb2LdITNxCJaon1LFARwts6NH8iZK8k9CcRuWRJRIZcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ybub389O; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ybub389O"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477b8a667bcso187636935e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616969; x=1768221769; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rwtDiFp9KdQIyBnUGPwoXLIyUrR5n3GCum8X5tXUFZ4=;
        b=ybub389OnapECBmtje2ZUfQzddB5gn4QPsYxXjyhzsasj3fxWNX//hr7kldVZ3eako
         7cvEJqRtt/oAggvzbLXCS0EDS+5IR9yt/dalJwMmGZNpb+tQ97ePDAk29fUpzmVDI0kZ
         92leP/R9mzfWP06QovkHzrgWxNMlYSs2ooF0RUscLBhE1LDSF6RWLuwAtU8X1QDf/aYn
         dm4igVkLEOpvC52BQlahp9oe6PGmMDJg7nytUVQL3InFfLpJ5lg746CvIE1+lkJ6OE+8
         pEtdWOX6nMoxNE7ZU5ZhSLD47RtOAQ+5nqqxMVis1gcd9GI4j3sCjmD+IG3CMgiezNN/
         smVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616969; x=1768221769;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwtDiFp9KdQIyBnUGPwoXLIyUrR5n3GCum8X5tXUFZ4=;
        b=rJNMZ1YsBumBmedwv9npGxGjT2+zo1NesztvIuRETNP6EJ1NXyibAUyO6axnAeUOcS
         LwtHErbJLydF3UwbuCzvyJFQlzt9DYv7DOEMwmqiZk0sVcecjteen/kiVdj+Kj9Umcah
         lX3t8rpuIuUHCEOeBGFVfwgoEEIwj/ERM3cp/ehLCFGj6nDbmvLyO6MQyoGOEEecbOqg
         /eGgJzgLeFvVG5BTC7In/RcZKxW0DIA22P6P+ocAFy9JP+SE0sgfJ7SVK5lXtHy2cV9E
         lR09MepB8SSCWE0wFDOePJC9mvXhgkTNdCSiH8dZdVCjdKdkvFLrIqmcQ6ZQD1vweguC
         5cRQ==
X-Gm-Message-State: AOJu0YwmminQY35sjAXiGgjuLPugfRYK7FyldFrjqVLoHgkJrIqApjJ6
	POaOKTMGkc0LyWeeggsRxsLCHbQ+9veIozYbg7aL6VU6sZrCCEPijfjjlN77Q5D2kDICBxRcCvO
	Nkn4YhfsDMDKlBUuNS7nvxkxrWGmHa68G93yHybVggSS+u0U0S7ShcivPf9NkQVINr2MBLyyx5y
	5WvuPDHoUh0/0o+gMVX/NedJuZhztsjO2mFF8qzg6b43fBlFgu142IG+CaEmQzI+4=
X-Google-Smtp-Source: AGHT+IEZJBvYw1qzq4uRE90zzyP9SDmMM3hiNu0S/bDnCSQpnWfUSXPovqFcoBd7/KM2x+O8R+/KaraNHMCFF7Q=
X-Received: from wrbgv17.prod.google.com ([2002:a05:6000:4611:b0:430:f5d7:f015])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:438a:b0:431:855:c798 with SMTP id ffacd0b85a97d-4324e4cba0amr64568193f8f.19.1767616968799;
 Mon, 05 Jan 2026 04:42:48 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:21 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Sq3fGgcU07h8oT77q1FdlkaJ3IdYOyIidruPx9dNhA4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G7iPgWcezTWb1MwyDAE+VMdYNyCmE5nty5g
 97NuKmpRUCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxuwAKCRAEWL7uWMY5
 RolbEACmBKncLY6uepUFAwTkw8aY+Dq846+YbPx4v+hpTPwR15MnRXq/iqZrwJNMN71yG6s0w+w
 RLBnbqI55BkMbEdIUu+sUOpBcQJdS6y4PEVr88xsaGbIpYuzJcGTfUOj583l+C7i5kBloeTxoPu
 7Z3uFv+hx2uwdEt1n/pPehfElhchDOmoNDNfWnrN1IZLgoghuiaDBAO6hDfXAhFrusGeal+YSu1
 trhG+fujoeWDZZxOb6fR4hUtEUPTz1anLf5THAgLq8hTiLygLo5gM56DdW8Nx8GWg0atkuFQw3O
 alWxutTiPI9mR/lgevnPAoFXB6+qiLC5F+ORZw+T99geGYrjvjZNawnou+yCPaaoXtO3h5bX8hU
 sWPkCdDk9X9fV3XjZt3LPUCww7qnyWGdzZ6cHLQAqcFqiP2vY2/aRKpW5CuVS+U2mEk0skChEED
 9el+3IW0WTC91OhvDp3gwPmVbJOt3b5WHw2zjkoFg0AuNbhIfc63hMTJaVB9G9RfUPGwT2uQ4yc
 tZabDmfSKV7IDb0MPA25JJjdhorfV5NlyUaVjJdErwPYjINBn8S6lee1SECXaTTcH5JWs714gxB
 LS4KFovkIUczrFtJPtZhNGBNYr7+9RLPx6wIig4NutYTO3Y1O1xcrCTWx7n08KQv//ThzmEZ0NC P460cXuSVuc2j3g==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-8-51da5f454a67@google.com>
Subject: [PATCH v2 08/27] rust: err: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/build_bug.c | 2 +-
 rust/helpers/err.c       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/helpers/build_bug.c b/rust/helpers/build_bug.c
index 44e5794880373e5b4c3e9de5677d8e03ccd4a2be..14dbc55bb539589fd822ac8777b3fdaccfee7897 100644
--- a/rust/helpers/build_bug.c
+++ b/rust/helpers/build_bug.c
@@ -2,7 +2,7 @@
 
 #include <linux/errname.h>
 
-const char *rust_helper_errname(int err)
+__rust_helper const char *rust_helper_errname(int err)
 {
 	return errname(err);
 }
diff --git a/rust/helpers/err.c b/rust/helpers/err.c
index 544c7cb8663283edbe202318e5bca870708546f3..2872158e379383d592af687991115a0d223c3898 100644
--- a/rust/helpers/err.c
+++ b/rust/helpers/err.c
@@ -2,17 +2,17 @@
 
 #include <linux/err.h>
 
-__force void *rust_helper_ERR_PTR(long err)
+__rust_helper __force void *rust_helper_ERR_PTR(long err)
 {
 	return ERR_PTR(err);
 }
 
-bool rust_helper_IS_ERR(__force const void *ptr)
+__rust_helper bool rust_helper_IS_ERR(__force const void *ptr)
 {
 	return IS_ERR(ptr);
 }
 
-long rust_helper_PTR_ERR(__force const void *ptr)
+__rust_helper long rust_helper_PTR_ERR(__force const void *ptr)
 {
 	return PTR_ERR(ptr);
 }

-- 
2.52.0.351.gbe84eed79e-goog

