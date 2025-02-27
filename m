Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A468E22FF4E
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 12:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658276; cv=none; b=V/MUI8bqKOglz4/xgsQE6iwsdyghxms+809q0/DfWgV/We73T8Rf5LZA6MCxei4asePvkk1KkTevguTQXVz1yOvBOhUIjS+0JGo6vANQrOFhrjgjOKUYgel9CHNziyPSPK6a2AV783zZSaj2bScZeHgpLiR0CNmFqeoOvGzrRqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658276; c=relaxed/simple;
	bh=PTMEKD2EChQP2kUhaxHvIOqhyTFQGOfvfgMjLfpR2Rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHAW14JkV2WDRk5GaWxNkYxQXIldnVknmz4b2mFOhTbougRGohW4c8XD4bQ1hFKoJp63bpVjiGUoN/H9IxPQtvmKXuqUWtwh3fi3SeWpHkjl+nw1LlJ2MlL2zuHoRY6ASHSa8xDIc31GH9rbjKpGtu9qmuFHNBUB0S/8urAW3Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=majmujgv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="majmujgv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-390dd3403fdso676045f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 04:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740658273; x=1741263073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8TH4Cvj18nm/1BUbuXS+Iv/nce9vLQaK2uqdnSHHx0=;
        b=majmujgvDUhIovFjTOd5dpcniOfeRDr5fYyu25ARNxKPhMsZtalkK4ws8uiI1XKCkH
         7EAscE9msTp6p1tymVxAS7wqLSbaDuY2SUEC5N/ebkyX/UI2Rnr+3bCHGL7Z5JCre9wm
         8lR1vg68LzuhjX/tOohr2ZdmcW5G2yfFkmz3Zh+S/aQBGN0YIzSDXOukbSgg9EvVNJ3v
         rYwieFtOMXqpSa1Vu3Kxgu7ovNk+QuGUvWN2cWRwXqhu1YQqOEa6CMIPgWk7jYt5uMdL
         qWR171QMFzWFfszVFn2PloScrqBOY1mQRVQbaS3GWcs2vdxe37Sn7gxAFcMyPqyM0esO
         vckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658273; x=1741263073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8TH4Cvj18nm/1BUbuXS+Iv/nce9vLQaK2uqdnSHHx0=;
        b=tRIVgZGfQXLQxhRy2dit9WjpDNHmoTIundA14os8UIQlGxgj8wj98PSHkOc+OQ0b1K
         BfHvCXrulF9baBhRfXmvbxuJ1Ngp84kKv2muskH0mtIayi3r0vuidbni9voKL3zEAu5o
         8pq/j3CY+c5+DtbprOVtQyjXLNYcUdx4auzvGdh2U2GorNygGVI0Lg413NJFEdMUbVNA
         Xzp+AzN1Td+jij9pR4wGPzufUryUeVYFruxuHbs9CDIGlv8y94LIQEqb4r/wyzhQDGy0
         iQsuhZ3cdG0Mw5RkPNwKquXf7da0BDul2tSMryTsrcwbVZlJw6W3or46gjf2HUfN5oWb
         OorQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBcarb4lhrMwSsGh5Lx+RmQHm2N7OaQmSe5RtOBqy+622V3yx00bS2mBOaDK6KtTxg5su+tZK8uJJ8It4SOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ivzogY+6LP2Dw9+Tr8hG5nTmJD4OVWwlqIEbs3UFYgzdHbVQ
	OVZTVP/WxucPwvaSuNWLUjkgvIkofs59KsJxfq+RiqMtivpV+Lyq6ZDwDADhLtkmj6tB4+ve+ba
	3mMnDd+wD2v9U+x2lORHXW6ajOa3Q8YW7zDFp
X-Gm-Gg: ASbGnctCxj4hUBxWZcDAnsRbZR0JavNOZOJYUXWxJvfc9on5/ZRdVeC5hnEkdrDj3mS
	YCEo6ih7A/SzGwAVOw/igxVr69CoQO5zJwcbBh0o8swP66zxyMdwsSCee11bGLo526kDw/VRVhd
	umZEAirSa3p4cm0KdNcxkuurF4ZrBajI0k1aXR8Q==
