Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A55514D2B7
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 20:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731960280; cv=none; b=YMh36YJl/UiA1glCJtf86LLvh0Ow2jQrhKRW1vXvUQHn4jYHju2L6Ynmw65yFav6JIkliwAzd1iJrD7kObWFbUAsA7NxnCK/L5PFR2QLTcoPUhH7us66PlXms8ryu5dHiXjdjmzDwNbBu7sLslR2Jmskpi32/7IIFTsQYcne/ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731960280; c=relaxed/simple;
	bh=KEJdLneilzcmp6yfaFHQuCSYW3bEEjpFcGPreEKZPM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TyNviuDhRppYxTbkdes7b40JDpD7o/mfUostFdItaCcQ7tiiKlD6Hb0gcVIu/MeklUuKzhBe33gBG4eBF0WXHl0fC1lFbY8JhxZwB9pc5fM901cfsupEDLFGD8OKV5RqKz6uFOyMhe/3o6qVM9wk2IeN3WOodrYUMjeWSN+Q3Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=XO6PmAJ6; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="XO6PmAJ6"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-296539a58b4so1064386fac.1
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 12:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1731960276; x=1732565076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEJdLneilzcmp6yfaFHQuCSYW3bEEjpFcGPreEKZPM4=;
        b=XO6PmAJ6XdVLBRgzrDoe9ChZqBU6e+vd4q2pCUv3jK4gNp4hJzCkQxXVnYKWzC1Fdx
         G4WsnHgoiBRZNl8abumObXSjmR+M+5FaDLaHsEe2nJfkOzqJsk1Iqqvfvs4N7MHtqaGv
         S3o2jOYYw3gUm0kotSpbW1oJCxYBEAE8NgxWtCuud74mwdVYXSXSmd6APQCiKlAv4wnK
         QiUv2j4sQIaMnL2wc0Uc7DAEGaN5/iPJBvEXzfh4Rdg/Kt3UGFJMd7wU5ZXrvT7jVNyB
         WrQh4JJeUhvOwiSET01ApiNIdi0LI6h9UBtUWYoZBKrs6e2bFBn69G24ILE613PorBrD
         NpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731960276; x=1732565076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEJdLneilzcmp6yfaFHQuCSYW3bEEjpFcGPreEKZPM4=;
        b=qAA+25RqDzmGofIOUcgsoDdlUMhorZkLd/aFpjUU2CKyElXp9T0edbXRmxjWXs4z1P
         Aq/p7YF8IhGWcXkqTcOZKrxy9dIaJzrEgIVrp6xsSk/+XjpoBKX2kHoposIlNLterRoM
         bYnNi/wy+DzovXsQejAtLrwlRa80I8ETmU7N5h8sxmmTE3tD0c/5ONyieitCh8TPaCX0
         tJovzZD8umNgHNnB7CIuLpwQM1Tc7TPy3DQlmEPdJ4TR6fUUtai3y2EvuB8TXaWIqlKQ
         /j+Gpel35aYnuiXjOQg4WuGUWT5Kx2mVE9HGQ31mfumqWxSaU0+Th4kOpQ/DV3Xf5w9C
         0I8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXq5qdr4TuEG3opkMIJJErIwr84THBv+P6l6fdqWI78hdki/DxOTU4HY0+BU0przCVPlSqiqhU8it6atr1TqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIXZrZi1P7Vp7tse1eLbEhHS07FxFQ0hwc+TZZUd3NJN9yCv2E
	z4L4Cwti7vn+P7IftbbTVcrUp0VljZZPXHofNcSzSW01Mr7Uk1wz5wXLZBLJ+UFt4aLILfa8Ndr
	ycmXcRNYH9NEKcxA9vTdzemUD+CTp763phGaxSw==
X-Google-Smtp-Source: AGHT+IFAXGEh8EuuekTO5PDc4GRvhZvH/hCqleancmLcxLDoNs6g4Nue3CL3qJPcM46HXjqikU7vqAY6lKuR5J9Hi+I=
X-Received: by 2002:a05:6871:80a:b0:288:461d:e1da with SMTP id
 586e51a60fabf-2962e2aaf1dmr10567367fac.41.1731960276121; Mon, 18 Nov 2024
 12:04:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116195221.373332-1-daniel@sedlak.dev> <20241116195221.373332-3-daniel@sedlak.dev>
 <CANiq72ndAQs4EyY22pAJdjD2x+eXsBJGYXFebuVj_zD77nqfYg@mail.gmail.com>
 <CAMFZ4eQQELStY48SLsRzm3BkKOs6y8AOnQ1A27HjHAufeEiD9A@mail.gmail.com> <CANiq72kTzQ7dzJfG5PxYKfSUafJ9vGz66u57oaEAyNuaBQ-iXA@mail.gmail.com>
In-Reply-To: <CANiq72kTzQ7dzJfG5PxYKfSUafJ9vGz66u57oaEAyNuaBQ-iXA@mail.gmail.com>
From: Daniel Sedlak <daniel@sedlak.dev>
Date: Mon, 18 Nov 2024 21:04:25 +0100
Message-ID: <CAMFZ4eTZbzBujoqvZBxxbJOihdVhz+D49yB0OzxhJvJjjn3-+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kernel: rbtree: replace unwraps with functional
 programming paradigms
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Matt Gilbride <mattgilbride@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 17, 2024 at 9:33=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Nov 17, 2024 at 7:36=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev>=
 wrote:
> >
> > But if you think that it is unnecessary, then I will only tackle the
> > previous scope
> > of this issue as you mentioned.
>
> Let's see what others think.
>
> (To clarify, I am happy with the change I quoted for instance)
>
> > I am not sure, whether I am using the clippy right, I am compiling with
> > `make LLVM=3D1 CLIPPY=3D1`, however, no clippy warnings are triggered.
>
> That should work -- are you building the doctests? (i.e.
> `CONFIG_RUST_KERNEL_DOCTESTS`).

Yes, that did the trick. I somewhat assumed that it was turned on by defaul=
t.
Thank you for helping with that.
>
> The warnings I am getting are `clippy::map_flatten` ones.
>
> > Also sorry for my question, but which new version of what do you mean? =
Clippy?
>
> I meant the future version of this patch, i.e. v2.
>
> > Thank you for your valuable insights!
>
> You're welcome :)
>
> By the way, for v2, the patches need to have some description in the
> commit message (apart from the title and the tags, I mean). Thanks!
>
> Cheers,
> Miguel

Daniel
