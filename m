Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463E93537C7
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 09:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430826; cv=none; b=PicxFVRbqr3ghN4Jy0sSvDGDXua4AWC1td1vWmJCJrwKeJGfsdaV/neTQnw6IVtJHZ0UoyHKQg53YooVdBmy6gt16QGnxeCU5CVpl/AT1IHEewn1x9M6FJCsf8UUjd0ajE4qSZ78v970y1xejI58jH5Hp7nSrTFQI3aeVsLXjfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430826; c=relaxed/simple;
	bh=Fu/5goeQAlX0Rywce7jRoMiFizTyCdbptvGBNlGiVs8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LHQmChbQtsH+dyLRR5kimzvI9jiJEaKFXX2x8fblpLCFShuu8bEHsfiPuvr5S0rTRRqEJ25klY/qDkFcMzGHnPylnoPjPybgLcooyvAjRKoWT9qmcdbtrFwT7dvc1eHhxS03qjvY9OCzGkiyZEvDBdnBR7uJoVeiAHwGj820yTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KbsuoCZe; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KbsuoCZe"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43b8e984ae7so243893f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 02:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774430823; x=1775035623; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WxamIYl6Fx84D1zRHjnQcy6k7mwM70brzcnjnbZYJaE=;
        b=KbsuoCZet/ONgF/P2X2FZE5T2IYybRpnVP85XFz3efvjbxvZqcY+x8qyNtols2w8Hy
         tuZIkn3tkeSTgLs5a1IWuEDUGFnpjc2kOHAKyjLuPwDnjFSKloWKOUAUrK/f7rlNaGlX
         ciVfNIcSJ0lPYx+UA8q9ojcOAwYjl+M/J36Da22Ky7KEq+V18llXvZql/I0DuBjoG1wT
         irsQqjqCV2dl2S1jDnDEN3uCcus7R8jeuy53758ENuNjiFs2GiVe21M9hmjvlHfaad9z
         5JbD84nbEOV3XI3wYZuHu/WCSS/OcN9XFrnjh4XM2fHvy1Ils3LjzZAJmGd16di+m6sQ
         y96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430823; x=1775035623;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WxamIYl6Fx84D1zRHjnQcy6k7mwM70brzcnjnbZYJaE=;
        b=TEoUQ8zA4EAppB3qIPsp9kvKHcbWbWr86JMgK1qWUdLtI+4FIaawMJze+CYyVFkOfk
         V6EK56VUsUluGTifeFWC9162TNoiklFyz8KNYDj1N5VGYI1fOdzzXrFIUGofv6xNQ9DC
         XRGTn0NPN9xS+iRDdBY1a7ffG1eiJAOvuzd0w5iyYyERLz1deKGSDZQbW4KBLkYUTF40
         Kz+gXVTnY4XDqVUk/EyLWjNDIX9vt5gQ28+vOjOf+/+SmpZjMR09PYLnMf5oQkWwBYmo
         ElT6bBu4EuE9/Q3hKklg3Q49UdHKArYa4qe7g4Y0TJ/dRDwK8trJaYvHRmWXvnByrdYH
         Kbfw==
X-Forwarded-Encrypted: i=1; AJvYcCWT/Tc2Pzt7oFYF8uFUPKYS0s2OP3hRLgYVoSd3KtaVed0XvrgnBHq08dtJXxgPeeg+o+gLdjG0Ci+Uw50HWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJ9Zr3HqUNIiptFJwQKL0DX41CTMu9SVug05wXMB5LEoHNxaR
	3STnDeVorQhK3OKxki0vUYAckUOPdT/QZtyrQvZcOTqFbYIN+RH5IvkLTo4K+Y/c2nijtM6NsfG
	+rBqqtdVHAnt7NBNqkA==
