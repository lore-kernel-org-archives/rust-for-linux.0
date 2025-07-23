Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C581C7F9
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 19:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753300710; cv=none; b=Owo4YyKZrbmL+qiWPa4BCGmM0Yi8O/BSrgkSnDZa1FZk7/uWLF6iegH0uiFE6/bgvTUnPVzQ40cawkueFrxbpIoOXbhBei+Wv3r2ClvL0LkTt6ZazQXKOQ736Q2suJwgrAqz88FehQh8DHHNzc6jvEED2leOMEA5IzMbMACNJkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753300710; c=relaxed/simple;
	bh=g8zhiVPOKgsXsJtn0IpsS+vCHNdsx7XJj10DE1qeXds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnj341KZAe3DBKfVUenk6aYNVZmUXwuHFl+jIBJoX3gxhMU4gitxRfxiFS2qwUUsWApfx1tnN/ibJtEr8QwJzEE3dQnIGEK7PUliag0a5M7LijQVD06rP/EeP38FYSbVNf6APpC9aGPoi8xOY8NVrK5nbawabdylmZPBRuS+OF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jEQZmeI/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jEQZmeI/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d3f72391so2086605e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 12:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753300707; x=1753905507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+wSphNwAMpLftkYCJIT/z3kQtESm9gjVoVF0r2++5I=;
        b=jEQZmeI/qm8uwXf8e7eim57vZffeoYpHQLAHwJG13Mk3ncIVnE2SzDAO7vhP+P2h7F
         SYS1XQLdR96ytwTiri4bNdVY8CRxKdoJ+vRk4jn3PHK/d8UH96WbiutYZR9VZSffQeQU
         gOORX//7sVdVl2vz1oULxC3p4o8KKdgGtmLM+o4xVrNrmsGMLYvGV9VlLXuMxrm+y2Eq
         b/s4W2cyfuFNRmkA6KU7qDaTPLg5KQ+l4I3zb8M3DSpH/PookHYpXRhLs+gjgUstdS6U
         83aL71uC/wFDz53mbC4HZlnE2VfFHJdd7zRPlDZC4U7HSO4XYWf4zbjmnxWGCCQMiKFr
         5c+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753300707; x=1753905507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+wSphNwAMpLftkYCJIT/z3kQtESm9gjVoVF0r2++5I=;
        b=OnZTn7Olpa/mP+A4wMMbDrllFWEJUwYHhcpUhc2WXzH9bzbMbtxi1i5bBvFnoQvOSa
         P55JfecYZesR+8b6avy/HOoAyioGE9BQZilokskU7bglwh63ZwwPAllp+cXalhGFMokM
         GmnuGbyX1KuOd2ytoHJDaRqtfTqoGApNZ/JDZoQh7MP1M5KckxZitWOMLIIpnjSeAJRJ
         S2y/8cAYavkL0u7yPpBmsuRUpJFb/imi0qhi+z8+kAttlIiQCpIPSaTxurDgDedY2gc+
         gpWUOaF3rh4RrRafUj8MkG8oSM88MVjjplZ7EC9OZ3DLW+1NexiWxt5VaBsQMdv94t6M
         WAmg==
X-Forwarded-Encrypted: i=1; AJvYcCWfWRor3ScTpLGHh4O5NbLJeXpZFto6tcFRtefPSjX+1PCO/oI6li2t5877HY4FpKeH4XswweyJcDToDYcYtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5vj7wl8bssMEgR0jeqk/yNrPgS0ruaaKYeAyApOqAn9QV3f0H
	lXn7mgKvixCZbLL26h5JNK1CLhgCl5uyi9w5FPFeMQ3YJLrlrklv6EiymdovMrd78+doC6Cf/bP
	o+IXBEA+D894WYfi4a0ykpmdMIKMtNgJIMe4Bs9LT
X-Gm-Gg: ASbGnctln7sZsQ1gwmjIKKEZ6Ru9DqNmwUxuJ5lQyszDDxhBo5a8JwT1fuCgMijpkmZ
	5di8LQ8/z1XWMF3C4ALV9H1BNupOazcYIprFHyUdMenKVi9NYrj8wxQzN2gBTvb6zgKu/pvBB3U
	DJLSfUVNpg8Roa20V6omHBG7KTnS6X1eCwBJT+8RmMXCU67y8fzc/VIGLlb2Qrc2gZ8NsQ6VtSA
	RpwzHBR
X-Google-Smtp-Source: AGHT+IFaDTU6O3IJMCvXOkDzZcTMBsDv+ztlngHv9aGs7ot96t0vQqO3XwvIou4OVwXTVfLDTeY9Gc8RfPDT1X5xwVU=
X-Received: by 2002:a05:6000:2901:b0:3b6:13a1:8861 with SMTP id
 ffacd0b85a97d-3b768ef8e92mr4135128f8f.38.1753300707100; Wed, 23 Jul 2025
 12:58:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-lock-class-key-cleanup-v1-0-85fa506b8ca4@google.com>
 <20250723-lock-class-key-cleanup-v1-1-85fa506b8ca4@google.com>
 <DBJIDFSMYASO.3VRN4ZZEUI8EX@kernel.org> <CAH5fLgjWFa8TjTL+rfv7Zd+OQqhkKqWvyTkGf60pMUyQ=c4sXg@mail.gmail.com>
 <aIELxq_iVMfjszkh@tardis-2.local>
In-Reply-To: <aIELxq_iVMfjszkh@tardis-2.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Jul 2025 21:58:13 +0200
X-Gm-Features: Ac12FXxMV-RP24FaIH2r0YNWB6v_mOHMqRPtrQ5jEyR_mwy2TutgiYw_IKyQKKQ
Message-ID: <CAH5fLgiOaZRki71X7oDPpz1OnNEbPgPLmcxbJXscdbDBhUy6=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: sync: refactor static_lock_class!() macro
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 6:20=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Wed, Jul 23, 2025 at 05:01:39PM +0200, Alice Ryhl wrote:
> > On Wed, Jul 23, 2025 at 4:36=E2=80=AFPM Benno Lossin <lossin@kernel.org=
> wrote:
> > >
> > > On Wed Jul 23, 2025 at 1:49 PM CEST, Alice Ryhl wrote:
> > > >  impl LockClassKey {
> > > > +    /// Initializes a statically allocated lock class key.
> > > > +    ///
> > > > +    /// This is usually used indirectly through the [`static_lock_=
class!`] macro.
> > > > +    ///
> > > > +    /// # Safety
> > > > +    ///
> > > > +    /// The destructor must never run on the returned `LockClassKe=
y`.
> > >
> > > I don't know how lockdep works, but Boqun mentioned in the other thre=
ad
> > > that it uses the address of static keys. But AFAIK there is no mechan=
ism
> > > to differentiate them, so does lockdep just check the address and if =
it
>
> In lockdep, we use `static_obj()` to tell whether it's a static obj or a
> dynamic allocated one.

Oh, ok. In that case I will adjust the safety comment.

Alice
