Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991BC3A8C7
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921073; cv=none; b=r+/BLsQjutZh+NeQ/BknsSop7nAwj/mF6UqSsz7OjlTIVQwVkHvSjHYz+dOWGhpOCMDo1jZ7SMe2wNKzoLbeMp2D/pZ89uZFXcA+LFyF8RhDh7FB+/oEBu+/NfHFALS+aVAQVKe+bUIDjiRef+rChhtA1QXLWFvn6IjdOb6M+CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921073; c=relaxed/simple;
	bh=YNgWEr/XGvSCMTWMRC8tTA4WI6AdmRIz2JD8EXdckDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ls6snCRRaZgvZtvmps9WUVM+YZMSWvBeqrkrls1lY+zXRlCCYm8snVyYJMaXszb8V9+eMsk9MwsxS/SudfIQoHO1p21rCYRmVfJ+sZbaZXPkdj8K8tDOZCsq6MrIPk6Yp1VWhgiZACUEQhXiBm9WpYQJgjeYmTBXkUd5B0vzZdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2fU3J8u; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2fU3J8u"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-600273605a9so39867b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 02:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705921070; x=1706525870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJRpafLcfALRH45pBjTo5h6ASOFS4e8/ZsG6m6PCah8=;
        b=R2fU3J8uLR5XIiKEnfH69iI5ne4r/YmHdJKsVcKntmgGjSHzucAIwMa+ye4TPubI04
         YY5XntVex8nQFlZaEp52tv2cDiUVnHs41oEM7yHR7saH0P+3VCJUqJp3sd+eJBRsIZj/
         Xk/juEtTvoVhLDygIds2/m1KNwt8N925HHiXhYSoUUssSHVSCZe07GiDhFL918jAhdvf
         GoDFGNoSISrBPTe7aT7lAixd4lUz0A9dpxNbeP0WmM5XWDXY0mm4W/MJ3wJzB48nPeMx
         83/yhpuuZX5memPEbxvLsD05ss1jLelCdJ62xEq4FesQNKOgclSHSnyfJoFeNYwn65/J
         Te5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921070; x=1706525870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJRpafLcfALRH45pBjTo5h6ASOFS4e8/ZsG6m6PCah8=;
        b=xOES3qwNazxDW6Mm8JIl0vuNjQy5hymU2ol/ThaCVlgd5l7MJUE97kZd4yhnxPni34
         uPFOCb/KCNQpFoHCYrIOQtbRh1B9IFgUQoF1YrP8iW22pzSfghP2ujIXXT29qs1BqQ5s
         rboGsqUaLlqF8sIwL2YMRx8juJeoHjSUWBfDbcTHHvgbNgnOACIXHHI3wfqGs5P20bZf
         n9kqA/a1UU+DmomDOTxfKqzfPHMDIcZsYHftC36CeXg2v5z/RDhhyJgqVbwp0k7hfYrY
         XKAtEamUUIsqh9v22p5aZ4ArudbHlyX7Dy1M1pCky6aVHbMaC9LeJcB4GvHR/CO5u9dz
         AEZA==
X-Gm-Message-State: AOJu0YxRxDUGOgLUhvsh8E+qx0ui6p25VU4/2OBhT3R09wL5CyKE5I4D
	KzHesnd+vs7NZG6pgnoTV8edgBk3HS7ynh3ANC5btBrI/CyCt3i5jF5qvUIae6vt8CajdpXZ1Li
	iw2NU378zELyK12glYXB2+nUakJxMmiX9RWY=
X-Google-Smtp-Source: AGHT+IEz4aaOQXFQBJtvOD/f/MilTuhDPXH8fXx88QvvTF4AQBk3700NZJKTrXMsxqzwhYf11YGLQLnaHMhGp4WWYF0=
X-Received: by 2002:a81:8397:0:b0:5ff:b100:9c7b with SMTP id
 t145-20020a818397000000b005ffb1009c7bmr2738906ywf.81.1705921070369; Mon, 22
 Jan 2024 02:57:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122054219.779928-1-dirk.behme@de.bosch.com>
