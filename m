Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BFA56852E
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 14:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964918; cv=none; b=gK5OctlhF9CntAuYdlz/LJoU08YXP8DqMIrDnNz3tfEHpnt0FoXgP634hIwJQwZId0Qk/Luds7UE6Qi7HhXueuZsBl/3ZqBpfsdvvAbHxoqmd9dshKnQrjjFKe1Td4E6e5Yx+mE1v/z1DjQPASMs5M2Whb1yZ9qnpCMgmjKtZW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964918; c=relaxed/simple;
	bh=C8wlVunptoThlz2K9sFX5JRkjNXNpZt+isVUJZEm52E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c4Vgbv8GrTVinM3eg4tQ+iHbb6Atx3BBAwXRpnCa3xbHnt8shfKGHWUKc3gNsLrGL3YsOpkz/gHLbJYJnbHrJA//NcdNCwxMMWxDxu6XQVVymTqus4UsC7ndeHTHuvEONz9Rql7bX8pHXZt0fwv30Fd89NhYQi0H6dURqaXQwdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dT0Nu+Bc; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dT0Nu+Bc"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso5546917e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 07:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788964914; x=1789569714; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG9J5Co/VVYH+Cridb4B9lUnRMf0qj5TUZQIt0oEj84=;
        b=dT0Nu+BccFjJCB9R7GMuD57mmKPClxDwMV+O3mtJXUmbX4effV/s0VdcSDqTA/EZeX
         6XxHqwEGWaXmg9JIf7ESrqDyeNbsHE+EFmI7NP+TnqRD3fkp1QokelH+yyEcNsCEe0ZN
         8XCd2386f71F9Yf4uHOmwwpP7DHrbnWsPdqfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964914; x=1789569714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tG9J5Co/VVYH+Cridb4B9lUnRMf0qj5TUZQIt0oEj84=;
        b=rr+9n8msGdEJmS177JBq7hVK1obCA+dS4nDqbcY7HddoieFf9/TjYSeRjHxT3XhWmz
         d4rSNQcQQyBq6eYxJMC64Z4+k8nIzjE1sUGngHDw9dEp6gSwCrtIgZ/5zCXekY2cjV67
         VdjYlsWEcOK/mn0Ynt5J4QojA3TY6tGxM4p0jw0Maeo59w8YWbwC/RBfc0xd3tydHm1o
         4niCJ3ggR1TdRfeoW1Thm/Uf5SZWehA/DQ9UqmcZOAjZmJD+u2u1R9r3X3rTreUChaL0
         9J9Dc6SuzPpgjuMUxKDEviRG6hMnCuJ5n2xJgNFojngtDTG9MHWCZ89kRAvze7cT6F5d
         RRDg==
X-Forwarded-Encrypted: i=1; AKwUvBxzTP5IaimudJwahTrEpaVYgsJh1GQuJ8szsfbRi9+B/sGT/WEs+8FFeDlMx3XcuURFtGPgGBOozGYOS4YAlw==@vger.kernel.org
X-Gm-Message-State: AFuF++nfTr6t82gtVkqPgvYAiIkradZHhFUKQV7kUXdjuCcDtY/OaQie
	63dJQGy2+Beyp3Wa0slMILnN/SIEJ19mFKa/S1YGoEv1gjx+eaepp0oiPxRNID82S1hK1qi+97R
	/RhxIByk=
