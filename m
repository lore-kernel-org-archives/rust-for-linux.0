Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA985223DD9
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Jul 2025 21:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752356645; cv=none; b=kLQbNJEbflLB2e0Km8SjpnjzVuwP0qGfJZqzze4Dy7aRNMdeEh8F08XLB0Bf6eb9jp5xE+Pt1uIAgv/xrrhLofHbHuNkCxsWsYOHSy2sD48D5HK6nFu1y+fUfUE8hTgxZNri0/qoPNHWtMW3VC0/f8SDOckN5ypj7/k45FrywGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752356645; c=relaxed/simple;
	bh=g3uF/zoGkId6+KY/AVt4Y2W4PFG0QlMx0+rXBUVCrns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWeHvqHl1ngzHEh0EDb2hBO9B/TCtSKIhM3mPq7X6kuhDNbFEofL6g9OzITGpygusTJi676dMWDB3uTWsEOXDXSH4XM5TE6fCjtRDi35Nul5HEBoIWvfB9RgqGVvDfDazfIjCdCRI+tiPckcIthy6HFF3/JrSCXP9pBftAm2vpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ppfDqpBG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ppfDqpBG"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so2538196f8f.1
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Jul 2025 14:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752356642; x=1752961442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJzPr9w7Pyu1TsVJ2QolyITY32C7As+7Er3afc51O5c=;
        b=ppfDqpBGytBSYJaSuoRAuBRgjGscX2WU9PEdEwsFSNFPySf0KdlephUTcf0H8RmPXv
         rMpu1SHipPbrg+cRViSAJTDtYji63p3hDHZc1KxW3nrn3udE0bFbBGUK7dRR2C6rN8HK
         nAf9TNh7ptTotkCCEalAtmbqCrYtdJZDnbeGGGAkrLsLGwz0Tn/lu5Uedcd05QJ6Deat
         usRejxJpIxaZMPhLrZ5gxSiKLxsR69J36QAAkG7gLQB3LCfbJ2iYEe9nf2cvSUfqIU/Q
         ILeGLWxLeuEHHaAu9fxJl9GISfviF6GuTohGD0uDvhGtSsIsXW9vezeRDfyx2By9nIh6
         btrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752356642; x=1752961442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJzPr9w7Pyu1TsVJ2QolyITY32C7As+7Er3afc51O5c=;
        b=FqMq8ghx8JwSoCiLRP7nkrxVgsMOWlWYGREDieZk9DmrWNcKs933LJwSbih6uiYfMI
         +0LOumSk8CsPNEr9H5+FHO2PBFx6FuyPc1KTwV0Ph0+kjfQOUntO+vTzt4vae4eHFG3X
         d5/YxX1dDIB2htGTPIrikxWX6T41mB3G7dtJcSfhqUXWOL0ygovgbI7LQC7QrVWW4Ht4
         YAb8M8sOBogxNYIFnHRY2R5/Ur2uIV70G4Wj03muusLDGFWhIv2tE3PRi5T7ZMRIZ+fQ
         myojvUvkbX5aBClmW6eZpECu3RWQli5MDDJ6r/TkC8w9Hy66FmQtSUpOW8ZFZWkx8Q8M
         chXg==
X-Forwarded-Encrypted: i=1; AJvYcCUb5Ic37roKqrAT9nDf5KzXQbkGqCCFLePWpeOtsooZN+RW+u83yNt2x81kj8TJcD1tT48NMQhDRBCTX2oc4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhn6mb3gqVBPVwMimewcRw86XNuwbXOwWa1M+ByXs6aboCmFFG
	2lzjH5Lx0+LdhFqeQ+CYBuhoI17uMgvsHOa1dd0hvvID4K9/qoQbcKCKCaxazMWsQDs6Rri1SA8
	8mmPOtC4r3XXjteL9e9vFTcgLjDvGh7PNoP0cbAp2
X-Gm-Gg: ASbGnctNOgP4NZRaEwKjZZR2Aq9zlsYXjOr9i3GcJJz+awh0gZ+7Evzc7hIABS6q3OL
	Za+NE+b9b3moYfzbJKIiAYnaRCqcQgJwpZcjgr/W51w/xgYuLl8wL2ctcPYxDlhIPq0ArgBWUG5
	rMnkcV5UK2F9TqZVBpMZCCamgW9eFeVEGVUVuZnUSAahghpDQ8G8kENAefqj+OL4RZnqIYvIMrh
	78gPKHD
