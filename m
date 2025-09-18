Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7FF313D50
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 15:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210729; cv=none; b=YJjCtrRyQYMHqOnGuEa58ejakpQHM/V3RuWhDXTex1YZBZ7wjf46wKiYntO4Nfl0P/sdAIyJu3vVkOs16I1cX97ECsFz4nv9PpiK+kwwZ96mtA2fW+j3Ytx0zGBu5JUCfkF5YH7ZUb+ad/Fm2MXWoQhRdIBbrABA0U9CkiYf1eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210729; c=relaxed/simple;
	bh=s3V+V2LAckakdZsEF41B0aB9f19oz/vHCu2aN/xcjFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1dNEh/Hv3ZAJ9gTzhA/SN+Fwpi4RmEELD6rSIGlgwfRFR+LdHPA6z041UBhby1tXrMLlV5GH0dIlEdm/v99aREVUDLaEW0oPEdgP3swv02/FrkEUMBaTtSlY68mtCclI/5sLUcbftvbtHLXaHazbKPtfqVwQE1EXTMj4qMfyUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Hqj8KHXv; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Hqj8KHXv"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-32b8919e7c7so1270404a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 08:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1758210727; x=1758815527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V04anXbncBY8pG9J//7xkYd/M3GClEPh+3YGabPQNsk=;
        b=Hqj8KHXvIsWRal/Q0jbxZkJArUG30lDKizlsTUCAkAeecu92v4d8kSsIJhE4ACK7J2
         NoBnrun1J46N6Bx4vtKN5PimAXiihr5PeWc1k/5alsrIOuMH3GXx20yZCT7mJ+m2DYIC
         j8VOKWeNf2R7i2Ls8UdLjVOHLBF5E/YTxnjlBcrMvQqlYJ0JwWycgEenxOdoykfiFRas
         8eAuDPuJuPi1DeuQ0QKdBsTQSG8+c2Bej5Qo0yN3pZgjYRAg1td3NPSNWLxmCHenkvvB
         6Mp8rwdtCQpy1zg/jRIGSf7Imxl9DEp0z0S7Zbn+eJrsmfuDY4BDXjOxP0ixehcu9X+u
         g2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210727; x=1758815527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V04anXbncBY8pG9J//7xkYd/M3GClEPh+3YGabPQNsk=;
        b=Sl3VU8P02tMS+xLm8AZ2OfBv06IXqYdvikPGzAy8HGbjdfJfCmA02jvYSaY3g5Nj0A
         VLnWwhw1BBsOiOj6uFVVSQAwNByVx/tOtr+L0QzO9P8SdU817MnrZ59DG9Q2RYlDaU0o
         350HvqGUJgAeAqZgiEFuTb+sf6NUGlltOzH/Y2hdSpaY4bLnyeRC//dtR3EAHrH+H2ih
         IbBE8nGIv1DWXhpHCjwjHRFMVPKpTwQV2mMg4ocsDt6I5lXBdTrt2388CYV2iBG3q3jC
         xc5ajz5eH2qDPYS93Igq2wGtCK6+V3wrNyHNWnfCWHQtH6DzEpGT3lJfcOqtKdMeKDMx
         gyoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfhy27K7RWSSx1u1iLhup03nCvtpIhVx0CTJaypZJRTNoCGGIw35Vzc8kVqU88Ix+5ZS35kS4iMrfAQPtaSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOThyVJ4RRO7gh1g7XdtCHpaySyoF3RTLD1btLk7aWHLhKWkjf
	nffbK4a6ZOKYG2fXHrJbBPkWp6Yw7mo2LfbJIn1NdXCvTu7c4Wy4YEpzPi+dQ1TQZuMR4M9HJil
	vTxQk8MQMYdRq0637ZQUHHW3+9egBauPHAYh4h/Fq
X-Gm-Gg: ASbGncsSlpyBugfcz4crxRfpe3QiQ2Ttbl4B8vibxSso/EaCxvPFXALBCj6q0iVyLyg
	gdd1l8Loy3IeuyKLlK20KchFEJoo7ig9I8M977fGseWvJLgGce+nRAdh8RGOVdu8IWnUxIG0OfH
	l55or7/wziSjRFyaXvRzBnaN5Z8VvCdqeJvyiEO42dJz5jMtf8uV9hMCnfw+X7i6YcBw/tP4LiV
	Sy7pyh7uIQAz5AUm+4PpfVsOw==
