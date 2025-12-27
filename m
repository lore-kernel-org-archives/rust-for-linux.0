Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E0325A62E
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 15:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766850823; cv=none; b=TIjr+Ds4QDP8BCA5BipI3CV+g9RBQZ8Kjcc97xsZtIGobv4FsgvWSsuk1ZCTEFIFIx64M0FQlBEa6DliYs2M7MkEBAjl+XVh75ul87n1dA0VqF6cm82w+kox1ZwGEFSTW3DibGAgoEJ8pHxDS7xUl7HfBnA1YU0k5NJv2bZQGd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766850823; c=relaxed/simple;
	bh=/1mzwrvoo+DSAsZx7VBoMRPoJtp2jBFBCvKpMm5HHKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9lilELVzAUlh1o112hhAkNYM8kLtt9CfkGtBNF7e7gPy88fAiGAIhZfKM75clbX88R8qXNhyRHLxzLjeY2abvP7q9DvCl1RCGPD68Rjh8SzhEjuNM4qJD0/adpp+jhATWPCifKzNPbLxcKG7o88/pBgRCGP5IG+313hWN84sCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hW7Fbud6; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hW7Fbud6"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-45085a4ab72so4417104b6e.1
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 07:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766850821; x=1767455621; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9JvsajGVvrFvmR+hZ+l9h+0cAK4GDfAglPzfgPuN9+g=;
        b=hW7Fbud6RuXtPtqrpCzjRYwvepYWegPaEpDQ7bM65f427tj9QhXP+pOqE3qUcOu7OU
         yyvjXKV1drPi6ri5TuwHCP+IuhD3ppOjf+8yvQ4jQxm2azp0nQ4zZFf/Ahu0UWR4atMd
         k2DlMGrVDJ0IIWCVfYdwNtkYQJPEwNBWkmmYkNpA/cmNy/4uy3FIbaov7A/16TuvjBeO
         3fKcCDnStGY7YUpWySTzWzFD1uUMB3Pi6E4UnL4CHAcYnI9uCq0F4IoMyiybZuG6ulvM
         NuRavYrVmEs8sPKH6tNWJxMjz/rUz4tnt0fwGmommTRQFzSanhFRKc/QtVl/87iVhXCE
         sXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766850821; x=1767455621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JvsajGVvrFvmR+hZ+l9h+0cAK4GDfAglPzfgPuN9+g=;
        b=sGFOXn4T12a94TU6sPiptFaaxYIWLSRcCyJq437h+V0Y6gf0NcomS2lHFE8wIhW6BN
         cEl0MwEPHaqf6Xnga+qMoprzXYDyOAjgid+05t7zCMKHF5zNJa0CIfDJh4UF2JnVefNH
         Gmq2cM9D7rYDxCIbXIlWG1Txb5Rtt47ETBmbjoksesbXertYS3VWl473IeyzcfHqY1fm
         d6m5Rs8BbyNrY6akhO9DkdZSRjxhvdcgecJQToi2jKN/CGY3DVFO11663/b0PnxDV/0j
         TC23ApQB+egJWPLMRkyhLmUblOU8LfG6enmuSLo71Y58xoBRZYT+s0VS5F2jxeFXmfMd
         763g==
X-Forwarded-Encrypted: i=1; AJvYcCXsC0M0ldxmgFTMLiuITuxSS+NEgMH/z+WRqAkAPLPvghu5XHJ4hFj3uPqMoSxeUtB4j+/yS/sGURoK0G4yGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2cTv+jwvgUx7DvzolnT9dxeDALiuGewP0yOQjSWkDErSZ//Sd
	2GI2kwGf3yr4L9+qyBq+HJ43DZavfQ7DC1jww1mRrnUIrZ3JmNY/TRu7D/D9NVip
