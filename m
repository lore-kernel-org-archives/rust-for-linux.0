Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EF32E6CC2
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704282; cv=none; b=ZAnVXM5oLDviMhdJkXqwRYAbZNBCcNVuANdC9pLaVHoBVV7DWVjT8a4nn9eQZA82HDD/Z1njgRt5Pvl5HFDvjdb53o1IktT2oWNjutSJIWBPh6KoBEQqvs+2pDtGnEB/c14mPGXyiuIecMId72u/Q8Bav8tmyEAIr0gWTkXDe24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704282; c=relaxed/simple;
	bh=1/CBJJZvebUaEpMRMz0jLxkYbfnSPmeqMANTKwDdJu0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jkBbBA4R32za/itxu16qCtCOWbULBObXRDZihtB/vHj4lNuvsUVJMIqlZLXvQpgCMa8CLX0aYEZaO1Y0MQQHqEqewpzDeW/tv1hWhkYcqYGzl8cSyo37IB7BzTDvZhVGQgAEDT0gu2hayJHNpxJzg93eb71JvOExWXZRgsX8E3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N1AgoMuU; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N1AgoMuU"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b7369635423so258510966b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704279; x=1765309079; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=anbYi57HP9Kk5aEWW2q8d0oeV/qqEXxz5j0SSHgcxrY=;
        b=N1AgoMuUcsCf5QF3kSc6W239KpkldxGRo944B+y9CYKVNJvdBXW5PH/bMGeU8TFoX5
         ENc9xMk32SAyaFQ1UPTPKlURByHIOJG/bdnGYNHA7zJsjmxfxnaR119VFPxQ6BacbTRk
         akfpG8KunWTbzL527Pv68w2kREyZnMWDzYWAG/PBEg1vaji80ujut307VNX4EcJDF/zq
         qxkxw0Ommnx5pWoq/Qh1yUKaES+RywtVXN4TmoLeuMt6RfMJ6Whj/KXQqtCf1T/f9qOE
         1aR59FMK1apOmZXisPuMWMxlnXRPDk1EKWHRY799FPl2yaJC3z1gspCaAQJ3+FLFQse/
         jcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704279; x=1765309079;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=anbYi57HP9Kk5aEWW2q8d0oeV/qqEXxz5j0SSHgcxrY=;
        b=kzvTMP3GzV1mT+f9PYuBZwuqbbLDgaD9RL3+qDGkeEhYNtPijI4pPhiggyqeq85eUI
         WLk6wRmeNL7XdkcgnXWu0beJFpH35cbPk2mXVWVotMx8IH8sfNdi7V9xE3mEeJt4DmNq
         eDHJHfqwknnbaSYornplkAhm8BU4PXSpSq+Ix+dEBCKOlStZJjuEOtKsMHrPdjoEisSC
         XJc4jbGy3S/sEJ12EwGyVySKuxmTzZyUlzWYTOEHwgecoAJ9YPkoW1sDjQnh+NCI6awM
         g3BBFZ2y0ZyBrl6O/hso00vNzwAZ4o1DyrSFAMrrIksg5kv3ziaE983epJGtJd2FgFjJ
         OXZw==
X-Gm-Message-State: AOJu0YwREoAmmhyIlQb5XeXYA/xzfo3bSHi+TTHV19I/3iiVuad2DbSF
	9D6mVnaGygXYMQPFO6TFBaPBPdcsUfLu5d7/YQajBmdwVBGov31UmtcDIYcT9DRA+MCDMIspfvo
	nqhU1bBeFRk8o1khQrtGN33lDTX6ESUEAdFs4Iax55yh3xmcDeTBCRKkotSz0Bj2B9hSnyNc1vk
	E+WkRqqawiZkqIRHToBHVoJJzWTWpnVS/m0sYG8BQr/BurdY5TeelzMl8fBDMtumo=
X-Google-Smtp-Source: AGHT+IEHLu2e1wh0pKkfNaqVfAooCena0g/j0wnKcnhPbQUc8IVuiRI0uzLmPudIDsc32YztlsfObKZFfzmB4Ks=
X-Received: from ejcrx15.prod.google.com ([2002:a17:906:8e0f:b0:b6d:5546:e475])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d91:b0:b73:6e0d:4f6b with SMTP id a640c23a62f3a-b76c55f3f27mr3672546566b.36.1764704278806;
 Tue, 02 Dec 2025 11:37:58 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:32 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2597; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=1/CBJJZvebUaEpMRMz0jLxkYbfnSPmeqMANTKwDdJu0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AHMbOjMlXUVhRM9/lrrLNLf+mAvxHS3sb5i
 YG3l5GW0MeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ABwAKCRAEWL7uWMY5
 RofmEACSpUM0gIo7V9AIyX0oEO8+ZcypT76Qn+4QeYA7Qw79eTx4uxZaxAGot3dzh8ib/iRRKDr
 LIuDYYu4OBZYqeTwPIQtJ2CQ3U1WTsw+lAeBZjihoJNEa7q1qHSBptnh78orgD8sHjqCfQvQfqM
 o7eqP3tbwpVi43DA5P5E2/FMBudVpNdqScRPH9NMjR764iGsry4Vs2Ddj+/BRALHf2e8gO8YKdW
 14zBaMo32P2ovyX176J5yE5NgcxzytuVSDbjhlYmqeBawbzbFYmjJP0Mvwk1dYbiBWvbQU9+fjj
 obQ39nMIbmwB9OpRuzNtB9Dv5+IJBVb2YeTm6TOiXbqZ8znV2rnbJtBkGNd4HwgQbCeA1rGklj0
 eHu8C55USZ6CiRqaiCBisV0qRKA5CEfK526qC6vvCcsb9RobxkQ6TOouqJfwBXuEScTFmZay7s3
 OtqlwJcuiMLhQmU2SO4aPTWxLYhDiRc0uo0dfv+enX1BHabQXadHcbaJWNo0gpGtHVPOgYGJu5i
 aJVINVXOu1yF5Q5OKK4+I3jESDD5h3BRIrXNJGTeDUScGt9C148p6GMyvEzS5muq+VSsKuiolMq
 lmkIpHI0K0ny58euq/w4+gTkDmw9Zqs3C0kaxeXQzd6X9H8+8tiRZGMcarsMp8lr91p/raiCumn NAr3+CEaAFuKNAw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-8-a2e13cbc17a6@google.com>
Subject: [PATCH 08/46] rust: clk: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

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
2.52.0.158.g65b55ccf14-goog

