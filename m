Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1124E36F7
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Sep 2026 20:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675384; cv=pass; b=fYSXLGoOZwEDwO0P7toOmSLJnrgSe5nyhiB8OTQGayET9rld8l6/HkkLWNzn4sbm0Tr5vO5aKlMVdvFagtIjKZ9uDJuJf5w1kzGWuDzdRWqqnVBLbECyihMuy0EM0+fdHyE4fxt9HipR24KkwynMSqh1/hF14XxqA4MAdFLE5tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675384; c=relaxed/simple;
	bh=GpHjDtqu+AzW6bYVn14IR7601Ha7EtaAYwvYSeYG9jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHgHd/T8RsCf7Vr2JiLFM2wfNHOkwgc7oCkGQHFGIzJJbQSRui0h5TKLMVAp0B7za+03PJG9TY/oVK5hbDIIMH4pSpws5DF4kNsHRRLizKDzU6cJPG+XJAacqhcWub46W2Q1Tai27NzHvF/looCwWylli1m0agzhhiraMmxiFDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RfRoG1si; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RfRoG1si"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso244425e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Sep 2026 13:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789675380; cv=none;
        d=google.com; s=arc-20260327;
        b=hyq3CgBCdWoc2TQgo109Mzos3ZZSsc8NvssNPp2FD178O9gYZ36EP2xgw+ymmbVqDx
         6eexsvyTL2WfKWJ5x1ZsMOaNirLUCgi2BkhktEJ0A/jWbEtp6aF7A1ekxqi2h0MuMbcK
         M0uzqhD9erd07jIrL4l9MG5UjqzJ1jIE7d+Lna+OLasuhuDu/+YOi7IP0Ed07+x3gd9W
         8qC/5NFx3FIs2eJ/t/Se7gWssAjiuXYyMsKyROqtrkoPQJSSmH1I8OrH968UbJ9gis6T
         NjyF3PXUfGm97SzfokyKSTd+pazmC/9gSXByzM8ymP0ozCIWCL0mTy5Kh8H8/z0bMVlU
         rD3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=25a39fQthoJQenvf3ilsmj4we8U0R1UDFLTQO2djkUo=;
        fh=8NKI6vJJmcwfdhL9sxK6QR/g0nyT8sUWGjnoshmhTf4=;
        b=WJPbUBcmOHL+bVyET0Irg7C3XZOM9crdCbI/AkOlBp4/WM+36Knjt5SA0JIGaxnohf
         k9qD0Z64dR5tpDz/3O1KrKsBNgdMYmAR3Bo+bHQ2A9r7rLsbYKoNsSwmFvEeRhKYcvTw
         xsoiOPunroVqsoteHYhGCTXHv0KAAtLbp4+2BnjbI43YafOqu5kJUjBZ0nUoJ4sV3k5E
         Gy9eYj6iOZjNXmmcZBwjV6EurRv9Mf2rIAYs+4nu1TBBmr5MC43gX5DojPpxVbJgKkhA
         gqQHu5iTgFOtmSjrUjH/npWjV9CVGHAB+fctJ+52cnI2IyNz43g/u9BEi+gCvGnyqnSN
         wUdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789675380; x=1790280180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=25a39fQthoJQenvf3ilsmj4we8U0R1UDFLTQO2djkUo=;
        b=RfRoG1sioHwQsGYSkcve3ZDGfErdmSWrgCWHA2JlCBaobnXxnBfdr0TKVq27LK2zIZ
         UOvE17R6vYGLa6zQAttig93toa0GDEpwxIgGBTum0FIhjWQ2ZvB9dyNYwvdV/otOI5vm
         A3ZFMmlVd6uq3DhAGMGK/mu80sINzK4rP2D3RMyU2gORKLRV1tGre9kz1kts6W1QAYaT
         9XuABFIURZMRzl1KZihvHVFw9CQ9VbWSNQiQyhE/Rv/Yb9DXy8oRagR/6b1gegQS3v8y
         YYEboH4Y45Pq3GkmJCdeXvha1ezGt4n7sH0US7ujlIUX6kFFOMpc2oolhcFXbjqXk/zG
         N+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675380; x=1790280180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25a39fQthoJQenvf3ilsmj4we8U0R1UDFLTQO2djkUo=;
        b=MpWylto50VtOIrkYx9MC1wHVVlOuGNVwlZeO/L5eIv2JDr8dzfy48xyJ0H5vTWotZw
         xRg8/5a30Do2v5mE1pXhPxzVbEBT3Kz0+ps/NGXk+hNNuYzA3bqEWko6tU6DaW7UZAm5
         W+CMyGaphf/qY58EpMYdCCvAjc96XO50mYGU27gNsPR67mDG2eIbl2IaJINaZuCYPtJ/
         TlmFWaOhQoMf1gGFUcKn038TwQGS1N+gn9NxdVCxljr6d5+sNfUyk4cLUJkaNR91mHIw
         1L+ABDe3L3Wh3k4MNnKY8pqWXyLQMbvWRuDc8IPMY82EK8MYlhpcIXan5yG/ZY4E4m6N
         u8Bg==
