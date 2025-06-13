Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC9315278E
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Jun 2025 17:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749837450; cv=none; b=JbSQvzoqiPGZSwxWzMT09+e0q0jtjKLAXcWW0QFEKtDMNzcezegvi19Aa0LHY//vyCCCOdJgzcvokj6qR/k4xTKMTDm6M+3xm4Qjt8T7/nldNYeCgfr6okxK3KKcP/+5DNNyQn/JE6IYDuNQq2iTqid4jaGaqpGt86UAFj9U3Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749837450; c=relaxed/simple;
	bh=jvcVb+am9I0doMcCE9QPUIDKwVhU7evy02DzLS67f10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxMe/vbzkyatf81EtS3k9F4SJiKkR5j37eif20vquqALUedeMPjFGItYc2vCAyEKRL3VbNVdx/4QK6CUZz3Cd1WUjA64uY+rgSRbEfizK2hDI3cGDKhA45GVeqQqH8L023aafzxiaw+gye6TTs12s08VcBVih66A+jPqLBpOHLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GL7C/5lO; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GL7C/5lO"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3131aa07b50so377463a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Jun 2025 10:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749837448; x=1750442248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90FfTOzbfAjAvN8JaGeMwReF1Gm0SoHr5nkIgmwzp+U=;
        b=GL7C/5lOgKfJCRf0PFKyF+UQQMLCzhL7Syt9EJ7M9ucrmE1iYkYcG2ph2cMobdHFQW
         98QtedMncc4BkfuM5FMm7XWSd0n+TVhMgzNgk+TJOkWnpjl80aIodEPzcl9BiG/623tD
         UNxhJCWFT1Uz0vihw9cNBRz44H1D5aIuXkMeQGVfqNdXt7OqVkcmzi/N+rRrIhV7Yg16
         JOMXOiVFrLvOOU7cla7S6guKZm/P2H+FeUvw5jcNQhxlNgTBO5Ea9u10GvVl3T5hUeqd
         m5sRRUNEFQoQNTERJZPCPR1XESccm6FaQoNod73kcWu8dnMaiAbv5tYoE1yNu+uohvg5
         hhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749837448; x=1750442248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90FfTOzbfAjAvN8JaGeMwReF1Gm0SoHr5nkIgmwzp+U=;
        b=HG2UL5t59lwuPJPtsKQq/5sdXxJkPLy1DYhekV4b81vZCyCwWRiVl/TAtUCbfUobGn
         ny9cAuPY6haf4UBHH7sKON7eoXQaLRG6jChPfl9DOOl/pmR9vwbT88cl7355FY2TQ4yh
         gNDT+kcdL7Nqn3YOHf0/TODsMI4XVm6Qa2NZgAVsqYJF8Fbd6mOZWedR0AtxjBuVSeTH
         V21akpUTPaYXB5HA4NIiRfkxks6LgLetL1wGl72sAO3ONg8AkudVvGucs+TsCzz0hIt8
         5dXQxAO1G6hYsspWMupN+bG2oKmNUWf5ojeyXIwwd8egt54JErearEI4/Dv6v3SRYpWx
         hgFA==
X-Forwarded-Encrypted: i=1; AJvYcCVQXqR88fEjMhtsnuLlGIp87igZpo9BL3O2Xq7Qgzxno+hcyyfwwXnk57AIGmIJJS9Se8qT2qiUvfxNDMwCBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzqZ+y8MCF55+1KrKs2QBMTqGOikxOCHYqXvGlc0BT2+CASsXi
	jRAgZW/5AqiwRUTOnMQCoUVnwPTm4j79Fx/+baiZvOkibHTvp1KzK8dI6rOGe0U1wI6cbIgJQa5
	Ce4OfzrjBJXtBpy97//E1Z1b3Ied5WOc=
X-Gm-Gg: ASbGncs8kpqXb8g4zZQcJi7Yr3aWQTSeFBCaqG4TPMCZsR7OyJiHD9RWfuTZXZDuVoF
	Ju1y+GWtuF7wRomWRb3VQ5bAn9znQN5lrVQFmPmaJCLcMDvqqlrRFZV8qUc9fFj7lvsIzKxBMMR
	HgMf0oVqDlsNHyWPDUqjK0V6T0Vgwn1sOXn0rCOBpYEXI=
