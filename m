Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1A41A2C25
	for <rust-for-linux@vger.kernel.org>; Sun, 12 May 2024 11:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715513030; cv=none; b=ZI/O3RGNiJ6ncC7bT7mKTMYvnAU5Jl22NmeshFL7Y8o/hN/NCgoDpmBt1cCGmxt2uo+BQ2pfC+3zVhVkVMXkOn+LLRK/2LQh+BjbGYOclsMtrvYjch+zNf/zIGE4PyfJewIpBZyjaL2m8JM9ZVhmD4cj8Wj2zKoxW43Z63+HlpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715513030; c=relaxed/simple;
	bh=1znuCdbJIknvKQOOFupps2xqm9RzkCmYR5LhPL6aQB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qF6e0zzJxtiXU1Vxdf39nBr9cI+lGqHjhS/E2RpOnQQwRCEleZvf785UyUzhV2TU5uNvPhzB0CHKlFSO6DAaOgPCmKJgrxBtPgbNYF8dV0OuPh+toXE0iAtdyv1eG3Bn3F93uDeyqWk6tC0PGmT/lzkuEZCN1G8AHS4Vaih0XrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7+auKf3; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7+auKf3"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-23db0b5dd28so2375314fac.2
        for <rust-for-linux@vger.kernel.org>; Sun, 12 May 2024 04:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715513028; x=1716117828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=762PUa8PRNB8OoXQopVe3c5CIMW93h5JHNgeBtDArnQ=;
        b=d7+auKf3d0d5stPMecO7E+0Jbdr//PKhfVV40aVReiCz7ac1lUJgHN4oc38+8jNUCJ
         J2lLkNv3TrAuKA5vblFv8osNGkZCUCUabmp4ZT5yZElytK5utg87eonNeznND+FcNwIL
         Vd6/n9FeAeJNGPbbazrCGKKKyhp+74ufbz3tyHuiyvTgiB2GcgG2iv97MXqoZWCmnX/j
         bwFd14Iyij9ESzKtlFPeJbJj+oEWMdZdYXL1t0Bz9G45O+fbe2pVyhuBlXacHbOLtVPG
         iXfkGQxPjUwDYFQ6rC4OgUb8c2g0SVMarkmk/oQTLAjzogGJPBhPRnCGOwNbuFeI1tDj
         mSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715513028; x=1716117828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=762PUa8PRNB8OoXQopVe3c5CIMW93h5JHNgeBtDArnQ=;
        b=G32FdyPqpRScX221W07eKZh5KhCjYISsCJimaTqd7sbbHwV8NQxOz14BsLHPGaxRhk
         IpD79fgTNfjE0hzpRS4zR93caNx+ICMxhhHL7OicrKYGsKanmCExv4bYwguD0dqsPwsn
         3yTVVxhcqbFGwd1431ZCH/qUWOuxRvkPbGm+WXqfOkU3ekzZyT4Toc6s1zNF+FlxUJ92
         fR+U7nruVWroKNdiEyKkAfsXgKZU3wFqiqspq3vfEYAYcbD8YSTgLN1mEScGDvXgoQJT
         A336ZJNI9mDJcmGxi+UTnEgXa6xWwJrkwyEvbyAB2KoM5rIBZRgUZwC11RYggfhNTsK6
         e6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVBo89x/Ks/D0jaq9elz25aHnbEFywmrJO4E1hDXbpzf5uvAuzLjxWWBHbgp+AhgoV5cOzoaZNuv6q7muAfUYXX865I/ddU49tOoWXdiGQ=
X-Gm-Message-State: AOJu0YwoGLVcrCjyeEnku7Plo/t6Deh8XaghH7nCjZUAJPYOG+iw9Yh4
	4A6mskW5+AtmvrYOytenwYrDLecKUG/pFgG049k7fxiQ7Bde3za4
X-Google-Smtp-Source: AGHT+IHXOa8HBzXfqO0gf47uhRKRFePOsxcpAe4wv3DodlCgZnPecrecj4pGNeEMWBBGvdeMNeqQVg==
X-Received: by 2002:a05:6870:f61f:b0:22d:fa53:5695 with SMTP id 586e51a60fabf-24172bcb9fcmr9355760fac.25.1715513028328;
        Sun, 12 May 2024 04:23:48 -0700 (PDT)
Received: from ubuntu.. ([49.37.171.111])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6340b767b36sm6029167a12.32.2024.05.12.04.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 04:23:47 -0700 (PDT)
From: Aswin Unnikrishnan <aswinunni01@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Aswin Unnikrishnan <aswinunni01@gmail.com>
Subject: [PATCH v2 1/2] rust: add example for `alias` argument in `module` macro documentation
Date: Sun, 12 May 2024 11:23:20 +0000
Message-ID: <20240512112324.8514-1-aswinunni01@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add example for `alias` argument supported by `module` macro.
`alias` accepts an array of alternate names for the module as string.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Aswin Unnikrishnan <aswinunni01@gmail.com>
---

Changes in v2:
- Add Reviewed-by tag
- Link to v1: https://lore.kernel.org/rust-for-linux/20240419215015.157258-2-aswinunni01@gmail.com/

 rust/macros/lib.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 520eae5fd792..aa89b41fa10e 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -35,6 +35,7 @@
 ///     author: "Rust for Linux Contributors",
 ///     description: "My very own kernel module!",
 ///     license: "GPL",
+///     alias: ["alternate_module_name"],
 /// }
 ///
 /// struct MyModule;
-- 
2.43.0

