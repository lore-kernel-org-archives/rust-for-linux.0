Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A72269CE7
	for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 06:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778999312; cv=pass; b=FN3iDKNI9w2DA556pmCABeVf2Y5rZUA0lX9JRuPeRosJ8O5VgrBq7Fd8a1y7lECoklAMUcJ+jSae1fJYoCszSM+mk7emdZeMMm8MjrDgeVrpvQeyORP3ds6zyc3F/DGgAFYqwT9OxVbG8jbDlhfzjmY8pa/XnW2CTomVtpRCaeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778999312; c=relaxed/simple;
	bh=OPR2WUH08s75FRHvXlU/rcxu+thbh0/WLa+Aj8Mbla0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhd9o4UWEEAS5bCxc7UhLWDqZlvYLbGnddotRzkbtgnrhFDJXc9hlIm7pH0bzIDcJufg0ZOVwrFESChr5NY28n0iQ056a0n9BKsS5bdXHXv66bpIWg3CjSzGbbwZRQNTls8mGYxim4YN9fpKh2oomtkGIADpO1FUTltPo0GoxxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGTZQFai; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGTZQFai"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f6e6a0a215so59513eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 16 May 2026 23:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778999310; cv=none;
        d=google.com; s=arc-20240605;
        b=RPeu3xAIud1asEg+t9GCYESkykPUjhgfm5qSm+XTAQEVMsMD2gfNpwOEAH5TUckrbK
         xSs9nB+lnJt+sXp3Sp5YPaBeoVWxapLpbB/5yXhJLQK2g+wDJVs8wXzWYDWcpnOFZRuk
         /0Y4bQR+XoVu9ezLIXXOPRHSp8cTWG9sjjSs8BNJrTjHM+LsAd1gsA6a29h8vm8HFCkr
         Uid6QO2/2j8b3x4JtLLUKP93qznZoa0VYSBYboeH0ttXV0vuT9PqFjIaJvyLgSin9Qjv
         AefHGWgyV2b7Ds2a0TbqsEfOv+elLHXywUU2ibcQQle2hjII//1PYHvPWFv56TeLtJ7s
         eMYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MlGs73OLRAgT31iPjKu3H4aS88H+LsbmLo/DH3+Lxm8=;
        fh=CU4EG0zduYy7CtTmxCirygnufPVtBTME6TtiKtdVPCg=;
        b=Hl8w/gGrUqeY8G20/1J+YLHGp9NbU7/1nDuPZ5xeIM09Rgoxc5M0gM8H5X+hwMXYZg
         bdTSwikrvYOJ82uKYk8E3VcFweLSE3BHdlH9zMYQetlTe9zOGNRrDYmBYC0/xVP1+pIU
         EyiDwORNEiF0hS3zFFHVF+aotXJnjwQjBIpsqq7lGCutCPZQgnKxtmm2OR//zSHGCCSn
         3g0XLia5nd9QUlFIkrFBCY+4BMsuO6FnNqLBMWF1fbXOTlXk7WG7PaCu45XR1k7oK3px
         yl7KcGPcbFYIbb3z9U9DvkWvj78WcUjZgVqnYxmLtutr/HO4fZqR2xC96EbR4j2uiiW8
         Cm8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778999310; x=1779604110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlGs73OLRAgT31iPjKu3H4aS88H+LsbmLo/DH3+Lxm8=;
        b=YGTZQFaing4oMC2mITA0WdJFvtBI2Hjp6gzlQbUUETLlcDgE4kRB8nZ4B+OXwa9syU
         ZD8kz8CBtDMklZw2LOw4JtCSSPAw9GAqObXSWUV0M9SfGOF6SidYzrX2jr8VNW+rg08+
         2S6aQlt2DQ+LJhX00Z7+hYgI0NInjk0S5l1YN349fL92HCuHdMjWwTtk+nTz3DSy7yO5
         1ZX1LBkh4ROn2jLx2iRDMwLXME4aIIr/iY2+LaEtlr2u0WcpzP2D8o7O8B1b32UMsK3n
         A6sUsqTmY4tzMHqgfiiCwr5AQKRfX2aUGpbUt5Ol9E+MT/ZpHGWYG22Nu7wU67p1ORfo
         INwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778999310; x=1779604110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MlGs73OLRAgT31iPjKu3H4aS88H+LsbmLo/DH3+Lxm8=;
        b=Lvoy4ndU2q6oNouejEJKKLF0QPAvjUK0Bfewb0LIrNjcctynJJckxVltX5yQV410gY
         WzKfF5RJfb0Qt+e46loqFZgCS4nx01t52D+3v4VgDN1D9I5hNnHz+Meqyz9hCqZUV6z8
         hLFHTa5hZRdPT8HMGepTYfOluiB1VkgnIIdmejjUcPDPny8kAoiQNCIjE5EF3uD5zfZw
         z7GSFIx0mYyzCFTFqDeG8Vw2dfhaVEItjMuLgjeTB3vWvv2218rXHDZYEahEDmKAD2cK
         zJpGkDz182aGQW0m/+C1s2cH5eDF0i9OihcPTD1hbbMW/1kLq7KCH5B3GW806LesPAs+
         KOdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xQsaavRBt/mcAT6kkOwKGWYHqlX9Wa6JGjMcHJBHD0gRBBlC6cUxJ6EyFV46YoIt0tuUPPJsrXSTCBVXYEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/dOwdEufQrgNdZlouttQyxsryYaAYhp854URt51JxxEMOu2u3
	8P5pWgBZdh6Si84KcSxy/pc3jJY+FpU+6DmiZzE76QG4VQjjnF/7imMwXZAncJlUsbn0uxaaD9L
	LmafeGLMdGqQ7DvC8/PTQNJ2+c6tAunM=