X-Received: from wrpa8.prod.google.com ([2002:adf:eec8:0:b0:439:b6fb:87f2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2385:b0:43b:4077:c187 with SMTP id ffacd0b85a97d-43b88a0ceabmr3905457f8f.38.1774430823350;
 Wed, 25 Mar 2026 02:27:03 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:26:51 +0000
In-Reply-To: <20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Fu/5goeQAlX0Rywce7jRoMiFizTyCdbptvGBNlGiVs8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpw6pifKy3+0N92ZxfYaGY7X+UUaF6DTgviEot0
 zXdyl+X7rqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacOqYgAKCRAEWL7uWMY5
 RhYND/9KMVMqSAj9QmLNdq889Ve/XZKdNm90UFVyoteP2R9T9nLzq5/09V3TXAwvSNuitRa9uuN
 NYRTfVJfDfm1SuEOstSHuYRzQj/l0KDFW7aJ0+ovXn5Bbigu8HIZHO4L9Q1a5s4reCvxBfNVtEI
 JBliR4yIqVLKj1SqJ3TEwfMHgF5uB6und1CKeFU9i2osXpbZhoW4012bRJaOxMvgfn0x8bmwpS4
 xaIQsTGPpbM6V8J841WNd+eHN/7rmDr9+YFdNlM5uKkZL0OvJyK2Qomf3/Ub9WGjQ8jcEn79GGf
 HGiR4cFwyt12TP6THmSHI+jfOPqiOwDRQ1SceMpMxgTaAUawqvJAq+GIqIL2Ns1X3Ir9G+r9vmd
 pxxK521pdyhp9fttiFdTDdMUljmg+Xm+Zir4w4o9JQ0ipygP5hJyxaol0mR+A85w/Y+kvfljpNQ
 vWnXZOZvrr6tGzi32ORl4R6n3W8PLS0I6NKW35YJUHSt65MJ5PdDo6XEYMmiYbMF0BJfajAy5MG
 tuZiyoRkFCYdJ7bSOuPo+afJg4W29oqIVIWk7uFaaU0GnNP1uZAihxtdnfV8tTELCJN4wESbXcw
 ks3cfQnwyjW+V3E1/nf4Ocj7ppCiltRixnirbtokHbCeRSX1iynvckR00Mgh7O7fJHjPlr7qQkh kKZsiYPbm2se06w==
X-Mailer: b4 0.14.3
Message-ID: <20260325-kasan-rust-sw-tags-v1-1-7d3a765a72aa@google.com>
Subject: [PATCH 1/2] rust: kasan: do not pass -Zsanitizer-recover
From: Alice Ryhl <aliceryhl@google.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

We do not pass -fsanitize-recover to clang, so for consistency we should
not pass -Zsanitizer-recover to rustc. Thus, remove these flags.

Fixes: e3117404b411 ("kbuild: rust: Enable KASAN support")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 scripts/Makefile.kasan | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 0ba2aac3b8dc..9a9033096c88 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -49,7 +49,6 @@ CFLAGS_KASAN := $(call cc-option, -fsanitize=kernel-address \
 # The minimum supported `rustc` version has a minimum supported LLVM
 # version late enough that we can assume support for -asan-mapping-offset.
 RUSTFLAGS_KASAN := -Zsanitizer=kernel-address \
-		   -Zsanitizer-recover=kernel-address \
 		   -Cllvm-args=-asan-mapping-offset=$(KASAN_SHADOW_OFFSET)
 
 # Now, add other parameters enabled similarly in GCC, Clang, and rustc.
@@ -73,8 +72,7 @@ CFLAGS_KASAN := -fsanitize=kernel-hwaddress
 
 # This sets flags that will enable SW_TAGS KASAN once enabled in Rust. These
 # will not work today, and is guarded against in dependencies for CONFIG_RUST.
-RUSTFLAGS_KASAN := -Zsanitizer=kernel-hwaddress \
-		   -Zsanitizer-recover=kernel-hwaddress
+RUSTFLAGS_KASAN := -Zsanitizer=kernel-hwaddress
 
 ifdef CONFIG_KASAN_INLINE
 	kasan_params += hwasan-mapping-offset=$(KASAN_SHADOW_OFFSET)

-- 
2.53.0.1018.g2bb0e51243-goog

