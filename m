Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002EB2DB7B9
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696173; cv=pass; b=WOE1MsOQyasw6DYGxwI+IjKQ5OUqaBdi3EYCwOxjfnXL0fGchC2xnRuol+MHifqzebeALAuug9B9K7Lb0+epSGCt5pVN9SL2kbdyKuiszKikhUHe8Gfm4EL04wjqvfJLe2pK9M6StId95uMatPnZZQ5go/FkFETNpvZI/kDc3nI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696173; c=relaxed/simple;
	bh=wFZ3WcatDhR5uImQkZGjiMV/Fklf+6X2ZjKbOG/rOjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pv8GWtMSeJuQx6De8ecljLq2c/1qh00JVj/kNZ9J32DigTNRAB8Jq2jW/qGAAC9b9N/ejtZZSqv8O2/Ah0tjQj0YM2FXXph8vyKlrMkIHgDR6Hjd88M05PanC7Gh2msXVJuttt0BFvK5rm2gdw3mRpJO/iPV58oM2gj5SU7j0TM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6a93qI1; arc=pass smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6a93qI1"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bdf96b3faaso344660e0c.2
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 08:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783696171; cv=none;
        d=google.com; s=arc-20260327;
        b=PWznr6MbQBktMeKPlkbETdhJ0HzSHBQPYBATaD8uf/TWPqula00rwCmHH8mCpF5+wC
         fMhHe6ZJbdqzstV7BGkINzM3pXPTNpKeogA2ZEea4zosiZs4xQdS/Ik8EA3r6fZjJiH/
         oPuaV7MEkaWjljNPfj2/WEkzPnjNFArVUjOUD+Qqtp0VUqigONNLmfI7FeYWTA/wj3yE
         CAIA4PBp4nY6cvRdiS9SO/XAZdvml/d3IniQ7l0JLeqenN0ApWeW6mr5zFEz95Tv6oyT
         468WwuzWt2hcOIbVxDk78sXioOF+bgn0UMZzAkFBoSXGAVCxDZ4DOSxzCUGhNLexYm/o
         IKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xXUgud4G/O9l9flAkvY3taGec20Vgh1cA8EQbaLr8+g=;
        fh=Cvn/a7ufPfgGwYPBQ13awov/txpAlVCjYLKBopKX9fg=;
        b=Ph+Mg/ZvRKFQONirC8GGlmn3cI21nwwoZgk9AS2+mvWsH4DwB3gZ7YAfwbcwRv8qiB
         lv5vDwwluXcNlbx4kIgaB83+hC81VWbGgMRrRxPNvCSupFOFCN2gLQyvexHp+VYRJoaf
         tyxsRi80fh9bmOvoPVSIfq7Z87oaSB33f8j8eUi/i9hbFZkTDfrbACKuAJLTdZiln92e
         tzldUtAPsJtdCACUgPeLKjjXpTu1s+N1TS2iLPjJVYLNDr4gXghR4GlHQqAoddbNhHrH
         Vj+yKa1bnv+Tl+y7p02RmSdiZ66MVMb+1hkIi42CW3o8b+1Q2uKTGt1B172QXVTu9KMb
         9Pkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783696171; x=1784300971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xXUgud4G/O9l9flAkvY3taGec20Vgh1cA8EQbaLr8+g=;
        b=N6a93qI1ROa+Lyk62cqjsMnPCJdF0ro4nIGjWR5tyshmeMrbE9dTRsCZIFeQhCRHNs
         zzVT/RLk3rxoBMV+dcDcG8Ffti0e8Sn8N6Ff0VS7moEfE9gtRVY3qOhYoxy0OMOfXUfb
         CbZp8kXzZ2QoptIf3k8CIpZvv/bGYKs7rrWT4IQ+cgsmlOxGDBhPMNDe4+tzAdfOXjuK
         H4Mh/vso7M3x0zmmqOUZKDyQ4grhNH1b5GjF0b3WYiyFXtsOfWieCSbIru74aMxuTGsM
         jp/oCDDX8nfNuuEZPnCkmCtveSSIHN/9flGnqw+nYeqpGL37oTPb/i/HiwjVJUcm6w3v
         +YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783696171; x=1784300971;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xXUgud4G/O9l9flAkvY3taGec20Vgh1cA8EQbaLr8+g=;
        b=i/AiU9hTTWaS3BH+5v6ljncEDvVV8F0NuD11/74fIY+iVhDC4bh78Skn4lVu4L7Lsk
         hi4KyoL+1++O/ifAoUGUpYOggo67Xdypz4agESYIwk3WQS3+pvQY3Q+OC5WuiXT0svml
         bGuHNyMWHoKT6IqC5ytYWi5dAqJNdp3BoZp0Fj/ae5mVVfjCMqTjZmOWkcsenwf/gUW4
         NINIj6R8Abkv0b34Qhu8tZcQ1aD3c9+G++8JcPirsNR71b3Q9buBOkY9q5W2LunIZWNe
         0L8J0fAiazFxOeTUyFLn+Qk2XYi99B1XKNKWTpeeRXl5WwsriE3qoWTfkg+G8/Dys2xP
         EljQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBGYugHIkhZBqWVJhviGw7UswBSJ6zHbQ/mjAhs36OwlZ0/APsiuciDVgc8N/sCYxVlfWm/pojIrxrSCxSgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3VrOjh+M+CcJ8KzxW3GBJhQJldlsrugFuAKFbY8lYnwR8cJi3
	qa4n6ieoiVMvpfsb7sz+xc5HtyGcPjpJXyt1skllW2u/Aai9QPcAVTDPWflSXFrGa4XNOvVqvu/
	kvIB4T4gRdANYfwCUYvKFIaTI3zerNr0=
