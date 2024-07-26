Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099454779D
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 19:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722020662; cv=none; b=SwtKbHx8uwP3FHi+mpztoJqLxKHgOB/C+yfP7xW+A7Jrw8b5/YpKW2gOZVU59IBX0h3RQFvqImsL78J3/8InGKKjjPuOCojk7oIWLaAnI0vm675veRUr/WGE6HuYsWKiJa0LMpyhU9mzMJQSNsdgILvkoCmYn6RmOZb9P1tP5KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722020662; c=relaxed/simple;
	bh=xYFuuot4DpQ3JXmw6W+JjQRTFtIKxSNiP41inmJwMbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4G4v3w2i/3JmxyWVxruwO+55dYOsgxBAogV49DNi5eMZi2oLFTGIWZYG9c/VxaiqPA5mPdrjLG6OLwA02/5YkjMB6Pihfb/mTtAp332XPu6AkQmH6XtJMnO/32A1+r4LTFvUV61v5guI8kuSlCT0gStx68UY2aXqy/TZBMualo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UCaCcooA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UCaCcooA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-368313809a4so10841f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 12:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722020659; x=1722625459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYFuuot4DpQ3JXmw6W+JjQRTFtIKxSNiP41inmJwMbw=;
        b=UCaCcooAMM0AqHLu1hHPLQKbFakgbWYI4rgMKVWtRSXibVmNqGy/vcrBxU6Q4e3SmN
         jww59C2VO84GItB+tsvV6vOWrjTpj1xQKDk6jqOqNyFMe9oqExOPZkBgU0m9gsQ0go9I
         4l0S072y9yFdBYJGWARlRp58EmCn2zkVwM6BBDBBQKR6NnUJ2yjXSnPo6OuBo2+ui0fl
         qcEGO0pDnwjkIa1bAKmEw5gJWlIaF1uu5VgiJzE8esbeC5atIo6qtrQKm5BaFFOa3KMY
         2gWsFW2b+SnXVuT0/xcAWzskLlsMfquQDhNQ4j5KFQuIWwF+neSNEjgcnYMgc/te42xm
         7cpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722020659; x=1722625459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYFuuot4DpQ3JXmw6W+JjQRTFtIKxSNiP41inmJwMbw=;
        b=h+EpNStq5Nw23scyAAKE8GdCMvFkholHPA+gGuFeTkmWrVFem8deFeooRe/v1QZEub
         r+ky9y4Zbrjsxio7v9rM1iDS7snv215OiE/s3PCAyHYSV0/ljgE4yI2c9zRmDqpmoql0
         o2z5FZaaIr0F+ewUMEn9pdNn3IBboGku2EPfgKlmFEydji4Rdij07YNGLr7inhHUjbSj
         HTHBGnY+bzubB4MdWFEcjUHtoY2oa8HfRO/fBgDf3mc4PrM0c+YowosaVsuLPxb13PjN
         vhQKj7lFApky8q3Mrq+544KDxa0aBWOjdUZHDMmw+7nAS6SxBCIAf0dsF2Cq1tIprIwk
         A8dA==
X-Forwarded-Encrypted: i=1; AJvYcCUfO+ZxyfLMveKpPbunFwGUOMeYZLoWArESyrC3fWDs6DMZAe3hdwmtQYT1C5IpzZuxYRndP1uX3t7uFt+nCL3NTjmzIvBI79y9d2Q/CwY=
X-Gm-Message-State: AOJu0YyRPmbRSFSwJUqXxTkqSbL0YWIo8dwvYnQ8+rb1GNjadm8dI69M
	wN1s6ef8opqFrrUek0EkqpOZj4yJe9Uh2jRqiQXwxEkaDHA7LWpBiK+rjtRd0dT1lNSpK8DbURd
	1vb4TGZsLLoi7rUmwDgsz6u0C5EX7X3+Fk2tP
X-Google-Smtp-Source: AGHT+IGraFaJZI/vS7GrHlj76pQFsxGjJcZravrRHHY5P9k1QKBepfjho9WjF6LoZFZWRcHCO/+oR9tNGGFrpgwCYKc=
X-Received: by 2002:a5d:5267:0:b0:367:8e63:4da4 with SMTP id
 ffacd0b85a97d-36b5d7cfa4amr360487f8f.14.1722020659116; Fri, 26 Jul 2024
 12:04:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-vma-v1-1-32ad5a0118ee@google.com> <3bf6bfdc-84af-442a-acec-a58f023d1164@proton.me>
 <CAH5fLgjfiE6xNpKVBAgXu=eFyE65k+RxWqNt10J+44pK-mJgTw@mail.gmail.com> <b7e8b816-a3c1-454c-bf97-516bf78c697c@proton.me>
In-Reply-To: <b7e8b816-a3c1-454c-bf97-516bf78c697c@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 26 Jul 2024 21:04:07 +0200
Message-ID: <CAH5fLgjF-_CKsgKm1OkSFMBt_HScO0o0fJBnaQY6W7fm1yPFiA@mail.gmail.com>
Subject: Re: [PATCH] rust: mm: add abstractions for mm_struct and vm_area_struct
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 3:37=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 26.07.24 10:32, Alice Ryhl wrote:
> > On Fri, Jul 26, 2024 at 10:11=E2=80=AFAM Benno Lossin <benno.lossin@pro=
ton.me> wrote:
> >>
> >> On 23.07.24 16:32, Alice Ryhl wrote:
> >>> This is a follow-up to the page abstractions [1] that were recently
> >>> merged in 6.11. Rust Binder will need these abstractions to manipulat=
e
> >>> the vma in its implementation of the mmap fop on the Binder file.
> >>>
> >>> The ARef wrapper is not used for mm_struct because there are several
> >>> different types of refcounts.
> >>
> >> I am confused, why can't you use the `ARef` wrapper for the different
> >> types that you create below?
> >
> > Well, maybe I can, but it means we have several wrapper structs of
> > Opaque<mm_struct>. Would it not be confusing? Could you suggest a
> > naming scheme for the structs I should have?
>
> I don't know of a good way to avoid that, IMO your current
> implementation has the same issue (multiple wrappers). So I don't think
> it's that bad to have multiple wrappers for one C struct.
> We could also use generics to solve this, right? I am not sure about the
> ergonomics/looks, so for example:
> - ARef<Mm<Grab>>
> - ARef<Mm<Get>>
> - ARef<Mm<Async>>
>
> I think it looks fine, then you also only have one struct wrapper.
>
> BTW what does "mm" stand for? Memory management?

mm stands for memory management. Basically, an mm_struct keeps track
of the address space of a process, as far as I understand.

Alice