X-Gm-Gg: AYBFou2eCVdAOVWh1I3iQ1CSrunhHZqik52oZNQADSloL7uQrh71kFslr2Nbzf/Owb1
	4QQ6Rs/o7uNOIE4YrJw1h32y15iKT7JLA5IK2UJ9Cr4n6Ip2hCZWfUyfEtgBt4yOdjj2Ty0OYQB
	i5Ykxh/RZBLRGB86ZIHFMh4b1UwVT2O2KMFPJy09MWHMMxNbhCiNfk5IVE4xQUOOqnrYc5t6+Wq
	cjT7SdONVnFKbmHvh3Q3cAHWtyxLUWkdq6Ru/Z6PtqYRi1PbtcxZpATsRZRKjp36wU0K4db4K7U
	4dVLdtK/gnNvWordAYK4eHTPZhDSQukhz/qBHp2ORpOjFYmN4tnhFMgtSYqp8+N6GH6YfwKORWa
	sFovJImpG1OtpeGHkYlflTy5mddGf+ai5E2P3EPdvcF/9fticJr8fstyqCAdSMMzd2PS4EV1skk
	uGreFPWCLEcAEVqijUnH8mSOSRLGbiKFqdQNlUSiDlhEJ+KS5n//OlZG27c+6kmqXN4Dtk5khYd
	Z9uHi+Bhj9ntU6OPzCjXnImoOCAamBFLVYTDqDHJBFK49/8
X-Received: by 2002:a05:6512:838b:b0:5b6:172a:d027 with SMTP id 2adb3069b0e04-5b6172ad101mr4053762e87.23.1788964913915;
        Wed, 09 Sep 2026 07:41:53 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6167027dcsm3880335e87.58.2026.09.09.07.41.53
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:41:53 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso5546899e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 07:41:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwXiA5S3fsBpGS7Cd8mTH2gk2T9KHD8yHzFxPMkw6xsPvdEO0cku9BQ47cwdUSEvkgFlKPY0O8rUgICHJuOMw==@vger.kernel.org
X-Received: by 2002:a05:6402:208a:b0:6a7:ee56:615d with SMTP id
 4fb4d7f45d1cf-6a7ee5662fbmr12667373a12.31.1788964533277; Wed, 09 Sep 2026
 07:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 07:35:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgryL8XqjFcO=EQwKdqNn51BANiv16QiqYKCUdXxDQBmg@mail.gmail.com>
X-Gm-Features: AcwNN1VOdEagBQA5D63IF5vfBaLV4II6ehpTsThafIib6q5kHaeURBrIxknkBpc
Message-ID: <CAHk-=wgryL8XqjFcO=EQwKdqNn51BANiv16QiqYKCUdXxDQBmg@mail.gmail.com>
Subject: Re: [PATCH 04/23] kallsyms: output binary data to speed output and
 kallsyms assembly
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

I'm finally going through this series, because I do care about build
speed, so I love the concept.

However, I haven't actually applied it and tried it, I'm just reading
the patches.

And this one triggered something:

On Tue, 8 Sept 2026 at 13:56, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> kallsyms generates an assembly file that consists mostly of .byte entries
> containing compressed names, token strings and name-sorted sequence
> numbers.
>
> For an x86-64 build with 158k symbols that is a 37 MiB .S file which takes
> 0.57s to assemble each of the two to three times it is built over a kernel
> build.

It strikes me that this is clearly a bit faster, but it still seems to
be not really fixing the underlying silliness of that code.

Wouldn't it be much better to actually create an object file directly?
Afaik, the *only* think we ever do with that kallsyms-generated file
is to immediately assemble it into an object file, because the actual
asm file is useless to anybody.

And we already require libelf as part of the build, and we already
kind of do things like that with gendwarfksyms.

Don't get my wrong: I think going through an asm file was very much
the right thing originally: not every architecture used ELF in the
first place, and when scripting things like this the current situation
makes 100% sense.

And no sane human wants to deal with this kind of grotty detail and
spend the effort on writing an ELF file writer.

But when there's a LLM that was used to find these things and help fix
them up, and it's something this mechanical and the result really
isn't ever human-readable and never has been, I feel like the obvious
step would be to just ask the little helper bot to switch the whole
kallsyms to using libelf-devel and writing an object file directly.

I don't think anybody has any deep emotional ties to the current
kallsyms code and that horrific step of the kernel build, do they?

               Linus