X-Gm-Gg: AfdE7cmf3kir1Re9oZeLO/S7h686Cai0IaYG7VAGmhnYsY4hgBFc+WPhO3ZEe7PTnT9
	2OtbRPsV+xfg5vfXa3SaLG0D+g/9WlBNO0bPluHZ+z3NE4D80YO9vJ/4kphdua32rk8XPjmm7A4
	8/KI5GA+MuxZW0GFjT4szSlh6Ei+Ct57q4bU0b/WNyhqjqDy7Uzoen2+1HTR6IzkgOtlKa9LlyP
	11Ra5xwOkyYfpryaDFrunMyJ1ZnLROOc2JFzsoRMDADN8Nxt/+ThHjcZuvEfE9q1HFmo59Ocnxt
	i1mgRr/8aV586HX7mk28fFtSWb9nPZBp+/ouAg==
X-Received: by 2002:a05:6122:2883:b0:5bd:81fc:ebe9 with SMTP id
 71dfb90a1353d-5bf75a9fa9cmr6210645e0c.0.1783696170828; Fri, 10 Jul 2026
 08:09:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <20260703-chid-v1-3-84fe8259e46e@nvidia.com>
 <2026070334-dollar-hexagram-e49c@gregkh> <DJSDFHOADWYL.V4WC2TI9UWYF@nvidia.com>
 <2026070745-unwired-maybe-769e@gregkh> <ak0pzDc69nAmnviD@yury>
 <2026070839-quadrant-gentleman-2334@gregkh> <ak61Embrj0qH1vas@yury> <ak68PmjY97BHOZOd@google.com>
In-Reply-To: <ak68PmjY97BHOZOd@google.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Fri, 10 Jul 2026 17:09:16 +0200
X-Gm-Features: AUfX_mz71O6wKNiBjknUzlHPuRHRfhmrp1Ke1wablmRwTKjPL09QiGzeg2wSZG8
Message-ID: <CABwQupO-vow5+SqHUpyXZouP=rjNL3cuV=yWkK6v=xLt0MKEAA@mail.gmail.com>
Subject: Re: [PATCH 3/4] rust: id_pool: add contiguous area allocation
To: Alice Ryhl <aliceryhl@google.com>
Cc: Yury Norov <ynorov@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>, 
	Eliot Courtney <ecourtney@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 11:08=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Wed, Jul 08, 2026 at 04:37:38PM -0400, Yury Norov wrote:
> > On Wed, Jul 08, 2026 at 07:33:16AM +0200, Greg KH wrote:
> >
> > ...
> >
> > > > I asked exactly the same question when Alice and Burak added wrappe=
rs
> > > > for bitmaps to implement their ID pool. This is the answer:
> > > >
> > > >   An alternative route of vendoring an existing Rust bitmap package=
 was
> > > >   considered but suboptimal overall. Reusing the C implementation i=
s
> > > >   preferable for a basic data structure like bitmaps. It enables Ru=
st
> > > >   code to be a lot more similar and predictable with respect to C c=
ode
> > > >   that uses the same data structures and enables the use of code th=
at
> > > >   has been tried-and-tested in the kernel, with the same performanc=
e
> > > >   characteristics whenever possible.
> > > >
> > > > And now it's in a commit message: 11eca92a2caeb
> > > >
> > > > They measured the affect of their wrapper on performance, and it ap=
pears
> > > > to be ~5%. See lib/find_bit_benchmark_rust.rs.
> > >
> > > You are comparing the C vs. Rust data structures here, which is not w=
hat
> > > I am proposing.
> > >
> > > Also, is this code being used on a "hot path" like the binder stuff i=
s?
> > >
> > > > I didn't see any side-to-side comparison between any native Rust AP=
I vs
> > > > imported C bitmaps. I'm sure, I asked for that, and I still believe
> > > > it's the important piece of data to avoid this back-and-forth type =
of
> > > > discussions. So, Alice, Burak or anybody...
> > >
> > > Again, I'm not talking about Rust API vs. imported C bitmaps, I'm ask=
ing
> > > to use the C structures like maple-tree and idr instead of open-codin=
g
> > > logic around the bitmap code.
> >
> > I understand your point. I asked both questions: are they sure that bit=
map
> > is the most optimal data structure for the ID pool, and if so, why not =
use
> > the built-in Rust bitmaps? The answer was: yes, it's the most optimal, =
and
> > using built-in bitmaps is suboptimal overall.
>
> The Rust standard library doesn't really have a bitmap abstraction to
> begin with, so if we want to use bitmap then it's either handrolled
> bit-manipulation or the C bitmap api.
>
> cc'ing Burak's new email
>

(Thanks, I will update my email in the MAINTAINERS file.)

Binder needs to acquire bits *while holding a spinlock*. This is the
biggest constraint.

My understanding is that the IDA API call might need to allocate
memory (and sleep) when getting a new ID, as a side-effect.
So for the binder use case, it was not an option.

@Yury, about the alternative of vendoring Rust bitmap crates: that
would have duplicated the kernel's C bitmap functionality.
There does not seem much point in duplicating that, and opening the
door to have Rust and C code differently named API functions and such.
So beside performance, maintenance and coherence are also a factor.

The Rust ID pool code is merely a port of some existing
bitmap-specific binder C code (that can hopefully be deleted one day)
that deals with spinlock allocation fun. If the constraints match, I
think it is good to see it generalized and used elsewhere. That is a
conditional statement, I am not familiar with the nova use case's
performance/allocation/sleep constraints.

-- Burak
