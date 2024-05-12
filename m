Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED0D1A2C25
	for <rust-for-linux@vger.kernel.org>; Sun, 12 May 2024 11:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715513034; cv=none; b=RpQxZlr6WuhhcA4gMBvMdp7YyaIICqhFtc+EBO1dH7/ZbZI1iDflX2INdgFU3fODOqDcfY0+W3NzJASuKPjSjSjGVg7puYR28fgfBy1f231PijujG2sXU3eDFr3hGJ1Qmxdeg+8kjK+7VvrkQOYahFlHOYpjs9GeMEsddTZr1bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715513034; c=relaxed/simple;
	bh=eyJa+yGYTCAQFYw58420uWI/CPI3+K4qSk8eEs+LdlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kq5Ucbw4F85HUV1h4tZSvBXYzvgsYWIQU4WDtkeHjRG7qoCY9yHqGQRzUcptx46Wct53Lr2GjDjTwy6Zg2eeIGcW2uCKP8L5NH37EpguDzM73SHAKxqknvru1JJ2ArQX5Cc/Ly0kxbZpHvsDXMrk9NNC8/YaMIoLWxM3r6Xhp/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmvC91SD; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmvC91SD"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-36c82ca80adso16600385ab.3
        for <rust-for-linux@vger.kernel.org>; Sun, 12 May 2024 04:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715513032; x=1716117832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYTw5okqMUFiuNJHWD5ZtkN06OkuWq+OuMTJDTy5n00=;
        b=TmvC91SD12BMy8BAifQGO6pydriEHJaZaK038FkqSqIv6y4gMf/+riBXj0oOhnlAwd
         zhCu+t02WwVBdYeCPbNSNE6JrqsJOO5QxRNlwG2VrhwR2zRjBgU7WNqcwRW20v57j3Nc
         +nG6p+FdCF+/TptdIOI71QzQ5kihCsajMaHHfPM6BtUCqBAt8MwGKHe9Stjr+DzN3Dwu
         oJPTqWNtKj3WJ6dLRmxZ6eLaS85XXiLkUoJND0MS9nUIPAFLyz+hDWE14Meho2mewJ3g
         mgHe6yFjpqbEfbZGq2HqgXOVqBRGDuQ/diWbQvwNkFKp/fUDZjk0SNt4NUK7mS6Y+r3r
         AX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715513032; x=1716117832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYTw5okqMUFiuNJHWD5ZtkN06OkuWq+OuMTJDTy5n00=;
        b=fi5uobS4dO/Yj5ipkFaILx11a1TkurUpW7FHyS8OrN7XVAFlrtxaa6164njBm5dTcc
         t1+hnBvWO+K5C7zTbWXjbAUoSYh6HpxybAgfxhzZB6aMyagXVU5nBZs5XQqQNp14pAIb
         F2xpI8wRDDyX3vZwCvDypf3NzJl5QXf0cJHK4eiHZqCy6b3LuRcm2c38wq4MkZfuJQZF
         mD3RhyOzN7DLtDsTwfKoIJEI5nQK3PdnbvANkl4ohPCFAvBECWbIZ35uAWMcopFlDg6u
         ehI8wirAu05y89IPZWpoy+HIb4FuI7eTCkYJU0IhI+YinNcOrdvWPu8pA3WJPXyRyjAR
         SuNw==
X-Forwarded-Encrypted: i=1; AJvYcCWE7IHa+FOR0AkOsYVV0/lfUFizCpMaSIcMntdEklgOHu4Gwd9bbC77QQcDOyzwgyLF54R4yQthmxyGdiJNQGwh3NRKbgaWvJ8liiFSS7o=
X-Gm-Message-State: AOJu0YyzDIBOxh5ey9d+sjUNsSqL6jJCH0gWaubtvpO6zOv1k58Kbdnl
	lUfRMSU2XrIZv3dbvuxXwvyQndtHo9nGajPCZ94mH2+jWK0Xph6m
X-Google-Smtp-Source: AGHT+IFbOgEFx8mk8ALCqHCAWolSxvO2SI6NIFHBDh1fUUUI9BAJ+IYYPJHxlRgSNwcu1iom5RVPcg==
X-Received: by 2002:a92:c26b:0:b0:36c:5486:83f8 with SMTP id e9e14a558f8ab-36cc14df709mr94834935ab.22.1715513032298;
        Sun, 12 May 2024 04:23:52 -0700 (PDT)
Received: from ubuntu.. ([49.37.171.111])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6340b767b36sm6029167a12.32.2024.05.12.04.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 04:23:51 -0700 (PDT)
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
Subject: [PATCH v2 2/2] rust: fix datatype in docs for `module` macro arguments
Date: Sun, 12 May 2024 11:23:21 +0000
Message-ID: <20240512112324.8514-2-aswinunni01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240512112324.8514-1-aswinunni01@gmail.com>
References: <20240512112324.8514-1-aswinunni01@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the mention of byte array as datatype for `module` macro arguments
since the arguments are defined as string, and `alias` is a string array.

Signed-off-by: Aswin Unnikrishnan <aswinunni01@gmail.com>
---

Changes in v2:
- Add expected string literal type in documentation for `module` macro
  arguments since some `module` macro arguments expect ASCII string
  literals.
- Link to v1: https://lore.kernel.org/rust-for-linux/20240419215015.157258-3-aswinunni01@gmail.com/T/#t

 rust/macros/lib.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index aa89b41fa10e..5214e07367c5 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -58,11 +58,11 @@
 ///
 /// # Supported argument types
 ///   - `type`: type which implements the [`Module`] trait (required).
-///   - `name`: byte array of the name of the kernel module (required).
-///   - `author`: byte array of the author of the kernel module.
-///   - `description`: byte array of the description of the kernel module.
-///   - `license`: byte array of the license of the kernel module (required).
-///   - `alias`: byte array of alias name of the kernel module.
+///   - `name`: ASCII string literal of the name of the kernel module (required).
+///   - `author`: string literal of the author of the kernel module.
+///   - `description`: string literal of the description of the kernel module.
+///   - `license`: ASCII string literal of the license of the kernel module (required).
+///   - `alias`: array of ASCII string literals of the alias names of the kernel module.
 #[proc_macro]
 pub fn module(ts: TokenStream) -> TokenStream {
     module::module(ts)
-- 
2.43.0

