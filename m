Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9DD48C8A1
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 17:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781025579; cv=pass; b=dBqIZzIjbdxAYsxo6kGAzlvo/QN1/kGdJfrNBgFLPii1+yC9r8s5MdUpw9SJDXf6/E9YwDrtBa5ycjHC55V7MuDS0FL/xjQBQUuWAmKvcg/WVosgJputacIYMv6idtbyLwUsLYc+ubfuWXZVCTgAFDZ1niBReKrg0QmAWjkYsQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781025579; c=relaxed/simple;
	bh=i9E6g7FrTHJuH/KM/L2YDGTx0q9lRs2Xj+Q3YKzpptI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAS+cydgH1XVFpz05MR/mCM8OsNcFZnXxKHdZYLKpu/lAuB0FqwHsnWjitROiPh4RFOuii1xh8dwxqSkTtEXS6nDZKMw4/KUjP9hummJpWkhV4VHc2nqP6U03w88hPVOYn3lvv7kLz4uP6erzRr8F20WAhqfZ02HXwlZZx1/690=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILC3pvwH; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILC3pvwH"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304dc707c7eso543569eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 10:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781025578; cv=none;
        d=google.com; s=arc-20240605;
        b=gqVYatpr6mpPPpQoi1IMAfuGmbcvGmngqAZDtdUK/CaDqSvMrPRAUsGyVqbytRGJLx
         4NOX/ZRraLxjZ/aE/XzbHzwigCSP2aAqjwZ5uuMYd/hpdhtvulOyzORsTtUIvb7XPX8p
         WPW4lsvdXAHJjNAMewTDp7nAOMnLRFZOpD6EjHOqgrF2sZBkyPD33/O9P1FrJzGXIhPW
         RKlNw4GXrbrDme/1e5S4SIYG9mnEx0o+JbH+97lZg2EfHS1tjrcsItw8YnKJRzLkGEPl
         nWQ9ms3nZ0pe6BxedVjaIbCPnlwRCb1dUxUxIy/k59JvfVAhNlAXkJjOIYDINfAuaDdl
         5YwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qdj1ZDhkK9hVS2s2BU4ZL0QegPmYjb1pgGPh1FYEFmw=;
        fh=gpDYt46kMToiY+wzGLs0n39NWomOmY3Vjij7MewRAb8=;
        b=GZvfVoZJlUFP7f6QDs6rK8w5zwzOOhyJq+B3fEhugMUqrPu6jEE4TVFtQ1Lg5qClK9
         NUIPmdo3Z5dAUZoprFqHiBx0h7rfS8j3SgxW/z1bXPG19KI7h6FCMXSf+jEemdugL+0+
         HNYtCHDT418m6dXUxYxnrTRYWSQtkpF04PHj8cIbJXicvq9awi61dVDGH448/e3hb1ir
         1KMeFzevwAactcWnnku1Rb14cKD8ROgPDrP39t67zFpDLAO5UnIy2yJ2fuJmlZm1HTHp
         BAPL74ybZ/ZeSHrcvCyI2RKrEZ+5X1zbSBsC/kU9M1l/jePaf4Kjrm6QXtEZ4R26pQen
         sXYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781025578; x=1781630378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qdj1ZDhkK9hVS2s2BU4ZL0QegPmYjb1pgGPh1FYEFmw=;
        b=ILC3pvwHmwrGs+WIEIEIAs3/R1AaG67QWbLwRlH0vi7RDeKE6UhFGy4Q81WDDh7XSw
         E7yvTiZPPgh7gIZ20+nT93ooOHAnRyRlj01xaFgjm2yc6QHegKQObljIcffnVwKI/4CF
         vvjG1AhhCwUBG4bzoESOvbyvmxq8lN1z+Dh+jRLvXDnvEjhpZmdqecGE8h/4oCwMDslo
         SOGPQg4d1vnq3kX0HwY2UPmVVY0VguyvnpPs9nPCRHmEeVUL1U+VetHtsQeUcSryhqR6
         K1u46KP66wHOkalkuuVFdWtCOYIy/H8Nmvh/uqNCTwc03nQnk6Y1kXXrm3OE1ugNkHgk
         jmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781025578; x=1781630378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qdj1ZDhkK9hVS2s2BU4ZL0QegPmYjb1pgGPh1FYEFmw=;
        b=EX8QIBY0sBE2YkO80aGgvDRJBJn9yEmV52UN4TMCXsZgMJ6kX8bYJMU/HQp/L6YjvE
         nPeZP2KMXHYFx2xJ0VVkb/7YDoavd6lTSqruke+tYRhc2tvgq+VN8Au10evhPNf3L1AD
         wIIWmmoASRx+u+1zEVt+yl1i0OfV7swzBWWAX7mqrCxNN1zazP6Itjazurh+RB2UFGi5
         R6A07nJ7fDS4ATTdzKxKof+0kzujA0oX/sii1bAZGt/XHXopOUHbe8wIigoWqqZ8AcjM
         Fbl3fGPOxgWyOTZWRrisbIBf+1uG4AT2YULDwgf1QxQkrAedniHS/GSqIl6GhGMRSDly
         KT1g==