X-Google-Smtp-Source: AGHT+IHaWCAPtldzHsXOX8LfMuJ4Kn2aOpz1eqAYmusznWkd40J7PjFBmbpkDGHYUXSXXq4IKAHJ0rYjP2C7bAgbVzI=
X-Received: by 2002:a5d:5987:0:b0:38f:4acd:975c with SMTP id
 ffacd0b85a97d-390d4f430dcmr6047575f8f.27.1740658272861; Thu, 27 Feb 2025
 04:11:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227030952.2319050-1-alistair@alistair23.me>
 <20250227030952.2319050-10-alistair@alistair23.me> <2025022717-dictate-cortex-5c05@gregkh>
 <CAH5fLgiQAdZMUEBsWS0v1M4xX+1Y5mzE3nBHduzzk+rG0ueskg@mail.gmail.com> <2025022752-pureblood-renovator-84a8@gregkh>
In-Reply-To: <2025022752-pureblood-renovator-84a8@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 27 Feb 2025 13:11:01 +0100
X-Gm-Features: AQ5f1JqUVKP1GAP99zBTs6W1IB0GTaEeL8d4qVYR5_PRZUXnpo-FpP_nPI9vjHw
Message-ID: <CAH5fLghbScOTBnLLRDMdhE4RBhaPfhaqPr=Xivh8VL09wd5XGQ@mail.gmail.com>
Subject: Re: [RFC v2 09/20] PCI/CMA: Expose in sysfs whether devices are authenticated
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alistair Francis <alistair@alistair23.me>, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lukas@wunner.de, linux-pci@vger.kernel.org, 
	bhelgaas@google.com, Jonathan.Cameron@huawei.com, 
	rust-for-linux@vger.kernel.org, akpm@linux-foundation.org, 
	boqun.feng@gmail.com, bjorn3_gh@protonmail.com, wilfred.mallawa@wdc.com, 
	ojeda@kernel.org, alistair23@gmail.com, a.hindborg@kernel.org, 
	tmgross@umich.edu, gary@garyguo.net, alex.gaynor@gmail.com, 
	benno.lossin@proton.me, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 1:01=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Feb 27, 2025 at 12:52:02PM +0100, Alice Ryhl wrote:
> > On Thu, Feb 27, 2025 at 12:17=E2=80=AFPM Greg KH <gregkh@linuxfoundatio=
n.org> wrote:
> > >
> > > On Thu, Feb 27, 2025 at 01:09:41PM +1000, Alistair Francis wrote:
> > > > +     return rust_authenticated_show(spdm_state, buf);
> > >
> > > Here you have C code calling into Rust code.  I'm not complaining abo=
ut
> > > it, but I think it will be the first use of this, and I didn't think
> > > that the rust maintainers were willing to do that just yet.
> > >
> > > Has that policy changed?
> > >
> > > The issue here is that the C signature for this is not being
> > > auto-generated, you have to manually keep it in sync (as you did abov=
e),
> > > with the Rust side.  That's not going to scale over time at all, you
> > > MUST have a .h file somewhere for C to know how to call into this and
> > > for the compiler to check that all is sane on both sides.
> > >
> > > And you are passing a random void * into the Rust side, what could go
> > > wrong?  I think this needs more thought as this is fragile-as-f***.
> >
> > I don't think we have a policy against it? I'm pretty sure the QR code
> > thing does it.
>
> Sorry, you are right, it does, and of course it happens (otherwise how
> would bindings work), but for small functions like this, how is the C
> code kept in sync with the rust side?  Where is the .h file that C
> should include?

I don't think there is tooling for it today. We need the opposite of
bindgen, which does exist in a tool called cbindgen. Unfortunately,
cbindgen is written to only work in cargo-based build systems, so we
cannot use it.

One trick you could do is write the signature in a header file, and
then compare what bindgen generates to the real signature like this:

const _: () =3D {
    if true {
        bindings::my_function
    } else {
        my_function
    };
};

This would only compile if the two function pointers have the same signatur=
e.

Alice
