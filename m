Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9361DF739
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 16:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742400691; cv=none; b=hM0j3OeffGn+avA5slPwCJY5lJE+Iidg4ihan/XSmVuKt+L63mXMPawJDDJfwTnS3cXfryCmTB1I4Qg/qUfNuFtzOAQI34CBHGMbqnkdAjvUCNWTTNQUk0Xz6rNa+yppQLuPrlCJlZlZBnwX6aBmQvjcWDIoo3CIBchZAwyaLtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742400691; c=relaxed/simple;
	bh=8DqBsikgA7zOXmG6eiKnL/aYl0OdYNLj+g4Ue5RXTKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUOh2RvFTY2frvVJkJ7ehpNS7Jr/TTiZy/zny48MjzssbnOByHtCghf+Yy89jWzFH7j80SntOBLR1+VjrDKqSgc+GpvtrI1YLCVHg9tOMxy/SlyQn8GxyF66cKVtIX70QcWY7wo/O5fJb0uRcmpSrl3WEgMQbpy9SeMdXo6lz0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IJ6PjV7x; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IJ6PjV7x"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3f94b7bd964so3972880b6e.1
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 09:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742400689; x=1743005489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DqBsikgA7zOXmG6eiKnL/aYl0OdYNLj+g4Ue5RXTKY=;
        b=IJ6PjV7xT2yKSD72s30VOx1xkroEkpZ0UYYWSNYeOrpzxuDcUgG3ufibNz8OWoksl1
         FPNkB9AtmM8wUgrQHyfazvDtbxftnlgudStraelfkjDQr6grsqbSGHzyv5pWY0kx1+4Z
         Nnt6vBCMHSch+H0YCZmrtICLY1Hf809encfOqLhjuR8LXOmesSgluckk8H/p8DqekHor
         0eIoWxyc3Cut/asjEVTLfbccaeqafTBufPpDOFaoWh124bZQPbYOuz1/Ku+25CvU+FZ8
         jH/ucpza5y2kliAVShOq8oFn0JBWY2sQhD7iE9jdp8NPBl7wKd2rV1ARmI2OqAkmsGyp
         z9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742400689; x=1743005489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DqBsikgA7zOXmG6eiKnL/aYl0OdYNLj+g4Ue5RXTKY=;
        b=WJYo3piJP3V47aGdmw9x8r6rXz5vwIrfulco23kcxtL7k1jwG5d9qa9HlIelwcJ6O5
         uJKbKRJ4091X4UqHAz6mSlDWNmhaXo62nsGYM0vGobafikgId+15hVm6Jx50D0pE94om
         u8mkL/Pj+wsX9rXIn+gGCosmlIFKo7msWXQ5FbkdDweHxkAtyN6D9jv9EkrzDc7iImA4
         K4AJeH0zo+VvI6yE9b+f69KXhvCINAwxbvaCIKvFKmxla6k7bskLvtEt9tl+MDLhEXNQ
         G7AlSWuvT4yK4imvFYxp37YR4SIsxrdzMlLnK3TR8GGJykkHJKyLT/VtlC2WmLcEQuAN
         xloA==
X-Forwarded-Encrypted: i=1; AJvYcCXJMjT+UnE25JRxkDjR9N7R3XLulS8UPDzSLdqCNWdGCdcV9zmv/COQGN6QxJ57FM8NEzykGZjXAOEv8D3IQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYv+N6Xx3ON0GbmydHk8N3BSjsn5IKFnN8bVc7LAg/9o4fBqUH
	q+KdvIzrAh0TqLsmKov2PIrJYTgRIrV83FXKgA1MLH68j6ms+bvWeIKhEe5Vlb5a2BKmS4zSIhl
	uoBzMwPhSoUDtO2bQjm+oMbUspT72iwcOzDC3
X-Gm-Gg: ASbGncv5SCnn9jN+lpdlUnza91VLd9WpAvOJDsLOlnsClXSMp9ph9OjTjS5Fvm2AWnc
	ddVkS/oM9jypNJcDrSr8/8ptIpnsDfaazbtQqZd755qklaOaSt0mOEakVY2hYvXQjtrsxp9EpOp
	4Cl41aKsMBWnKGVUA248UugDF9q5VB98nqWl7vSWxlZwbkvqIYGqly07PQofjGyuqeIFg=
X-Google-Smtp-Source: AGHT+IEW9jnPz92hsq7khlXESplWvRv/nknbjLt/n9wh6GdkzRZMnj0RC4JOEcC0Vxh+2e7utxkJXS51NVDXJP+g6MM=
X-Received: by 2002:a05:6808:1692:b0:3fb:177e:f987 with SMTP id
 5614622812f47-3feb4ab7158mr33311b6e.20.1742400688840; Wed, 19 Mar 2025
 09:11:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319112822.1961241-2-bqe@google.com> <CANiq72=fBJLhgW64vohSopsR0RQLch+_cKqRKDQT7yR9B6A-mw@mail.gmail.com>
 <CACQBu=UC-DmLGpg30=Dyp5hhWV7HGXG+bL73YBSq5vSa4t3mig@mail.gmail.com>
 <CANiq72k8-5YRwmcn1h+avuyusAC36ttOqwsMH_eO-DLxTm5gpw@mail.gmail.com> <Z9rroCn3MAsXz1Lw@thinkpad>
In-Reply-To: <Z9rroCn3MAsXz1Lw@thinkpad>
From: Burak Emir <bqe@google.com>
Date: Wed, 19 Mar 2025 17:11:15 +0100
X-Gm-Features: AQ5f1Jr0LaiSOo7wg9Oxek0xiU32mVJbIh4vLfpBtIPhus0dJ2MigWJRIumPGXo
Message-ID: <CACQBu=XbepNPkeGW649Ogf9PNQ59kebatpM8XTgFN162TVj9-g@mail.gmail.com>
Subject: Re: [PATCH] rust: adds bindings for bitmap.c and bitops.c
To: Yury Norov <yury.norov@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 5:07=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Wed, Mar 19, 2025 at 04:43:50PM +0100, Miguel Ojeda wrote:
> > On Wed, Mar 19, 2025 at 2:58=E2=80=AFPM Burak Emir <bqe@google.com> wro=
te:
> > >
> > > Thanks, I was unsure about this. I understand the desire to not add d=
ead code.
> > > Yet, next-20250318 does now contain helpers for `cpumask.c` without
> > > corresponding `cpumask.rs`
> > >
> > > So, I will include this in v5 of the rebased series, but with BITOPS
> > > API BINDINGS [RUST] in its own patch.
> > > Thanks for bearing with me : )
> >
> > No worries at all! Perhaps wait a bit in case I misunderstood and Yury
> > wants to clarify.
>
> Yes, the general idea is to be able look through the all software pieces
> in a single series - from C wrappers all the way down to rust end users.
>
> This way I'll make sure you are using the API in a right way. And I
> think I already helped you in that department, right?

Yep, thank you for the timely reviews with the comments. The series got
quite a few better. I'd love to be as timely with sending back the new vers=
ions,
still getting used to the conventions, workflow and limitations of the
infrastructure.
