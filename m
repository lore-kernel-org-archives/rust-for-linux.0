Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3091DE4E0
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jan 2025 21:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738098444; cv=none; b=lnk2ey2al+/63dMYvP1M7F6OT3dg7cBZ15zWNE63m2Deu57RB2Smwp4mW+tUY4MF8gqaqHyX4fxweOzUQx5a/1iOF0U9Gfnt3tKuf829ZmuGRFjUaa4jwQ1YMaJNH1WpAE2Lr6G5xLUbzU5Yq+33lop3eYOrONu+5eb06PXW6KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738098444; c=relaxed/simple;
	bh=tQWPSfd29jAb/+6dxN1Azzarx+5KxjRLA7zuyfgU0yY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjzFj5gFvaOqZQw/KAKLC4Jhbe0J+WUff2cHgY19UFO+hrMQi4f5Q5zpF6zGvZP+S2WrzXblJBrTRbmBDMh9zDO7gSc/azWRMBwgtstdxSwvGxu92hv7Atz9wR9fNAc6/hj/AkOyyEh40xj6yirttLNvM0FSFrL67DGB38l5f9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4bNYJhN1; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4bNYJhN1"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so8313340a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jan 2025 13:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738098442; x=1738703242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QK497g/6YRHBQWEHRzFRbGaEnXX5xC4fNqFlti0tjyQ=;
        b=4bNYJhN1rYm3VLItt1ZXuxqcv4yJKvs/XppHzj97uUX2VQEaHfw2G6zk9AG6Gfqu3L
         Dn4yObrRlOjM/Zp6d9thf7dL/OoGzkYer2Z2Z2bnETg/BDotzlZoc1c9AN5cfzCFzftM
         7yngSzoY2sC+lAQOHL+0/Yneu4EBYetTukQ8rHuGcekRSiOQZuvImY931xcoBIRpTI7n
         N1M28lRBJFNh3zKl2vu62l+yoXyyc/BmLWsLnj5I7x46LAsh8WSJbZDPKYEF7E6uGnyk
         P9X6vLxs89EyuEsacyFGUFpFIoRm9o5SwZu61YZEmbkK6NRlhS8N4RJbOi+9jfVxbF08
         5LhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738098442; x=1738703242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QK497g/6YRHBQWEHRzFRbGaEnXX5xC4fNqFlti0tjyQ=;
        b=C16j/XrGRh4Q8cTrKcXX9y6XJec36aNFCm+XJdtqmqrsRb4U/CNr1hzVyPDSyANHph
         EyHa5v9y66r5cb8IvEVqq0OA7mjtVf1etl/crIgU7erIdJcn6tONeuIDv5FIHO4Y8lM8
         pFMtAyZWIoOXLKQ1nXA3yAONHgZ7/vqN4Uv0XvyzdXuHJgyyRdZcz89RTvCvAwV2DOIa
         tzfHejrUwQneoXMP87bqqrw/Kxdi97yz87DSg6XsDIeu/nvPCMm0IfT+8K83m3yQ5Pie
         zRSQFOGU42woq2Vnp1Pr5rMk1O8DI4oo6hqusAvPi7gZ2TI1I9cS53uIq9MHpt8ozXU6
         nByQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTu4Yu6qroX8Jb2YYrqh3iuh5iiznU12axYep7/AK3JLWVoLeegskRnPiE0lqp76/dt3/JkhIWpV7SZ3+FQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgSRRx4w4q81ON0qFOJ8EMCFZoEZl+YL8v6VWdPpp6IvA6/No7
	Ym1OfKKjmMxsh0HBB6BN1fIpe6W2Kk4G40NVfmWz+g4VShtcC+nhJRjEy+JulnLtrs5ifB6kthN
	tIOFfcyH/A1CoznNRxPRk8JT1nQlV7ka8WxvX
X-Gm-Gg: ASbGncuxuoFBSs2mzC8LK6lgVsSOvjmKGRMTGqa6TtdiDQFhzDnbvvmJpW95E7LHY4V
	zQJMvb/K3s5+uZ+P0kmkoJTEfOzrpYEWfXTMINUd8cp+E5q20Jqu5dYb/qXW69OUDVtC/pxvp7g
	==
X-Google-Smtp-Source: AGHT+IH/lkJUsgOOkYQIY71+zE4VMub6TDVQlrlJUr+ZynBpE7dZZOzfulWBYCBgeTkybQoFXs2WuJxlrLIR+mWyj5A=
X-Received: by 2002:a17:90b:1f8c:b0:2ee:94d1:7a89 with SMTP id
 98e67ed59e1d1-2f83ab8c371mr692765a91.1.1738098441153; Tue, 28 Jan 2025
 13:07:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126223627.732451-1-sergio.collado@gmail.com>
 <CANiq72koWg-GGD3w5mJw3F-hGrOBZ7hiK1G4pHY+y_rQmtG5+Q@mail.gmail.com>
 <CAA76j93kQG0GjaMWpR+AnxPWDO1ud0SLECCE3uxN7FAyNB6Dsg@mail.gmail.com> <CANiq72kXG4qURXjnZZTLPMn-k_WwFt0yabR0nfCAzDMqYNJKHg@mail.gmail.com>
In-Reply-To: <CANiq72kXG4qURXjnZZTLPMn-k_WwFt0yabR0nfCAzDMqYNJKHg@mail.gmail.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 28 Jan 2025 16:07:09 -0500
X-Gm-Features: AWEUYZkKC1VY3tjA3ydqlvc8OmdBVLMFqk2PhIKYhR__-FUAX6WpHbJt4T_2JJI
Message-ID: <CA+GJov5qSXG71YFgqo=h5PP=HP7MPmvU+XVsTcaChR1DOBvHuQ@mail.gmail.com>
Subject: Re: [PATCH v6] Kunit to check the longest symbol length
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>, 
	David Gow <davidgow@google.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, David Rheinsberg <david@readahead.eu>, 
	rust-for-linux@vger.kernel.org, x86@kernel.org, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 3:56=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jan 28, 2025 at 1:24=E2=80=AFPM Sergio Gonz=C3=A1lez Collado
> <sergio.collado@gmail.com> wrote:
> >
> > > > +#include <linux/kallsysms.h>
> > >
> > > Typo?
> >
> > #include <linux/kallsysms.h> is needed to be able to read
> > KSYM_NAME_LEN: https://elixir.bootlin.com/linux/v6.13/source/include/li=
nux/kallsyms.h#L18
>
> What I meant is that the `#include` in the patch is:
>
>     kallsysms.h
>
> which is different from:
>
>     kallsyms.h
>
> Does that file build? Or am I missing something?
>
> I just tried, and I indeed get:
>
>       HOSTCC  arch/x86/tools/insn_decoder_test
>     arch/x86/tools/insn_decoder_test.c:13:10: fatal error:
> 'linux/kallsysms.h' file not found
>       13 | #include <linux/kallsysms.h>
>           |          ^~~~~~~~~~~~~~~~~~~
>     1 error generated.
>
> Thanks!
>
> Cheers,
> Miguel

Hi!

Oh yep definitely missed that typo. Thanks for catching this!

Thanks!
-Rae

>
> --
> You received this message because you are subscribed to the Google Groups=
 "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/kunit-dev=
/CANiq72kXG4qURXjnZZTLPMn-k_WwFt0yabR0nfCAzDMqYNJKHg%40mail.gmail.com.
