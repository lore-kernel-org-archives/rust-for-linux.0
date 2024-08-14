Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4265F15C9
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723639021; cv=none; b=NixF/up+dj3fUVAaWL7C151dVqZoeytKiZ2T2IYrfdMvzGpe5ysfyCW4iIPo2hJAuahcstuiHqGpGnv16V2hrI+tTxBfBblDWwlInbDWYFYWs+2pH8sJ7g5KOjc0+3A5m4ZEW081Nv7Z3kZLD7bL0NTotlT7aQc6hozm9SMRzf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723639021; c=relaxed/simple;
	bh=6ZdiB0uP2lP7RHGqOjJcVgCWEGCiLEplGilrezxBb7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPGL1bmUs/hh2tQaLFygOShjPCyqDCwldb+s755fOuRyMWoGA9qL2BiaCnUZt3lWCHWFZ80Fij3GQVvhG+RejPcoPm9FTjPTzHAarGuhT0zi3h5GxlNzUtn0peIzBYmevyJOiAua5rIP4/ehb+lb5myL9jmt0WLCSY1W/tb9wIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YqLVnvZ2; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YqLVnvZ2"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2cd5e3c27c5so4379819a91.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 05:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723639019; x=1724243819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsYhBBoNZ/KZiWXtsX/kspAyxbuRsaD4hUI1DCobIk4=;
        b=YqLVnvZ23J5pZuKbwAW/mYb75GCxI4UhUOgGqFA5BxOqGXIL9D73tmLGRdRfueXYcA
         vLIjeohRjeiHLgcVP2idoaf0VNfzzNy3o8/t32TWRoASEZBD3mKXqIeEeGRqNAPtlkoF
         8/ho3fD6QViNlDXci29Rs3ib2zgiPiFVYSMSovoQudaWMg+rlhMpvc6N5eF87MpHV74A
         XMKZXf54i2AnOC8HbpiLJrSuJXLqoQmMHSKn9rmpZHLRB/HCgD6v3aZLpMLK21zEPYS/
         8+K22gKPDQZRFTKua83UDMwJzXRV5Fw0QGBUove+pvXekq9qPjOFX/fPW+DuYHhg+/ii
         I0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723639019; x=1724243819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsYhBBoNZ/KZiWXtsX/kspAyxbuRsaD4hUI1DCobIk4=;
        b=Kd0WaENsFNFgPfc2xUSi469mHoaHBUwfBp7YpceBNWdJ/yRNFkd+Ix3nAsxc6Ft155
         ZZXL9yOZHHdvt+Yx9yeKndzrSFGLMHauxEySxzKwdS0OiN8QLOJ/8NlWvYLqW0lI483k
         G6X/wdJfE2XB2pTD5iVNMDjCaKHECSZV9I2FzZDq6UZbMXFF+EipzVz1t00yEIE63fGi
         SdapH+qzHlZRBQ7VFpUDi5YQHGACOzK+1LH17de4xf/cLZzapMMGjRYOE+A5rKGW/gdL
         8cCRnbE5T/6uVf19dTaGPuzZpAs8hZrfmMJlPUiaPI3QGRF/nBaxI1ZJeI8vsre8AM9R
         WTDw==
X-Forwarded-Encrypted: i=1; AJvYcCWNTGK7l54ESLD14BAA/4tLB7rkZH2kkXedS9JNjsesHQdPIf87LW+BdKLuNFWX7jsqREw/njb7+Nx8nT+daEXbKHr2Dvo6aleoa7DTzWk=
X-Gm-Message-State: AOJu0YzWKJFCkPZ/d1I9z7YoaRUpHYdtxOcw0U7m8lmwLEOduUUJG8UR
	Ef4/VTBZmcRbj0NPzg8b3+k51aeARUGTih72kc4WeuMThGZ5HUK6GC25QOwldBDh7FE8AZkcZ7g
	+SJVp0a+ZgFZUPFVTRNcxQnH/utcQI1/r8X7G
X-Google-Smtp-Source: AGHT+IEYSU5ADFNMnTBkYUrta1oNabeXl+EYQ1/5DIXMm+1wdj1nohjfWDC+csmmh52avjlQtaYV19D860L/osVg6Yc=
X-Received: by 2002:a17:90a:5d12:b0:2d3:b643:8386 with SMTP id
 98e67ed59e1d1-2d3b64396cbmr788802a91.9.1723639019073; Wed, 14 Aug 2024
 05:36:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812182355.11641-1-dakr@kernel.org> <20240812182355.11641-14-dakr@kernel.org>
 <CAH5fLggchaAzcRK=i=zRm7hTg6qX0yGBAyAHcO45rG-oEh-AMQ@mail.gmail.com> <ZryjN7Rn_vZNwsZU@pollux>
In-Reply-To: <ZryjN7Rn_vZNwsZU@pollux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 14 Aug 2024 14:36:44 +0200
Message-ID: <CAH5fLggbXYYSTKMUR3jRXwWn7WPi8GtZpHqhLPWW9XHieRPQRA@mail.gmail.com>
Subject: Re: [PATCH v5 13/26] rust: alloc: implement kernel `Vec` type
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 2:29=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, Aug 14, 2024 at 10:42:28AM +0200, Alice Ryhl wrote:
> > On Mon, Aug 12, 2024 at 8:25=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > > +#[macro_export]
> > > +macro_rules! kvec {
> > > +    () =3D> (
> > > +        {
> > > +            $crate::alloc::KVec::new()
> > > +        }
> > > +    );
> > > +    ($elem:expr; $n:expr) =3D> (
> > > +        {
> > > +            $crate::alloc::KVec::from_elem($elem, $n, GFP_KERNEL)
> > > +        }
> > > +    );
> > > +    ($($x:expr),+ $(,)?) =3D> (
> > > +        {
> > > +            match $crate::alloc::KBox::new([$($x),+], GFP_KERNEL) {
> > > +                Ok(b) =3D> Ok($crate::alloc::KBox::into_vec(b)),
> > > +                Err(e) =3D> Err(e),
> >
> > Hmm. This currently generates code that:
> >
> > 1. Creates the array.
> > 2. Allocates the memory.
> > 3. Moves the array into the box.
> >
> > Whereas the stdlib macro swaps step 1 and 2. You can do the same by
> > utilizing new_uninit. A sketch:
> >
> > match KBox::<[_; _]>::new_uninit(GFP_KERNEL) {
> >     Ok(b) =3D> Ok(KVec::from(KBox::write(b, [$($x),+]))),
> >     Err(e) =3D> Err(e),
> > }
>
> Generally, I'm fine changing that, but what's the reason for the suggesti=
on? It
> shouldn't make a difference, does it?

The compiler is much more likely to not put the array on the stack
before it is copied to the heap.

In the case where $x constructs new values, it also avoids
create-then-destroy on allocator failure.

Alice
