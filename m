Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CD6224D7
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jan 2025 13:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736687433; cv=none; b=KVwtfhBCqUiLV5cek6euQzwIAjgvI7M6ec85/Er8sKaUys+4OoMsJHH2mldzqdTYGqdIsl5ldoE3yutRfDHS/Qvs4qMmtMGQadqp6z/n9ttzmAH07/bKWuY+MLb8O3y1vek3Tt0MNQd/7h8KE5hxZkR/yoLvAwzB6il1SbTe/j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736687433; c=relaxed/simple;
	bh=td6O3pknPirOh+eHjPMhEfdBkXaDiuLnATFU/I8BzUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JQ5AYm+PEO5qK9Xdu+u2MinEKaM99o25R4JAYt4/idSdUVGIe8kZIfUgw9n+IhZbbXoNB6QIvxBFb/H8z5tDqbNJoDog6iQVoJMg8dRLklfLc68Zz+/cOsxwQEKN4AWaNIkCcOQJZPVXPg10imdmA7XATUhxQL35qaIxOHLjdoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/gkNBcC; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/gkNBcC"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef6ee55225so732315a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Jan 2025 05:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736687431; x=1737292231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdgOA5Kx9LaG87CTVvpGmWf+J80Ehiu/Y0BhxN5JX7Q=;
        b=A/gkNBcCEB7HeNRCCuubxnYb7LnlY/WmDrh3ukDnFKC3/nkjg8c7yWKv969vluqT0b
         XPoZgg3WvRTPn16h6pyD46RgU9nXDa2DJlbk530e91XfM38JuJuyhHm0Jo4/hldVbSuj
         iFfq0lhsjOudX6Dag4rAwbsbEiY/tNx9bV4wytOUDPJdYz1kHToUJaQxLVPRRCGLRCsu
         6j50awpldShiptZVLdkqB8298AJHz3L1EAY9GNr8f0mFHhX90miNDIpvo+ULBsErXBT3
         6pS6Xfc9aq691fBU7iewsTpAjHTsLypbLw3Q9RtrcfcTOE+YnlvjwdK3vrs5HTw1qdzt
         9X8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736687431; x=1737292231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdgOA5Kx9LaG87CTVvpGmWf+J80Ehiu/Y0BhxN5JX7Q=;
        b=JPdqjyerfebON2ipxmlz/O/qk2Z6bIRV6Mc2Obf1inpkL7wZunzN5hfJECaXUL5doW
         LdjFZxLskrOlc9c1PDEwGaw4/+KkU0HcGohXNePjkuNGHa0RDu2sR8AQxVWdnGJeBE0T
         x5VoSNjxvNmH0gl4TiHQFqGSQ5ieve2NzpW20cCxq3PX+j0DvW0GktmRHTmeOmb0pdX+
         Y4pThLEuTRvxE/MmBafz0twX+UVMsHcxO/WN+f8qacYmjIim9mkvrdS1DIBxhum+2qFN
         70jjvVR5Tt7gYyiQmXw76wo/L+7kMi9RmF9oH/urWD5SrDHT1jy1Pyb9e1T6d8yXXQyh
         8WcQ==
X-Gm-Message-State: AOJu0YyFrCwBr4LDjoO6PKRcWPGVqF0L/icNpv3M7mzxO+q42KZUtBuw
	sbhAQjMoLeccp2uW40tz/y17xIe0I1BcvQ4S2Zq3USZs8gZDgGDYhGRv0/Sq3A989SWQaeSPnyt
	eRAOmXNWEn2mIvccPonAqS7IeOak=
X-Gm-Gg: ASbGncsUNi8HA4ZUw619g7hp0R5eBpticJ3CKrE/gn/AtYLNsf7EpgqO4At03ZEBV1k
	iKmMrqQdPd1yEhZ4RCcWKVqCxUGPnhm28pCXxFw==
X-Google-Smtp-Source: AGHT+IG/d/vWaIL4eMz0KhCvleuz4ENtv5nc04HLYmiK6/uAmWj/2hLtq+aG8AlEVHAhczFx+DG83oeIFZAdBQmVL84=
X-Received: by 2002:a17:902:e80d:b0:216:25f5:9afc with SMTP id
 d9443c01a7336-21a83f5e6a8mr90152375ad.9.1736687430836; Sun, 12 Jan 2025
 05:10:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107062134.2981602-1-dirk.behme@de.bosch.com> <20250107062134.2981602-2-dirk.behme@de.bosch.com>
In-Reply-To: <20250107062134.2981602-2-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 12 Jan 2025 14:10:18 +0100
X-Gm-Features: AbW1kvapMb_SnXBJbxFUk3ugr-WKpETiVR75ultpPC61XNIaKurBhkbiTN7ziyE
Message-ID: <CANiq72nKLZ7MdMGzQw8jJZ0_f8L-sV1n7_Ax2Up5AwYfg7BOZg@mail.gmail.com>
Subject: Re: [PATCH] rust: error: Extend the Result documentation
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 7:21=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
>
> Extend the Result documentation by some guidelines and examples how
> to handle Result error cases gracefully. And how to not handle them.
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD=
710v=3DhQO4xi+5E4xNALa6cA@mail.gmail.com/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Meta-comment: was "In-Reply-To" used because this was meant to be a
series, or because the patches were related? (some clients like Lore
may make them harder to see like this)

> +/// the error and success handling can be implemented in all detail as r=
equired.