X-Gm-Gg: Acq92OEcO4K/yhZaEc126ni+Y3F2mzL5xpdLr2+k//nbMIRgarqgEhssuOvsn+uyZFv
	cSmDhgfwQgDrct2pIJMmbJnZmoHZx3l5Fa+HFexqtOYwXn3VJdZMs0xrm6QsDOMLlrXXHjYP5dn
	QW5b0jbBibElXgrWti+hbXC/DmzVKfe63l1GRCpPQS+LyK+7roZnWwlx6I4BB/Q8Bx20Q5fR/yU
	aYDVtmhizRCVsESmmX2OSVs/Ys74rU4NCNlsYuCo7SXsJyQiTgHMxOiRb8TKD19/43C72DxXWfp
	DWQiLCa1wAb+AVEirsox4Rt2TZCCjB2/gBWU/oW1QDO7vByT6NnlOgH1+uuU5SFAGXEjVkSHV4Y
	N9Lr6wtAo8AkTqMcpnlfpfBA=
X-Received: by 2002:a05:7301:644b:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-30398652434mr2296228eec.5.1778999309791; Sat, 16 May 2026
 23:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com> <20260516215354.449807-2-julianbraha@gmail.com>
In-Reply-To: <20260516215354.449807-2-julianbraha@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 08:28:16 +0200
X-Gm-Features: AVHnY4Ifc1Hb7OMmaBPhAaR2oSj-1JLh4DvcZKwastPdAt-HWTIyTG-2JU6Fszc
Message-ID: <CANiq72kr=tzvEitYj6xyT=jGnKQZK1dmekSU3us7MWGTrv0FNA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, jani.nikula@linux.intel.com, 
	akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org, 
	corbet@lwn.net, qingfang.deng@linux.dev, yann.prono@telecomnancy.net, 
	demiobenour@gmail.com, ej@inai.de, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 11:54=E2=80=AFPM Julian Braha <julianbraha@gmail.co=
m> wrote:
>
> +CARGO          =3D cargo

Question to Kbuild: would it hurt to hardcore `--offline` here?

If someone within Make actually ever needs Cargo to fetch something,
then they should be very explicit about it (in which case we could
have another variable etc.).

> -                 rust/libpin_init_internal.so rust/libpin_init_internal.=
dylib
> +                 rust/libpin_init_internal.so rust/libpin_init_internal.=
dylib \

Spurious change?

> +$(TARGET):
> +       $(CARGO) run --release --offline -p kconfirm-linux -- --linux-pat=
h $(srctree) --enable-arch $(SRCARCH) $(KCONFIRM_ARGS)

This probably does not work in `O=3D` builds or in cases where the
`srctree` is read-only (please see my other reply on the docs patch).

> +// SPDX-License-Identifier: GPL-2.0-only
> +use crate::AnalysisArgs;

This appears to use a quite different, custom Rust style. If this is
going to be developed in-tree, then we should do our best to follow
the guidelines:

  https://docs.kernel.org/rust/coding-guidelines.html

For instance, a few key points are not followed here:

  - Public items are not documented. When they are, they seem to use
comments instead of actual docs. Markdown is not used either.

  - No examples, doctests or tests.

  - No `// SAFETY` comments for unsafe code.

> +unsafe extern "C" {
> +    fn curl_global_init(flags: c_long) -> CURLcode;
> +
> +    fn curl_easy_init() -> *mut CURL;
> +
> +    fn curl_easy_cleanup(handle: *mut CURL);
> +
> +    fn curl_easy_perform(handle: *mut CURL) -> CURLcode;
> +
> +    fn curl_easy_strerror(code: CURLcode) -> *const c_char;
> +
> +    fn curl_easy_setopt(handle: *mut CURL, option: CURLoption, ...) -> C=
URLcode;
> +
> +    fn curl_easy_getinfo(handle: *mut CURL, info: CURLINFO, ...) -> CURL=
code;
> +}

I like minimizing dependencies, but since we require vendored
dependencies anyway, then it may be simpler to use a common
("standard") Rust dependency for these things. Then we can all agree
on a particular one and use that when the same need arises.

In fact, it seems like FFI here and in the other file is the only
source of `unsafe` code, no? We could perhaps even `forbid` it
otherwise.

If we truly want to minimize dependencies even if we have vendored
ones, then we could call into the `curl` CLI instead, just like we
e.g. call into `bindgen` instead of using its library.

Thanks!

Cheers,
Miguel
