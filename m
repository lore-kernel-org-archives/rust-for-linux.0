Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1153E1448EE
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Jul 2024 16:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721407628; cv=none; b=ZJKHrkVFGuDTlHJkLAFp8Pu53TcxTI01w2h7faxhhfPl0fkT4kr20NG4SHV/PEeJARsT1Pd3rKsyBcyqjY2405A6LoRxZACjUOB7KnY/LDrsnR14KF8bg5lEZcyFQZ2yoWYzYOubxYKWQ2RjFkJMH0q2yPmijygXFerBNqhwVE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721407628; c=relaxed/simple;
	bh=W9BCtaO0cDlPx5zYgeL45JaSJ01lNQ6L7I7oe5/Xavc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGOlGY05BaTtWvRyEQLc0Db4xJudXWHDoLWTYM8J/9GvJ2X2znbz2wwLpeSq2MrvpJYaEq+/ZuzDGGH8ZzdJ0fNN2rU+iGHbg73lHyb2XX8MvU5RvEtXkcoGVCcTR/spEFeihIZ4b8TALGR9SlhLzDASlSqi3L5J1QZ6+sZyEsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LufGMfo6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LufGMfo6"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-368f92df172so257403f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Jul 2024 09:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721407625; x=1722012425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9BCtaO0cDlPx5zYgeL45JaSJ01lNQ6L7I7oe5/Xavc=;
        b=LufGMfo6aqN+VGRKieS/uKysRtt7pDJLdq3g94yrZ9bbZ6foUq+s0+FniUpvmTvWRC
         +BPg9pOmSAEGi5ho/QZKtj6vtdF/C75yRMIpS2SkODI+HvAxXhLZZteh4A+sbAR5dKC2
         gyhkZPN2/AMAQiwqSxkwTZSrhtC10mFCYP2VaUEEGvUBmnZZCKeO/HkW9Rb/gA4cgU2a
         MZHUXso9bARp3V86wEAH+TPPhduWt+AHt3CSW18HS80oaIWhwqDmgSD6ieyW04ImKoi6
         CBRopiXgVqOkDHvz5jK1Zy8qCbFg25N4poIUqn7UIFEd8Sy0FqmtTjfGAbb60Zyf1vFN
         dTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721407625; x=1722012425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9BCtaO0cDlPx5zYgeL45JaSJ01lNQ6L7I7oe5/Xavc=;
        b=a6lMjpzx5APnH4xUpHEPYBWaVzfaxfXf1ZsQZZvC+HqmI99680WDsA+2H7wwO1ufT9
         hEm2KfNAEDIaC3j9nYWpcPh0BiXZLTlT129f5Z3E1HWminiXMWbs0cSQBvecovcqyqJT
         gVCBb4nLigQ4kU9xdbdUk88EyKF5ZtuQjXuNDfbjhgkeP6eKgw3+FLNHaH+ro/N5RrB7
         eKpwwEhvAA0XEH8ER7JTRxRHQOJnFCNTqh3bwvt4DZmqpsNUSy0IBhwavMxriv8GlTC5
         oDIYTT/PV2W5ISwd0NIQcYp4vciketdECWHq41oQHrkkxhLXUTWj77Ne0/EURMCQbsa+
         sMUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwY9Nml4bR3XyGcVyjLrQKKzzSgBKNj6R6O/qeeJtfsF2eSDt82ahVRBXQrv571lVrKzGE2BdDfK16y2TOX/YgE2gIFy46QwolJR3qtMY=
X-Gm-Message-State: AOJu0Yy9abYdgmZnOa9FgNCqokRn82ZAisYY6P/1TGllhPdzwU8cmj9l
	k+vz0d3GkDrBm/iPZgrbjBQhlwR6C2Zfi9AcNOqL3ipQL7Cmfi8e65rxaV0vTrNmXUTbuijcOiq
	cF1YhPYO/g5M4DxF8nc0MFXAfUmALcRiHL2EW
X-Google-Smtp-Source: AGHT+IGpVg4LrfRhKy8N6tEZ0l+p+dko9Xsgg21EOC4u1GVaAC5QXJ7PzAnFYAhbm3VIoPzX9QAW/0GrB5uN30dLsL0=
X-Received: by 2002:a5d:58da:0:b0:368:65a0:a423 with SMTP id
 ffacd0b85a97d-36865a0a82amr2913589f8f.27.1721407624980; Fri, 19 Jul 2024
 09:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717221133.459589-1-benno.lossin@proton.me>
 <20240717221133.459589-2-benno.lossin@proton.me> <99DF6A0F-BAE9-4341-8B42-6C1F1C69E2C6@collabora.com>
