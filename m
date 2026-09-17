Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AFD4ABBD6
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Sep 2026 17:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665707; cv=none; b=nCqIzdH0Q5hPqYG+TSkd+jOOCwuCFwOky7Y060EfqN5ypQPus9kU5M3hofPnF7/HLwaIt20UCPNKosqNMK1cVybHy0m0tugpUkt4DfP5CS0S3LIdL4J5+jGDnU7yyvSB6PDBOC1hE/qJLRKShxA94cAu7LxsIzUatSk626JzE2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665707; c=relaxed/simple;
	bh=biPMv+ofFeAlNkpuoiheHfcM5OSqeT3TWtGH022bAOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZVb4KgbbLUIMNlO/7Xytod94D9kYMHvBPyqCcLMDDm/Qg3uKfn+XKUWNdkI2zeSUriBx/DZESPRgrtxTOn5kZZOgScxvjkVydt24KIkhlsQuIGELUZdEaXgG/pVDqaTnKNBjNhw/G1fpWtDPqvk9ySPD+9+Ko1yV5cVXa7czGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ec5OT6MK; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ec5OT6MK"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5919af2eeso9540751fa.3
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Sep 2026 10:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789665703; x=1790270503; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCKe0geuwZYO+S2TeH6s+a22CWM7gde8UuWVtmH3l0g=;
        b=Ec5OT6MK53AGsNcilUiak2zhu/Qt/JecqxV1A5gRrQ7HWzQrluETJpN30/XKMh7leC
         D4bmqMrnVHRYEwQ/N4Zj+HBDMcEFl5KJ3Rbdn1CYBCOyatbGtIPC72jnxurntKmG+JUi
         2NQQ1OTbSt2fAyLRRiwjdjzYQN+N6exN1UjuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665703; x=1790270503;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iCKe0geuwZYO+S2TeH6s+a22CWM7gde8UuWVtmH3l0g=;
        b=U8+HtWt4aZQkThVXg+NlkC9h8/0AoL57WiaH7qqOoerP4D+lbRASDQU0+2YVZ22UgH
         zv8dVuIArD4S4o0R3y4+JYAa/pzp/k7pEwTaak0QdtvfFKJfWX6ZaFjg2mkndSA9faWK
         6k8y0Uj6LTZw/JI77B0+c8Jr7JFXeNNTigSbdtg6O+dnlbrHC4C0YQlpYgpfID3TyKLk
         aKq/aFbyfsjTDCA8pCyR2o2tz7XupsPHTWNA1cKGMrs+iOEYIM6knR5Csin6HGo/yZtj
         D+H+hyZZIAl5ORfbV4BbqP8gDGsnO/Hl4J0UPyQBnuai/awqLc+zt2+Yb5SjVkUT6fxC
         WkEg==
X-Forwarded-Encrypted: i=1; AKwUvBwlp/PPaxYjo7YJlJUozH/pf3xZSNj9geg7lkbAp/r1OAY0Xqo1gWTVJNwdzO0SW4zfhQEcWM9a96SSfH+s4A==@vger.kernel.org
X-Gm-Message-State: AFuF++l8xPl2eAxhFKG/sywd08NA8iax2nWyZw59tX1zeyCyQKvGMWAX
	wtp24YYtXuOwWVXY4vJ7Nq2jRFXdwoKkn/20HXcjySwVNaUDtBMKA2x5bRBb5Bkg/HPVEyzXP5m
	FQINXnJj0Pg==
X-Gm-Gg: AYBFou0dAptAWLgjo+GKVRwLuyHXSYxKTSjnJO4Z5q+HIb9QWTdKiao3oKavYBzrLkT
	NP4n5ZlJdYddbYbcY1kg505LV8Dz9jhHOQlxwuKQ6hhJOT64xnwaK8kFzCB1GkmE45TK6imcyFF
	jFfzrPVi2rRByrW8euO14emGdOsKrfRrgfbTSFbcdJdmbA+Pid0fYrZbquvTLQOqBg2/TaXE10s
	I6mOzvtJ0V8UNSPIWgYfZs7vYUJG0yMNzsLBV8hofpGGB8Fdtz3PWDxnCcN754/+8OY+SuTlGsG
	YmCtUdhZMW31T5XfkGvLbMUNH+ksGLwMBnnWrgiyrBXgPEHngTMLIhcwM9vEHtdgnRM25ZayKo1
	FVyxGFLBNEimNdfEHGR37Qob8CDdTuyq0gz5URRtTVyk8Hx6hTdYYyKzoS84xI3U8ciimnZMpQM
	Bqx1iUZA0NQ+ba/ThZmYV8SL2moo2BQwNhccc2IoilYVdFuVrM7UEaTfgkKkoPO5ddKowGrrRg/
	dhWaKrBOVhu01wv2hPwxYWaUktlmprA6BcL6NRu76QVyJML/QrkXk6S5Jcr
X-Received: by 2002:a05:651c:43cc:10b0:3a3:7681:6d57 with SMTP id 38308e7fff4ca-3a5dc9f5577mr10579601fa.15.1789665702910;
        Thu, 17 Sep 2026 10:21:42 -0700 (PDT)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com. [74.125.229.204])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5f910894asm806311fa.16.2026.09.17.10.21.42
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:21:42 -0700 (PDT)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b74d0133e0so1024618e87.2
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Sep 2026 10:21:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwUZUc7C+OWX0Azc4Hrh9a82EvRBs8s4iYDHIHF45iQLhH7agCSBt5wiKLsl1pyivuvpyT3WflA27SNonGEaA==@vger.kernel.org
X-Received: by 2002:a17:907:c1f:b0:c12:e178:9e68 with SMTP id
 a640c23a62f3a-c29e5237e9amr501417166b.19.1789665344119; Thu, 17 Sep 2026
 10:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
In-Reply-To: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Sep 2026 10:15:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
X-Gm-Features: AcwNN1VkAmOFPymjE_dcKSWc6Q8Z4LvlbW-9yRGSGQmATfVxYq3jdlUQ82g4gXM
Message-ID: <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] kbuild: significantly speed up kernel builds
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
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 09:06, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
>                 == defconfig FULL build ==
>
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc        32.5s    26.3s     -6.1s (-19%)
> Threadripper, clang      34.5s    27.2s     -7.3s (-21%)
> EPYC, gcc                28.7s    20.6s     -8.1s (-28%)
> EPYC, clang              39.8s    32.2s     -7.6s (-19%)
> M2, gcc                 519.3s   512.4s     -6.9s (-1%)
> M2, clang               634.5s   569.4s    -65.1s (-10%)

There's something odd going on with that M2 gcc build. Why is it such
an odd duck?

             Linus