X-Google-Smtp-Source: AGHT+IGGRDg6dvGUeK36Oput269pl2yqb2y1xFKKSHDBlRpPDpYrhtJaDkofu0+vdab81vGgubCT4qvyh3ShB2z9IPs=
X-Received: by 2002:a17:90b:17c6:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-313f1befa77mr310176a91.1.1749837447824; Fri, 13 Jun 2025
 10:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609223606.2897030-1-ttabi@nvidia.com> <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
 <68b469afff19b8612cd1d8502166a9c868fa8ea8.camel@nvidia.com>
In-Reply-To: <68b469afff19b8612cd1d8502166a9c868fa8ea8.camel@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Jun 2025 19:57:15 +0200
X-Gm-Features: AX0GCFsYQyx7tJ1klazdwLLF-ext-Zv0IwsOQSQt75NIGyhO3DRU0t9tH7Z15XY
Message-ID: <CANiq72m6VxkB1GNL=t_Tq+bXSjXYeZjagP_FK5AfLWynvdd67w@mail.gmail.com>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code tracing
To: Timur Tabi <ttabi@nvidia.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"lossin@kernel.org" <lossin@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 7:03=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> If I move it into str.rs, and I tag it with #[inline], will it still be i=
nlined when used in the
> macro?  I can't figure out how to test that in godbolt.

The crate is the compilation (translation) unit, i.e. like (typically)
each `.c` in C, so the compiler can still "see everything", if that is
what you mean.

Even across the crate boundary the compiler may still decide to
inline, as if it were in a C header.

`#[inline]` is not a guarantee, though.

> After moving rfind_const, it turns out I don't need the `use` statement a=
nymore, but I don't
> understand why.

It may be imported by chance from a `*` import -- you should
double-check, but anyway, please use the full path instead.

> Like this?
>
>        assert!(::core::FILE.is_ascii());
>
> This compiles, but it seems wrong.

That should not compile -- were you calling the macro?

> Even though I don't need to do this? The code compiles fine as-is.
>
> Isn't the whole point behind `use` statements to avoid doing this?

In macros, you are expanding into the caller's code, so you cannot
assume what the user may have imported.

So please use fully qualified paths, including starting with
`::kernel` (i.e. not `kernel`).

> Well, it's suppose to generate the basename inline, so that there are no =
runtime calls.  Otherwise,
> I would never have had to create rfind_const.
>
>         pr_err!("{}:{}\n", sfile!(), line!());
>
> This is supposed to be inline.  How do I get the kernel build to show me =
the generated assembly
> language?  All of my tests in godbolt show that this code is always inlin=
e and the compiler notices
> bad values of start and end.

Const evaluation and inlining are two separate things. I think you are
trying to say that since everything is supposed to be inline then the
compiler should fold everything, but that is not guaranteed.

When you have code like the one in your patch, e.g. the `let`s are not
in a const context, and thus it is just normal code. It may happen to
be all optimized out, or not.

And if we made a mistake, e.g. replacing `start` with `1000`, you will
see it panics at runtime due to overflow if debug assertions are
enabled -- not a compile error.

But if you use a const context, like the initializer of a `const` or
putting it inside a `const` block, then the compiler will have to
evaluate it at compile-time (which is why not everything can be
written there).

As for showing the generated assembly, the object files are "normal"
ones, i.e. the usual tools should work. You can also put the `pr_err!`
line in e.g. a sample and then doing `make ....
samples/rust/rust_minimal.s` (eventually we will support `.s` for e.g.
`kernel.o` and other crates too).

> You mean like this:
>
>         const BASENAME =3D unsafe { core::str::from_utf8_unchecked(slice)=
 };
>         BASENAME

I think Benno meant just wrapping all your macro expanded code within
a `const` block instead of a normal block -- no need to declare an
intermediate.

I hope that helps!

Cheers,
Miguel
