Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301366A02D
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Feb 2024 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708435056; cv=none; b=PHuUIh573RgwURfuZV7kzeXg7BEX776k+yaXK2MlyErcKa+lW4m4aFTbeJhE44r63yEnb3xzNjQOYY23bvhtoSG2cooqbkNmkzd6dbziX6++M871QWOaVwiOWb5cN6a2zRVY8Vv7/OgzW0JqcpGP28ZzO+MzyjtIQbY5aKv0d3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708435056; c=relaxed/simple;
	bh=qL9esCSTsbD1GdZPqIOF52zqtukaAoOtfw37L/iCfIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmqueYlR9NzH5w1lmFw72q8BJxIUgy5TslhytS4YT7wh189+EBiPT/M0OAr9BXGVvXbMOJsazJUqbx/GANwe7LRYyr2aIDb6RM21HlKEJvLAS90P2vLIZXqhqDD8P+JT+9Dawja2/RSyxL3XN5khBJEhhUsZOA2ELjFJIdCjxW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1nBzoJkl; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1nBzoJkl"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c1593b82acso1078890b6e.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Feb 2024 05:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708435054; x=1709039854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qL9esCSTsbD1GdZPqIOF52zqtukaAoOtfw37L/iCfIE=;
        b=1nBzoJklVG6MRZ57Q47qkUkFL5A4A6xZjHblZrbhHHANcgwrWVUvkB3ahdzzJUFTTj
         +wAZXnsFU50xZu+MfJAnZzgL6dNZCiXbjXJY3f6vyc6Yyxd2dGKwgXIm5UnhzT6KnJlV
         5V/Wlkz5E0r+6OQbUGqnuSOZEk2Q5xchVNsYQhBxEbIbZD9iQ1NHXQGr38yiCeWhEM1Y
         36KQffCLZgJK7W6WwsReGF/CNDx9tj2PnW7aSziuCDpplv6IykxcSR6gf7OsB0CW1C64
         rmcFxSBAXy9tj2VxMPRnxyoG8rS3ztZ5LzxdJnmo30jgXnwq1ZuesWZ4JVC/vFZjH6Lv
         CuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708435054; x=1709039854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qL9esCSTsbD1GdZPqIOF52zqtukaAoOtfw37L/iCfIE=;
        b=dusJKCzvrtgHLY/voPppopq4cQGYsxhcr3rWbtBqj3O9oeEUEcSwqt3SyhbEPgE2NX
         HSwuTIbHLt+j15zym/YKXNGDjCUySMfcGjxlEnGNHxBw4mS+FEXI9+W4A4Y+KvnaZEp9
         m3QBZxv0iFPx4gsR2CLfQ/xbNS/cmxP2C51rTN+PaU17CN1f/8i+w4pUDn8zWvJ0yJUQ
         cQ+764UiDqW9vlIkjksj+aP31J3ValjGv8s1ftrGdv/TWyJqxguQFhdDktlEUzLzl6j+
         EG+vjtEgWWfm2F5zPWDRAn8UV0gI7IWTtk1VGNcPSZ374lZvz3o9uaL1/G5tof4ahdF+
         VG1g==
X-Forwarded-Encrypted: i=1; AJvYcCVo6llo/q/x+IXMb6hgbsWzGGloDjZO8rIFzdWnbQBgw1wnpHE7W+5hTQKY3IzBLGka97089veRLpDnKo6DxQcZWQZmkE8R92v0HrEdUFM=
X-Gm-Message-State: AOJu0Yxfx5s4QcGKHddXZFJq/QEWkYeBb5Td2ZOrhrKdvVxPdEG8E2K8
	/9zr+M1hM9/NtjaOEKAuHz1/cb55HSq6FsdBhVfks//igbtjyZ4mlfzkwFtnnTtCt8bpb9ilcFn
	gGMl7PSp1Dc/rpQTTvqrhNCSfPpsV4b6bq3Vn
X-Google-Smtp-Source: AGHT+IE0KzursJtPq+abIWMqtK5O1+xQJm+xa2/64BP3Y6r6RrQUFND+hye5sxQmu0NqoMrH5fj/TKGMGYpHWYzYVPM=
X-Received: by 2002:a05:6870:4195:b0:21f:662:7f4 with SMTP id
 y21-20020a056870419500b0021f066207f4mr3540551oac.32.1708435053990; Tue, 20
 Feb 2024 05:17:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219163915.2705-1-dakr@redhat.com> <20240220093541.280140-1-aliceryhl@google.com>
 <e543b270-dea7-477a-b83d-62129d4ac708@redhat.com>
In-Reply-To: <e543b270-dea7-477a-b83d-62129d4ac708@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 20 Feb 2024 14:17:22 +0100
Message-ID: <CAH5fLggXiXGA_UWCxqqLhMpXe1kepDv2vMG+1jLGaDSzdRHvSw@mail.gmail.com>
Subject: Re: [PATCH v4] rust: str: add {make,to}_{upper,lower}case() to CString
To: Danilo Krummrich <dakr@redhat.com>
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 1:02=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> On 2/20/24 10:35, Alice Ryhl wrote:
> >> Add functions to convert a CString to upper- / lowercase, either
> >> in-place or by creating a copy of the original CString.
> >>
> >> Naming followes the one from the Rust stdlib, where functions starting
> >> with 'to' create a copy and functions starting with 'make' perform an
> >> in-place conversion.
> >>
> >> This is required by the Nova project (GSP only Rust successor of
> >> Nouveau) to convert stringified enum values (representing different GP=
U
> >> chipsets) to strings in order to generate the corresponding firmware
> >> paths. See also [1].
> >>
> >> [1] https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General=
/topic/String.20manipulation.20in.20kernel.20Rust
> >>
> >> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> >
> > This looks good to me, so you may add my
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
> Thanks for reviewing this patch.
>
> >
> > However, it looks like this patch has some clippy warnings that need to
> > be fixed before it can be merged.
>
> It seems that those warnings are treated as fatal even, although, given t=
he
> rationale for these warnings, I'm not even sure those should be warnings =
at
> all.

The build currently succeeds with zero warnings. That's a very useful
property, and I would not like to give it up.

You could submit a patch to silence these specific warnings. The
clippy::explicit_auto_deref warning is not one I care for, but I would
object to silencing clippy::needless_return. Using return statements
when you are not doing an early-return really is extremely unidiomatic
Rust.

Ultimately, I think there is a lot of value of just applying the code
formatters and linters and following them to zero warnings. It ensures
that the Rust code is relatively idiomatic, helps avoid long
unproductive discussions, and makes it easy for me to fix formatting
issues in my own patches (just run clippy and rustfmt on everything,
and it lists only things that are my own fault).

Alice
