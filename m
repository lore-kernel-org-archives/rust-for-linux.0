Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0C02777EA
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 10:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164019; cv=pass; b=BiHUMb6ebjUMzgbvv6mxJ/LJSZ0Nr8moGoFre5Iz6VftlNRlt+ZCSnYk/vY9VtCuYBqkSLyzn5Sf/MyTiRp7ynQo9viZov8mcsFEMgRH5UR2L4H0u3CdZ7rFKV8qr2A8udDeqq2TFZss4p5JJube/9mwyAoPH3jhIhylns02Qvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164019; c=relaxed/simple;
	bh=r2Yb9Z7/28qws9y72DI2mwic3I5De1S4rss0kdut/90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hb7xd/1lofbTLYoMVuq+bt/rao7MqEVIfZW66YbbA8JHUIjcR/akNjSgK8A5FtP1dKOoUTUVJDsnk1ZLqxjuPaDtK2jpIMhngzSZFfQDhVHEw8uOqrP9TBiGmPS4SWSu4MZJqZy6h3VlHmBXlyHoiBNsXbeZUX4jQnXbHw5Nae4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWq3YUe3; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWq3YUe3"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b1769fda0eso222315eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 02:26:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769164017; cv=none;
        d=google.com; s=arc-20240605;
        b=X5630v/OX9KwJylhoUL+LdiK0wShA942cmPuCLcD9smn8XD3bfbLcsYPpVQ+VDTWFN
         13C4qdiSf2CAtqRNlMJdsk3WLO4gX8ueEEA2pdCZaqEq/joe2WryhZJ3Su9+Vsy6n47T
         SPzRRVMFD4jZX+JxI50i1TWD4rjHnzUwZE/3Tnu8h7+1wRoUPW/pfXx7QO3h+ww0Djzr
         bO/0rcZeTOqOi6pijicvI+8pYrv+FGW3l/qItKyWian0saoFBKs3nnfUIs4mDAamcZjs
         A7n6UrhHBQ6Ls+cMcMQgXj1+h+f9C0ZLJMcMZgX5y2w0r/pH+oVsXjHCY+o1YOqBJoN0
         4NLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dczC/fHwBMLH9Ns7bHWP5l77BPtNvAs7KMnOrwXl9iI=;
        fh=jbbd5r+aNnsJxjq9vEcN/d9vPrqYLJ6qFxddITwBITA=;
        b=jNEa13XdIQW3JZUmRdMU2iHbIZl/6JC4wDlEqIjk6luNx/vToTf0wABPRlDwTIKQow
         iMBwCyOlcdgivsR9zcmuV1xkGGdGC3k0USwnWyYtqjdni/24NHFKkVVOIDztsgaMBpbN
         Nmo1Tu24w/QBchUcYhY2O6CT2cEMR9nctwhfj1Ynmh/2Y2gXk0bNgrGBnmAW+tFU/OI/
         AVAFYW8+Df9r/aAsLVgSwcVaqTb+oWOMBLhQ8d0eukUP7JNXHY/xmyAw1/zImkFByQoh
         m4V63li5neTIivMAGiZjIAY01h7CCu6YsPKSee/lsgRbbcs/jIuGd/eGBizg5vonrQ/Q
         p/Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769164017; x=1769768817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dczC/fHwBMLH9Ns7bHWP5l77BPtNvAs7KMnOrwXl9iI=;
        b=ZWq3YUe3ftcGUw2VMBZVurbDFYyFywULgEJjG/pMrkgPVBJsdDOWlC0i2Qa6LfS6cP
         tH4GXn0yWNG09gfolzWE6d5rvtRGpbw6COIDDS5UUPcIxh7m02b9UEnFbOgF2nrIiS5e
         EaNM6vxYwnKIHtNMY1avkh0fIhNPvsAv00k2v9+2F4/IqPNx3Pxo9eHRFU8Xm/wY+xxX
         tfqZapbl46rWjDlXbIQvHSkCJ48QkFTlDnjVHxGbl6o4JR/0hPJSw98ui1zJ6FzuI3LP
         yGHGij+WEPj3m7467HFUy76Q9/o8gChHg+0s4vfK5noiLAEbLS/dY9vMCoZvPG5hhPcr
         klPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769164017; x=1769768817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dczC/fHwBMLH9Ns7bHWP5l77BPtNvAs7KMnOrwXl9iI=;
        b=h07E+5W3NExoh3k8hy4sTOBfZyGo/HZkEwQdcSfmYRJkPr7XnWuOTTdJbqhnNFcV0C
         RkaiuyTQcmKz7lWfyjZX7keXoN7CcIDCcm24Vxp6E7ifmqxbQ0codSaOKvdGuTpBAqzW
         2SoHJ5a/NrSP+x03XT+oybOnDC4LI9JCmWMcf1BhnT5lxHJ2gsUATlCnKNppDhIcGL5t
         OUKV6uwa1qP3adoDhy9mO2+zOuisYu8rqVsyK7/5mx4Wy0nlKeEIPo/IXWr783HBFPEB
         LKAuT0XcIiJjmY+0ilNJFO4dSlzFXnlAtWd6ksMfKxnJ/5V9V+Gi3+rsdKWyXZJbaEUX
         933A==
