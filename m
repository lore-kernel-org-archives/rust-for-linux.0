Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B27435B65D
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 16:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401695; cv=none; b=bKSPOvtOevVDvj/p3GwLmTkXVbAbUf70mFZsyomYeHffL10X4AoqgmKEyZTnjAjVyqs42gOCiFRiXQpFbcrPf1kvQ/QDHU0yS4Hh2yN6aJHQELLXD2rLQ1/p8dviYv5l2qgBv2dEVRKqn4tES598JTdohBZFRoRw7jGNKhd+0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401695; c=relaxed/simple;
	bh=xMRNGFwT5MG/tN2Z4rVlgZAaGoxD3wGYA7E+SDFQua8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1BHSR1X2lC5oiyiuyCcZy5fNAvRnQKvuJkjswXRl1LIKbDY2RL6LT/R4Y0wYPDa4J5SggzjrLDtpmKOWUTY7dzkqvjhNpdWJYHheDdcZQZ837f2+LWA9iFw5WBDeClRa5oU2I3oEBAC5ikf1RuQtBssGKbzkg8IIWPQEVueMAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bn40L2Ph; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bn40L2Ph"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so409507566b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789401692; x=1790006492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lW3GLwaZtw2SQDM2dpduYrEemaWK0EaPlBH9/B8yf6k=;
        b=bn40L2PhIdla8rpqbnEzAnLJpriq5PbjPHB13q6hzCmt6e8ug6OoZBi+gjCE/debWV
         xXNJwGkvHJRyghU/am4v0iC9PUy1XdZO9NUrz4T5hWBD/IRxkUAu3T8rHJyoP0PbbOiG
         LD1Qj/WYp8E468b2+uYpcr4LDydj+VCLL7HBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401692; x=1790006492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lW3GLwaZtw2SQDM2dpduYrEemaWK0EaPlBH9/B8yf6k=;
        b=FcBzub8Mfzum1L3IMLqlLc9vWYVRLieLI30nLoWcrto7cENyEAC6D0HHwU6pI8yOZT
         ute33/MPYstRB508SmCW+mjv/rmBNObdbytRe8RD8882QbLxBmr4osuCl4F0xWUNpaKi
         YoF67H+KY9QCf3w3/pVl2n5Uy6X7a2Y/pTcvA8BMCZ5f+UGCNIHP9dehloCNmC9atsTe
         jQrCKLjQOhiPoLiiC/t4WjlsemdoRwgOcZnqAfpiPeLVQBfNqwmKPijmLbjT8+xnecSX
         Ui1NvUlfh4cXAPx2NTEntssti3Zkv/m0hzc2Ga6FzqlmnVKxv11yRqunKy9VSgeZwt+a
         wr7A==
X-Forwarded-Encrypted: i=1; AKwUvByth3O8ZgEVstzLkX3MQkAajKrEXi5gmCsT1KUv72+xgq0ogPem+4BJvT+XPR1typcsbuHE85HJprq+ZqD+Yw==@vger.kernel.org
X-Gm-Message-State: AFuF++l5HJFz1mAC7JO8JZaagRcHewnLxFjA8Q66ZWoqRLEf3a7dL/W6
	Ncg+E8b80S+a5M0CooYVmeg6v4DME0Fo6M1WquyhYftRpRNe8zW4xZNIc61ojUi2C/KIqcdsROo
	8Dlj7DQA=
X-Gm-Gg: AYBFou3Z9xpdjcF/oo96yLELpGJVzPn2TQ3z/AdE1+XW6p+328FRZ1XsaDD/yrwE5pP
	M6oHKacGFL0z0TRUCT43qQVV7mgCJqfoglvZsJagO4vdVq7iaTcur1Wpm1rPKnYJQIGPd617eJV
	j3oSftKpL/Sg9n/gqqnKqbDtznj/BAMSGPw9v67LAQPGrrBjr7iE5eOLf7G5CDzUU4fHDJlr52G
	iUC9lSrPsWxe7e4dPWlOdwuQjJHZJWWlyGaMXcfiQ4uiMqaFNVD3pbznEwqb/zAtNpKNjgcffMC
	Y0rtrHvixdVypJNlJiQ4qcf9Buo8YtgPE+xxQvZ9sgxB4Znf9cc9FaGqcvuTqxVYT2fERetOPg7
	lBzU8qw1cPq286OfdVNjQoM0SXuXjLx6CLRzk2hGprPEpDdTW27pbKpUgILG/wnghb8lGAluqpb
	eSzpyQOpYulLh7TgtI2ix5GIMMVhxuH2k6L4t5GPBZnnWnvtx4XKLe/XtX+VMR0StJxFycsHteK
	O03wlWwdUjpVPacemoA8ROkdEAp8GupA7lvhGHrU4RVrgymyw==
X-Received: by 2002:a17:906:c112:b0:c29:450f:bdbe with SMTP id a640c23a62f3a-c29b8712bbemr384127866b.16.1789401692212;
        Mon, 14 Sep 2026 09:01:32 -0700 (PDT)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com. [74.125.225.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29c6816618sm12191466b.63.2026.09.14.09.01.30
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:01:30 -0700 (PDT)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so14741585e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 09:01:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByEI7H8F3yU79C4l9SsP7RfvzxJfWLl8DeZF2qdaAJzUHdR3rcm6CHD6J7eNjBFrYIF9epvG+9I5YQ/V4QzeA==@vger.kernel.org
X-Received: by 2002:a17:907:3f9f:b0:c29:444c:8f28 with SMTP id
 a640c23a62f3a-c29b84c2597mr415053566b.5.1789401247404; Mon, 14 Sep 2026
 08:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org> <202609140833.88C0E16E50@keescook>
In-Reply-To: <202609140833.88C0E16E50@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 08:53:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
X-Gm-Features: AcwNN1VyLYI7E7T_24gtwZZHDPdmXi1EUi9s9xthPRH35xQepEwWHVnUZ8r6fdo
Message-ID: <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] kbuild: significantly speed up kernel builds
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 08:41, Kees Cook <kees@kernel.org> wrote:
>
> One area I think might solved via an LLM is the 3-pass kallsyms stuff.
> If we could get a deterministic kallsyms build in 1 pass, that would be
> very nice. A lot of people have tried, but it has eluded upstreaming.

Even the three-pass one hasn't apparently always been entirely
deterministic. We've had random reports over the years of it failing
in some circumstances.

Maybe we've fixed it all, or maybe the failures just go imperceptibly
rare. Regardless, it has definitely been fragile.

               Linus