X-Gm-Gg: AY/fxX6qBuWH/8RfWxiFRLnW7ItlujeXsrFFvMWfFYNNs06cv/DSFmT5YduR7xXtL9P
	f3HERLaOQ6AZaZdBbI05rHd4JgxZYS/MTGW0Ag1UiRMNemf2PjkO7zzCGGKGJ5UPN3LBra9bexE
	fjK8NY7yJc2AaVp0/4jBgcEDCQkWdaluX5OYVnlwOWSyHOcD5OiwgFg7vGTy4Sh9ciWQ2D51TzE
	PD8829Y5cmuMIHQNcQne4QxBTEbJ7zF18TcMxTeulObQziPmGzyNK+tFo67mX6Ye69elWpefr+Y
	6WgAOXrc4n/MFdKO8f0kaCnXUlhwZ7SkFcSxpKYdpxYYMgywtcsb3xuPW8e9A9wtzPVyVc1+4xv
	zLFV16Ds1vQM5yo6fe9BsHBWXru2BPzWKnFvHcACHfdegDQ0+O0Y9ikf/XqOwgTjyOoaiaSigCR
	Esg9QBekcM+5mtTIlTqBFRtsWDb1Kly1V7IhFrIQCcaY0jdj7S0UoFcdHa
X-Google-Smtp-Source: AGHT+IGn+nJ+NUQr1QniIbtzoRzCAOpg93o1Z3CdbYFbcxmr+QIFn8BZyHf4r1HyhCh3jf7JpTAPsw==
X-Received: by 2002:a05:6808:f8c:b0:450:b947:1d8c with SMTP id 5614622812f47-457b20455dfmr12290217b6e.67.1766850821080;
        Sat, 27 Dec 2025 07:53:41 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fdaabbf2e6sm16088184fac.17.2025.12.27.07.53.40
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 07:53:40 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7c6ce4f65f7so8196983a34.0
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 07:53:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDJq1UNVC4LCmJG4bt62kJzQUxV0n2mpdE8eVsjTYy5CGS4p4kYKFI4YaV7dDoIe9EM5m6tzNZtcMTP9i/Zw==@vger.kernel.org
X-Received: by 2002:a05:6830:44aa:b0:7c7:6479:38d0 with SMTP id
 46e09a7af769-7cc66a1ba63mr13731713a34.22.1766850819899; Sat, 27 Dec 2025
 07:53:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226-soc-bindings-v4-0-2c2fac08f820@google.com> <20251226-soc-bindings-v4-3-2c2fac08f820@google.com>
In-Reply-To: <20251226-soc-bindings-v4-3-2c2fac08f820@google.com>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Sat, 27 Dec 2025 17:53:28 +0200
X-Gmail-Original-Message-ID: <CAKBF=psoOa2S5J2Q6Euf_tDdBJHhGpFA9P4304vo9WgA8y71Fg@mail.gmail.com>
X-Gm-Features: AQt7F2rd9emh_aWaU67zgQcsi6Mj7lTB8ZM25TNYRpzo6vcp2c9Ipv2o4DKpJyQ
Message-ID: <CAKBF=psoOa2S5J2Q6Euf_tDdBJHhGpFA9P4304vo9WgA8y71Fg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] rust: Add SoC Driver Sample
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Dec 2025 at 22:18, Matthew Maurer <mmaurer@google.com> wrote:

> +    fn probe(
> +        pdev: &platform::Device<Core>,
> +        _info: Option<&Self::IdInfo>,
> +    ) -> impl PinInit<Self, Error> {
> +        let dev = pdev.as_ref();
> +
> +        dev_dbg!(dev, "Probe Rust SoC driver sample.\n");
> +
> +        let pdev = pdev.into();
> +        pin_init_scope(move || {
> +            let machine = CString::try_from(c"My cool ACME15 dev board")?;
> +            let family = CString::try_from(c"ACME")?;
> +            let revision = CString::try_from(c"1.2")?;
> +            let serial_number = CString::try_from(c"12345")?;
> +            let soc_id = CString::try_from(c"ACME15")?;
> +
> +            let attr = soc::Attributes {
> +                machine: Some(machine),
> +                family: Some(family),
> +                revision: Some(revision),
> +                serial_number: Some(serial_number),
> +                soc_id: Some(soc_id),
> +            };

To me it seems little bit awkward that all needs to be CStrings. Maybe something
like this could be used (basically cow)

```rust
pub enum AttrStr {
    Static(&'static CStr),
    Owned(CString),
    None,
}
```

This will also take out Option with same time. Then some nice ergonomic way
to use this. This is suggestion and I have nothing to do with soc layer.

    Argillander
