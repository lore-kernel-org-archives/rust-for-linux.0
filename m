Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D433346BB
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616967; cv=none; b=by2QevhAHftNnHAwYGKU0ZVbHCCwV8nDNzAxkFtAhqShfDkywakFoNvcSidHoS4W9WMYI6cEPSE+15rbiIdwdzqgorzjR7O2tjXJl2Mt4RBzZf2u6AhG8zE/XfS3e2RntIpaX1h+SxbpPvQ2z42VsC7SN5gqzYPNHI2NHKOPmwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616967; c=relaxed/simple;
	bh=WRkPJEy+GjVSZxgwl7Jzpi8fMHqkkFMtQU4c0+Tod0Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=vDTQWbVquZD6sydoU5rA6BChEwGEIhpXhLAfjFqASzg2O5vKpp9gHxjJf4X9T1ub6wlVPn+THqVV1PkwO4ddVLzL7ckrzTIEg8svBBOI//YapRh9fUjBUmdeWCvKVj1jh5agCxk+xFhAaeqIBoUkohvNep5yTOV1yPXCr6xbrlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RiE10I/I; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RiE10I/I"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47788165c97so76836665e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616964; x=1768221764; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kn0DewO2Lv099plLn+ktyqm9+gJNKKN0vCwkcu0MBU4=;
        b=RiE10I/Ie82fUB7UvLZVvz9Bz87wh48envxDsKWeciS28ZY3QBiyOn+QvoXw5b8R1J
         cNY3vbveHMVSc/9iO7Wc9L96ikSeZNlnAF4dbC2DoG1QC16Zjun4P16g73rVwzX4DN4N
         F6phdv+Xk5SAAS+/dB9JB3C4Zss8CuaUkA4rh/B8OVkFJ2OcCQI9PEbXi/NsTyybbC/O
         Axdw+3aTAS9yiKDsk5hMgnbFS87RA/3zqvFfhGAufZ7Yo/eddiUMB2fdy6AnUbGx+EAu
         QCPbEYlfyl5B0UnvcA9M6Vhuu3Hd4nlEFZYC+TkdO63adpHuYSaLd07nJbE5aj1T3AnE
         EpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616964; x=1768221764;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kn0DewO2Lv099plLn+ktyqm9+gJNKKN0vCwkcu0MBU4=;
        b=tejqq2xtyCtOKK6J94LgioyK/GG8ZQFhLu2topanpiBHZSD/Ga6nbmebDFVLR0HHSp
         ef6P8WA6h5jwDjd9effPaNZc4OUPJaHC8hXU6jfj8JQ78yiGg/KpB/cMPt3tRG0/LaNm
         /oedjHvCaOO7gkfw1IVLD2ZfUNwgEapw1PLSYSNkNpOy+TQAdUhNyOJWuaEru9HSuFCy
         iL0c13Q1FB1g8PQ1wr3fuO8EI6Arv8on2hQjpoZILcdmf/ipX8bpqej6fqkw6/XYSPiz
         KuIuGJVI/KR+jlmBlnsJLI/eDqdIlJJwCC8DI5UGEmfW63gyZgET2jnQH6wzguIoLaSd
         +3YA==
X-Gm-Message-State: AOJu0Ywg0V5Pz5iwun/PGePRgQ8aiNhIV2BtIzRG40feR7eJkxpT60nM
	dx6kawSsFAgEsMvypPDIsUwy213akFoDm0rqKv1hHMLNd5DOA5ofSlZW/HlSdI6S17HbyklaWzv
	h2L6mASCplEAgnq46IKofN2MX7dpOpccB2GLpJ79GCws/f0b7n7lPxuT0JA5Pys/4uNuFKLxU2f
	9zjSnoQyHwlhd7xZCMn39XAAv2DZlwcWURNCxgG45ICsGBWmsd2P0Y1wGyqDB1Pto=
