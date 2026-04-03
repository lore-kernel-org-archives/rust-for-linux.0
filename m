Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E3130E0DC
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 04:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775191997; cv=pass; b=XGySTUriPeJAwF7xabOE5hPNSDwMXpqJr/yedD4g9GJTw3iNNToN1CUwb04Koe+E4MEw+taaRe+2N5jXi6G+c/t3dn7/FIzZdGRGqt+CvXhiGem2aa+qcTXnaWYr+TKWepqfSWjx4e7O5LtAHyZCx5vAY+I5sXzadcvfdubpVeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775191997; c=relaxed/simple;
	bh=yl2v4HCLZpTTCWiNSHezHoQggNNu2rh4MEf6BSYZ4xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rTx/0G8dK2btzwKycYTV7/l6QRvUFQ57XcENcCcjHES9uv7VElLxYnGM6WD+MHko2gNLA8DDGsubISgL2SqWKQD/bBkHKMcBhLdtGXF10wAmu160LBv3VsTy5obJ2+ximy1q5mGUSnI6VG+zhnsugLfhOujeyMFLlIJMVDPLdHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScgQv2X5; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScgQv2X5"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-128bae6a35aso60138c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Apr 2026 21:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775191995; cv=none;
        d=google.com; s=arc-20240605;
        b=MwnN5g0mPugL5k3NYJ75ffQrzKOH5skLsjrvU0KnjujRePQZnwYSoNqC5I8EOq/Lrd
         NhvnXofrHD9P5tQVg4lD4MdSCYoDFyA0IQXRGoiAJC5r8WVSD5TeBwGvRG/z3kXEWyZR
         cDpFCiJWFQz//W+wE+ghSIKxOQklysFDiIvW1JQUmptJak/lbja+cFPhHG8Szgp9iNcu
         g70XbVwkepyNiszQFtFeqI9xzpJie42jXO40+lOeiyzVhTwKkNL5ADPK/N3GSXlzH4Yz
         2+HiiLE5XfbdvdoIshNvt2I3fVjbb4U+ZHaxMPKrnvcJDxZqEZIM3OXqeK3PymV+q10y
         9GYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BFl652h+zh7LQ70IxgsBAbSjGMJ2GOXvRo1wsMp6Q80=;
        fh=gbyHQAQXEHy0LBSkwpLtYFWo/JlLkxlHTy7U0QTJ+VE=;
        b=aQxm4xJo0RQeS9f1kEhulBDf/eURJVO5pqHH8zKcz9DpHoaUiV/+wuEX3JidRReQrk
         U8Iz9gDX2D8oElh7fa28c87hWc/hxrHfLqdogstVHzs5oGcS0GrIsl+w+DucNuh1UpJ/
         nf6owQNrzgjsR1lKwwqgPH8Q5km49rpxQL/8KRPsSrs9wvSj+mORVyYl87K7WvTKm65f
         iDIPB/4VB1a6slw9JyQI3vys6Z+WA0U4Dvyq8/9mMaB2IlVOfUNU7vvZei+YUtmT3hYX
         doJCMxF0BAqEQblYxURRNM6d+QIFooDXEJYxIpscPwynIW9bb2M7RHAA+8ANhl6WqYvY
         KY2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775191995; x=1775796795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFl652h+zh7LQ70IxgsBAbSjGMJ2GOXvRo1wsMp6Q80=;
        b=ScgQv2X5z/bPy2+z10wPDBjbAJjE3PoN74nC1/UvC8JtZrsNakh9CrdwIoI/YgeAZv
         vPnuj3BDj0nN8pXYnK9uVgnS+bFJraVVqGHAKvAp43hVsAuo9JXI9HsRc7m/RruZY+vG
         rk6zChqSM20v1riLHfqgMxA/BGVzxS2mQvBQsi/njNzqEKa+gFAhXxn7438rzumaCaM/
         I9UCC8FnDWjbGb6klI9w9/Y6Dk4cGDccSFAOfqrlJfmKvW2sre73jo6S+2MGhHYQ2xxo
         Asu1zybAk6UXgPIuDpPXjhff0bq+nGK829+7dFbpRs3XJupsBJS/81apoQjRSdwId/1b
         rCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775191995; x=1775796795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BFl652h+zh7LQ70IxgsBAbSjGMJ2GOXvRo1wsMp6Q80=;
        b=XmsIgJE5CLFHmppnDI7uvI+Z0HhkuoBa6Js+M8IQybmC9e2/nck358Mrg1wAc1yS2V
         HX3ST3YMT5CRUEWw0fY3O62NJGkzNwnFEXpO8QG4eMAzsbEtKEWH2LmWRziLyNQBx2X+
         fAwMoZDs6lThZ5DXmbSOqNeBxibY8N4XfzGsXapNlsC8QAaeeP1Z3+16L67v1FVTW9fb
         4MVDsBqM8scex5RZP6MlrDxfWlEFnK+J4wq6VUA4caT1cDt+rob3QOBK2woWFunZPUtk
         UNuMyftUwFgoIP9zq3Ecg6ej11qjGgbzUOAEFCTgfiOMnv2ZxlcVozKRnPYVI2ESZfA3
         VkLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2oP7SBfW4QewcIUwAzh7eDxoTH5Rdbbg6Wk1ANFa3GQqQ65wZeRD5dTPjcEZDVUkvGRE526teZIB3uXaygw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3g/2ljMU7O8Ntnup2WYeoJNb3Nnwu1MExykTH2JTBj8SXAqse
	2Fevn4Qso+o+7fqMLH33kB/qnoGLxRDTpVu77ojbMkzT0FsDBUwxJr46JlQA9IJbRjc68nOdIaR
	J0w5kIvHk9ptGbjVtfY/thZTAXSyMMYA=
