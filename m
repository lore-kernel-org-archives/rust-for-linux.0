Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514393B2AA
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766489966; cv=none; b=Uw4YE/8TJW/meSJQ8ekhjQBH6WhUd4Z04w7oLwR/UCHwKJZUQbY4yxH+h26YJpAqiLIjWUYDBaeTbYJhz9hTUJEnOAM3f15gawWBLq47t/a0IxQ3HYAavNgdAnX6W5Wspi9nyxHD56lwoEmhipUDexMD63wFCo68z/UFHW21yqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766489966; c=relaxed/simple;
	bh=HmroTegyE0ozGc8wTJUyfwGhI74+O3p/GegeK21LSn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iOG4Lgv+KjT72wn6f/1ZjRPS2BTVzUuVpMLQiod3w0FqQM5aN3XFM/fbom1KRMTMy7VDrZOS+0wqm4ewwDoCTO3X2RJ73YeEqZ0DqR574/IPvU7K5jgdWahVjVLMWN1Vu7UPeSlzAIWwzg5yB9bjBXnc2ioQYPRxnujordMAOHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBdaxPsC; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBdaxPsC"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29f0f875bc5so70770515ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 03:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766489964; x=1767094764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kM0Fyimw717pC9AKWZSs60i5cwEhrvAalNnqLiDG3+w=;
        b=jBdaxPsCVi74aqg2myi90fLJyFAqTGyettGXV0k6kL0P9daxfYBVfCHQp3ARz9V1N5
         ElrzJ8c19oFPKI4OZN3afpKW5IFgUhESQsB2mPFKNjqdH8hgYTl68JZSBZwoyEZXCeQn
         FtWrfhEgARc/72eufL7ZQ77/LiFEjaQftehhYhcXEHLDwJkBU4bgEXqORrw6RF5Jm3kE
         uM5HL/xX9ZWa9FVOAzOVkmu1zwX8AHvnMD24nCUr+G6Ulx+Wsv0txPDhUXva3uQS8TuL
         rSWoMUPpdXjv/YAAI18HcdGOKWRnYdpIjXDOuhqHL1zeo3OJJ3je55CLaK8XN62CYtvk
         M72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766489964; x=1767094764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kM0Fyimw717pC9AKWZSs60i5cwEhrvAalNnqLiDG3+w=;
        b=ZZxDv+pAvfodFjjYg9jQXjsQb8QeUSXctCfYIe6fCZR2C1sBmqbjgBOA/DY8PLMhTb
         5bYzRbyQQblEmAFBrttMp44ofHtwwcEgRbpkAaLborZGPJ/9x5Mp7YIBoU1KsNV5sJIL
         StzOeGskwd/fkMjMNffu0HMu06jo6hjt9Hm4dNxWue0aDY8wKJNj8ziycNlPZ5VEahzk
         1jtsvF12TVFvguGYwzPiDT+UCWxLV/oBSzpq7+sSHX+SrA1p/oZH/PldhdyyYdkeFLM1
         bKrbwDPdSsFlWx/983pBcnbwQUOMOB+WRIq7PA8Uy35BESD2rDQ1gsT8MCgKTHVORT+U
         oNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj5sEBmDUE7pV4JCPDkGC47WwXpv0NJ/kYvV2fAMR6x38hI+cZHgt83TNnRN8vOjOk4wGjTM7tqm3qoLPKkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4BsYLNCI2xsK1454wRYpqmDyveYjfajfNbfzr2RxPrl6kBnEF
	cwbQqV/XvNNvQDJvAg3dCEoxtiZBMVRnn/3Ojm1+f6AhgNZosPBrepSfzP8XXA==
X-Gm-Gg: AY/fxX6sjp/f0WYSl0GSsdIms3yyDbID9mZAKkPSnvWTsDBrLwNLf4h69pC5VBFvb2K
	zayOgJBJeI87g8YJR+J8PS7NtpCyGGB+NpVIGjWF8JzW2G2lG3AikYNvJr7BX9Yxyz2jpLZ/YY4
	2inoI3s8WJ6KYUzRvjacSP6Vgev1Jrh6WFRdH40fRxoCezwA+gmtu0fXe4f4AvWpDvsynz+6djd
	14Spqc3wwDKzeuU6ovw/Es1c7pTaV9Oa3ILEA/cJcdqqNFv+ii93tJFHFmw13zuaBud/0NRHSOV
	bNjkNzq63E6uD7U8iGz32qnjq4LN/5GpZTWvvRlCjWtvJ+20BU+V8XkeLS1ABCA+deHd9KIeqwK
	a7h7zJdJQFHgXle0ZZ3z7AmUau1TuxAegQtCCun6o9Uuc2UCCFSr4nNZ1VHJ8i0GiMbiOWSkB/Z
	Mo64fN3G55L10XAKMJIsb4YXnKCWwMMRFQ72MXlJBfBWT5SW+ak0wCO74vUHByFA==
X-Google-Smtp-Source: AGHT+IHHkc/HIe0xhclItX9GDdYgVSNwItVgScxroh9aR9B0PFmc0HE3cs+DRM0m8jg8VsXi+VAqcg==
X-Received: by 2002:a17:902:cec8:b0:2a1:243:94a5 with SMTP id d9443c01a7336-2a2f2936dffmr132250915ad.47.1766489964491;
        Tue, 23 Dec 2025 03:39:24 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d74ba5sm123753145ad.89.2025.12.23.03.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 03:39:23 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1] objtool/rust: add one more `noreturn` Rust function
Date: Tue, 23 Dec 2025 20:35:38 +0900
Message-ID: <20251223113538.1016078-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Fix the follwoing warning:

rust/kernel.o: warning: objtool: _RNvXNtNtCs1ewLyjEZ7Le_6kernel3str9parse_intaNtNtB2_7private12FromStrRadix14from_str_radix()
falls through to next function _RNvXNtNtCs1ewLyjEZ7Le_6kernel3str9parse_intaNtNtB2_7private12FromStrRadix16from_u64_negated()

The commit 51d9ee90ea90 ("rust: str: add radix prefixed integer
parsing functions") introduces u64::from_str_radix(), whose
implementation contains a panic path for out-of-range radix values.
The panic helper is core::num::from_ascii_radix_panic().

Note that radix is derived from strip_radix() here and is always
within the valid range, so kernel never panics.

Fixes: 51d9ee90ea90 ("rust: str: add radix prefixed integer parsing functions")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 tools/objtool/check.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 3f7999317f4d..719ec727efd4 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -197,7 +197,8 @@ static bool is_rust_noreturn(const struct symbol *func)
 	 * as well as changes to the source code itself between versions (since
 	 * these come from the Rust standard library).
 	 */
-	return str_ends_with(func->name, "_4core5sliceSp15copy_from_slice17len_mismatch_fail")		||
+	return str_ends_with(func->name, "_4core3num22from_ascii_radix_panic")				||
+	       str_ends_with(func->name, "_4core5sliceSp15copy_from_slice17len_mismatch_fail")		||
 	       str_ends_with(func->name, "_4core6option13expect_failed")				||
 	       str_ends_with(func->name, "_4core6option13unwrap_failed")				||
 	       str_ends_with(func->name, "_4core6result13unwrap_failed")				||

base-commit: b927546677c876e26eba308550207c2ddf812a43
-- 
2.43.0