X-Google-Smtp-Source: AGHT+IEJCZL2ARGJeEeEwvrVmP2Ub2cGteMg+w7kiF1YDvqzpB5wrAQNEs5BtROFcFTFw+/s+TKqny8W+JPLAoTfeEQ=
X-Received: by 2002:adf:9d8d:0:b0:3a5:1241:c1a3 with SMTP id
 ffacd0b85a97d-3b5f18a7eb2mr5744590f8f.50.1752356642103; Sat, 12 Jul 2025
 14:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703-topics-tyr-request_irq-v6-0-74103bdc7c52@collabora.com>
 <20250703-topics-tyr-request_irq-v6-2-74103bdc7c52@collabora.com>
 <fcdae3ca-104d-4e8b-8588-2452783ed09a@sedlak.dev> <aGeF_W74OfhRbkoR@google.com>
 <49ABD63B-05C6-4FDC-B825-5AA2ED323F1C@collabora.com> <CAH5fLgggM7ZCX7nRz7M=hkxwzcp8UA1=2BQqRFA2CgN9eEUmsA@mail.gmail.com>
 <82EFFBBD-C6BF-444C-9209-70805E31EE9E@collabora.com>
In-Reply-To: <82EFFBBD-C6BF-444C-9209-70805E31EE9E@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 12 Jul 2025 23:43:50 +0200
X-Gm-Features: Ac12FXzMen0His9GRs6zooYieCyoacBxhr-tKSvLnOA_LIg59_k_fvdb-RWybi0
Message-ID: <CAH5fLgiCVJbmYd0QC1n_ANeJoDbxW_hn-i5FnUkd5Hx6fxQ=fA@mail.gmail.com>
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

On Sat, Jul 12, 2025 at 10:49=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
>
>
> > On 12 Jul 2025, at 17:03, Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > On Sat, Jul 12, 2025 at 6:27=E2=80=AFPM Daniel Almeida
> > <daniel.almeida@collabora.com> wrote:
> >>
> >> Hi Alice,
> >>
> >>> On 4 Jul 2025, at 04:42, Alice Ryhl <aliceryhl@google.com> wrote:
> >>>
> >>> On Fri, Jul 04, 2025 at 08:14:11AM +0200, Daniel Sedlak wrote:
> >>>> Hi Daniel,
> >>>>
> >>>> On 7/3/25 9:30 PM, Daniel Almeida wrote:
> >>>>> +/// Flags to be used when registering IRQ handlers.
> >>>>> +///
> >>>>> +/// They can be combined with the operators `|`, `&`, and `!`.
> >>>>> +#[derive(Clone, Copy, PartialEq, Eq)]
> >>>>> +pub struct Flags(u64);
> >>>>
> >>>> Why not Flags(u32)? You may get rid of all unnecessary casts later, =
plus
> >>>> save some extra bytes.
> >>>
> >>> It looks like the C methods take an `unsigned long`. In that case, I'=
d
> >>> probably write the code to match that.
> >>>
> >>> pub struct Flags(c_ulong);
> >>>
> >>> and git rid of the cast when calling bindings::request_irq.
> >>>
> >>> As for all the constants in this file, maybe it would be nice with a
> >>> private constructor that uses the same type as bindings to avoid the
> >>> casts?
> >>>
> >>> impl Flags {
> >>>   const fn new(value: u32) -> Flags {
> >>>    ...
> >>>   }
> >>> }
> >>
> >>
> >> Sure, but what goes here? This has to be "value as c_ulong=E2=80=9D an=
yways so it
> >> doesn=E2=80=99t really reduce the number of casts.
> >>
> >> We should probably switch to Flags(u32) as Daniel Sedlak suggested. Th=
en
> >> it=E2=80=99s a matter of casting once for bindings::request_irq().
> >
> > IMO the advantage of doing it here is that we can fail compilation if
> > the cast is out of bounds, whereas the other cast is at runtime so we
> > can't do that.
> >
> > Alice
>
> I=E2=80=99m not sure I am following. How is this compile-time checked?
>
> >>> impl Flags {
> >>>   const fn new(value: u32) -> Flags {
> >>>    Self(value as c_ulong)
> >>>   }
>
> Or perhaps I misunderstood you?

Well, that particular implementation would not be. But you could
implement it to compile-time check.

Alice
