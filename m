Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485721;
	b=B4yxAStcV8acw7SBW4koM6mg8iRHh+mK+c+N4fTcJJMUt5/Ja+j4JC+5s14NTblYxXyu
	 55Riqyb66KGl7ZwvZCJXIwdj9AD4oPC8ejTYP2xE5bvMYS6yTxnKABUfJwz71SQf1sy1I
	 pNy/VsYn4XgwV1k0kpFlpqbzgpkiY55QcNSovhT55aUa7T0F01XCsqe0R3fpLWY43M5dG
	 CoSTWnoCTkPFgGhguUQZhoDCEJ6BQQwqydSDM6R/WdE82E+dPgYewyyM2RUtnlZfJUA83
	 qj7Pqno8CXJbc1/k0xEWxpGwsuhPKjyQOX5vLMhhyV9UGb9/7tEvq9RJl1Q0c+tBEfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=792bh/Up9G16rEbI9KHRJopjEWEttOYtK+WiqlBfpvE=;
	b=G4mBD9PmPRJBYYJoefA3ZPkg6NheUMR+TfT06tuY2lAcO7Ho6uYFvfGNr0dgwAu9EMQo
	 j48LgrmREQM6xc1NzCKMEfIAjjCeUrNjNk2YTw9ENhgl9NjB6WSVUqeWrk0Tq8lmv5b68
	 Wgll67NoJ9uu6/R0Fl26BiiUpsgK8L2rDyd/SvBQJin/9I9XlR830VkUQLTwiLdpadd71
	 Stbj7vMDqsyJUPttovw0pmvOE3f45uvjDWTTRvx+uTnbDbps6SX4ZYU9oaKgYZmC+fJg5
	 VCqYWWZZ4gwlNRqveVaGu+dkGZbbsC7/mT6mbv+wpDTxxCfzRGYT60LIWQk5EcK7MdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jdgZmgc+;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20556606A32E
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 12:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20556606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jdgZmgc+
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba078abd70so16027655e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 04:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794485719; x=1795090519; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=792bh/Up9G16rEbI9KHRJopjEWEttOYtK+WiqlBfpvE=;
        b=jdgZmgc+cFIs1nJDNmHtEbdC7Q0MPUykRgvtyJyqbSmOYZeYTnM3mIoRsyR0ReTv8U
         cytSWkTuSlVAE6Cojp8xdcrBe0fuzkXg9JlqSlRdJc4sZQveqm5oiPIOXfxoUf04zT4H
         eTvPAvVyxiHFvj7Xd7GWa3R7T33nA3sqTlobR/eDlve0pNioGwxc6GevCm43/G88DTwK
         M5IjhrE/plEKd29oAJ2wWy9XaJ2T6x2Kg2wjQEmrUCjRCFLk9dFYEtKljAyNmdwUHzyI
         emhIEgEbyqjnb2/Lybaom6LpHj0fq5ENVsBOsWlCcnEwPNxcJ0xEOsBZhWlMvmpLnH4Z
         yqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485719; x=1795090519;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=792bh/Up9G16rEbI9KHRJopjEWEttOYtK+WiqlBfpvE=;
        b=pIMwY6GB4+bRKEZzyWTRaQwBfP35/NyhMYN/omwI2Xi/5KoKKOk1tPgSmnXYLAW28t
         JZu0FTlf0Brwh8HcaUSvjxwEHCnFbhN+5jz1NJR69gMs07wXSDLg5L4f39vWmvPXCydS
         PqErznTD/ge90qI2xzQxyVf2KxYx5yFF5HlZsWDSbhD2xkYps7M8IYhpjskVHDGjVoVU
         8/xJtZMGm7M48+RMHea9X0hgABkpkWEQ7BJe+pf93N6g9Q/E5dDRK0mcVDr+C89GcsRH
         wyE4PuvItvmvWyDVcEEwbHtkGvXFog33xI/sjU+euGyeLxTeYmLnsr64VYfnsc1tO/qd
         i+Uw==
X-Forwarded-Encrypted: i=1; AL+hErHrvMNq1uL46KG99Yxi28Q9gSpxwSYqXjyPYDwvjixmCs8nQbHM2cYzWwMvf7zp1MmZpEKeav1900v1zkd4jg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9c+wC/izZd/njXMPiOK82SxXOOqjD/hypuDq1wGzaFiAPaMYdd
	qgvIlRW56kGv9u+/lKlK/UiJNZap8MAGYFnXieqQ/CLUEFqcg51Fyc1GGTFxO1TcRFhNswsRLBa
	X07POe0nQqBvmsA==
X-Received: from wmbz23.prod.google.com ([2002:a05:600c:c097:b0:4bb:52ec:7054])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e0e:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4ba093ac8f6mr98156255e9.32.1794485719173;
 Thu, 12 Nov 2026 04:15:19 -0800 (PST)
Date: Thu, 12 Nov 2026 12:15:09 +0000
In-Reply-To: <20261112121512.1670347-1-gprocida@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112121512.1670347-1-gprocida@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112121512.1670347-2-gprocida@google.com>
Subject: [PATCH v5 1/4] kbuild: respect skip_gendwarfksyms in cmd_gensymtypes_S
From: Giuliano Procida <gprocida@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, linux-modules@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit 9c3681f9b9fd ("kbuild: Add gendwarfksyms as an alternative to
genksyms") added `skip_gendwarfksyms` handling to `cmd_gensymtypes_c` so
that `rust/exports.o` could skip symbol version generation, as CRCs are
computed directly from the defining Rust and helper object files.

`cmd_gensymtypes_S` is meant to mirror `cmd_gensymtypes_c`, as noted in
the comments above both definitions, but omitted the
`skip_gendwarfksyms` check. Respect `skip_gendwarfksyms` in
`cmd_gensymtypes_S` as well so that `rust/exports.c` can be converted to
assembly without `getasmexports` attempting to compile undeclared Rust
and helper symbols against `<asm/asm-prototypes.h>` when
`CONFIG_MODVERSIONS` is enabled.

Signed-off-by: Giuliano Procida <gprocida@google.com>
---
 scripts/Makefile.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6127feb970c6..873a9ed62a18 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -428,11 +428,11 @@ getasmexports =								\
      $(call getexportsymbols,EXPORT_SYMBOL(\1);) ; }
 
 ifdef CONFIG_GENDWARFKSYMS
-cmd_gensymtypes_S =							\
+cmd_gensymtypes_S = $(if $(skip_gendwarfksyms),,			\
 	$(getasmexports) |						\
 	$(CC) $(c_flags) -c -o $(@:.o=.gendwarfksyms.o) -xc -;		\
 	$(call getexportsymbols,\1) |					\
-	$(gendwarfksyms) $(@:.o=.gendwarfksyms.o)
+	$(gendwarfksyms) $(@:.o=.gendwarfksyms.o))
 else
 cmd_gensymtypes_S =							\
 	$(getasmexports) |						\
-- 
2.56.0.567.gdb80ae8cd5-goog

