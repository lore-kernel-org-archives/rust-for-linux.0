Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9210524A7CC
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 14:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736952181; cv=none; b=iBhpWiLc0CxydogfwXt2tNc0H8wUO+D+03Vr4lhbPVKmZHJkF9zlTGDxxATINqmVVwM2udSPaZmw1SNg3sCuzWNCWzOhsF2q6LxPRHp+rLnQRd9Pz6TYUUUJl/AmXk3xomtu0nHeaxGcRl7XNfIDQCf12HUwdaIsiLW2cUY8N/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736952181; c=relaxed/simple;
	bh=NfPWSrHIC689+bD5UsrSX2pw3s2b+fl6k0/Q9byTPmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ockbbqnv5rMdGuE1bnhKW8L7D+hrgdX/biCaQj3niQ784ul7R5gRVqlEnE3TGYieRfBALuMuhy16rlzns3y7hsAdKQbgtXjUL5zom3QFBwseRuSMcD35SktHsYRoLda7w81ryxjKwUxq58loZQXgjbq6JdkUJfo0mejc7xXJ9eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F1Z3IJZm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F1Z3IJZm"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4368a293339so77144285e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 06:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736952178; x=1737556978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfPWSrHIC689+bD5UsrSX2pw3s2b+fl6k0/Q9byTPmY=;
        b=F1Z3IJZmtoWSbz4anvaRe5P+CH1wRsPcbP9H2f0VMcH72a53apSDMl+fNnzF7nHuk+
         TBE4T0gkTnAfmrhtjLTmOMekk3AMplvHaLCQAgTOdxwn+tWWrXUSsljkU6sKYdgHlqKB
         IMbCfsTFGZeoOpoIPzumVAVT/d/A0v6XEaUz7xn/cn0hecVV5REh4LGD6nr4SOxRokqm
         MUdM0AF3S2WdQQZfqfdENSonAT14KYJNC4CBq1CJjwTROFjZmevdFejuIAwj3u4kOEvK
         7uWNPhtMyitd+P9HHb1VS8+UoW5s0h1UATPUVOq3QkdZkVXdNrD0p0UARtWawLdxNWs2
         N1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736952178; x=1737556978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfPWSrHIC689+bD5UsrSX2pw3s2b+fl6k0/Q9byTPmY=;
        b=V/u/yetBYhpjth4aAo7N+HN3fRXho3EtlMklFJRD89qqDFSaM+Rtld/OQSv7nxe+l5
         aeYffJYh68ARVShVPjrAZL6z4lJ8OgwAJFZm2OBlp6FcD6TN9gHZHq8AKF4/97Y1aShv
         GJQbr5HBBV+FHUe4NP6dWRxpgunSDWyFC7x1BYXMEI8RnmKsMiwSUOuzGHdM3ldagfWR
         6Ksu5FXo6/OHZaDAX+MncRUmxK9FcPfnV9C0ZQnxNIdpoHU27pwWM+BZgjxHqePPHHm+
         vKmwbd58qbmmsxLUiuNYH+fKs3jRR7Wjslur6Ds0XfT+1jkAlywvGcAqUWfkBHmbowut
         NGEA==
X-Forwarded-Encrypted: i=1; AJvYcCXCOCGbfQm/2IR+9zePdR4xT1ROX2p1WSZwJKGQSXYTavi+HDlgWJWd469+1WfuZg/3p7JC/likwLMxpKu66w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuAcviMLbb404eFaAaasKAMcjjKX2cl9ldXWJq0i/7y99SuSV1
	Qhl76NLUHqf3yBUshgQrVPbNr+E8fSmXAXSJw0j7hd0TxBh+192fh5dqCUgWk/rJWDkzCE1o7nv
	E1+OlIUrlz6WiVwEPTh3Vog1Ypw8HqTWAmTge
X-Gm-Gg: ASbGncvKNmMmPxA1f1reOyfv/nIAR2RpUPpBltaVjz78m6ySMUYB1xGS3hNuAPV1hBM
	FlJ3C2QZ1fgUTlL16johN8uLA235CDbZaYU8ltgk=
X-Google-Smtp-Source: AGHT+IHu9Udu/vPBRUK3l8lMGiSfXE7Fphn+ktYKzxMmCRYfwdy3Z8KY6u5ywgXA46jiRY+Ync/XwYBG0ObW47vnUIU=
X-Received: by 2002:a5d:6d89:0:b0:38a:8ace:85e8 with SMTP id
 ffacd0b85a97d-38a8ace860fmr26918498f8f.44.1736952177744; Wed, 15 Jan 2025
 06:42:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
 <CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com>
 <04864DC4-FA5B-4D7A-8EE5-BDA1E8F88007@collabora.com> <CAH5fLgiaVg1+PZxGr0Y_oyu9pJfTSRuN9n4EomFGhnvnZXC4cg@mail.gmail.com>
 <20499935-B328-4DE3-AFBF-B692FA3434E5@collabora.com> <Z4cFO5NIW-E07Vl5@boqun-archlinux>
 <CAH5fLgge1pp10a8w4xp1eDobMJUHpnM1Ezh+JHmVmfF=6_vpTQ@mail.gmail.com> <Z4fIi_Gr0XZog4Ye@boqun-archlinux>
In-Reply-To: <Z4fIi_Gr0XZog4Ye@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 15 Jan 2025 15:42:44 +0100
X-Gm-Features: AbW1kvYcl2pht93-O_xpTLQ2AAU6rkhrACuRwlq7EgtXIytCTqUv1WkDv28Z2A8
Message-ID: <CAH5fLgj6Wnrn6Ois+MbX16j2szRsBEgqVyArcGwhjEK52JnD3Q@mail.gmail.com>
Subject: Re: [PATCH] rust: irq: add support for request_irq()
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 3:39=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Wed, Jan 15, 2025 at 09:27:39AM +0100, Alice Ryhl wrote:
> > On Wed, Jan 15, 2025 at 1:47=E2=80=AFAM Boqun Feng <boqun.feng@gmail.co=
m> wrote:
> > >
> > > On Tue, Jan 14, 2025 at 03:57:57PM -0300, Daniel Almeida wrote:
> > > >
> > > > >
> > > > > It's not the pin_init! stuff, but the Opaque stuff. If it fails, =
then
> > > > > it runs the destructor of Opaque<T>, which does *not* run the
> > > > > destructor of T.
> > > > >
> > > > > Alice
> > > >
> > > > This is pretty unintuitive if you take into account trivial example=
s like
> > > >
> > > > ```
> > > > struct Foo(T)
> > > > ```
> > > >
> > > > Where dropping Foo drops T.
> > > >
> > > > Is there any reason why dropping Opaque<T> doesn=E2=80=99t behave s=
imilarly?
> > > >
> > >
> > > Because `Opaque` implies the value may not be initialized, it's simil=
ar
> > > to `MaybeUninit`.
> > >
> > > Do you really need the `Opaque` here? C code won't touch `handler` if
> > > I'm not missing anything.
> >
> > The irq callback is given access to handler, so it could touch it at an=
y time.
> >
>
> You're right it could, but would it? C code doesn't know the concrete
> type of the handler, so what it usually does is just passing the
> pointers to the Rust code (again).
>
> A similar case the `func` field in `ClosureWork`: it doesn't need to be
> `Opaque`, although workqueue callback may access it.
>
> Am I missing something here? Daniel, why this has to be `Opaque`? Could
> you explain?

It needs to be !Unpin, otherwise it's not safe for Rust to access the
pointer. ClosureWork is not the same because there are no *other*
references to it than the workqueue.

Alice