X-Google-Smtp-Source: AGHT+IHm2U4tWkUDpICYqeLNPlKYam++VODEibw8EVXPE4rw87vgRP74KmElTW/bk6q2Gh7YOrjrH2FB/w7L3E8=
X-Received: from wrbay21.prod.google.com ([2002:a5d:6f15:0:b0:432:57a6:83b8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c4:b0:477:7bd2:693f with SMTP id 5b1f17b1804b1-47d1953b80bmr675231065e9.6.1767616963860;
 Mon, 05 Jan 2026 04:42:43 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:17 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=WRkPJEy+GjVSZxgwl7Jzpi8fMHqkkFMtQU4c0+Tod0Q=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G7/A1DRVQMGUVLN9y7nYjZEkCgkcSSu4DQy
 6uUz+hUdG2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxuwAKCRAEWL7uWMY5
 RkRsD/wMFku/Kwblx7IjsnrjOEZXCpxGGikfBuDosOgmFw9jmdn5ADXBxOm8abSZXynhJSWNE6F
 r/A+F6scg2H2A9XnnFVXv0vrQoYgQA8HpZF/jfrcje7PBpCk0g22PtwWyMS8Mt+Me79FvjJwsJz
 XFyCkBeMJwWvpVFOgqa34v96JpSonIAqJuQhAVDcFViumNNf5CFoFFRBrKYuMCe2NWNC+JQSkcS
 ZE6ER8Vc8lh3Nr4eQ3M1MOhn/xabwWIE8Uoxmv4ZcPG0sMmNZgP6YfRL6HvHsVJorIxSFvL27R5
 M4afb5QgjN4I+tQi2YWjhtZa37g+LC9UiM7Y8Ybyn7uD27YR/KhFG7kURxW0RI6riqCkUCYRj8Y
 X16DewOhh9QjXRSUv/vMPvzpr3ZJDD0kdfmyt244jxqBav73uzJgpym1GM7bhdiUCFz/rOcNFpG
 Y4f68/Nh9ReeB7ofuKfnpJzm1gM21UkhFCXkyY/ieX6pkJrzWW1jxL5GAyXhmsvIPH5bZu20uVI
 IbrOUiFqfhUZ3uIq+0Gy0Ms35XiVBUahQOr+6LKUC8XK75xjQwhls8LGZhPW0A67ay1WLjdzL3O
 Lr8M3tnCxQac6kwl+SUiF+nH1G+TJT3TjtmTdhBCjotXLRqB10EZ9JBAb7QJMo4wBiQ43tiVOFk OC0IAytIX5dnRjA==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-4-51da5f454a67@google.com>
Subject: [PATCH v2 04/27] rust: clk: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
---
 rust/helpers/clk.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/rust/helpers/clk.c b/rust/helpers/clk.c
index 6d04372c9f3bbc4355c86eda5b1ebd7576d26442..15fd7e469cddf2e10d9e996c5055c7afb219e68c 100644
--- a/rust/helpers/clk.c
+++ b/rust/helpers/clk.c
@@ -7,60 +7,62 @@
  * CONFIG_HAVE_CLK or CONFIG_HAVE_CLK_PREPARE aren't set.
  */
 #ifndef CONFIG_HAVE_CLK
-struct clk *rust_helper_clk_get(struct device *dev, const char *id)
+__rust_helper struct clk *rust_helper_clk_get(struct device *dev,
+					      const char *id)
 {
 	return clk_get(dev, id);
 }
 
-void rust_helper_clk_put(struct clk *clk)
+__rust_helper void rust_helper_clk_put(struct clk *clk)
 {
 	clk_put(clk);
 }
 
-int rust_helper_clk_enable(struct clk *clk)
+__rust_helper int rust_helper_clk_enable(struct clk *clk)
 {
 	return clk_enable(clk);
 }
 
-void rust_helper_clk_disable(struct clk *clk)
+__rust_helper void rust_helper_clk_disable(struct clk *clk)
 {
 	clk_disable(clk);
 }
 
-unsigned long rust_helper_clk_get_rate(struct clk *clk)
+__rust_helper unsigned long rust_helper_clk_get_rate(struct clk *clk)
 {
 	return clk_get_rate(clk);
 }
 
-int rust_helper_clk_set_rate(struct clk *clk, unsigned long rate)
+__rust_helper int rust_helper_clk_set_rate(struct clk *clk, unsigned long rate)
 {
 	return clk_set_rate(clk, rate);
 }
 #endif
 
 #ifndef CONFIG_HAVE_CLK_PREPARE
-int rust_helper_clk_prepare(struct clk *clk)
+__rust_helper int rust_helper_clk_prepare(struct clk *clk)
 {
 	return clk_prepare(clk);
 }
 
-void rust_helper_clk_unprepare(struct clk *clk)
+__rust_helper void rust_helper_clk_unprepare(struct clk *clk)
 {
 	clk_unprepare(clk);
 }
 #endif
 
-struct clk *rust_helper_clk_get_optional(struct device *dev, const char *id)
+__rust_helper struct clk *rust_helper_clk_get_optional(struct device *dev,
+						       const char *id)
 {
 	return clk_get_optional(dev, id);
 }
 
-int rust_helper_clk_prepare_enable(struct clk *clk)
+__rust_helper int rust_helper_clk_prepare_enable(struct clk *clk)
 {
 	return clk_prepare_enable(clk);
 }
 
-void rust_helper_clk_disable_unprepare(struct clk *clk)
+__rust_helper void rust_helper_clk_disable_unprepare(struct clk *clk)
 {
 	clk_disable_unprepare(clk);
 }

-- 
2.52.0.351.gbe84eed79e-goog

