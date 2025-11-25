Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3415A2D9EC9
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764063508; cv=none; b=IZt/MlS1m1N1ZeMjbiXymQMMEtucDLKOMgWSgEFKoJ1BxdRU3gsJDFBN4fzYvuPfDiJY1LVaM9U4jTZ0+99vV38bbMShANuxjrGtTgARaH5MpGRGyPGy+0DEPDKyqSzPfA78CzQbv/oYl+hyxGy+ibuwua0kFiweVMKVGjLjx+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764063508; c=relaxed/simple;
	bh=yCXjAp11zJU5vSMXw5sgaQ7w2NF1uM5CXUSz9VEcdeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LcSfriGC0sQ6DrSMI7MfEgypZsPhpDvtlDM3RpZfiyRH4C3ZL8OvHfQLGVukG39CWYbrH6wFbs9YYCAD3KcdU+eyEHWC5vZXD0hjBkGKPFmQ8HywJj12FjtfG+peggd5CzPchQAC3F7q3jkfGJaqeWgnL+igDtFT9DP8oqEaI9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKoiyEWr; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKoiyEWr"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2980d9b7df5so65602945ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 01:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764063506; x=1764668306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BalTlnK8CSDhMtJJ+7z2yztrhiNmZUAZ4AGy5ZJmXak=;
        b=TKoiyEWr+UnzYmgETOc78/lBjBsc4iWzYebS4/0mOX+BEMAoDWeENbQgJR/wFqVIpP
         HNiil0cCjVNevClccQXR2mo6TtETPQJ3XscgKYoxdbCGSaya/cjOFwWLHeiUIY9nuvID
         5yZiLn96AMt68Bz+PSy38pJvFGwV6pklVs2BRpq+wRL9zP8wmmxmZSyMTXnqnygHE0rG
         bZ9dghiCnzPfzP1n7CQZbPGRruQtDLGyJdjK48sL1OnhUrZUM88UfzhJzv52RgD46UHf
         5+6MfS1Tz+TGEoP11TjWItAwHlHtghB6XsVCxAs8scHGSvOLe+J9yjm3KE48Au3W4n6T
         B1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764063506; x=1764668306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BalTlnK8CSDhMtJJ+7z2yztrhiNmZUAZ4AGy5ZJmXak=;
        b=Qq15Re7m50YCpQfSNQ9pg1aajAGAKRIFQKlSMPI1uc1Rzzoqt3fe8aZsLItbgyNSrm
         GZ/lsszWvi/IAj1+28B1jViNR1GwXL5Q/2fuNN0ilJtttX8MwZ36++6HmVkD1xd0hvaU
         V4CcfYWT1F6eEpHnCEHP2uiugkv/aYx//JpynD9X5j8ydrwgAyyzbbozqb2Jd5uBtTTs
         2mPyqOlcL1V0DsRIz8HnWiUbq33NlDj8U9C9+Zq8q/OQ4ZLnu0Mt0HSHM29RQP3bNjBk
         3AunW8E3vJhtD2heEOHNEY19EaT94ccvjNBod36ap43gkxzKhERpqdGY6vGWRIiIsWuC
         9pjA==
X-Forwarded-Encrypted: i=1; AJvYcCV79Oi+MOFForu5hFclgJUUZ+p6oWcqvjp84B2YCTpM2/AG497KKMFF9btOHTOuxS2C5v+t+i460qvyySxBAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUbZD1nz6+Opitk1KUsoS/hA3bRmFeipg0bPX001ALmPerqq25
	uJotwwkjOPcru6u/NcSW5Hm4lUpylBpW3GA+ctBLbl1fyPii9Z6d94ow
X-Gm-Gg: ASbGncvhiTO9fps3yv4dB5cr0o008UHezLD7SeMZcUVqQ3/2WReLGnMBmMGuF19O6NB
	88Ziu3ARe0ujM5nMmgigkNekha1cUirPbO19EF3lADRxnFME3UI9Op/+zAgjB4RoNiz9jjLVQiq
	D4iwclDgDM9xGotSFLI1ZKm8R4J5j5lw2R//I0RaFytLke9yF9FQv8zbyMeoKNOHDB4vbsvZIm7
	hiXMu513LF6KtWpf4EqED35uE9SJ3xxXHOSCy7WcEPmhCjBi+9TpRD0vADf4qF8/aH5pWfENjjs
	CebYO4fnpB526Cwdto95ZdcMLUrjrJFlLMzrFQNdrSm1bMdnGwqnLpWYO6QK/mC4cmWWsLFC8wm
	oi+tzKg+CwNwcQ/hTtdeKUBfvTEe4Q3Q0fZzL5KGr6DmwnTBmPW61/SOeH5Ev9JK7tSvsIQPNbL
	DGUzhuzkC3lIRkLZSmOCpF1g==
X-Google-Smtp-Source: AGHT+IGPbN5gpEZW9nkpGciWOJBJST/YMdXV88LF/Up1YoeCG8ActmI+QPpP+pNGAQuq8TjRoZ42hw==
X-Received: by 2002:a17:903:2f87:b0:295:269d:87d1 with SMTP id d9443c01a7336-29b6bf84213mr160826725ad.52.1764063506364;
        Tue, 25 Nov 2025 01:38:26 -0800 (PST)
Received: from localhost.localdomain ([104.28.217.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13de62sm162581935ad.36.2025.11.25.01.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 01:38:25 -0800 (PST)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH 1/2] rust: syn: make rust-analyzer treat `std` as a dependency
Date: Tue, 25 Nov 2025 09:32:59 +0000
Message-ID: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the `generate_rust_analyzer.py` script to ensure that the
`rust-project.json` it produces includes `std` in the `deps` field for
the `syn` crate.

`syn` directly references items from `std`, so rust-analyzer should
treat it as a dependency to provide correct IDE support.

For example, `syn::Punctuated` contains fields of type `Vec<..>` and
`Option<..>`, both of which come from the standard library prelude.
With `std` listed in the `deps` field, rust-analyzer can infer the types
of these fields instead of showing `{unknown}`.

Verified the explicit uses of `std` using:

    grep -rn 'std::' rust/syn/

Fixes: 737401751ace ("rust: syn: enable support in kbuild")
Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 scripts/generate_rust_analyzer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 147d0cc94068..3b169904ee41 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -103,7 +103,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     append_crate(
         "syn",
         srctree / "rust" / "syn" / "lib.rs",
-        ["proc_macro", "proc_macro2", "quote"],
+        ["std", "proc_macro", "proc_macro2", "quote"],
         cfg=crates_cfgs["syn"],
     )
 

base-commit: 54e3eae855629702c566bd2e130d9f40e7f35bde
-- 
2.47.3

