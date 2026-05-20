Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E98394781
	for <rust-for-linux@vger.kernel.org>; Wed, 20 May 2026 07:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263249; cv=none; b=WWAZP7gA52Z5WRyutAXn1RR2b5BJ+Eanr0LfA9D8QxaNWWZm5Yie6BCr8pXmT+SNAn5+4BzuJKzKUjQrKoig6bLjlkmUtgbG5brN9oQWpNAk1aq4JKd9JJoIS3o+Hn93HtVOYc3LpDKdbnH/kVkA8KtM0HsQlT1itUKCvNsl74I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263249; c=relaxed/simple;
	bh=0UKYns+nR+ySVSzxIxiko6WAtELM2fCZwIlWFYrPDh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MrOVr4m/ocbvSd687RrgtsdN7adh9RNCcgnSAbVLGx4d9FStzfxP+swO5cEETECb0VDu+SgBJDhbcOfUQuDklUes3w8BakMOaTl8MWzofa+SgnCKIbBju1YLErdWI6z65PD8CFkkpmi6VbIywj6u2I7V3f/QOCtTS6IR+sKQcD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSIRSo2Q; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSIRSo2Q"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso37496455e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 20 May 2026 00:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779263244; x=1779868044; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UhoHBzW0YBQ4lxgfg4HswZGmxJ5x4IyqPjbt/WLXKcM=;
        b=CSIRSo2QZA5qQPKFmWLcrzYWPxYZeShZjhvKS1CHqbzjCJ9UCfubSaP/iY9Ih08qol
         FZLCveCSm7h8FCyYJD0kXbFDmvR1WWiDreVTcskOQe0hxR8PaM3KnWmF3I/l8hW6qAzj
         k+/SQd+e4i7RLSNK6r+xpxTD9HIQqYIyDjEHgHo55UPs6G96nlFvWUzfdKrqUxypTuUW
         61j0nk7t2jbvKvY8ZUdAwoS4vwJDUsyW8pXFeRd+hciqnD+Lyzv9HaYzA4mgDMSju9La
         9Iw+yyQKL6gz9lEva7Hw6R5r4OPSSYysGacLoh6XwxgUbwUsmWu6JPpeBP+wapMJlTM4
         +VOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263244; x=1779868044;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhoHBzW0YBQ4lxgfg4HswZGmxJ5x4IyqPjbt/WLXKcM=;
        b=QViJFbS28wYG9+fdn9ETgAzZHQ+/FMRWQUvadCx7toPvtktKPoUPcV2zAEHtLFL34Y
         b5fFDwx1JyWJn8kPk/gCtSKVrJcP4Hfr3IQ1QLfokLEHEVH698l9aUfaj/3csTbJtwwh
         446crEOMa7XHSBaxFfnmNExju8iudMrkujXQnLim/9UueMjGgA9h+legKpRFx43Iwt3R
         QDFeoP7njGg5XsbgkmafWhxeguuHoDQHN1/Pl1FqNzh97/uPvy5eeA1ckwgvOl+ejMLB
         4O2hQZ3wXgN5459TdLQ88rZT0xsid/ySrIBudKTMeyo1C6yq4zuq7+Xk/C/tqV54OsY7
         wQGQ==
X-Gm-Message-State: AOJu0YzX8F/f3yvQYG4hKaLz/ZJdPir/q8mVK4nFVLEZdkFMPU4Dxg7w
	s0FIJPifl+M/6xZ7529Ct/q1f9jPWgQ9Czp8W/a37S+5x7ByufUbN7pT
