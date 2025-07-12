Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33797280A3B
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Jul 2025 20:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752350644; cv=none; b=CM1cmySFycgk2PK4UGRg7jD+wjT+FMH/RU9zFIZEgvDGd0gMMJeSP7jOTEZ04o3jzGZS07Cb1gyHP4IiYrFJtKfoe/zNgaBowwx77sbwMvBNipzV4mnTFvD6tA004rAHdB81LIztEuNqukB53yJZ74hVYd5l2S179dgRqnUGLVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752350644; c=relaxed/simple;
	bh=p9a+vV8apmZ7sCsNyZChMdg6f/IVBql6r178baN5A/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPFO8sJbkJ4MGdovHMSlHKq2j7SSGGn5tYQkZZl5kO6MU2zGAXime0DWaAEq/VWWvDrf4aYWAWcROQpAQx9IX+85Ezr6Pos9JUyTxS+T9qI3tDD399Lo8mKr0dsttfjFFJyWtw6bXsGvFzGY7jQzq8a1B33l4myn3EC+jBdzqKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4ghgFc88; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4ghgFc88"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a54690d369so2882760f8f.3
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Jul 2025 13:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752350641; x=1752955441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq3PmOGCkrfXK01U9GZwebuTRZqcIqJ0ltR+JqYn6ZM=;
        b=4ghgFc88bjxW9nmU8YOgzVafNUTer16wV0TvEOT2OFCtl/aUjS72xC7loGSOEHTggI
         jo8wRxWuJZjH30Lm2jnYOyrBJ8EIv7uXFXUrOfa6HI6dwKp9RM+PchSsirFueo/6DRcV
         4VwraC4P15ZfWCnFK29df5m/DIHhmFowrWZP9ZeTeA0hufJBpBJk6OVEo0dvJVtqKdQU
         SIdi5AtI2IT+i+egvQpKAHq4G4Yp64SHqlAsGtD3Aj032m5s7S41/Ct9Wo1fBNJfNG5y
         MGti8SQcvPsOeXSjMkP2WNq1hlNixlac/P9rTvGDm3/uLsvTb7e2E/3q2X+PTAJ30y5u
         Fftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752350641; x=1752955441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tq3PmOGCkrfXK01U9GZwebuTRZqcIqJ0ltR+JqYn6ZM=;
        b=FoAlMlin091/IxYPSygxepz9XVUczIOWLeynoMA8166n2ICDB6ghi6ML3TY03KpC/4
         jYMcc9lnxx7fyearJZmmXlNm5FBPL779HN4AWA/qmNDsGZc1xEIv7DpiBleYkeTSnd92
         DzB6RHwRjVeIjZ8hOM/Fug3WIfifHip146Iy4FGC3me2JKJBvzXv7yLbw2+Wj4kumdfq
         OqqklLEDT24LSmQc0zvGmYNkRjn79x8dxI7GOUqfhCSOFjg7t6UPWOADsMWFfgBWypM+
         OkMgd/L7hH6LDFn47LP3MKfjE56iLpXoFsRrOs5l6DTpP6cUis2qFaoRJqabKWHSXXNU
         Jrig==
X-Forwarded-Encrypted: i=1; AJvYcCW9iG2qq5Qfo84Yicib4K2orNxzJK5RJqp2Tc3hEukmMAIKJJUafwvwXD7B3wqwjKLewGWb3A1Dm/U46wIeWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjlZ68u/iTmrfgTZ8R0APtRsW+YhqEpDL2LW+y8cKErTbIEM+5
	pec6U48dIBDBGPrD5ddzTRzjGfoSPECyeunWS1jw8qfJVhQUxiOQ85PhgN3BUUC5suOG4dsXKJs
	cps4IH2O/j1QV9ufX34AzB8uBDmGKDQgo6a8daPZ/
X-Gm-Gg: ASbGncsrlob9x1Tx0gUSRt86zQqLjrrrz7x8SW/JRfVk+W/HgiYqQsWNq/A+1bKlBOr
	29TOpyIa023u20FnleCrrNPiG3qlBOXmkJtSBDtQs6gdRPXBsM+KThKlx4c7CmC+ZLLM22Fyi1J
	dFb97YfCx/RKwagUM2NjqAKW9wEVdRbVUUwucC63bx/S3Qxr8iKWv/WTXWEJWPrZgL/WFVrxId/
	nVyyRD+
X-Google-Smtp-Source: AGHT+IGF89aatpumiK58uy2w2NkR0vfwl7z6BkyK6LzczLJROl19LmbktSpyeUcyETjQeM3Pn+QdA/l25mYxSvdIIho=
X-Received: by 2002:a05:6000:290b:b0:3a4:eb92:39b6 with SMTP id
 ffacd0b85a97d-3b5f2e3a4cemr5868399f8f.54.1752350641213; Sat, 12 Jul 2025
 13:04:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703-topics-tyr-request_irq-v6-0-74103bdc7c52@collabora.com>
 <20250703-topics-tyr-request_irq-v6-2-74103bdc7c52@collabora.com>
 <fcdae3ca-104d-4e8b-8588-2452783ed09a@sedlak.dev> <aGeF_W74OfhRbkoR@google.com>
 <49ABD63B-05C6-4FDC-B825-5AA2ED323F1C@collabora.com>
In-Reply-To: <49ABD63B-05C6-4FDC-B825-5AA2ED323F1C@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 12 Jul 2025 22:03:48 +0200
X-Gm-Features: Ac12FXx5YdpbrJ0gR9WkcUwidfMCVAJWSGCrV2cShwr-zHhsRabmwxCyCH_KC9I
Message-ID: <CAH5fLgggM7ZCX7nRz7M=hkxwzcp8UA1=2BQqRFA2CgN9eEUmsA@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] rust: irq: add flags module
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Daniel Sedlak <daniel@sedlak.dev>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Benno Lossin <lossin@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 12, 2025 at 6:27=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Alice,
>
> > On 4 Jul 2025, at 04:42, Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > On Fri, Jul 04, 2025 at 08:14:11AM +0200, Daniel Sedlak wrote:
> >> Hi Daniel,
> >>
> >> On 7/3/25 9:30 PM, Daniel Almeida wrote:
> >>> +/// Flags to be used when registering IRQ handlers.
> >>> +///
> >>> +/// They can be combined with the operators `|`, `&`, and `!`.
> >>> +#[derive(Clone, Copy, PartialEq, Eq)]
> >>> +pub struct Flags(u64);
> >>
> >> Why not Flags(u32)? You may get rid of all unnecessary casts later, pl=
us
> >> save some extra bytes.
> >
> > It looks like the C methods take an `unsigned long`. In that case, I'd
> > probably write the code to match that.
> >
> > pub struct Flags(c_ulong);
> >
> > and git rid of the cast when calling bindings::request_irq.
> >
> > As for all the constants in this file, maybe it would be nice with a
> > private constructor that uses the same type as bindings to avoid the
> > casts?
> >
> > impl Flags {
> >    const fn new(value: u32) -> Flags {
> >     ...
> >    }
> > }
>
>
> Sure, but what goes here? This has to be "value as c_ulong=E2=80=9D anywa=
ys so it
> doesn=E2=80=99t really reduce the number of casts.
>
> We should probably switch to Flags(u32) as Daniel Sedlak suggested. Then
> it=E2=80=99s a matter of casting once for bindings::request_irq().

IMO the advantage of doing it here is that we can fail compilation if
the cast is out of bounds, whereas the other cast is at runtime so we
can't do that.

Alice
