Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF8D550DB2
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 15:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966851; cv=none; b=JEK3V6uelLZWowU56AN+nApameNm12ZgZqD2syIyis4uagzUH/LKI2erfl6tiNlP//WPdFkqYV6l9yqzOOw6IpmXTaXBkfbfdI9SyuVWkYRWcEHTUkw1Mk95NgXlF/raGmcDaDC7GUeiFqydobyEGYw3KBKwZbQ2mk8kL5kGyQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966851; c=relaxed/simple;
	bh=qF8PC9Ug90yk/PrOmZBC0YqOzOPUdR+ADtjc56MP5mA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n39UIAZ2pFy3Zrv9K6OlYAdpaDELwM5C2095rxZYS3kHa0KgXJr7OqjeHSfVhxAoy+/X3n1AR9D1smVDi+3jscONhyligQLPNvKvi8jeWtnhfkvxz4fZCRBdBz6KpJahSqYdY5lxn1ToDTnOYII17FgLmuFI+b1HQk8nN5zsJa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W6PJ3AA7; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W6PJ3AA7"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso17105666b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 08:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788966847; x=1789571647; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JHU6Yr48iRYl83IyQpODgW1j4SilTECHHS/aRaqSbs=;
        b=W6PJ3AA7H7h85xPYs3bV39W0ZG0rbao+NuQY4i0PJZ6/E1BoZFyvfE4u+kOv6LW2xF
         M8p4drZLjFBXdLbgGp5fcPrW/FEEa9mcxZMw0ASOKqgX8bpJ1ghgQ/LCiO+pgUSHyP+c
         apSaz12N+WkhSlrv/a1ySRQ+H82of5NmnXcWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966847; x=1789571647;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9JHU6Yr48iRYl83IyQpODgW1j4SilTECHHS/aRaqSbs=;
        b=MP2x0QB6av4Gzm0i8h4Xk1XDcWn5SNc69kxAGJlkuADILv3DiV6vyhZFeHa2YOB1YW
         zYIfl6Xs0Vbn1k6+NfeOf36DxN7T7hkD+YUvfg3WRpwIh0HC6SR58qzzL1Q9TrE4mUqs
         tc1x1duXr07Ucidb+3PKyZscgp21etKNc59vBgMUdpvGh51Tp7RnMegjGdxoyre0dZMW
         A5zYfhRSEK1IKkwBEU8Q+arBCBDzAmYNMzRncy3162sZ6YxtqhEBjvKdhCzS3dlHB5WX
         1yq8Bfc54BI2rn6J6NP3y7LCgjcPPf3sTlguAvd3ouWWf9Uz7Yyq/jvr8SgliPXwjrz+
         ZqQA==
X-Forwarded-Encrypted: i=1; AKwUvBzXgf6vn9h7OeozcypHHRsqEec9xKdKSB83KMQfq0whgciDYQY8FOSt8tzokdYduje5Yghx+r3HDmPNjvOhXA==@vger.kernel.org
X-Gm-Message-State: AFuF++kxlI2fkC/o4extGJZ7YBfTfGW1AlP/keSptxMiGnPBMCaUzlBz
	QxBluDsBHGXqqS6W3SLzElGCn6E4HKbD7u7qOPs21eJId21WU9coWL5njSQtQy8CoYwtxFDRuqt
	nusk7HqeDdDKI
X-Gm-Gg: AYBFou2koiofFkRzrOFQJdjnUY9rEFem0fhgAAjpKzV/vkkKqdQF25Lr+enlrLgJ8/0
	tHQZRoBxxRLc7Tn3acvYZle55RWq3SgZMI9Ba4vpSnXyE7bEy7aRo2gPJzjXEAobgAzUNFBxYpD
	yFaJss7LAEE15LLPk6dl1RrZrpTY4PcRvnZoO4tOE3JNE/fNOlykC3yRKbkpc7kpvwbRTX3SL3x
	x/1FCirCID/fv9HDCvLKuo6fI3yKjK/6hlaOuuwD/9KhQx3iwaK6gYZ2vUPLSd6VSJ+ekJQhC1U
	wpHN7N9AU+/JlNM4fLwzuk2ioYymgjtG5Ntmlzhg2rpANqIyrc2AGK17UvGMAA+2XQWnQgBEnL5
	nuuqSVGlS7P0udbGiy6YcCQNVHxnNxJ5QEeTEiMn+/MUcsgT2dyGxUg/0e1h6ADUbspKhzPBVPZ
	OTM/APqFR/VXufnFiqJ/SKVzcaAk9msXRcBbGSToEvKHej1Z7k4F75UF+dmJAH4a6RHs4rrpQE4
	unFErFbvOYUEEqApfR7f43pb3+UfQ==
