Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D723B6345
	for <rust-for-linux@vger.kernel.org>; Wed,  6 May 2026 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056702; cv=pass; b=RWlq9U2HxTje/MdQrELDQdEFgMMsPwY7uxt/8f2Zg8SxAZNvWi2FdfGIfvuGqTFShc6I6u3l98XZI48nLdnT6QCR8hnXCwsOa1wDFOZ2b1ujhtH9UBF/LvVCGoJNSk1JY+vgtf7n7DPDJh0PwzyxSgwtCjwsylKZtp0APDRtSNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056702; c=relaxed/simple;
	bh=9nVWNeTeG3ZRxhZzd3nwBLx+qelPCKU8ekJq89YrS+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usjlq/6xP5btIEO+bf8luSgTjnU0TPixEb8+gQhqwtuvmV2UerPDAdH3JCOr+JQhIdsKvC0LeKykHoYgRFMLrcq4+KCNAjRJxJYgH+T1m3Yb4zDHflhbNGc7F1rjqxqxZMqqDNZwBi4xd6yf0ZqcUGhM7UDE5ORyaYe5YpMs5uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+oSqrr7; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+oSqrr7"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f5879d63ffso15221eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 06 May 2026 01:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778056700; cv=none;
        d=google.com; s=arc-20240605;
        b=ApJCGqIEJexEy3tyUeocQ1vJ6UlatYJn58usP9KVMrd+eIhG675n6MiV0NGQKhYS2F
         1m9vzP65oFM4fM4JAI4VhQsKcuF/U4jMOqOE6QsOw/u0LKrBZG3Zl5T4MyNtJ3cjFLz8
         i+sEk2fQ3SS3hYM3X4G0Zl3CEvBqfjxSzA3pR5HWoeRJucpH5n0GSX3o1yo8e5RtNMLz
         5d45dbuUddQUKsU6tK16xqVXU2mJ/4FgGbwO4402jL2+aMoDRTD0UQXQrGK/ngX6O4TJ
         h1VZ0Jh6I6mfgnTk03EqrTjiDUR5ofsRQTzAD6bibvnWLPgqxetvoASgxuBtXxyVYZjn
         Hw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KjJ3M5hqlIjwjVLxyicNRFnGTiIibcbqWXMBe2L4fRE=;
        fh=nC0v/95VLWkEyzanDH6GIN/BXFytVpbBd6SPguN+3E4=;
        b=hV29RQH/ZGFsh+BoYctp0oAfKL3ZBJPZfTAQjEJS54wMuVfBRF2uEsMhee+ECHKNZF
         iRKmDrLex99PRdSiTz5E3f5PZ19AJlPY0AJz9wOe06hATsxp4gttKmM29/gkHdmyaEnP
         FaYiuN0BUZIfRWby921W3WNkrtjs58S9jYV3Ta0r6kUSJQ3chWiUohL5FvAfAmWqIVD0
         TLbmvozLufeHC575duF5IyiMAhzaF4/I7rlb7ce4wtH67pxMEK5RzZFIqUr4+rEUCS77
         3IN3ycLqry124t4zvpTdSkDB0wboEGWbw+wZ+JgxKiabaHkDBtoE1UrYozDnjWl7zeP/
         R4Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778056700; x=1778661500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjJ3M5hqlIjwjVLxyicNRFnGTiIibcbqWXMBe2L4fRE=;
        b=M+oSqrr7ATlLSDWBSacNHlQqSP6S8t4csJphptB1y4CcsnaXzqeL+iNTaoKoW9Hl4T
         cdQhzTzHUrwEkAE9L4Eh1aD0C0sY3weJnMaJGoJTi/z4i8sljw9PKjaE7tSoS2KhnZDL
         CChA/4eR3oQdh0KA7kpTMvJlt1mcLs8tUK/fpIT0N2fJsdnO9LyazDbOJQ7vYM0+lxUs
         //wkTv8FPRpPH63l14lrZd+ClQUcqM9zkbgF/kA0z6LSClAHWb1Y+8yk/fKUOQ89Vld3
         3XmXYSGxL+GNxd3JyI05HfSZHwpsC+tgA6W8Y7JmbbWJa56A5h7xSCF17dEKX6bArPHh
         g+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778056700; x=1778661500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KjJ3M5hqlIjwjVLxyicNRFnGTiIibcbqWXMBe2L4fRE=;
        b=lU178XepHGrTZsK1A5nsgUcCtO0kKOxrQ9rOVgcWsp8zmrhf4zTnBgpHpid93zHlD6
         WMpcAu6uBM9ALMzBOLf11Gi5yaldODtwgaGCP+yv5OUklqdCV4CHCYoV00Gesu+a7jR7
         9VMjOZCpNKkmrCNO3abh2xnMQgOHTrn2ktSmWYvmYfghTbgR5dg2gcXQnwuEijQQqiIq
         +DEl/Xemp9JkCJBJjJWUowszKjQcEUU9TAb/ywR7/SNWH7xUm8me4hr0lxb6hkRIajTf
         iuPJTOPH8CQxWJwqAM+JBtgOadKQ4/Sd/VUZkF1NPRqhkjgCAVnirGNtBABF0+acRDYL
         Pt5g==