X-Gm-Gg: Acq92OEbIKNGranOJc7KsI3upsebwtpTXcGYeYMaXYZn3MO3uv0VdlCQrIP6iPJ5KpM
	GtR4Mo+4ZME361f9svJKp+cFpfZZT1UjxOZlAjUsrU/zJBzVwXL3gGo1U6Aq0MO3tB872dayGgJ
	8cziuwPia5SYkTy9FaZ3jzgxNngQrcpIurCMQvkTUO6FU311I3yiFjClUqFfXU1WmJMwpqvsuIM
	f4Bvy96D581oqwJOTKlnUC3HdtMrk790crTn+OKNREdRgwOcA7+oGIi9W2/VSScrUkUey2hBKRA
	yYGViYmpajB2GPhZOaKMAT7eF7hrI0uz+yDgl9OJ48cv4rr333VP0+1lYbHqUvqalgWxLVhozRw
	piQPF5uv5R9fJh6f5WkQUTELTweGWqmQJBMBLYsjeopFOCdEkkZPaMe9zvqiQqXbGI+gH5+1c4h
	xtQNJ0DgQ17IFlD5LDHt6a++shZSC2Koc=
X-Received: by 2002:a05:600d:8496:10b0:48f:eb8b:9980 with SMTP id 5b1f17b1804b1-48feb8b9ademr222374065e9.30.1779263243420;
        Wed, 20 May 2026 00:47:23 -0700 (PDT)
Received: from [172.16.16.15] ([195.100.225.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm372136795e9.4.2026.05.20.00.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:47:22 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Wed, 20 May 2026 09:47:20 +0200
Subject: [PATCH v2] rust-analyzer: update generate_rust_analyzer to pass
 cfg to macros crate
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rust-analyzer-macro-v2-1-bcf5bdeca1a1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0JmbU07IIIr72FYVJjCJEDNFIlIu
 LuVxJ3L95L//gqBhCnAJVlBaObAfoyAhwTqzo4tKW4iA2rM9UnnSp5hUna0/fImUYOtxStElxZ
 nV5BzGcTlQ8jxa6/eqsgdh8nLsp/M5mt/veJvbzbKqNIg3stMN1qn13aw3B9rP0C1bdsH47hmh
 bYAAAA=
X-Change-ID: 20260506-rust-analyzer-macro-22f387f8eff4
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
 Jesung Yang <y.j3ms.n@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779263242; l=1851;
 i=maltewechter@gmail.com; s=20260417; h=from:subject:message-id;
 bh=0UKYns+nR+ySVSzxIxiko6WAtELM2fCZwIlWFYrPDh4=;
 b=4GC8ZOA4N7D9snyqpBhGgS3hhntoIUFF1JAgy8Hn88T7TvpHYLcc/mbYZQD1vssAzqJhUkoRu
 GKbkvcSX+/zDTj5Scty/4qItdlV5z6k1BOkr1E9c1diyWTdYaoX86tf
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=07WplWXZnwyLTMZOHNCIGcpoEutcMXU/JDY6f9VtxSY=

The configuration passed to rust-analyzer for the `macros` create is
different from the configuration used to build the crate. Update
rust-analyzer configuration for the `macros` crate to reflect the
settings used to compile the crate. Without this change, rust-analyzer
does not understand conditional compilation gated by configuration
redicates based on the `CONFIG_*`configuration values in the macros
crate.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
We are currently moving the 'configfs_attrs' macro to a procedual implementation,
with this we wanted to gate the macro on CONFIG_CONFIGFS_FS, since the macros crate is
build with these configurations since 36174d16 ("rust: kunit: support KUnit-mapped `assert!` macros in `#[test]`s").
It compiles but rust-analyzer does not reflect this as adding:
 
    #[cfg(CONFIG_CONFIGFS_FS)]
    mod configfs_attrs;

will _never_ mark configfs_attrs module as included since the cfg's are not passed to
the macros crate.

Changes in v2:
- Update commit message
- Link to v1: https://lore.kernel.org/r/20260508-rust-analyzer-macro-v1-1-9122b940d003@gmail.com
---
 scripts/generate_rust_analyzer.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index d5f9a0ca742c..69990a96522e 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -238,6 +238,7 @@ def generate_crates(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
         [std, proc_macro, proc_macro2, quote, syn],
+        cfg=generated_cfg,
     )
 
     build_error = append_crate(

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260506-rust-analyzer-macro-22f387f8eff4

Best regards,
-- 
Malte Wechter <maltewechter@gmail.com>