X-Forwarded-Encrypted: i=1; AKwUvBwVqU93mnttJ6U8EraotZwqPLE5yIQfofqOaShqlzQ8BCDf27ZHbVs2xXfFVXZIsKURC1Hyu3GLHmI6b/JqyA==@vger.kernel.org
X-Gm-Message-State: AFuF++metY7lTRzUIJEtmCBnBe1NH8xf+3eOX1t+TKiECSD3ir89m4Wo
	zbxq4HLdJrosExx0cXtl6SIRTKqDg2xrsHds98iBZnA2nvEh5+ncNW3lfoFh75lzl/AEFIw9N2E
	ugn1Yh7IrfUqJRnhapUYGK2rSBmu3n/mCZCx3gFqQ
X-Gm-Gg: AYBFou3FdUITZIqPt81oJoGfMhsEXGYhhUhnPEGHTPoz3wMeTgemWOeLjpOREGpnUsE
	0SbRDYjSf61AHUM7Ds2Z13cNXpybFOh8UQR3oTnqF+TTRzRj80UD1qLuneXnQQ+tdG3Pd1SUQqn
	AQSp/9XivJXtho9F/0ZhjTAqUV3mPDP7I4Tb//CgUhatG2lfUtUpFn4VTPM2KgvoK8FxN5jpve2
	q+w7xuWs7qWUaOlKv+0AB7FlOQXKwiegxTT80wRfvpfDZ6GLzOe+CWiadexy3Qmonww6kWKb0T/
	x1u924/Yd1aUZEnBjEoAy0YebpwWssBX+Qhzvlkz8xzdWlt9Kh1sktIyAnQnDb+LLWp3DW6Cri1
	iGwgTcc7q4jbxgnhxwwqUb+VL3t6qWq/K/akxHNcBU/M6LvaHiIrQVRNQz/t9BGa1QH5h6A0=
X-Received: by 2002:a05:600c:a013:b0:49e:6891:27a8 with SMTP id
 5b1f17b1804b1-49fc574a9bcmr72735e9.25.1789675379819; Thu, 17 Sep 2026
 13:02:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
 <aqwkk7FcQ0XWeqJW@gremlin> <aqxCNyxYRzN2Oher@gremlin>
In-Reply-To: <aqxCNyxYRzN2Oher@gremlin>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 17 Sep 2026 13:02:48 -0700
X-Gm-Features: AcwNN1XUt93HLe1Zu-oZLdknUZyAU05hxj4P7Ko_JzOHOx4U0fnT6yaI1XKYaw4
Message-ID: <CAKwvOd=zbE8MZXCNCBJNpd2WWn7f+AOfxYcmCp7e-8uFSM+D9g@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 12:42=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> On Thu, Sep 17, 2026 at 06:36:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Sep 17, 2026 at 10:15:26AM -0700, Linus Torvalds wrote:
> > > On Thu, 17 Sept 2026 at 09:06, Lorenzo Stoakes (ARM) <ljs@kernel.org>=
 wrote:
> > > >
> > > >                 =3D=3D defconfig FULL build =3D=3D
> > > >
> > > >                         before    after     delta
> > > >                       ----------------------------------
> > > > Threadripper, gcc        32.5s    26.3s     -6.1s (-19%)
> > > > Threadripper, clang      34.5s    27.2s     -7.3s (-21%)
> > > > EPYC, gcc                28.7s    20.6s     -8.1s (-28%)
> > > > EPYC, clang              39.8s    32.2s     -7.6s (-19%)
> > > > M2, gcc                 519.3s   512.4s     -6.9s (-1%)
> > > > M2, clang               634.5s   569.4s    -65.1s (-10%)
> > >
> > > There's something odd going on with that M2 gcc build. Why is it such
> > > an odd duck?
> >
> > Ugh dear lord I think the LLM somehow corrupted the numbers... Let me
> > re-run those myself locally and come back with the actual times!
>
> OK numbers are in:
>
> M2, gcc                 564.7s   512.1s    -52.6s (-9%)
> M2, clang               615.1s   564.1s    -51.0s (-8%)
>
> From the v1:
>
> M2, gcc                 564.0s   512.4s    -51.6s (-9%)
> M2, clang               616.1s   569.4s    -46.7s (-8%)
>
> (Tested as per the cover letter pre-reqs, i.e. applying dependent series
> first etc.)
>
> Not sure on the -5s delta on the clang build :) that might have been me

Clang is faster on Thursdays.

> being more disciplined this time to not use the laptop at the same time.
>
> But broadly in line with the original numbers.
>
> >
> > >
> > >              Linus
> >
> > --
> > Cheers, Lorenzo
>
> --
> Cheers, Lorenzo



--=20
Thanks,
~Nick Desaulniers