X-Received: by 2002:a17:907:608e:b0:c21:34a3:4df9 with SMTP id a640c23a62f3a-c2941868b06mr72402066b.3.1788966480770;
        Wed, 09 Sep 2026 08:08:00 -0700 (PDT)
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com. [2a00:1450:4864:33::10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a98efsm804684266b.14.2026.09.09.08.08.00
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:08:00 -0700 (PDT)
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso518747a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 08:08:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy0CFoxWvuBUFa4iRUGCarboTpAueSkzDVa98swubg5c1uvKn9aKkTEbgchNGnzko3Y/QKx5QAxdJn8AD9UUg==@vger.kernel.org
X-Received: by 2002:a17:907:728f:b0:c25:8e4f:6d84 with SMTP id
 a640c23a62f3a-c2941868b12mr66185066b.2.1788966011712; Wed, 09 Sep 2026
 08:00:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-15-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-15-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 07:59:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgAWpVHmR74jC7sbSJGQEHyaaN0awNfSz_SjPv3VGSYYA@mail.gmail.com>
X-Gm-Features: AcwNN1XmVo334b1UP-lcj3CPx7zvteJ2HddEJqKkfbem-zQh2qUu9HycJHabLtk
Message-ID: <CAHk-=wgAWpVHmR74jC7sbSJGQEHyaaN0awNfSz_SjPv3VGSYYA@mail.gmail.com>
Subject: Re: [PATCH 15/23] modpost: emit module descriptors as assembly
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 13:58, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> modpost generates a descriptor for every module in the form of a
> <module>.mod.c file with .modinfo strings, the __this_module descriptor,
> exported symbol tables and (with CONFIG_MODVERSIONS set), the CRC of
> imported symbols.
>
> These files are compiled like any other kernel C file with all of the
> -include preamble, as well as including linux/module.h, header dependencies
> generated by fixdep of a few hundred headers, an objtool run and if LTO is
> being performed, a link is performed to generate native code.

This kind of triggers the same reaction as the kallsyms code: I think
not including <linux/module.h> is probably the biggest win in this
all, and precomputing the offsets of the (few) structures that modpost
uses then makes the whole end result fairly trivial in raw asm.

Fine.

BUT.

You end up with things like this instead:

> diff --git a/scripts/mod/module-offsets.c b/scripts/mod/module-offsets.c

where it generates a header file for those asm scripts so that the asm
generation can do things like

        buf_printf(buf, "\t.size __this_module, %d\n",
MOD_SIZEOF_struct_module);

etc.

But I - again - get the feeling that this is all going through AS as a
silly way to generate an object file, and that there really isn't any
obvious advantage to that side quest.

Becuase no human ever wants to see that asm file, and it's no more
legible than generating the object file directly would have been.

So I get the feeling that it would again be more natural to just
generate the object file directly when all those files really end up
being are a few symbol definitions and a couple of fixed structures
(is there anything but the magic "__this_module" thing and the modinfo
unique ID thing?)

And again - I feel like nobody sane would want to write that code. I
certainly don't. But if this was at least partly automated anyway,
going that extra step might not be all that horrific.

I'll also be honest: part of why I do these suggestions is that I do
think it would be faster to skip the intermediate assembler step, but
a big part of it is that I don't love the random turds our build
creates. Getting rid of the *.mod.c files would be a cleanup of our
strange build.

             Linus
