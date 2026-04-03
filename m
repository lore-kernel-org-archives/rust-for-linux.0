Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EC2625
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775231597; cv=pass; b=bR2thZTEgM9n8+p13RFJ6z+1w87PCu2loHkH8Z1xQIFVRswFWn0QFU3F3bq9E0bjJtK6Dsi8y3/jt8C3lcI8zEEicQ9NTI0LZSisJtietmG1KqWJRrsSnoeY5WzGwlcqc1zyDrAb7iSaQm94d/KQBdIoK8jPd4o5AmvM7e8d82Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775231597; c=relaxed/simple;
	bh=t23z0PvZ5SLNM3iOMGWZAQbIb7X50AxZc0jqO7F0tJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IWgaYYcECSXbG0hNEELfmfNWFX0fViuLPdal+jvpJUnQcFKSzKWGAAAtpiX+yorgfs+edhWF774US884vgAV4zKyuvPzklo60cE8n+9q7Z4Lxp03H03qpO/pz0Ym+YmD1/1WnYiad7WmPYlKwJmSr26W6IgCFlS8/DoU+iRLhgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NjFAMa/4; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NjFAMa/4"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66baa7fdfd3so7840a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 08:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775231594; cv=none;
        d=google.com; s=arc-20240605;
        b=lqCTofSXoVIKuQn+EsMwbhiazR7IakVjYYZy2TZ3iO3sgJB0t9eeTpFLrAf6fGYVYX
         oayT+ZTTWUoLBzV4cs7AAjDbxqIciGisx1G2cTtj8cn74QPutngKjM1nkcaiXN6qebnX
         QGI9wIm10p2B6Q2Nu0llquaD6pD7YYoioffo2UvppjejzcA3eidj+3QjMDC4VgjlXoUc
         m0IWOSYYgLu/Ya3ljVUTLTwbwyg5sO3PAfwHbVm1+ha5co9bs+wZt1ogTXfBvUSdPI8t
         KqIHX4OdP7A1dPx57iLmaVwl3r0V0Vc6+HwHiTGEz9qbEPF8ab0j22LAcaZ6xkIeAw4h
         Mkag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=coqr6EFlArhl/x0h/ZohwmdyLe+IJgT11ByZbHHxjb8=;
        fh=xNJdn0i8oIbGNzTXsXxmwKtirdu+cPbrh0XMlhIiE8c=;
        b=AYCPZWwd/VyDyWtUqnBMckiazoISdSHHC1IxAKy1JTFN2Aerj5pz6ugd0pGRruvB73
         e0P/rWwb4qIkebThjgTDoMlcyqN2N7sphJshnLyhBX2s3/EfeQXO6NjjWIQGZ4qanE/7
         ad+AOM7IJnyqW56e+NmixWYAnFcfvimOwtk3sKBChPY5Bucd9DyAg9rO8/czJAtnGabe
         TMXg2xQ8czJVevANsPIjXCzL5KmlOKfk8oE+VTBeAzKNAJ898ezMXOpfu7VuOao3eJ1H
         NRYtdhIyTcYItkkESq8ExkmAT7loql1nWP8Qz0bq2tysxFwaGkzCsIh7iqBAoFNxjQLU
         n9Tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775231594; x=1775836394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coqr6EFlArhl/x0h/ZohwmdyLe+IJgT11ByZbHHxjb8=;
        b=NjFAMa/4gMTIyl7BlE0aQyZ1GJ+rVpy10ZCGEpSJ/JxduwK/HxPapOnuNDmM8yi0XL
         SJZDXBcBl1vyCSWAbiZcgPMQXpWU5jNGVHcHuaybl5DFK3N2UoCL4zYWIPH/Ay7n17oU
         U0QEpAgorn4C7554o/d/BOg0tfERKk7lnBAeSaxZNypiOk3sGQxVcMmqdk/Xd33+FFp9
         3xqtJRkJWutehg0v6hTx9YRcIQxaHhjmspQNxGGbsyDcjT6nzWncOwVEnQIuBK9+v62J
         4+7kOwppmVeW8hBhcnZwLfJKu8D/gaLZaqLtVn6jUoHa9DiO97vlq2o2T4PkUNAIxnZb
         cgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775231594; x=1775836394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=coqr6EFlArhl/x0h/ZohwmdyLe+IJgT11ByZbHHxjb8=;
        b=IfxNjGgujkqXN19IDwhJJGvOnbc5pG+shF0jSZ0DeeK2c8U4AdBaK0OFURQDkO0cno
         Hi3JFXt9lkvfyr3hMXs3pbJHMXkBsiBO/TPdowyxYZCX+JgEmD2kEtYIBZVzt28mlJTp
         1QfTF1yRshIdNkgReCizyrAhuoLQ2NuQbZlp38t619gjdcug3Puu0lD84mn1/Ey1jdA4
         0NS5AENE48Nz54n0eqLMwCy2tHBpnyTimKV0tUtcHhJ9X4u/XHO/t2jrn7BMew7hh1C8
         rk/WNWkcoGTnFDl2Hoy/aNF1e4X5FMK2nZqZDJjyNjnwr+XhBu8KR5ZtJHxcHciLvtlH
         A2HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXj/sVy6YbyxpGyknZoGEtPCd6iRyOkISSeuXOGxGubHc9+gRpbapJ7muuhxK1MU+tPiC0bmtWInxQZzNlbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgbSB0Bp/gp5hl91Nd88cEiJvVH00qm2QtSHnT9HI9DBceLUaC
	pVOtIsFjetCXLTxzsG231GIXGLUFm0elNI+WbsBOzax/JcecKEifg+IvnvWnR5SSTe85pMl1wgm
	2xra7hbZ8omIZlbJrt5fiPbgE49VZLCEqCnTcp55G