X-Forwarded-Encrypted: i=1; AFNElJ/G53BESe+P6Iesd3DwEO1nVAbpS4ouCi7QGfgOemuzosHv0o+SRrTcgB96h9875Q7mepJvsFWX+7yyu3eWPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqpHRB3lqlIU3CxitNDk9S93lufOaoecmhm3Jmbv5MaCKVzi7H
	HBBATNacPKESeADkq476RZR4cQz5iR29GnLvvRqe3nLPDD4qw9ZaQxk/CfW8F3YV3iuJ56ym+MA
	eK47Kgo/nJUhzNUEAa5gIRZnUiY7beVg=
X-Gm-Gg: Acq92OH94LbyrnzUjwdu2ZmjdZMNliL/bHuyr8vDVPbHyZURbbORzMyvf/U/pH4rsIb
	UTrL4t91lYjFjJi4R4bcJv2MtcDQLJI107cck3o1+9/xP7pwAHkk5h4Oe/j6zdnT9hbR8nVhj9X
	PO1kzIpJIMHZ/Bct4yaNg60mgL82owWPQcMrxDQvPa4wMhCMgsCl6+iaQRHf33NxlNRSt6xU796
	5gTArhh6La/GQQOSnWIO36+/lMtf8pm1jITYzW57nL8KE4dfZWjUezu8y0ZpuqrD21NUmr+W63U
	sg9OS2wE5QCBnFH64CRLWCbokiBBDWE+8rjif8em5XqzPhhwUNRPWcZ6AjVvaRgG8ximS8vT0Xe
	LgjNsjc+1rkANXbMJlbzEWJNqaOR+5AVuzg==
X-Received: by 2002:a05:7301:169a:b0:2ff:b29b:87b with SMTP id
 5a478bee46e88-3077b5fe235mr6554986eec.5.1781025577871; Tue, 09 Jun 2026
 10:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609142637.373347-1-gary@kernel.org>
In-Reply-To: <20260609142637.373347-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 19:19:25 +0200
X-Gm-Features: AVVi8CeFkVbj9E3PXx3Az4UAa3Y8O7iOpi-vamCvayZRaQa0QwlC9T9yRU6Twpc
Message-ID: <CANiq72miJLmc2EadxUa+yVZ5T72QuTES4Gz=YVUsNivYvR=wDQ@mail.gmail.com>
Subject: Re: [PATCH v4] rust: make `build_assert` module the home of related macros
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Tamir Duberstein <tamird@kernel.org>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 4:27=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> This is the remaining unapplied patch from
> https://lore.kernel.org/rust-for-linux/20260319121653.2975748-1-gary@kern=
el.org/.

Thanks for rebasing! I had it as "Waiting for apply" in the
spreadsheet, but this saved me a bit of work.

Quick question below about the prelude...

> +#[doc(no_inline)]
> +pub use crate::build_assert::{
> +    build_assert,
> +    build_error,
> +    const_assert,
> +    static_assert, //
> +};

Did you split this for some reason? I moved the file to a single group
per crate when I moved the file to the new formatting style, so I was
wondering if we could keep it non-split. I mean, it may be nicer for
macros since it allows us to group them, but I hope we don't end up
with many `use`s again if we go down that road again...

Or perhaps you did it for the attribute, i.e. it may behave
differently, but I doubt that is the case? i.e. if `no_inline` somehow
behaves differently this way.

> rust/kernel/sync/atomic/predefine.rs

In this one you used the prelude, but in the others not -- which is
fine, we should be using the prelude more (though perhaps it is a
separate change), but I wonder if there was a reason.

Thanks!

Cheers,
Miguel
