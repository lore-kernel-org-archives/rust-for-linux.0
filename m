Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2622C11E6
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 22:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789425533; cv=none; b=CciBmqhaXTT5fmH6baFq1EstcrSoOCOAxgqLsZ5kl3ZhEHpGWjKRgO77QxAjkxmTG9/XddXOW1yl69cb78inhoB/LhKmaViQ1F6crENd0WDraob6ivd+562nVuGmb6Q/k+rqkDEymzxOuFcsC/oKLYcdMTJ6/y6ot9zUtngBrRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789425533; c=relaxed/simple;
	bh=3pbB/cdA2n+mw9ojxn7xAJ0JjyYJsv3yomOKFEBUOog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELicGioq53dYEktciJ0P9RiJk/7HdZ1GGjvxNZk/ggMAIGmGmBYQL4QANmOwCXFWaPEKAneOl3RLmP2DIpv4qK+LT/2Lj9nVcmUrcLAJYdMS141tY+WBAvjvfYb2+PE1muRmQ7G6NKag1qCD/L1vPUpa78Eoro4XIzeYr3s6gTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=guGvSHrW; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="guGvSHrW"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso453516466b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 15:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789425530; x=1790030330; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=doHeCbdvroV7mGBSmqv1XRXXxfYTXe+sNzLZzLwqdyM=;
        b=guGvSHrWkAoZNkW42TYRcgrnhKGvmBMiX3KaxBGFz53XSm/tjUw/3ye3YGqmvFnhhX
         O+kiOvYrpAMGEOFsb9FBAsbXuUddSMANna93ZYwGmmn/VqF8pfhTR83ZiGkIIIu2NZx2
         +7Y/+qfThLUKKGv/MAKgiiY8ps1ZI23kXG4f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789425530; x=1790030330;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=doHeCbdvroV7mGBSmqv1XRXXxfYTXe+sNzLZzLwqdyM=;
        b=0P2vWjBSGoSDUHlNr1KtlIb+eQN/WnIzPKDCTmu5btE7Hi3QEWvMfXBY45UR8tIqs3
         L3n+f4u/rtFNqAM9SpXF3cQTJfn2opOc5B6CFi6qrMo2dajPV4pkdVA6c4uukePM5UMK
         Ogq+paWmWva29xIHFYAXs/oooe/5G7HphoaVAaWTCrZsxLXxwkaCRh7FOwG4eqHnuVLD
         1NQ0V23C9ZTYKRQN8C68y8ldtrTmU8cu6oU9caQlg5XAGUTTbWTSRn91pVqEx2xwHMpb
         hfZcfJr9BmWFPCWPmzo6ZluBiosikHRcUuELf7l+FVR/HTXCRDyu0uvLe1McVu6ncwk4
         tGcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCcboxzMh1nZUIVm8r6CZiYwmsvojorIBARp8NuzO9j5BSP6eiYA2stqjYnOoDi1uZcUV6d1TBwS7a8BjWZw==@vger.kernel.org
X-Gm-Message-State: AFuF++nTqxyRcoVN4qIc/nNSr6+9nrTn9T4g7PV07530km9IuXXZb6GJ
	LFp6vvxa/Ns0tDpsmLlYCbsYSHSW/nGP1/1VIczI/0MgRVYfnoLyZmS6i9E315n6AERcwXNS+kQ
	gAac3pV+1zw==
X-Gm-Gg: AYBFou1szOSF6g48hKoKyd6imWG8MIA3PbYAOPqg60zP0/7o8+JSOL6OXqiXTgJ7DMN
	85yCca1GZpz6/KyBIzcWth2nL3gXHUpwlaVE659bEP5+7ZCJJB2mnih2waLw3HNzWw6UP044/Va
	pMLcG9nMzoXvFrKZCbbvrimbMFxjbhmXcg4vl/dWgzv3jxQGLYFztgTQKwku8/w4Bhs9hw0jIuk
	aGubkLInjP81wWiYrxsM2ZxRGUSmYIwgSkupmTjoNs8kFQxaqStCd17u1wTWKw1Wubnrm7UK79O
	x+k1YgjLLe/Gi1FiU5yj0+2PfjLuF/VHQ9hkPW8ffAxkI6WEOHoHnLTU6BmKsymAm7PihAQEeet
	/UQSj6pFbmaaRDmLI/KcSoElp8VNpZc3/8wwMfdb5cVmKPalDTnVVCgdVdU1PbbkWbs+hHDF1pj
	4tbPGZVpvc4HMjEMoJ8QEwthRRFTbacir7Ob4O0LDH7pqUMQOmDB5JWlkJ8pZLj1uFH/8LSsBdl
	NjD6xHKhg9RAQBToUA4vbMxTdNlPhB6Rc++/qXoCrQFgbLZ5Q==
X-Received: by 2002:a17:907:18c4:b0:c26:1648:a06e with SMTP id a640c23a62f3a-c29b87725e0mr273154366b.41.1789425529663;
        Mon, 14 Sep 2026 15:38:49 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ead51sm489765366b.49.2026.09.14.15.38.49
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 15:38:49 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so620256766b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 15:38:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxybt0B4tm7RG5INBSLH12UHj339+x9aOkWkD2x9ae6TBYT8CPihb4Ioh3a19dAu4m5Mj1ujbwtWruF0EoN8A==@vger.kernel.org
X-Received: by 2002:a17:907:97c9:b0:c29:4415:2ebb with SMTP id
 a640c23a62f3a-c29b860109bmr315536666b.8.1789425035842; Mon, 14 Sep 2026
 15:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-15-39817ec5db23@kernel.org> <aqhLhVMkNzf_4oJw@jpoimboe>
 <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com> <aqhmhmgrnN3Mw8yG@jpoimboe>
In-Reply-To: <aqhmhmgrnN3Mw8yG@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 15:30:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj3BKkCYtmfs5sORF_+Oumv2Gc8D+YxkMp9W2-mvLS=Ug@mail.gmail.com>
X-Gm-Features: AcwNN1UnWAKTndckmaJ94decAtfrWRGA6P58dk0oXtHcS9ajgGc6O7ZKSXjYJOY
Message-ID: <CAHk-=wj3BKkCYtmfs5sORF_+Oumv2Gc8D+YxkMp9W2-mvLS=Ug@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] objtool: cache relocations, do less work
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 15:23, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> There might be more efficient ways to structure the considerable amount
> of data, like replacing "struct instruction" with "struct basic_block"
> or so, but it's hard to know whether that would be a net positive.

Yeah, I was thinking that you'd only hash instructions as you find
them if they are obvious "I need this instruction", and then try to
hash them *again* if they are branch targets (and just have a "already
hashed" flag).

That way random number instructions would not be on the hash - unless
they become branch targets.

And you wouldn't ever really have to track any complicated decisions
(like that whole "basic block" thing - I agree that it's painful,
because the shape of a basic block will change over time as you find
branch targets).

But not a big deal. More an idle thought brought on by that other
patch that changed the hash table size, and this discussion that was
talking about the hashing - or not hashing - of sections.

So more of a "if it is easy and straightforward" kind of thing.

             Linus
