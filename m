Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4217514D705
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jul 2024 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720518410; cv=none; b=iCvVEPh8tUACB3by7RE8AjJPguuYP4JsVs6PFdUaRp9Jzczr6nwW2ef+BScS4PaxS1l51NSCFRQ+9ipS2wP3lRUzfio7z8OiNZnXgckNzOOXlIrACkPXYuWMfBd+nOCzn9jgM28pBKpqHEvY3yp4Q80FdTXl+2I6c8t7czwvTbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720518410; c=relaxed/simple;
	bh=eCQQDFY8hVymXwxKp1QUQeYKDxSsetFoWDv41bgZWKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEpXCqIOPIgYx18M2yMwVQSJIhMwCUdUx/pWZPx/hOyxny3QXOExEyWCaTkE4/V+K7kli/okg3JSflD5vqIAjuZfu+855HbkdKR3/jrANLnwOzHWeEdUtbNm0/5SXv6gMFfmFfCVRYJelQ6Rpw9IHvSG/xl4JQCQrPaPgzjVPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q5TI4TJJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q5TI4TJJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-367940c57ddso3248039f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jul 2024 02:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720518407; x=1721123207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAl22PofvTioHWfNt+bF1Jl2BsmrDxNKveilF7T4GJg=;
        b=Q5TI4TJJPfT9bqIXr+lPrwz7V5Za4GRxc4NhyGxzc5g9TwPpb+ne9WJn6PHu8U3tZL
         H1obsd85mEaSLKu3Wsjgzjbf6WjTRdx4s71PjMfPWo0KFMy3a1sNbVt9ibuRkqWYaTE+
         JBDFeb9CG2x5AUyS9jnPUBS9Kuq7KV+zHOXXhiGfJxLsxz6S1PhXYEQlgXE7q5I1mfOm
         zp0U/HZai/8Xju4cV6cZSkqMYHzTaLPKnLjtDoSwx9EqX2AYqAj1Mnfc2OP3yPhakDfd
         5obGbXT4uXXYFxUp3e3/P5eFkqL0Uv7e/95M1ksbNJI3YZljAUEJEB/Y7HfFTZeWKuqd
         TOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720518407; x=1721123207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAl22PofvTioHWfNt+bF1Jl2BsmrDxNKveilF7T4GJg=;
        b=MWqgVKhHeOiZ840bZZI/KHYk/pSejS8zKMyAndggRVPA/3gesiDxqIPx4OC3qizVAa
         SMfJPM032T9vURxXdwdwdV4uQM1H4wX+hI5sQxPhWZ92sqhUjEcT69/REGPq4cKyEN68
         hpilImft4uUJU0Z0AuCsOcFAMhlJEn9eHMq5dZtZPPyRgaiz5381Ky+X8rac/9wC8Sfn
         wzInsytipmjNYxPiLOD2ClaVcu2RYkLySn5X6N+YSFN3ZvM2ligLrvZLnNzQgLPgXabe
         kkbEKcLZ1FxhnsrMFhoovmd4mV+3zXXU7qG/6iZjJr9jbBaDzuQtHiRhC8ZcM3oWXL78
         7Ogw==
X-Forwarded-Encrypted: i=1; AJvYcCVvxmqw2VcIbQtDj+rb8KQb5LM1lHLh7h000IXftFwxL3xfCqI2NSr0EdACVwMR9HD3YM2I2oYD3y6mhz1yra24JxIhq4t5TJ5oM0e+i5w=
X-Gm-Message-State: AOJu0Ywf/FE9eGNNeYNkkePOV3z4COA0BEeEk5+eqldGePlPf3sD2b7K
	7bOnhDyznfX3K86tVWX2bX0hbVJHM+cRFBcsNQXvT+IDDL1UkuWxmn0ccQdfqGIgYYT/iyAve3W
	AIyj5E/KHw5m2S3jvrCK4Xt4ENjNC/otgfBPk
X-Google-Smtp-Source: AGHT+IFlHTSp/MVSEbMZitGmqh6j910gE+cVPG5i5gaBlx/eMJDN2xZthp+2hnjGAc7uIFJk4Z+rinA4ANAty8nqf8s=
X-Received: by 2002:adf:fe4d:0:b0:360:7812:6abc with SMTP id
 ffacd0b85a97d-367ceadb1edmr1187247f8f.60.1720518407332; Tue, 09 Jul 2024
 02:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528-alice-mm-v7-0-78222c31b8f4@google.com> <CANiq72ka=tMDHq3S2N0dkzj0DBje+kdz0nFtaQZ9RHC0rbii0g@mail.gmail.com>
In-Reply-To: <CANiq72ka=tMDHq3S2N0dkzj0DBje+kdz0nFtaQZ9RHC0rbii0g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 9 Jul 2024 11:46:35 +0200
Message-ID: <CAH5fLggUcj=qne9uO8O=OGZgcwbhKMAJKpPe_s6Nd2Bbd+45JQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] Memory management patches needed by Rust Binder
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, Trevor Gross <tmgross@umich.edu>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 10:02=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, May 28, 2024 at 4:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > This patchset contains some abstractions needed by the Rust
> > implementation of the Binder driver for passing data between userspace,
> > kernelspace, and directly into other processes.
> >
> > These abstractions do not exactly match what was included in the Rust
> > Binder RFC - I have made various improvements and simplifications since
> > then. Nonetheless, please see the Rust Binder RFC [1] to get an
> > understanding for how this will be used:
> >
> > Users of "rust: add userspace pointers"
> >      and "rust: add typed accessors for userspace pointers":
> >         rust_binder: add binderfs support to Rust binder
> >         rust_binder: add threading support
> >         rust_binder: add nodes and context managers
> >         rust_binder: add oneway transactions
> >         rust_binder: add death notifications
> >         rust_binder: send nodes in transactions
> >         rust_binder: add BINDER_TYPE_PTR support
> >         rust_binder: add BINDER_TYPE_FDA support
> >         rust_binder: add process freezing
> >
> > Users of "rust: add abstraction for `struct page`":
> >         rust_binder: add oneway transactions
> >         rust_binder: add vma shrinker
> >
> > Links: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-0=
-08ba9197f637@google.com/ [1]
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Applied to `rust-next` -- thanks everyone!
>
> [ Wrapped docs to 100 and added a few intra-doc links. - Miguel ]
> [ Fixed typos and added a few intra-doc links. - Miguel ]

Thanks, LGTM.
