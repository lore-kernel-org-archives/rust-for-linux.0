Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074C98F59
	for <rust-for-linux@vger.kernel.org>; Tue,  7 May 2024 03:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715052311; cv=none; b=LUhKHvRR7trkXJXR38RGK8k0yBHZmOwBW4DbzV8neNLnU053Y6+1voEv7XkYouo7/59F1oMoyok6r8EUMFXUMWc4QW/vdIMXwGQCzm/DMrLB0k6IJju/zoqU3LZiM6gbzUDuXAIT6fVq09EPzq3IET2DuEO08abjZtuVvTonMt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715052311; c=relaxed/simple;
	bh=SOT5d0A5NN6dVAhmQZIMMWayL5STSmxC+IrB6oc7jd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KT/Q7S1zz0eAxcV5vYLaqcuJfU+LK5sdb8LzkDl5F90RHOZOx+/ywCMo1Z0z5SqUx9gKPw8dvtc4Y/MbMVcgyxeCoii8A87Md9aIBfdYMpcik8h+spurnuTmxB/hmfprW59O2fHyfJqMI4MwlzzNcCtKtNQUcLq9E0Ct6HUfshg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRk3n7bc; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRk3n7bc"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-61be4b98766so30860347b3.3
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 20:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715052309; x=1715657109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uv77xie287++WAc+lPWW6nvV74sP2nc6DDd0O3st9AQ=;
        b=hRk3n7bclDxppSLHpYN+7tdfIVpP+RbwtoAO8tfn8cf7VYQpvjR7q/ybCbHoQnIQG5
         SSXEw/7wxm+fuZLVnfzJHqxIIiWdBQHtTUQVTboRC/Ln4X0nED7jS00mBiiYor21WZRI
         htQX3EZm4N1ytX7dtG6fzfOS0s7yA93T86rQLTGWXy+DfR5pN81WcyD3+n4uqiZ0JUu7
         Mt+DA/0+cG98ZAMyv/gMlTKyw/xYT9PEEjcok5R+/71tWi2COjCKaNis1oRLgNEyvqoL
         wpEIlfMNwivFg9Kou0c1PlfuLHgZF2KtQNt1XcQfHFcE5n9CvIqcqW53rFFFKgnhL9Xc
         NERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715052309; x=1715657109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uv77xie287++WAc+lPWW6nvV74sP2nc6DDd0O3st9AQ=;
        b=nEOX6BSo1TGfUQB1PBi5bnT1nJKWuQh6oCOAxy2qjRgNWOueOCDK69lbZPmX1cuUYR
         dNi1koAO0pek1oVzDXVEjuyuAaQL0oTsMHt3Tk88xzmgwk80xFtnGsWnq6ynKXvMx5lp
         v7lXmX9z3ZL3qicp1nHTwPQlsuqVLobbjSWv2ksiPl05fdkHURubrgWbFm8vTCZZmmMU
         mQEuap+4vF441Z8asGA9HU5RcbhL2c+v6vcOZZWnC7jeVesy3FP/dD4VGLCP1I0htDBi
         th/4fXpF2kfDMy41+6wAEkYEFIiJ7c3r5VlxiVpNVZH5ByE1R1DOs4gbfcqIqMXIJk5H
         I/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXahWjB6kRBz/eAelvBHMku6mEzGbSsUcPOpYnR9lA3OY6ox+JIhvc+vMag6plG8nC4i86kc7tkG/K2X1er+01ZBM2+NA/KW8KGX+25Q+M=
X-Gm-Message-State: AOJu0YzaWJdmJL/iRHmpOMSM1oPp1HvyqOPDFUwu923MjHDvCmLJ9ali
	Xp4Icn2AhFtAcDE7iPVKCx0nYjHz9I2hlZWQGW7hIeLOZQypuThwMUVdfgQE3B76otV7oaB8QoL
	7Tkgo8v7dzsk5zjRk98taQOgOeH8=
X-Google-Smtp-Source: AGHT+IFd4R5aKw+ZlDfz5zswEKjkTtQeOMCtf5xDs7UqsTxpqtb8DMmFPHHTculS9+WALnHSqgkuptmsFgHYBBs1BaQ=
X-Received: by 2002:a81:9293:0:b0:61b:d8:c5de with SMTP id j141-20020a819293000000b0061b00d8c5demr11651361ywg.19.1715052308598;
 Mon, 06 May 2024 20:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430121322.2660-1-dakr@redhat.com> <CANeycqqRasM-k1WY8znPbF3_bRDGQHghnyMi=oy=Mjs9UQH0fw@mail.gmail.com>
 <ZjFq1uVXi4k1jjQc@pollux>
In-Reply-To: <ZjFq1uVXi4k1jjQc@pollux>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Tue, 7 May 2024 00:24:56 -0300
Message-ID: <CANeycqryFoTk=7McpUY6UndO7RTrxCGLZvNx8-JgTm3uUcRfOQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Apr 2024 at 19:04, Danilo Krummrich <dakr@redhat.com> wrote:
>
> On Tue, Apr 30, 2024 at 04:25:44PM -0300, Wedson Almeida Filho wrote:
> > On Tue, 30 Apr 2024 at 09:13, Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > >          let (ptr, len, cap) =3D destructure(self);
> > >
> > > +        // We need to make sure that ptr is either NULL or comes fro=
m a previous call to
> > > +        // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guara=
nteed to be NULL and might be
> > > +        // dangling after being created with `Vec::new`. Instead, we=
 can rely on `Vec<T>'s capacity
> > > +        // to be zero if no memory has been allocated yet.
> > > +        let ptr =3D match cap {
> > > +            0 =3D> ptr::null_mut(),
> > > +            _ =3D> ptr,
> > > +        };
> > > +
> >
> > nit: why did you choose to use a match here?
>
> I felt like it reads nicely.
>
> > I don't think C
> > programmers would use a switch to determine if a value is zero or
> > non-zero.
>
> Well, I think for writing Rust code it doesn't matter too much what C
> programmers would do? ;-)
>
> What is idiomatic in this case?

The idiomatic way is to use `if`. Even in cases where a match was
required (e.g., when checking an enum) and only two options are ever
used, the languages has the matches!
(https://doc.rust-lang.org/std/macro.matches.html) macro so you'd do:

if matches!(a, A::X(_)) {
} else {
}

instead of

match a {
    A::X(_) =3D> {
    }
    _ =3D> {
    }
}

They even changed the language with if-let constructs
(https://rust-lang.github.io/rfcs/0160-if-let.html) so that we'd do

if let A::X(_) =3D a {
} else {
}

instead of the match above. Here's the first paragraph for the
justification for this feature:

"Introduce a new if let PAT =3D EXPR { BODY } construct. This allows for
refutable pattern matching without the syntactic and semantic overhead
of a full match, and without the corresponding extra rightward drift.
Informally this is known as an =E2=80=9Cif-let statement=E2=80=9D."

So the language designers and std library implementers provide a macro
and a language construct to avoid using matches when needed, but
you're going in the opposite direction where you don't need it but
want to use it anyway.

Please change this.

Thanks,
-Wedson