In-Reply-To: <99DF6A0F-BAE9-4341-8B42-6C1F1C69E2C6@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 19 Jul 2024 18:46:53 +0200
Message-ID: <CAH5fLgje088THfszy0LiE9u1b=XYme_Vo07azjiba=TJ85usvA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] doc: rust: create safety standard
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Jonathan Corbet <corbet@lwn.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 6:24=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
> > On 17 Jul 2024, at 19:12, Benno Lossin <benno.lossin@proton.me> wrote:
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Rust Safety Standard
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Safe Rust code cannot have memory related bugs. This is a guarantee by=
 the Rust compiler. Of course
> > +it is not without caveats: no compiler bugs, no bugs in the specificat=
ion etc. But the possibly most
> > +important caveat is that of ``unsafe`` code. ``unsafe`` code needs to =
follow certain rules in order
> > +for safe code to enjoy the no-memory-bugs privilege. A simple example =
of such a rule is that
> > +references must be valid for the duration of their lifetime. If any ru=
le is violated, it can lead
> > +to undefined behavior even in safe code! The term undefined behavior i=
n Rust has a lot stricter
> > +meaning than in C or C++: UB in Rust is totally forbidden. In C one mi=
ght rely on the compiler
> > +implementation to ensure correct code generation, but that is not the =
case for Rust. You can read
> > +more about UB in Rust
> > +`here <https://doc.rust-lang.org/reference/behavior-considered-undefin=
ed.html>`_.
> > +
> > +If ``unsafe`` code makes our life this difficult, one might ask the qu=
estion "why do we even need
> > +it?" and the answer to that is that it gives users an escape hatch to =
do things that the compiler
> > +normally forbids. ``unsafe`` code is a tool that enables programmers t=
o write more performant code,
> > +or code that interacts with hardware or C. These things are particular=
ly important in kernel
> > +development.
> > +
> > +The most effective way to prevent issues in ``unsafe`` code is to just=
 not write ``unsafe`` code in
> > +the first place. That is why minimizing the amount of ``unsafe`` code =
is very important. For
> > +example, drivers are not allowed to directly interface with the C side=
. Instead of directly
> > +communicating with C functions, they interact with Rust abstractions. =
This concentrates the usage
> > +of ``unsafe`` code, making it easy to fix issues, since only the abstr=
action needs to be fixed.
> > +Abstractions also allow taking advantage of other Rust language featur=
es. Read more in
> > +:ref:`rust-abstractions`.
>
> This is something that I think we should discuss at Kangrejos. I do not t=
hink
> that we should set in stone that the kernel crate is the only place where
> unsafe code is acceptable.
>
> I am in no way disagreeing with the use of safe abstractions, but I think=
 we
> should have abstractions where they make sense. This is the case in the v=
ast
> majority of times, but not in *all* of them.
>
> A simple example is a MMIO read or write. Should a driver be forbidden to=
 call
> readX/writeX for an address it knows to be valid? How can you possibly wr=
ite an
> abstraction for this, when the driver is the only one aware of the actual
> device addresses, and when the driver author is the person with actual ac=
cess
> to the HW docs?
>
> If a driver is written partially in Rust, and partially in C, and it gets=
 a
> pointer to some kcalloc=E2=80=99d memory in C, should It be forbidden to =
use unsafe
> in order to build a slice from that pointer? How can you possibly design =
a
> general abstraction for something that is, essentially, a driver-internal=
 API?
>
> For these corner cases, a simple safety comment should suffice. By all me=
ans,
> let's strive to push as much of the unsafe bits into the kernel crate. Bu=
t,
> IMHO, we shouldn=E2=80=99t treat Rust drivers as some unprivileged entity=
, they=E2=80=99re
> also kernel code, after all.

Perhaps it is worth having the document explicitly talk about middle
grounds between "directly access C apis" and "don't use unsafe code"?
My file abstractions [1] expose an unsafe function called
`assume_no_fdget_pos` and I intend for Rust Binder to have an unsafe
block calling that function. Using such an unsafe API is meaningfully
different from just directly calling `bindings::fget`, but both are
unsafe.

Though it doesn't seem like the document actually says "don't use
unsafe code in drivers". It just says "use abstractions".

Alice

[1]: https://lore.kernel.org/all/20240628-alice-file-v7-3-4d701f6335f3@goog=
le.com/
