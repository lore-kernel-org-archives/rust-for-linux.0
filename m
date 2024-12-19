Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04401D7E45;
	Thu, 19 Dec 2024 21:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642530; cv=none; b=RwzUeuv3KB5dxvh/FstXB/4vvSSR+eJNlEt4YUKizomOw7MlL6wTr9ovEikOz9AVsVAtSSPUTHiOR/Yuq9N2rUS0KG2XT7shLthZbm1PFKV7CsQn5Rm9WJ93Gia/Uh3XdKVG/ICmRWfcfEIGu2XK4iBnLe5HQcDkIENGuPayEtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642530; c=relaxed/simple;
	bh=lY27LEhr/RrYnOIR8z3fQ4J3MpeoCX1CqLVxrfhFCU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AeMQxfboSbCuFBk902xvmZgMP+d4NbDkh+FHu+D4a+hfdAB+DW26ScsTMOa5eJgO2Y/I1B8iYFj6fO6v9rm70bBkgvTa0kVFj3ju5B8CaifklSieHH/V7KKJtdFg7ZEegIRCdjMhpdH/DASfFbEqW5KMAiQaZzH2vOfrNIsLUgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8tQUDtY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8tQUDtY"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21654fdd5daso11915735ad.1;
        Thu, 19 Dec 2024 13:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734642528; x=1735247328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeeL6HPCkGqR+iss0d46HW94C36VOktwSeHKqW1zTWU=;
        b=h8tQUDtYOfy7WqoqloRvXvxcMLqIEibqwpMk5qRpLA9i2POBqfCXTMCdoXBYD9Sq3i
         /eJYJZ0ZgckslgkFTUOH8Q9vt+pcwMEbaiEW/YFkjwSI01rfmklDwwhg8PvIpomfIIQl
         QfKoIVsVXzhNl/7AHw5udnBtNQ21BWyOb/ztHboUoLvgCYhJptt+o1VSIeNAItcyeZ7v
         RPT4aEJLNGlhx9zDWHBzCXRWI8DP/RjKJ4i4mt4v415SREti+/90BcRKzeZTN6xLvvMo
         1jinkBZSqZCS+hOn1CcbxUA7QQMqFRZGlYzq5MzQIrQJjWAUFMT+5SDDa1voY6VGfr3C
         aagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642528; x=1735247328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeeL6HPCkGqR+iss0d46HW94C36VOktwSeHKqW1zTWU=;
        b=Lu4V8lLI3440gqU1r4xzNbWO4+jU8HDRo9p2NrswUyXTSOfRVl329ORgFfeNANTzm/
         RuFQ4Vk9uco+SdlaoVYSrAGk3b4JtiDFVpo52teTgskv90+XWpSBUXq7JyDmjLqLyOBL
         aY+RdaC34aXNM3ElryG1T/JqGhjlIO5fB9XFqfQqlSjb9qCIixKvCQLxBVSPm2cbI05Y
         NQfiuv+7Ng+upw2k6iHxuXJRAxOqvyapP0/Z0ZTZ5tGfys7E4QQPs19QA9iaQc1sTc5m
         AFUdb2RmCOqTvWdS8kwKCcqXjt17gnUnl7cC7TfjRyUxVLheJvlj0b8OZ+KW+3lzU+JJ
         KUHA==
X-Forwarded-Encrypted: i=1; AJvYcCXUYHfIgpu80D8nKTEvvDBQilbV4Wtz4XqXYZcf732m5ROPeEs5uTOw4XTaPibbHZYLTqlsusqY6qi5Lt9IHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSQtNq2SB9snyGMeLGRadXmPtYfxIxBUGeaMFzmSua96HqFJlU
	uSe0eLoBun0llhynDqrAM0IttTUfQDlmN8vjLmV9oCQAekixLovU
X-Gm-Gg: ASbGncvFksIu8mGxIkbiQjvZIEn8r9VeE9FjeBEFoldVX83DE/DofhHjsJk9pkwcjJp
	8UbizelVBry4Trm5kE9b3NsNZWyWggM6iWMNZTe1xAlWkDw7Zytbh2GvD/7DmcXxrXMNNw5Kc10
	IEMA5W9bi/oTSXS9tAN7zfqKxaYs7RGV2G5z+ZyEdNm4ty4mTlIFrSyWGWhBIFiilnZrk7r5Nrw
	OzchHycMBVvSSYiIgnulNAAm4u+a8PoSfQPHiKL/4WzILeYF6ychBSVGYdKr3rtjA==
X-Google-Smtp-Source: AGHT+IF/1tM3WCgqS4vfhViKK0R9nsVTEMtAfdNwyZiWjLZy3SwsOJSvD1LICQhf2BHaA/XvshYH/Q==
X-Received: by 2002:a17:902:ebc6:b0:216:1cf8:8b8 with SMTP id d9443c01a7336-219e6ebe15emr3313535ad.27.1734642528276;
        Thu, 19 Dec 2024 13:08:48 -0800 (PST)
Received: from mitchelllevy. ([174.127.224.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962cc3sm16831755ad.28.2024.12.19.13.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 13:08:47 -0800 (PST)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Thu, 19 Dec 2024 13:08:27 -0800
Subject: [PATCH RFC 2/3] rust: rust-analyzer: add lib to dirs searched for
 crates
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-rust-percpu-v1-2-209117e822b1@gmail.com>
References: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com>
In-Reply-To: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734642524; l=916;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=lY27LEhr/RrYnOIR8z3fQ4J3MpeoCX1CqLVxrfhFCU8=;
 b=mwtTmJIpnuguPatbGcieMpjbUb5v3yLgy1KPUvNYJhpLHNbxO1HwQtsnaFhqxc/yuAMoKljZH
 own5+keq+syBDNH0fM3Z66LWAo5xjtxa2gnmh6vJFnKBtyFvvi40Xs9
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

When generating rust-project.json, also include crates in lib/

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 scripts/generate_rust_analyzer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 09e1d166d8d2..7d7ffb45fc0c 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -109,7 +109,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     # Then, the rest outside of `rust/`.
     #
     # We explicitly mention the top-level folders we want to cover.
-    extra_dirs = map(lambda dir: srctree / dir, ("samples", "drivers"))
+    extra_dirs = map(lambda dir: srctree / dir, ("samples", "drivers", "lib"))
     if external_src is not None:
         extra_dirs = [external_src]
     for folder in extra_dirs:

-- 
2.34.1

