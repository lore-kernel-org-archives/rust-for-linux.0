Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623D4283C8C
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 19:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749670607; cv=none; b=JNVSv/8SWNXRbo/Fnwd+hPHzADrF9hLydGQud7mJ0lcD9HJ/1r793ISzFsZREL5D70FPGleCultyOIpxlgj79/0ptNnI9BQqk+B7jfFhS4u+taFXQaNk23V+mJBY56Kpq+2l0UkuSIqLOJ/6ZrxRaSngiHIP4iiZ4Eokz6NwbfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749670607; c=relaxed/simple;
	bh=FRd5Pca7J/f+Rrh/WDUQUYH4N+OoqdWEDRYIieG9g68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jS/Oh8C94Pz8qNi34U6+R3nJtjhP/8+owhtpnpb0qvARSzTDo1SmSmEPSPsEYt/uXxAO9NlI4uMY+3d9NWaXWY5XpzRJ4lpr5UDUSpVNg393I+D+Xs4TM/5o+9DZrDTt54nrtNJ8SJBFwLbq8ofoXKGb9fjI9a61U4Q6HAkG0bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZRtR+Fe3; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZRtR+Fe3"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2e41064e247so69608fac.3
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 12:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749670602; x=1750275402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRd5Pca7J/f+Rrh/WDUQUYH4N+OoqdWEDRYIieG9g68=;
        b=ZRtR+Fe3HGuSlgGH3VtaS0jW/rbxnNvNLADsIE+zLfegoHWEeWNzu5rsYk6AXahF6K
         w15Z5kQ0Y/zsWKpsZEPGrhpaA9pn8E4onu/zGzCqrWcfZT4iKjdKqwAeZKqiW5Mq3g+J
         TuEDpW3Ur8y+6HKULNvWz86R61qY1IqMwF45vh0eS3oyOG6fFFkKHY+lgHYZoCjudPJV
         v9oRTUgZ11zn6hmXiKU1oOBsr90CkN8A5z3wUvOqp+pD4y4cpNXMDQq8GfmQmHoFm5el
         gWeUfOIOmeDC2LWYfYBWxGMgfhN4hFm2YE8PYUCL0CHSy5AgLJAp3EUC81BJQ3vN5eZz
         B9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749670602; x=1750275402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRd5Pca7J/f+Rrh/WDUQUYH4N+OoqdWEDRYIieG9g68=;
        b=E0hYH+/4DWg+Gk9CjSljZ5qY47b30Pl3IVPOrW3Ip7RiST5Ft0HDhfuALYvdeVv4uX
         gPJiqk9G1/bL60p8Q19ETjADRKcqdYnXn/tpoimW+urNW6u49nXjJWqbS6qoptar9osa
         3ORrzhRPABddT33v60reWp8Exl4e0LO47FgEgatEp+MUh6qQsAxlcqbi969wXHD8ftW0
         XENXsN9cpL9YRTjeJlNliBo8AkAG42CGikNQ77+dzZHW0Ousc0urSrHsBO0pdaWs0W/O
         0jplnp21kiHiH7Ms7A+kC6hPZJMpdfP0S1QO/ZhhxO+83Uh6Z+EuBpCrHJG184WfNExj
         fzNA==
X-Forwarded-Encrypted: i=1; AJvYcCUEBcLLAMGasFdn48adFgB+2af2x93CyLeIQp96UeNkYIL2E/jHNI/TkZ+Ep6G5Dhzf82bvZIv4DHLLNu9EbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfh49f4Yp9cZJFxEoJSLJQfViglN3otb5a8klgWlxJVWE8GqzP
	38Yitxt3HbgxFSms2sJdQjx4DILZR65IuBYktbC/+rn4e8+JRTtnzv6rRaT6sNPETt5ZuKWjDeA
	Hc5JqoffdeVqW4gwllTgRBX/6sbKHt/vlJE+9gwEs
X-Gm-Gg: ASbGncveQD0LExK4OIV3RMz3Jy3v4Blwv2IN5iJnfnMSvwyqfZhNokxSOM6qqvIDAXc
	hWDQ+cBtfFE+pLrlTIuRyV5yFWmqsNVau5UWm153Tu3jjepEcCIP0eBQOnFvpfnMamwuGGUQd5H
	nlz8mtuL6N+gcWBJ3k6RhjFh47S9syu4tD3m63KXQXE9qnx4QInbCPtb93zDoS2NmkNuJPCiH8V
	A==
X-Google-Smtp-Source: AGHT+IHhX/J0KgTBqTFodOiUoIOZLLvskczxvrkU8jA+rrpxEq+8GIz7VrHt1fqC3oToKkknmx1PVZC1oRVO50e0z3g=
X-Received: by 2002:a05:6871:2b0c:b0:2cc:3523:9cd5 with SMTP id
 586e51a60fabf-2eab6fa5f8amr84101fac.17.1749670602224; Wed, 11 Jun 2025
 12:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602133653.1606388-1-bqe@google.com> <20250602133653.1606388-5-bqe@google.com>
 <aD2118mMOs8CZyGa@yury> <CANiq72k7wnHsd6jrckkZtRpwbTPE+5ikbCw=_RexuRvwBSp-Rg@mail.gmail.com>
In-Reply-To: <CANiq72k7wnHsd6jrckkZtRpwbTPE+5ikbCw=_RexuRvwBSp-Rg@mail.gmail.com>
From: Burak Emir <bqe@google.com>
Date: Wed, 11 Jun 2025 21:36:30 +0200
X-Gm-Features: AX0GCFuGeRjnvrLzoxm0k2luQ-ZeSCWV_imHjgZMV5WADOuB2TB360to4jKqdKA
Message-ID: <CACQBu=X69A+XxMd5iqT3DgYpQ4Xx_z3GVouuyd3atUiKZKkw2g@mail.gmail.com>
Subject: Re: [PATCH v10 4/5] rust: add find_bit_benchmark_rust module.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Carlos LLama <cmllamas@google.com>, 
	Pekka Ristola <pekkarr@protonmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks all for the review & comments.

On Mon, Jun 2, 2025 at 4:44=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Jun 2, 2025 at 4:32=E2=80=AFPM Yury Norov <yury.norov@gmail.com> =
wrote:
> >
> > > +const BITMAP_LEN: usize =3D 4096 * 8 * 10;
> > > +// Reciprocal of the fraction of bits that are set in sparse bitmap.
> > > +const SPARSENESS: usize =3D 500;
> >
> > Is there any simple mechanism to keep C and rust sizes synced? (If no,
> > not a big deal to redefine them.)
>
> One may pick them from C (possibly with a `RUST_HELPER_*` if needed).
> If they are non-trivial macros, then using an `enum` instead of a
> `#define` on the C side is also an alternative.

I'd prefer not to move these to a header file and define RUST_HELPER and su=
ch.
I'd prefer if test & benchmark code was somewhat contained (although I
agree it would be nice to keep the two definitions in sync).

> > What is the name policy for rust? Maybe a more human-readable name
> > would work better here?
>
> Up to the maintainers, and generally the same as for C. In the global
> Rust samples and things like that we have `rust` in the name since
> they are Rust samples after all, but there is no need to say `rust` or
> `module` in actual modules etc. unless there is a reason for it.
>
> I hope that helps!

I renamed the module struct to `Benchmark` now and made the "name" the
same as the file name.
So the _rust suffix is there because the rust file really corresponds
to the C file.
In this particular case, I think it does help to see how it relates to
the C file.

Cheers,
- Burak