In-Reply-To: <20240122054219.779928-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Jan 2024 11:57:39 +0100
Message-ID: <CANiq72nCtbFt3Tysr6AdUNHdw7QBVS+7dTwck-BD7H_XfF+CEQ@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: Add description of Rust documentation test as
 KUnit ones
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dirk,

Thanks for sending this! A few nits below.

On Mon, Jan 22, 2024 at 6:42=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Rust documentation tests are automatically converted into KUnit
> tests. The mainline commit adding this feature

Perhaps remove "mainline", i.e. it is the default.

> commit a66d733da801 ("rust: support running Rust documentation tests as K=
Unit ones")
>
> from Mingual has a very nice commit message with a lot details

Typo ;)

> for this. To not 'hide' that just in a commit message pick main
> parts of it and add it to the documentation. And add a short info

Perhaps: "...message, pick the main parts and add..."

> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

`Co-developed-by` needs to go together with `Signed-off-by` (but the
latter cannot be added without permission).

In addition, there are also two ways of using it: you can give main
authorship to yourself or to one of the co-developers. It depends on
what you agree with the others / what is fair. Here, I wrote most of
the text, but I don't mind if you want to keep the main authorship,
especially if you are willing to put the work to improve the text with
the feedback from Trevor etc. :)

> +KUnit tests =3D=3D documentation tests
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> +Rust has documentation tests: these are typically examples of
> +usage of any item (e.g. function, struct, module...).

I think the previous section before this should be re-arranged
somehow, since it already introduces doctests. And it should probably
be moved into its own page like Trevor mentioned. See also my other
comment below.

> +They are very convenient because they are just written
> +alongside the documentation. For instance::
> +
> +       /// Sums two numbers.
> +       ///
> +       /// ```
> +       /// assert_eq!(mymod::f(10, 20), 30);
> +       /// ```
> +       pub fn f(a: i32, b: i32) -> i32 {
> +           a + b
> +       }

Two blocks are missing the `.. code-block:: rust` we use elsewhere.

> +In userspace, the tests are collected and run via `rustdoc`.

Double-quotes?

> +Using the tool as-is would be useful already, since it allows
> +to compile-test most tests (thus enforcing they are kept
> +in sync with the code they document) and run those that do not
> +depend on in-kernel APIs.
> +
> +However, by transforming the tests into a KUnit test suite,
> +they can also be run inside the kernel. Moreover, the tests
> +get to be compiled as other Rust kernel objects instead of
> +targeting userspace.
> +
> +On top of that, the integration with KUnit means the Rust
> +support gets to reuse the existing testing facilities. For
> +instance, the kernel log would look like::

Hmm... I originally wrote this in the context of a commit message, so
some of these paragraphs (and others, e.g. the "A notable difference
from..." below) feel written from that context (i.e. mixing
implementation details).

For instance, here, "Using the tool as-is would be useful already" is
justifying the reason for introducing extra complexity to transform
the tests into KUnit ones, rather than using `rustdoc` as-is. In other
words, it is more about justifying why the changes (i.e. the commit)
were introduced, rather than explaining a user how to use Rust
doctests in the kernel.

So I think some bits here and there could be cut and/or rearranged to
sound more like documentation.

> +Tests using the ``?`` operator are also supported as usual, e.g.::

Since we can use hyperlinks here and since the question mark operator
is a novelty when coming from the C side, it could be nice to link to
some docs about it, e.g. to
https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-ques=
tion-mark-operator

> +To use this it is required to enable::
> +
> +       CONFIG_KUNIT
> +          Kernel hacking -> Kernel Testing and Coverage -> KUnit - Enabl=
e support for unit tests
> +       CONFIG_RUST_KERNEL_DOCTESTS
> +          Kernel hacking -> Rust hacking -> Doctests for the `kernel` cr=
ate

If we move this into another page, this probably could be in another
"Usage" or similar section (and move the KUnit script parts here,
too), while the other text could be in an "Introduction" section or
similar.

> +in the kernel config system. Note that these options should
> +not be enabled in a production system.

This is true, though I am not sure if we should duplicate it here --
it is in KUnit's docs (though perhaps where it should be is in
`CONFIG_KUNIT`'s description, i.e. that way one has to see it to
enable it even if one does not read the docs).

Cheers,
Miguel