X-Gm-Gg: AeBDieskebuzZJhKQxOdN0RJ2+9YXM+hlSddwZXFkT3KFLN29UIc60obwLcvmYcwiJA
	WQkn7fL5XqDfO7PnLoGsyuemdQ5yHmQO1nV23Hzt9qu1qWXe8RbU2RNA1IbRC1z8WoYYx1VdnTP
	KSOHwKv2DzUOdIHTALsQtJTxW67PggZyKEtEJQ375T9dz8Laeh1rUTeFtbYecnrmqd2R5cxjdVw
	wi5Skj+SScT/LItL+S7/zOjgvZ8g87ypJdE6RGugJBHlCuN5jMv8hfVJzyOnmSzYe2j8w/Yl6ti
	X5hp8+Bb4z5AjG0=
X-Received: by 2002:a05:6402:4244:20b0:66b:eb42:be7 with SMTP id
 4fb4d7f45d1cf-66e43f7f81amr19687a12.13.1775231594022; Fri, 03 Apr 2026
 08:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org> <20260331205849.498295-2-ojeda@kernel.org>
 <CANiq72kNqmGpFurRy2X+a=9fHV_hxpfWBJ-+dEL_qj2daLM8ww@mail.gmail.com>
In-Reply-To: <CANiq72kNqmGpFurRy2X+a=9fHV_hxpfWBJ-+dEL_qj2daLM8ww@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 3 Apr 2026 08:52:37 -0700
X-Gm-Features: AQROBzAYADRZHwIlu_Hu7-_xFAf5tXH5Q2bpU3B-T608yTRVpmc4-aeDHJhGvtI
Message-ID: <CABCJKucPKB-ntYi=EzPqyypy0kEHwnZvEvCEyjdQUWqfeAnGig@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: macros: simplify `format!` arguments
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Thu, Apr 2, 2026 at 9:53=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 31, 2026 at 10:59=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> =
wrote:
> >
> > Clippy in Rust 1.88.0 (only) reported [1] up to the previous commit:
> >
> >     warning: variables can be used directly in the `format!` string
> >        --> rust/macros/module.rs:112:23
> >         |
> >     112 |         let content =3D format!("{param}:{content}", param =
=3D param, content =3D content);
> >         |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^
> >         |
> >         =3D help: for further information visit https://rust-lang.githu=
b.io/rust-clippy/master/index.html#uninlined_format_args
> >         =3D note: `-W clippy::uninlined-format-args` implied by `-W cli=
ppy::all`
> >         =3D help: to override `-W clippy::all` add `#[allow(clippy::uni=
nlined_format_args)]`
> >     help: change this to
> >         |
> >     112 -         let content =3D format!("{param}:{content}", param =
=3D param, content =3D content);
> >     112 +         let content =3D format!("{param}:{content}");
> >
> > The reason it only triggers in that version is that the lint was moved
> > from `pedantic` to `style` in Rust 1.88.0 and then back to `pedantic`
> > in Rust 1.89.0 [2][3].
> >
> > In this case, the suggestion is fair and a pure simplification, thus
> > just apply it.
> >
> > In addition, do the same for another place in the file that Clippy does
> > not report because it is multi-line.
> >
> > Link: https://lore.kernel.org/rust-for-linux/CANiq72=3DdrAtf3y_DZ-2o4jb=
6Az9J3Yj4QYwWnbRui4sm4AJD3Q@mail.gmail.com/ [1]
> > Link: https://github.com/rust-lang/rust-clippy/pull/15287 [2]
> > Link: https://github.com/rust-lang/rust-clippy/issues/15151 [3]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> I will pick this one up together with the other one, but if someone
> prefers that I don't, please shout (e.g. if modules wants to pick it
> themselves).

Sounds good to me, thanks.

> An Acked-by is also appreciated, thanks!

Acked-by: Sami Tolvanen <samitolvanen@google.com>

Sami
