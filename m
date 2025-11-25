Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E68D2EBB9A
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764063513; cv=none; b=FX33WqDCvE4RFA2foQT23yPTRilDBDsN6mv7mRglmDKNYUG0A4Ejy2GNCt/xtteWb9s9oy0K+GAiLros6UsRJ6Q6ZbmNljUXAAlMebvyHQSQLyxrSdyYDm/6nzF+44hNEFg3QFxgQk6+LcOCjb3774K0dm04zxPyjrqQB4f6g1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764063513; c=relaxed/simple;
	bh=PzyJCo0NMDC3zrGjoc3Af43gFBEssNp6mXzXvVML1Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lALFo/UQ/520vHWcPb94w6DfUOPjSmbxjpjhycPO3y4C0X+yZaFfQAMDvXRFdL/atPrL8BoaI4nQZ03HCvpSe5j0xBj4xnYpdQZc3yFE/nJC0+4xcagixgY3rJx+0WQDeoXZBqG87IvTrKZ8NVEl8a5Q3U10xfsdh7BCoxAX2eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fk03Eece; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fk03Eece"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29586626fbeso65896405ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 01:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764063511; x=1764668311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kvg2CC0/0PmPD+bUYi5OSZ99SQYfWFsx9xU/p31vcY=;
        b=fk03EeceQru1mFcjw70hm5x2Mgh1gzMFAddDOqJZGZSgEx7SD7K39AroX5EGRM4HHb
         VbXv8tpQt4724W5aXg0Hu2Qd/GEGC5YxUOPrgc+CFRa7JMLPQiYBKy8E5MPdz4Ov+yCp
         IwEaMO85Aqtz7Lb0s9hRxsiRg02xi5jWeamDA6wm02yeHCHhGyYJZM8zKpMOKKK8RS+G
         obhWhYMEKSSiMF3t0TAcn59H46bBWV1QVOzL1kzNMJamK1EeXYvsufB+T2l02vzRAidH
         Sr0aQCS1JjNgeKwiv1ENh9/ICQ1iV38pydS9Szu0DoyeEf16r2cIU42+crZNebgTn8Kr
         EKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764063511; x=1764668311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3kvg2CC0/0PmPD+bUYi5OSZ99SQYfWFsx9xU/p31vcY=;
        b=j6EXzJqrapNuiZ6mphqn55i8d8/GmJyjXS5Fk4QA4Cjavg+3Wpy9CAKmvxnelhA29x
         HV2MSY5zJKlR+2iXWlCC5ywtFRRVcLrs9LPckW/KOZMQtsGHaclza7YgfZEJnzW6ewgr
         Shp59cgLVcmty/UrJnj+Q47MpMcfbHauzY4Xb8Yo+QcfhyyRqXX4FzW+m1woSwJHiC1C
         Vibx7ze8U7ARzKcZHgxzfxwOXrQQpcvbSxEsK6yj/caxAseF2BD0RgZsuTLUkIp3W7Ho
         0wcuSsJy7f52zoXy8/cYPU0trxZ6qR9s9agzdcxcavDupXoXGffHcF+C3PAVb8j1yD/9
         KQQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXIzaE0ZogSd/INrpdfoDuP7SiD0+NMlpkU00P4G8/8yVYRBskXUBg+3ygKI0BGYszSG3sPw/jG7ZvMCg7kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuyLQ2ixqLY2rOCVmeyvmXe1Ff/UulbCxwwy10dleVnMIyOh5I
	ENy0BcRoHH2rNvxS7Qg5YY4L16m3NV27dgQrSvEdM1vlVw8265EJFDMF
X-Gm-Gg: ASbGncuGFH/XNZpnmcjeQf2bD0zUdRm0iRK/sD3RNR3kheUASnL5CokEhHkgW9KhUfY
	fmCaodrypd63D5VI6wnVZoBonZSjgUrJkQL3DmAu7EVxzrlFBNwZ7rp1X2lV6p1TlZ0BNHqYxn4
	NJJODndvQupi9lFfiGyx4Vt8XMdffJTxToJgeXhclrmf7blYsSBMXM4lYGX2C5LndnGHaa/xBgu
	9svCszCDyku525c6TPfo7xImGqCyMR2Tnz/07N+U6O7PKvswvAk+bQ/eJ3O92IRwNiZ8JBI1Orz
	aBRZYXOH2vJba1zSa0wtJZ7/oqx8QaepYmjgSQCYIL0enhORxLin+/An6rQJRszcBN5mHsKTX52
	EQWP5cvcZJfwe9CHeFur07wkH6/EW7kccyvr3Pw4GW9oktm4zUuBPrephyBNhJ5ctufTlJQz3ZE
	3EWFsSkPRzLUtwHh/Tfz+k4QAv5ULu0F5z
X-Google-Smtp-Source: AGHT+IGDZyxuVTVY/bzA2yeS86Pm1DIgZCtnxsJ+F9ZKGd59POWb9qoDVQdCxfHQiEF4RzOy29ipqQ==
X-Received: by 2002:a17:903:440c:b0:297:d697:41e with SMTP id d9443c01a7336-29b6bf3b588mr174847565ad.37.1764063510703;
        Tue, 25 Nov 2025 01:38:30 -0800 (PST)
Received: from localhost.localdomain ([104.28.217.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13de62sm162581935ad.36.2025.11.25.01.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 01:38:30 -0800 (PST)
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
Subject: [PATCH 2/2] rust: quote: make rust-analyzer treat `core` and `std` as dependencies
Date: Tue, 25 Nov 2025 09:33:00 +0000
Message-ID: <cef76fc1105481d219953c8552eb5eb07dac707a.1764062688.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
References: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the `generate_rust_analyzer.py` script to ensure that the
`rust-project.json` it produces includes `core` and `std` in the `deps`
field for the `quote` crate.

`quote` directly references items from both `core` and `std`, so
rust-analyzer should treat them as dependencies to provide correct IDE
support.

For example, the `::quote::ToTokens` trait is implemented for
`std::ffi::CString`. With `std` listed in the `deps` field,
rust-analyzer can show the expected autocomplete for the
`::quote::ToTokens` methods on `std::ffi::CString`.

Verified the explicit uses of `core` and `std` using:

    grep -rnE 'core::|std::' rust/quote/

Fixes: 88de91cc1ce7 ("rust: quote: enable support in kbuild")
Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
Unlike [PATCH 1/2], this change doesn't seem to offer a noticeable
benefit at the moment, but I've included it for completeness.
---
 scripts/generate_rust_analyzer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 3b169904ee41..b8080febc4bd 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -96,7 +96,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     append_crate(
         "quote",
         srctree / "rust" / "quote" / "lib.rs",
-        ["alloc", "proc_macro", "proc_macro2"],
+        ["core", "alloc", "std", "proc_macro", "proc_macro2"],
         cfg=crates_cfgs["quote"],
     )

--
2.47.3