X-Gm-Gg: ATEYQzzMM9UvrZUNaFfv8foUSJngej0v607+nxprwiXS5wbBkKww1z1JdrNH9gwsOce
	eYvnbjvbFU2O2gaPUevTOq1ttE5xWDRo9SquHemnJog9PGagU+Um1pjk6TucfQ4kIsCFCBwGReK
	cBCYXiBrW+QkqsreY22xZ6i6Tlt0CuUlKuuXi2VGB1jqYiAeSq5QRItnKuIccX9Bag8qVVkCHaa
	g5GmGHYayVCETdsXjossemjTgQfjsF2WmKEfK9o635TrFX0Yz+qZ2LxGMKE9xwOSYcc1H89zdFO
	zovHs/nfd8IXH7TDKYZENueFrC9qOciKQSromWmDtzMwLikHe5fHnp+3wlOZgVLVFSYFyhmL/ZN
	4pR6HqBPku4HJTLRLZnXNBHc=
X-Received: by 2002:a05:7022:929:b0:128:d590:2947 with SMTP id
 a92af1059eb24-12bfb740ef0mr367589c88.4.1775191994985; Thu, 02 Apr 2026
 21:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org> <20260331205849.498295-2-ojeda@kernel.org>
In-Reply-To: <20260331205849.498295-2-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 06:53:02 +0200
X-Gm-Features: AQROBzDJbkOKUs3Pbx6-NjHKhuMni-H63EEyi2tvHo0-KK_56o32Fe31dKQRj3Y
Message-ID: <CANiq72kNqmGpFurRy2X+a=9fHV_hxpfWBJ-+dEL_qj2daLM8ww@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: macros: simplify `format!` arguments
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 10:59=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Clippy in Rust 1.88.0 (only) reported [1] up to the previous commit:
>
>     warning: variables can be used directly in the `format!` string
>        --> rust/macros/module.rs:112:23
>         |
>     112 |         let content =3D format!("{param}:{content}", param =3D =
param, content =3D content);
>         |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#uninlined_format_args
>         =3D note: `-W clippy::uninlined-format-args` implied by `-W clipp=
y::all`
>         =3D help: to override `-W clippy::all` add `#[allow(clippy::uninl=
ined_format_args)]`
>     help: change this to
>         |
>     112 -         let content =3D format!("{param}:{content}", param =3D =
param, content =3D content);
>     112 +         let content =3D format!("{param}:{content}");
>
> The reason it only triggers in that version is that the lint was moved
> from `pedantic` to `style` in Rust 1.88.0 and then back to `pedantic`
> in Rust 1.89.0 [2][3].
>
> In this case, the suggestion is fair and a pure simplification, thus
> just apply it.
>
> In addition, do the same for another place in the file that Clippy does
> not report because it is multi-line.
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72=3DdrAtf3y_DZ-2o4jb6A=
z9J3Yj4QYwWnbRui4sm4AJD3Q@mail.gmail.com/ [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/15287 [2]
> Link: https://github.com/rust-lang/rust-clippy/issues/15151 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

I will pick this one up together with the other one, but if someone
prefers that I don't, please shout (e.g. if modules wants to pick it
themselves).

An Acked-by is also appreciated, thanks!

Cheers,
Miguel
