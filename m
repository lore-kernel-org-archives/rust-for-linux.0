Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14781DD3B9
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 21:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724103354; cv=none; b=c2+BSp2WggC310Z7+eubDUvfLkxEED1qtMVmsO5CUm+2UjGnCGluqnq+sst1vDDq+IwWUgVrGt0IjFoZPWD9XecweT8mhklTDvUVEGpNpK7Odp//rGlltRFBekHCxv2xTERT9PUMplpf6btTdWd8mUkIvHnfLASKzWXB0kMur/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724103354; c=relaxed/simple;
	bh=9oNV1w3wGfKsfCywfmT2diaojSN6oTskGZWRM52458g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=URC5bkYZewalKXw2qvkHdZX2SsfVzygB+QSDm0b1d5noUUWxbRlBc0+ipWI1CVsnsWhk2QfcqIyRwd6Ftk1vg+EyBCKN54ctWF8taNsbovLVOVs8Frzd0ecXctjnqkm+h5057qM2SFNn/lG0pwUHrOmzwjl75TBNeGx56dZTxjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QesAqVf4; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QesAqVf4"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6b41e02c255so51679407b3.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 14:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724103352; x=1724708152; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nhd4bVGt7t2cMFreV83ln0lve5lvedn9wm7Lt/YZotw=;
        b=QesAqVf4DzOmi6sDnze81CUeqZpsWJzTJggmyrjM3ER2mdyaVKbTeVL6T0ztzI4eix
         cUPuZdT4sf4brEqVkTHYYbDNDIDBiPu9R3Btmz1uEfJN/Ax/BUljcq9nZvXq04vFwlgt
         y+bEh0PNLaGKd3mX9AyyZX9rUfPpV4tOMYhj/V6mpatR4RBEwEsh2mWDVjEmAl8jkAiG
         CJLrZdcVlqJgH+KPMr3v0piHPQL/gPQhIEmFg1/gY+Vszt3RGSylmyBMrWQkX1Bhurzu
         mlUQmQ3Wjen6EP7Z7MglJ3Dkqegn6wtmt/cgv+iXeY5XhrDiT/wEwcOE7VHHJ9dLVKGk
         GaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724103352; x=1724708152;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nhd4bVGt7t2cMFreV83ln0lve5lvedn9wm7Lt/YZotw=;
        b=XzrvwPDpmXZWtntL99dJvTt7p2CwCf2IRzHNp6NUf1Hduq7cNoNAg6u4l+2gWbpHYI
         Ahl/uwkdaCo5hQ/T9ADA7f04y4qQ5y9p1oOZwmHwkvSluJptZa/1xnu56FShbx3o9L1A
         PhAb8yqnRF3H6sbyRCu6xNMSWgZTkiB0m0nNP1ETG529eQTKJyfH4BfnTtqOgFP5o+m3
         lQ8vQ10cXIE24Ll8WR+k9GM+56CMK/GeGt5uBBL6GKPu/PENg5YPRAwT6E9SmOfTkEy0
         hoOEOcC1rN3W+YFpaOT3lH9qP+DXYDJg8z/3q5ZjG8IBLptK6jqzwvSRgWD0OGt0hfIQ
         5jgg==
X-Forwarded-Encrypted: i=1; AJvYcCW/ouBH8HxQNBnA4ja2YNbDbmZ8Rbm0bEg7f4dlC6JX7NoHYOxDkAq2qHYWyt3ZxYYmbbctHWH0cu0iRWVOqVFF7EjNUI+BTFHysVT5gk0=
X-Gm-Message-State: AOJu0YzVGFLeAMMVdqgxLigX5i7g5vpTJV/OaM7GCvIT5MvoV/IB9Jsq
	4s4AdrJ/bV0cHvPLpJFxz9iZn0wOZZqvUg+m6KOqjUY6xTO7HDMZxUxrsej2PA0F++209SUcvL7
	igbxyWQ==
X-Google-Smtp-Source: AGHT+IGrdGkpFhjR6FPlXdtXR3sEdRIorE/hVIxLA4gK2OzmA6/Q93EsKJfCVwpE5jbhlit9Iqplyhs7pn+a
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:6892:0:b0:e0b:a2a7:df77 with SMTP id
 3f1490d57ef6-e1180e64015mr158092276.2.1724103351771; Mon, 19 Aug 2024
 14:35:51 -0700 (PDT)
Date: Mon, 19 Aug 2024 21:35:21 +0000
In-Reply-To: <20240819213534.4080408-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240819213534.4080408-4-mmaurer@google.com>
Subject: [PATCH v3 3/4] rust: kasan: Rust does not support KHWASAN
From: Matthew Maurer <mmaurer@google.com>
To: dvyukov@google.com, ojeda@kernel.org, andreyknvl@gmail.com, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Petr Mladek <pmladek@suse.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Yoann Congal <yoann.congal@smile.fr>, 
	Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alice Ryhl <aliceryhl@google.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: samitolvanen@google.com, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	glider@google.com, ryabinin.a.a@gmail.com, 
	Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Rust does not yet have support for software tags. Prevent RUST from
being selected if KASAN_SW_TAGS is enabled.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 init/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/init/Kconfig b/init/Kconfig
index 72404c1f2157..a8c3a289895e 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1907,6 +1907,7 @@ config RUST
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
+	depends on !KASAN_SW_TAGS
 	help
 	  Enables Rust support in the kernel.
 
-- 
2.46.0.184.g6999bdac58-goog

