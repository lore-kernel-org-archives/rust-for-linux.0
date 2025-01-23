Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B9520C49F
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jan 2025 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737623263; cv=none; b=Xf+cJC07Rg0GTA2OYiBQD3It/b0f153q/hkjCKlIAKUnlZl+H6QE/pAnm/cTGgyjlL4hb1w6SkQXoEfDODDfvUuvp3SWVkb0Rs7LsaH2A6EBrg9ykCRmWoPrAYDN+gA3kTC5RlVy7xDxFGDjZWzUOVe5eEF/SBJgl63bVPtUcD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737623263; c=relaxed/simple;
	bh=JixD1bokgWEI1oNhfOFrLjTSj8SeVKyCS/9CorKSWLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IF2cmbfB0T8yY+QDxiH8sH8GGu0467fimq+ND1DMo4gzGVxBSnFyOHem+ix4gYeDqMGc4uS8BLXE2NQHEOjl+/P51DqPwwmFenQTft8Sa4ke9e9O5SYQ8BoyiuYZ3GQiqN/7sLotGzrvyuBgsAajEv/gh+MdODEu6+lFXddD5+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a+ZYaqJ8; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a+ZYaqJ8"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-386329da1d9so306395f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jan 2025 01:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737623260; x=1738228060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs04k9f9SHPqaxDwfjaILdviMA+hX0CFhB1h1gh8bQY=;
        b=a+ZYaqJ8tGLblJrTvo4sMHN1z9Pbved3lTz12aWirVwtAgAI7ykaTh/XlHjWEAJXfu
         yjro6o8vBu/nBG95EbiiDo0uXimdJc3P6y4o1Lb/WnzZkzLGr+Ai7KlI31HkjJXDXHr2
         //aTFQ7ZnB/tcFzNTZO01WTBT5Wm9Xgc0HisDZWlHpO9HJItMdCMtmGuMheMJPqjTGmi
         1zbXpTe5+cLcU5pRcZNCMsUGzk53TIG2fLEBdPNH8vcHtD6xDGSfeTMg5XychB61EI0T
         RubeKSdE6aNTQj87Ljhbi/B9EiA3m3YD5hUD5JXbY0SSuW1BojBxA8cBaYLeNIxzfqe2
         gjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737623260; x=1738228060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cs04k9f9SHPqaxDwfjaILdviMA+hX0CFhB1h1gh8bQY=;
        b=P4b+cEse6S/jmdelyWemp4fn3UCM0Y0O0oVTchB21TkWQOpoUXip3QGFPKkGQx+WkP
         QZXJwA4iOFqP+aMQLMrXpYeF20PjZCX7GPjC6fkHfKbGhPHn1ILCJmfcgjJj8nuk7x5a
         wN9xdGsNEXC0O3xykiTfSw8Q3lNV5bawzc2z+4u4Xa7FJCj9YcRetZL8FTVJQ9A5C08r
         p1X+0yUHQq8BJoIw3rKlcMF64GlUtQ6kIczHfMlE0uGHtxe5QOgJAAU9JJo18b3QlN8e
         ULWqcA7s0fqBIEhbZYZ9agU4CzzS65OFx16LiuiWbU/c/T2xame4am6329aWZ5km4l+S
         sMQw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ4ySqLg4ZtrpyYz/kYZ3E3mVhMhQJUMTvQ9Vl0t/EKNadAdsdqCuI9J6ynN2nanv3liXr7HSveag2y1212w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzToZTjYgibcPs4AoNiwQLeKBZHyNhonxXQPQ94QrP7movS0G68
	e2MSzNgA2xZKjTsBD+NayizGQMnimk1LE1A4mAVTb7eT8tD4lN/PXkrlLuKHW945DJZB0pl2Wpt
	MDCGIpDNp4WbgCThHjJOvoC+INDmInmfak8bA
X-Gm-Gg: ASbGnctFrJOEfXBeG3OZD0DVQxZeUPhab9TBU6tB+Ke0BeNw7iHzcxEeYPaHpC5nRpe
	2d5c8kVlfJWaQEPSIO9zmO7Uv922cmGYua84mPnNNxFqxG+d4V+9p3AudUIWqixUUKOU2bbADWu
	qUgNLTw7vdIW0LDA==
X-Google-Smtp-Source: AGHT+IH2Xn4RJdloALFnfbAxXGsyLJwpP2UJWndN5RMAzpwpOZaygaYIuJkWXpxToWK4dNx1JWBCr5m4bF1OEJVWJR0=
X-Received: by 2002:adf:fb4c:0:b0:38b:f03c:5bb8 with SMTP id
 ffacd0b85a97d-38bf5662030mr19511346f8f.14.1737623259630; Thu, 23 Jan 2025
 01:07:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122163932.46697-1-daniel.almeida@collabora.com> <Z5HtHVMipAdNvOcj@boqun-archlinux>
In-Reply-To: <Z5HtHVMipAdNvOcj@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 23 Jan 2025 10:07:28 +0100
X-Gm-Features: AWEUYZnHdTyL7XssEBacIbRcSES0O-3DSDCVgBiFlXTOjLFTpYkN1mtg8Dtmddk
Message-ID: <CAH5fLggSET--eSW=rA_hw2jAyAO6_fa82gm0X3qeanXEvmZscA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: irq: add support for request_irq()
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 8:18=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Wed, Jan 22, 2025 at 01:39:30PM -0300, Daniel Almeida wrote:
> > Add support for registering IRQ handlers in Rust.
> >
> > IRQ handlers are extensively used in drivers when some peripheral wants=
 to
> > obtain the CPU attention. Registering a handler will make the system in=
voke the
> > passed-in function whenever the chosen IRQ line is triggered.
> >
> > Both regular and threaded IRQ handlers are supported through a Handler =
(or
> > ThreadedHandler) trait that is meant to be implemented by a type that:
> >
> > a) provides a function to be run by the system when the IRQ fires and,
> >
> > b) holds the shared data (i.e.: `T`) between process and IRQ contexts.
> >
> > The requirement that T is Sync derives from the fact that handlers migh=
t run
> > concurrently with other processes executing the same driver, creating t=
he
> > potential for data races.
> >
> > Ideally, some interior mutability must be in place if T is to be mutate=
d. This
> > should usually be done through the in-flight SpinLockIrq type.
> >
> > Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > ---
> >
> > Changes from v1:
> >
> > - Added Co-developed-by tag to account for the work that Alice did in o=
rder to
> > figure out how to do this without Opaque<T> (Thanks!)
> > - Removed Opaque<T> in favor of plain T
>
> Hmmm...
>
> [...]
>
> > +#[pin_data(PinnedDrop)]
> > +pub struct Registration<T: Handler> {
> > +    irq: u32,
> > +    #[pin]
> > +    handler: T,
>
> I think you still need to make `handler` as `!Unpin` because compilers
> can assume a `&mut T` from a `Pin<&mut Registration>`, am I missing
> something here?

The current version operates under the assumption that PhantomPinned
is enough. But I'm happy to add Aliased here.

Alice