X-Forwarded-Encrypted: i=1; AJvYcCW3HVWIkFUWHBs9jjt7V69FWfao/w8DjWoVLTM+BMVm+BWPlwqvAF8e/OUf/BwQIw4AHx1dJwnh/9oI7257Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+pi5Lb9vBBf6rxXOFVI1l89UPhI05+/reSvb9U/CfVIUinAyM
	HQThzExJItbaujgOQ2WLI6sC9dx7mP55CrZczzCMU5btvdkVwbCI8fIteFQLkhWP/gn7m0ljZDf
	Y0+LPSkxZk0ZSEeAWXSt5FVQUhLSrneo=
X-Gm-Gg: AZuq6aJAyLfbeTigNzJI56bq9FgGBeQzPAsla3MYe/6rOeq0TPHpik6Zwwdmbtp3RX+
	c3UZB7Kh2WOJCinocDmrvNwF67jkRV4Tezj3yvYLPCouVhJxLe+PmWD2t5crWxgpP85/V45RSzl
	rwvdJolP9+WfQ1mDHG3db/4oqC1BTzfnQZ5yiTteR8pX8kTUK3l//8moi4htn34bOU4U2+o60f8
	7Z0z9oiY7OyQR+3jfZcuo9ZOzQsqCo/oSlKIHUEyIOUrCrFqYh3IZeVF9xJ58BAo4BAI5gxKmbl
	KCqlERabE18bT/g9CbUvLsJZVHF97cNbXOAW1GQEGGYBC8BQ9xLpvBB29+umkNUOcwTRIY0qS3d
	FdkzUDNdVth3M
X-Received: by 2002:a05:7301:fa86:b0:2b6:f2d5:2923 with SMTP id
 5a478bee46e88-2b739bef2b5mr503067eec.7.1769164017042; Fri, 23 Jan 2026
 02:26:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-fix-pin-init-crate-dependecies-v1-1-1c6cfe9aa352@gmail.com>
In-Reply-To: <20260123-fix-pin-init-crate-dependecies-v1-1-1c6cfe9aa352@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 11:26:44 +0100
X-Gm-Features: AZwV_QhfnE78D2snsNYShobmiFmrbcy7cWfzqFppVyRSJE9qN08KaK1P7eIhdZc
Message-ID: <CANiq72kMh2QYZF5gLzSZVOxgZz8Or07c4FxzWNXN1_4CwkBVJA@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: better pin-init macro resolvea
To: engineer.jjhama@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 11:02=E2=80=AFAM SeungJong Ha via B4 Relay
<devnull+engineer.jjhama.gmail.com@kernel.org> wrote:
>
> From: SeungJong Ha <engineer.jjhama@gmail.com>
>
> Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>

The commit message appears to be empty -- I think you may have wanted
to use the text below the `---`, since I see another title there
(although it isn't exactly worded like the usual commit message
either, i.e. with "Hello" etc., so I am not sure what happened in this
one).

Also, typo in the (patch) title.

> @@ -123,10 +123,18 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, core_edit
>      append_crate(
>          "pin_init_internal",
>          srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
> -        [],
> +        ["std", "proc_macro"],
>          cfg=3D["kernel"],
>          is_proc_macro=3DTrue,
>      )

Is this commit 74e15ac34b09 ("scripts: generate_rust_analyzer: Add
pin_init_internal deps")?

I think you based this on top of `rust-next` so you did not see the
fixes currently queued in `rust-fixes` (soon to arrive in mainline).

> +    # pin_init_internal uses #[path =3D "../../../macros/quote.rs"] to i=
nclude quote.rs

For comments etc., we use the usual style used in other Rust files, e.g.

    # `pin_init_internal` uses `#[path =3D "../../../macros/quote.rs"]`
to include `quote.rs`.

> +            str(srctree / "rust" / "pin-init" / "internal" / "src"),
> +            str(srctree / "rust" / "macros"),

There is this rule in rust-analyzer about `source`:

    /// If two crates share an `.rs` file in common,
    /// they *must* have the same `source`.
    /// rust-analyzer assumes that files from one
    /// source can't refer to files in another source.

I am not sure how that is supposed to work or why rust-analyzer
requires it, i.e. does it mean `macros` must have also the `pin-init`
path too? Or just that, for each file, the path that included it (not
the entire `source`) must match?

If the former, we may be also "abusing" it in the other place we use
`source` for the generated files. If the latter, then it is fine
there, but here we would need `macros` to also have the path, I guess.

Or perhaps that "rule" in the docs isn't as strict as it sounds?

Thanks!

Cheers,
Miguel
