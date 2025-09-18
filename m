Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB625393E
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 16:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758214619; cv=none; b=Y7b80wJZtOzaHMAxkg0rfCrQ0COeA56vNdmf52jRfA6nej5d6cSTgztY3m9pYp9X1p4ZxUXhwncHLijonjcsXLb8yx+Ng59ssJlE6YWlWjlrd32NOvPpmKhq+ih5w0+mO5G0bIOniCju2GI1C/UgmcPyC5TwFRgte/r2FwaEafs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758214619; c=relaxed/simple;
	bh=UQkDnZN2YupD3ElsirlzPOzXvwseK0yLG5wxXtspicI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwwaDmKNns9tH/O31oPvZR/OJC8EMqj/+65Mr88Q+76s9XR6mtb4YSNHx3TLbYFkGMw7FSt2iBk7CsGd9zm85Kp8vLWooivXLoes6RQhzQxJ8je/sJRtk5iIbO0MFvRwztNgEYltx8s7ckox2sF5FSZCvGQ1aAnSyYtVI3GavYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jXnI6/a/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jXnI6/a/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so8346845e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 09:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758214615; x=1758819415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4k3y0PregncblUWSi1Dac4GIHe0eZqcNbIV+BL8uo7s=;
        b=jXnI6/a/zYADZ6DbYb48EmA0qVXPzs8yc5zVkLeB0qcfqHKcsKjnYM39qYMpb+MQ19
         KUqSECu7skJ67CR+L65tYZKoQ1by+VtvawEcsHqDAklyZTinf3+kizlueVUOq3WicDhA
         Ag4/XiQpeSypQj4V8hji+WTtdkzsWMOG/36za9s78YF+vdakheOsLMUAMZPoiNjmOP13
         FcH5wpYtUPRc4zXXur1btnrfjzsTqt9lwtQXuMpIofk7ZuNLOQEk1bRc786BM58BplMq
         LMJkRMNMypqF71ivnYWF5r7PkzszOt7DjLy0C3KhfNKYn63bMC8DFQLqL6lKJKBvdgxu
         r4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758214615; x=1758819415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4k3y0PregncblUWSi1Dac4GIHe0eZqcNbIV+BL8uo7s=;
        b=HfgTI4gsm45lIeFaYpizWxGK1la9R2iC+pClvK8j73DzKQYcDQqlE7vy3qVeWBBun/
         ESg61xJLkxt39f7i9P3kN4afEDB2dnW+Uux53BPP+qtToQnMHyNZ8gUx2+HCwuVRqneN
         IESEa0lIErJFfYhg0NypCgUPtMqzpFAawivrfdD0uSkGQT49nVO9UPSamLH7p4UzbY+2
         oc55pN4d1lh1BMXmCJWCNw5oSlAIRcF2Syi3uvIjevp+b6SpBSb6VKyuVSCeEfmMEuvV
         snRl6+uJZIlvexUxUlfY7P6S4B1ixBOY5xEN6jnHl1Je/Kic6PHL7/q62z9jbX7AHV+F
         zvcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPNoH3/8raekIZ/ioMofHy+Rt035P7YDU/lrtmOzGg8w0tJvUodMD/HtL8M/MRawphsvlytFWLwGa8jmiu4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUbQUeZzCYsDq/3kkAzRKmEkJzhLACiIApwH25V+skEH9+aR+e
	Mw6wBnfOT3kIwyuNpaDZxgq08oFc505EJ8cWq0FxsNSZijTY3JBPTuHlL8QnQ/TthL37jV0AOeF
	1JAT9PvAjxUuTwHumnO+u/ixC4B9GbKOl65lCmAUT
X-Gm-Gg: ASbGncu3ERuLKwytpW6m2nrbRucUfTQrlNVFFYypS0Z0O/7LqK6Q/nrl0vYZT665HmD
	1ZVFc2ZhFlWzZLPoA+0iKs35ZpOYdEB7ksRMZmb2jXXHeTCltZ6nUTA4RORDiIjuM27xgkgbFQ2
	9Ko1TeA9Gb5MMD8rxoQwVjdWusUiYPG35k1PNzbRYaLn87sGwwSTL3Hg+iv2idhdWBh4JjqRs+e
	nUyAQmajE7+Kpfk0nXpVSZGELWjCx03Cw4pkqu2ay0FuKvz2SGxi7AtsdF8ECgU
