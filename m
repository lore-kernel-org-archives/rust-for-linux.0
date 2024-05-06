Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C8D157499
	for <rust-for-linux@vger.kernel.org>; Mon,  6 May 2024 17:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715017905; cv=none; b=gFzVRbFhqO8OlZn8yVXYLJDlYViGqMrZwQVNrHbcW+q1Mbia/GjQxHv8TBPFBnJdIYkEeVLpCFyRhHb/frWBcx8iG5FXzMyGPyXk7uWWSKZ9cUOsgitdLjyETVLuUr+Hd0DopIrgMhZ+lcnA7lPaNcKzgKCnLrjyP7CZHIxVZd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715017905; c=relaxed/simple;
	bh=n+ggXJuMDy3ztUuQdogsS5kTE6OjXKJK3NoOAxwDlUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OruyEn/nONorOTIie+TfMir7lIEUZSoMesTjBvMCIZWX2gz+S9tDyRkBDip6hqfFUKAfq68U5IeOrVeLUdh3VuGYjBBoUaCLFQNrdMwDAqZ2EuKnAAKDyFWMrEo0AegHQjUdrdctM3DxnbJZjJJRELY3sZ8Ge9crm/9qE5ykVxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iA18VD8q; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iA18VD8q"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f457853950so1400038b3a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715017903; x=1715622703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wurQtlXnQruaxZGmjoZBz3RX7oXBHFU8dFMH3DGp+dM=;
        b=iA18VD8qn/y7KfS6J+dzX3+7gd7ye/6lp+cRrJIJNZaeMSNLnjOObejkQs2Pu9JyeR
         PqjPM0amRDKGYnvBsVw+/z4VKvGkzJ6bjAFcX7J4dKf5+biNtYkPmgjMS0bY9TzC5T3l
         F6YTfYRKaD8RIvTiMrRPGW3P878GBURN1Ii1icnqG3opot7w5mfEioNO2+zPsZ8f5jl2
         DXSVT5JuZ5RvD9xGQ8/X2VnM17wGwwlF0nOqNAwVvbrhP2NVJJ3TCUc5+/46oax4l3b5
         scq1scJXt8YZgl7Wj1Kqt2Qj7XNKQMwu9jsAsw6NRWSXqwHL0sN8QYv4pDswvUMRmdD8
         UgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715017903; x=1715622703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wurQtlXnQruaxZGmjoZBz3RX7oXBHFU8dFMH3DGp+dM=;
        b=wuGD7jkUIb3+AAGYMRHLh7vf86YV2yPN/elf1uNUlMhzQ94XJCFTC4uk2pDkbBguWb
         PK6x+modsU9UCEnrjv91AriFc/WHZoKjw7cy0keEWHWmq9EZ+F6qwQlI4yfV6LsHBSL8
         X7jUuRamM8lOTNYvsYZpN/iF8jS2gavprFYBbW7yLihUijpLLLI1krE8PaIrIA9n5aCF
         K7ycjEGUyLqExhlb4tfoTX3bspXsP0cddMEeTL+Rka00aJUP8dlncc2eaCUenyqzsbKf
         qSL2hP4SowLnPbLNhnKFocYY7U0KE1ocqNkNuYVhRPhoSlSGpwAM4Nu8ftguFlMwWyVc
         CMnw==
X-Forwarded-Encrypted: i=1; AJvYcCXq3Q/eWW2ZdlrvLVvhSQ/aleUNq/6NR7fVmuKzL8XFNmKplZGE0tlWoqNykpAPRUcb+NyVL11Lu+6R3r0qUrBuoBQLIRkkzO/2SLs6G+k=
X-Gm-Message-State: AOJu0YwAiVeuBiFv0y4lZwLeh7MlsZcQR1M4yCEeTahHfeV45kILXx5O
	BGFPSqEqv7aLHB8ldT165cz9ImRv0+dY8eqG/IDzHx+IDz1j6BqP+ZSboQyCZWgXFFDaL+TGxCQ
	EiHZf/+3CVzloD5fhirI0e9gT6MA=
X-Google-Smtp-Source: AGHT+IH8Mt62MuKQL1ZkalGP87eZfS3iHdOlVOzv/LnegQfkY+vcem5lPH9/vG1mD904Dqwu09s/h5jE32xZ3xUCxHo=
X-Received: by 2002:a05:6a20:1584:b0:1a7:9b0e:ded3 with SMTP id
 h4-20020a056a20158400b001a79b0eded3mr561016pzj.11.1715017903199; Mon, 06 May
 2024 10:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501134834.22323-1-dakr@redhat.com> <CANeycqoRh_hjUmAKyQCjNy-SJ+Ct5XR9yDMBc_HJaY3+EjajuA@mail.gmail.com>
 <82f42e39-b1a2-4915-b382-71f4c06c3f53@redhat.com>
In-Reply-To: <82f42e39-b1a2-4915-b382-71f4c06c3f53@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 May 2024 19:50:19 +0200
Message-ID: <CANiq72nHubtd7oB=JUTY8B0H9WA35jio1L0tfTSxDpJFLBcdMw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
To: Danilo Krummrich <dakr@redhat.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 5:22=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> w=
rote:
>
> Is there any benefit using an if here, or is that your personal preferenc=
e?

`if` is meant to test a boolean condition, which is what you are doing
here, so the question is why would we want to use a `match` here -- we
should first of all try to be consistent.

Now, I can understand the appeal of how the `match` looks like (e.g.
less braces, less zig-zag indentation), and if this were a `if`-`else`
chain with several cases and the wildcard `_` was not used, e.g.
something like:

    ... =3D match n {
        1 =3D> ...
        2 =3D> ...
        3 =3D> ...
    }

then I agree it would be clearly better.

Perhaps you are arguing for something like "let's always use `match`
in cases where a value is returned, i.e. when used as an expression,
and save `if` for the C-like cases". If so, would that mean then that
we need to do:

    match c {
        false =3D> ...
        true =3D> ...
    }

to be consistent?

Then there are other things like `if let`, the potential `is` operator
and postfix `match` that should probably be considered.

Anyway, I am picking the fix as it is.

Cheers,
Miguel