X-Google-Smtp-Source: AGHT+IGHK64MwYO04bSsnMMTx3l5xs6cc0c36CiG/JwzvP03YtDz7B8RYzBt6ZEJM2wYQ8zXLBs1hm/F2ebCi5vuLes=
X-Received: by 2002:a17:90b:2e52:b0:32e:5cba:ae26 with SMTP id
 98e67ed59e1d1-32ee3f5cad2mr7263871a91.23.1758210726665; Thu, 18 Sep 2025
 08:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918-rust-binder-v1-1-7a5559e8c6bb@google.com>
In-Reply-To: <20250918-rust-binder-v1-1-7a5559e8c6bb@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 18 Sep 2025 11:51:54 -0400
X-Gm-Features: AS18NWD0rI4CL8d-I3ThtruBnhZqOIxzK-M-XfFJiGvkJJ6szBoJDjngnfMmssI
Message-ID: <CAHC9VhSPo4+gSqR2g-6yvDtYGyAnQ4scw2_vQCUrKzbBBd790A@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: add Rust Binder driver
To: Alice Ryhl <aliceryhl@google.com>
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

On Thu, Sep 18, 2025 at 6:19=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Please see the attached link to the original RFC for motivation.
>
> I did not include all of the tracepoints as I felt that the mechansim
> for making C access fields of Rust structs should be discussed on list
> separately. I also did not include the support for building Rust Binder
> as a module since that requires exporting a bunch of additional symbols
> on the C side.
>
> Link: https://lore.kernel.org/r/20231101-rust-binder-v1-0-08ba9197f637@go=
ogle.com
> Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Co-developed-by: Matt Gilbride <mattgilbride@google.com>
> Signed-off-by: Matt Gilbride <mattgilbride@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/Kconfig                       |   15 +-
>  drivers/android/Makefile                      |    1 +
>  drivers/android/binder/Makefile               |    9 +
>  drivers/android/binder/allocation.rs          |  602 +++++++++
>  drivers/android/binder/context.rs             |  180 +++
>  drivers/android/binder/deferred_close.rs      |  204 +++
>  drivers/android/binder/defs.rs                |  182 +++
>  drivers/android/binder/dummy.c                |   15 +
>  drivers/android/binder/error.rs               |   99 ++
>  drivers/android/binder/freeze.rs              |  388 ++++++
>  drivers/android/binder/node.rs                | 1131 +++++++++++++++++
>  drivers/android/binder/node/wrapper.rs        |   78 ++
>  drivers/android/binder/page_range.rs          |  746 +++++++++++
>  drivers/android/binder/page_range_helper.c    |   24 +
>  drivers/android/binder/page_range_helper.h    |   15 +
>  drivers/android/binder/process.rs             | 1696 +++++++++++++++++++=
++++++
>  drivers/android/binder/range_alloc/array.rs   |  251 ++++
>  drivers/android/binder/range_alloc/mod.rs     |  329 +++++
>  drivers/android/binder/range_alloc/tree.rs    |  488 +++++++
>  drivers/android/binder/rust_binder.h          |   23 +
>  drivers/android/binder/rust_binder_events.c   |   59 +
>  drivers/android/binder/rust_binder_events.h   |   36 +
>  drivers/android/binder/rust_binder_internal.h |   87 ++
>  drivers/android/binder/rust_binder_main.rs    |  627 +++++++++
>  drivers/android/binder/rust_binderfs.c        |  850 +++++++++++++
>  drivers/android/binder/stats.rs               |   89 ++
>  drivers/android/binder/thread.rs              | 1596 +++++++++++++++++++=
++++
>  drivers/android/binder/trace.rs               |   16 +
>  drivers/android/binder/transaction.rs         |  456 +++++++
>  include/uapi/linux/android/binder.h           |    2 +-
>  rust/bindings/bindings_helper.h               |    8 +
>  rust/helpers/binder.c                         |   26 +
>  rust/helpers/helpers.c                        |    1 +
>  rust/helpers/page.c                           |    8 +
>  rust/helpers/security.c                       |   24 +
>  rust/kernel/cred.rs                           |    6 +
>  rust/kernel/page.rs                           |    6 +
>  rust/kernel/security.rs                       |   37 +
>  rust/uapi/uapi_helper.h                       |    1 +
>  39 files changed, 10409 insertions(+), 2 deletions(-)

This is a pretty big patch, in the future it might be nice to
decompose things like this into a multi-part patchset.  Regardless,
the LSM/security bits look okay to me.

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