X-Google-Smtp-Source: AGHT+IGrECi09TQaSKwSJ+8onLSD1LnP0+Uoq3q4qz+bp+RHGMmJnZZourdxee7Ub4Y3szZNq360euO9+rjTCqDTjSk=
X-Received: by 2002:a05:6000:310d:b0:3da:484a:3109 with SMTP id
 ffacd0b85a97d-3ee83cabbb0mr7006f8f.38.1758214615021; Thu, 18 Sep 2025
 09:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918-rust-binder-v1-1-7a5559e8c6bb@google.com> <CAHC9VhSPo4+gSqR2g-6yvDtYGyAnQ4scw2_vQCUrKzbBBd790A@mail.gmail.com>
In-Reply-To: <CAHC9VhSPo4+gSqR2g-6yvDtYGyAnQ4scw2_vQCUrKzbBBd790A@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 18 Sep 2025 18:56:41 +0200
X-Gm-Features: AS18NWAz8MdqEDamxmxcXKPJiVDlGZOQPplPG763EIp0srUdhSQtCXPruqOyyYE
Message-ID: <CAH5fLggNPBb7g-fq7YMCwi8KsRdpK4uD_+=o_Anqm4Uq7R5VbQ@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: add Rust Binder driver
To: Paul Moore <paul@paul-moore.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Serge Hallyn <sergeh@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Matt Gilbride <mattgilbride@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 5:52=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Thu, Sep 18, 2025 at 6:19=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Please see the attached link to the original RFC for motivation.
> >
> > I did not include all of the tracepoints as I felt that the mechansim
> > for making C access fields of Rust structs should be discussed on list
> > separately. I also did not include the support for building Rust Binder
> > as a module since that requires exporting a bunch of additional symbols
> > on the C side.
> >
> > Link: https://lore.kernel.org/r/20231101-rust-binder-v1-0-08ba9197f637@=
google.com
> > Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Co-developed-by: Matt Gilbride <mattgilbride@google.com>
> > Signed-off-by: Matt Gilbride <mattgilbride@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  drivers/android/Kconfig                       |   15 +-
> >  drivers/android/Makefile                      |    1 +
> >  drivers/android/binder/Makefile               |    9 +
> >  drivers/android/binder/allocation.rs          |  602 +++++++++
> >  drivers/android/binder/context.rs             |  180 +++
> >  drivers/android/binder/deferred_close.rs      |  204 +++
> >  drivers/android/binder/defs.rs                |  182 +++
> >  drivers/android/binder/dummy.c                |   15 +
> >  drivers/android/binder/error.rs               |   99 ++
> >  drivers/android/binder/freeze.rs              |  388 ++++++
> >  drivers/android/binder/node.rs                | 1131 +++++++++++++++++
> >  drivers/android/binder/node/wrapper.rs        |   78 ++
> >  drivers/android/binder/page_range.rs          |  746 +++++++++++
> >  drivers/android/binder/page_range_helper.c    |   24 +
> >  drivers/android/binder/page_range_helper.h    |   15 +
> >  drivers/android/binder/process.rs             | 1696 +++++++++++++++++=
++++++++
> >  drivers/android/binder/range_alloc/array.rs   |  251 ++++
> >  drivers/android/binder/range_alloc/mod.rs     |  329 +++++
> >  drivers/android/binder/range_alloc/tree.rs    |  488 +++++++
> >  drivers/android/binder/rust_binder.h          |   23 +
> >  drivers/android/binder/rust_binder_events.c   |   59 +
> >  drivers/android/binder/rust_binder_events.h   |   36 +
> >  drivers/android/binder/rust_binder_internal.h |   87 ++
> >  drivers/android/binder/rust_binder_main.rs    |  627 +++++++++
> >  drivers/android/binder/rust_binderfs.c        |  850 +++++++++++++
> >  drivers/android/binder/stats.rs               |   89 ++
> >  drivers/android/binder/thread.rs              | 1596 +++++++++++++++++=
++++++
> >  drivers/android/binder/trace.rs               |   16 +
> >  drivers/android/binder/transaction.rs         |  456 +++++++
> >  include/uapi/linux/android/binder.h           |    2 +-
> >  rust/bindings/bindings_helper.h               |    8 +
> >  rust/helpers/binder.c                         |   26 +
> >  rust/helpers/helpers.c                        |    1 +
> >  rust/helpers/page.c                           |    8 +
> >  rust/helpers/security.c                       |   24 +
> >  rust/kernel/cred.rs                           |    6 +
> >  rust/kernel/page.rs                           |    6 +
> >  rust/kernel/security.rs                       |   37 +
> >  rust/uapi/uapi_helper.h                       |    1 +
> >  39 files changed, 10409 insertions(+), 2 deletions(-)
>
> This is a pretty big patch, in the future it might be nice to
> decompose things like this into a multi-part patchset.  Regardless,
> the LSM/security bits look okay to me.
>
> Acked-by: Paul Moore <paul@paul-moore.com>

Thanks!