Newline between paragraphs? (Though I am not sure if the intention was
a paragraph here though).

> +/// For example (inspired by [samples/rust/rust_minimal.rs](https://git.=
kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/rust/ru=
st_minimal.rs)):

I think this goes well over the 100 limit -- in general, using a
(long) URL may mean having to avoid the inline link syntax. It also
helps readability for those reading the docs in plain text.

> +/// fn example () -> Result {

While `rustfmt` doesn't do it by default (yet, hopefully), please try
to keep the examples formatted as it would, e.g. extra and missing
spaces and newlines in this example -- `rustfmt` would format it like:

    fn example() -> Result {
        let mut numbers =3D KVec::new();
        match numbers.push(72, GFP_KERNEL) {
            Err(e) =3D> {
                pr_err!("Error pushing 72: {:?}", e);
                return Err(e.into());
            }
            Ok(()) =3D> (), // Do nothing, continue
        }
        match numbers.push(108, GFP_KERNEL) {
            Err(e) =3D> {
                pr_err!("Error pushing 108: {:?}", e);
                return Err(e.into());
            }
            Ok(()) =3D> (), // Do nothing, continue
        }
        match numbers.push(200, GFP_KERNEL) {
            Err(e) =3D> {
                pr_err!("Error pushing 200: {:?}", e);
                return Err(e.into());
            }
            Ok(()) =3D> (), // Do nothing, continue
        }
        Ok(())
    }

With a few other changes: a couple newlines to make it easier to read,
moved `e` inside the formatting string, add a period to the comment,
moved the comments to the top (it is what we usually do, rather than
put them at the end of a line), I got:

    fn example() -> Result {
        let mut numbers =3D KVec::new();

        match numbers.push(72, GFP_KERNEL) {
            Err(e) =3D> {
                pr_err!("Error pushing 72: {e:?}");
                return Err(e.into());
            }
            // Do nothing, continue.
            Ok(()) =3D> (),
        }

        match numbers.push(108, GFP_KERNEL) {
            Err(e) =3D> {
                pr_err!("Error pushing 108: {e:?}");
                return Err(e.into());
            }
            // Do nothing, continue.
            Ok(()) =3D> (),
        }

        match numbers.push(200, GFP_KERNEL) {
            Err(e) =3D> {
                pr_err!("Error pushing 200: {e:?}");
                return Err(e.into());
            }
            // Do nothing, continue.
            Ok(()) =3D> (),
        }

        Ok(())
    }

Also, you may want to mention `if let` or even provide an example too
-- Clippy would complain about it. So an extra intermediate
example/state would be:

    fn example() -> Result {
        let mut numbers =3D KVec::new();

        if let Err(e) =3D numbers.push(72, GFP_KERNEL) {
            pr_err!("Error pushing 72: {e:?}");
            return Err(e.into());
        }

        if let Err(e) =3D numbers.push(108, GFP_KERNEL) {
            pr_err!("Error pushing 108: {e:?}");
            return Err(e.into());
        }

        if let Err(e) =3D numbers.push(200, GFP_KERNEL) {
            pr_err!("Error pushing 200: {e:?}");
            return Err(e.into());
        }

        Ok(())
    }

Another possibility, to reduce the length, would be to have a single
example showcasing all the possibilities (`match`, `if let`,
`expect()`, `?`...). But I don't mind the "effect" you currently have
of seeing how the full example gets simplified, to drive the point
home, even if normally we wouldn't be so verbose for other
examples/docs.

Also may be worth mentioning `let ... else`, though to make sense it
probably requires a different example.

You may also want to call `example()` in a hidden line, so that it
gets tested at runtime too.

> +/// Instead of the verbose [`match`](https://doc.rust-lang.org/reference=
/expressions/match-expr.html)
> +/// the [`?`](https://doc.rust-lang.org/reference/expressions/operator-e=
xpr.html#the-question-mark-operator)-operator
> +/// or [`unwrap()`](https://doc.rust-lang.org/std/result/enum.Result.htm=
l#method.unwrap)/
> +/// [`expect()`](https://doc.rust-lang.org/std/result/enum.Result.html#m=
ethod.expect)
> +/// can be used to handle the [`Result`] "automatically". However, in th=
e kernel

I think the word "automatically" may be confusing -- perhaps we can
just remove it?

By the way, it may make sense to link to the relevant chapter of the
online book or similar somewhere in the explanation (on top of the
Rust reference).

> +///     Ok(())
> +/// }
> +/// ```

Please add newlines between text and examples' triple backquotes to be
consistent with our other docs.

> +/// Instead [`unwrap_or()`](https://doc.rust-lang.org/std/result/enum.Re=
sult.html#method.unwrap_or),
> +/// [`unwrap_or_else()`](https://doc.rust-lang.org/std/result/enum.Resul=
t.html#method.unwrap_or_else) or
> +/// [`unwrap_or_default()`](https://doc.rust-lang.org/std/result/enum.Re=
sult.html#method.unwrap_or_default)
> +/// can be used. But in consequence, using the [`?`](https://doc.rust-la=
ng.org/reference/expressions/operator-expr.html#the-question-mark-operator)=
-operator

Those have different use cases, right? i.e. probably require a
different example. They could perhaps go with the `let ... else` one
after this discussion, or, if you want to keep this patch shorter,
perhaps simply mention them at the end as other alternatives depending
on the case.

Thanks for the patch!

Cheers,
Miguel