X-Forwarded-Encrypted: i=1; AFNElJ/uZ4BntPnv1BEkdVNN5e3c9VSZeM8COBjOg0XMysWWt0SFqKE0kLIloclDrFSDy93w7XgMbCyx2mLyR9SUSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKPke7tsnNjLdLMFZG0mc8MKPegRSUvMwTD8bwzIHlz0no3B5D
	/n6fVhLNAKUm9pTmJrUak+yeHxOk5jRPJBkTig5kXLYztXa/GlgECqmsERU+iLdxQcHI5sPQ5kJ
	WTc4d4ndl/cfdGgbhBqiwoVxBiMHerLM=
X-Gm-Gg: AeBDiethpWWTmr7aT3BOLWon3nD5W9yLFxMdTyO2xaQ4w4CjQkXfMsVCzB6qWqRIcoC
	LSS1BcDTChKQ/eHht3PPWwx/L55s9zdHyTtk2gQqvw5vk75VMiwoK+16xP3jhbqx3fvZZOqeKnt
	s5DLlHk9ND3lP14zMGcNOihmgkXAmid71zYdk07c30lDdB3BL+8+dCpPFzdNgx2EbQixYXsebvV
	w5zIpuT1+w5ezgntm332KLvgywKlM2iK/olRMAmBOIrmTYJMRIa77asfFGzFNscz0ScSsg2i/lv
	fHCxcrxx714vLfhtlDXBy4aTyoTL+zW12BXmKGUhSmONYIpoMcbSEv/T2+b8sQHL8D48xsv/AhX
	jmdCCvX+WdMOn7MD7W8U322k8lzqrZgORmBod4Kd9jTHp
X-Received: by 2002:a05:7300:a988:b0:2da:a813:a629 with SMTP id
 5a478bee46e88-2f5676c1477mr458743eec.2.1778056699517; Wed, 06 May 2026
 01:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
 <1bceee886b9027d66bbb48d9d6c8d1250ce8dbcb.1777987028.git.mchehab+huawei@kernel.org>
 <DIASHBBEIHQW.3EQSDUML6G3SB@garyguo.net> <20260506084935.1cd4b794@foz.lan>
In-Reply-To: <20260506084935.1cd4b794@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 6 May 2026 10:38:07 +0200
X-Gm-Features: AVHnY4J-4Wx0cKoZWw7hIQ4U4xAoj3JLXdrdEzm3q17ndVYjPejJZ9W_3tXEkz4
Message-ID: <CANiq72kN=2RsE0Wm_489Sc-VKO40A0uYinCj1McT=YMu=cM4aQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] MAINTAINERS: use a URL for pin-init maintainer's
 profile entry
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 8:49=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Maybe it is just me, but placing doc files in the crowd together with cod=
e
> on a project where documentation has its own directory sounds weird(*).
>
> (*) except for userspace tools and staging drivers where we want
>     everything, including documentation, contained on a single place.

It is a similar case -- they are vendored libraries developed and used
elsewhere (e.g. in userspace too).

> As you're already using some scripting to do a bidirectional sync,
> you could add there some logic to convert rust pin-init documentation
> to rst and place it at Documentation/rust/.

Most of the pin-init documentation is elsewhere (embedded in the Rust
source code) and already rendered at rust.docs.kernel.org.

(Using Sphinx for Rust has been discussed in the list a few times in
the past too, and that has its own set of constraints).

> Btw, on a quick check, only Rust has markdown files:
>
>         $ git ls-files|grep ".md$"|grep -v tools/
>         rust/pin-init/CONTRIBUTING.md
>         rust/pin-init/README.md
>         rust/proc-macro2/README.md
>         rust/quote/README.md
>         rust/syn/README.md
>
> As one of the people who spent years helping improving the Kernel
> documentation and doing lots of conversions from markdown
> and other non-structured text formats to RST, I have to say that I'm
> concerned with any trends that would add doc files that aren't
> properly integrated with the Kernel documentation system like those.

All those are vendored libraries, and most of those `README.md` files
are about clarifying where they are taken from and their licensing,
e.g.

    # `quote`

    These source files come from the Rust `quote` crate, version 1.0.40
    (released 2025-03-12), hosted in the <https://github.com/dtolnay/quote>
    repository, licensed under "Apache-2.0 OR MIT" and only modified to add
    the SPDX license identifiers.

    For copyright details, please see:

        https://github.com/dtolnay/quote/blob/1.0.40/README.md#license
        https://github.com/dtolnay/quote/blob/1.0.40/LICENSE-APACHE
        https://github.com/dtolnay/quote/blob/1.0.40/LICENSE-MIT

i.e. they are not intended to be kernel documentation, and moving them
away from the source files doesn't sound like an improvement,
especially since we were explicitly requested to make the provenance
very clear.

We could perhaps have a list of vendored libraries in
Documentation/rust/vendored-libraries.rst` -- that could perhaps be
useful for some folks.

In any case, I understand your desire to keep things integrated in the
kernel documentation, and I appreciate that (I also like to have
everything neatly integrated), but please do not assume we have been
randomly adding Markdown for no reason or that we are not trying to
keep things properly integrated... :(

Cheers,
Miguel
