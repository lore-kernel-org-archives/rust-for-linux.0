Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792453030;
	b=SKshRbitsPx07m+lr6IKcAAVbHjvW4nIMv6ZIv+LF2ENO4GqAJ2TKE6uehmW2TGuSyuK
	 8NR6gvmg9Rb8tLoirzEpu+PTMatKE+c+diS+FIJ4Aqw5+wL5JS3sHjfhPY134+y/x86Qe
	 CHtbN32qrU8HDB9GvepyTVinXbEU4xEjU8Lq8diiSCON1MikqK0EzBQdvqSEUBWrtycDQ
	 yTbwt8UqO7cgN/+aHDnpZBDGSCQP24FpUzwZh+t+7PQpgwYwGJyFckqyFlABBfdxIWRlE
	 sMkNmZfD53D8ay7ksBSWKxjPjRY7P9NMeMi+xLH9eHOF6AMqBuLaEk7UhEuahiEN4kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MK8gOPYVfT5VqSmtMrhhTQt8Rw9PxMYlaejGmJfPUyg=;
	b=pncg04ePUbBhk6xxYbyMC423mwjID/FVQR2HyQ7etb3lQevOs6p+p1AJKeS6lFhtCltG
	 Tc6+aZS2CblA5N46UaNfnDjX7EHMIZC5lGkGsK1c5O7mCvHz6MprIyLikr6n3PanEcMIz
	 q/W5VERe+2QCedzTwev15TctWDTPXkzT9BQ4CkrDNqexSuZaFgbAdzgqxTC7FkLt+/x7W
	 W1FqVeTuWDRikPrIegfVVQ0WDwGcDoDL8F3XkDkTNbVi3hwNgrMEbdZKXAZGvVkKmnujw
	 KL3OKeLbDqPBUK5NpyZe0ZckKdRXodjwHhs1TDWX+uRZDrRAlAhJX05LxWT9Zg45Q7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hNXjva9A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8170A606A31A
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 23:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8170A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hNXjva9A
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018493d57so27225e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 16:37:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792453028; cv=none;
        d=google.com; s=arc-20260327;
        b=ZneZDkLldROPS9YDfZY24XkXc4hJ9c8bB91JKqmQwGOAefCi2L1Me8/dBjNU9u/gQ9
         fclLtXwDehxjwLHmLNM2DpswFAW2xBPmAqqEmp8K8ihiUwxozoCSZEvwEmhg7GAQEJq7
         yzLZc0hRmVye+l1OP5mj9sKTXWtL8Whn1pZom03T/kjdi/J2DZmvOuH9NVblwFzk+9vB
         PI+viSPWNClOW0xNf1BrOvg4BbGQ9ERRtRHOMH5wm1xet8GI5KsNbNGKvKqbaExw4wQu
         LQJeDUrIkbYod8tkcixJQw58UMAc1sAetf3vZNaUvTErYC1ERmzZtaX6Az+wjPyuWJNP
         hNtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MK8gOPYVfT5VqSmtMrhhTQt8Rw9PxMYlaejGmJfPUyg=;
        fh=zl6wIf5jK1tQX9/VxO9tQPnJtsB5s4CMX6O6Sn+MOAM=;
        b=Am41DmgCGphirAZgi3DuK9zp7ItkBmbMCkNF6dw5y18eG07hYvpl3D4ikHggu2a+DB
         ObModiRBt4rOI2C8xcb/xBNjLG1qzETE3t/sWxmm+TgxzoM+KE4VfWxx7N+zihvjnIR2
         N/rVg5FrtHgIuGzIHzy+rAZC4YIqUcvSTJxdvs4qR/g69L1CkLFLf8x79SMOD6IR9dqT
         fZS9Ykjj+WqKKHzO2Ei0prQPhAI/kv4JAwUS+96EbWZ5lL+zFsK+gtNVl45wkPusC+zf
         uu95rvJKeT/bqbxhofQb9xDTnZysyTPkEBskfwzvDMtOVXmS7n4hvgcn7KKOGFOmjWN6
         FKeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792453028; x=1793057828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MK8gOPYVfT5VqSmtMrhhTQt8Rw9PxMYlaejGmJfPUyg=;
        b=hNXjva9AuReiGmDqhlkICFvjeCxEzLbBtwZ5E4X15NzRgwvehw7dMASIa8RSj+DBbK
         R0qRvC7LPQrlq0icq1iXo4VtHdUTs9RLrPhgQEktxEe0vP4WiGGil2ED3orirh9L63D9
         3Y8v5h2KdVD9r4GBO0du+nxI9Fd1FcS3KLAwdsauNAQf9GriY1YMt64GcA70hLIfLQLY
         4lIEdN9ncpspafiLIPPKrWIM+vJuSRsrqv29g9a31AVF8y2LZuC4GkqxmuUoVsC+xtxt
         9jUQK/+ckuk8p5qkTQtpmNbGPImAGBUaxyT1lHukZr1oPFCZrCdMUt1bCG1bq/2oGZha
         2xlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453028; x=1793057828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MK8gOPYVfT5VqSmtMrhhTQt8Rw9PxMYlaejGmJfPUyg=;
        b=gDORxu/+/a85sZ8/d+b2Dxa4PS0Vi03l/eEK8G+lRt+Gk3m4SEUuD7enC/clqXBau9
         FZvXbaT0FQJ57eopyMw/2SjlfhpAQ7g4Gp8EXP7AtKuDjtA82D77W1i1VThYZpVHWGCn
         YFJ8pc1lsAF7d/jgDtTTRq6sqwIxZZlH1d0thf7m+WKl04ncrCo6+/2R1KzcMb4gU7q1
         VKh3rS/ZolHL/ZFjYex1XSXJPnQH58qvmN6fB9F+Ke2uFlhZ3FfWGSvnM6t1jTLtjrOK
         ArjQxiqiLuQluXdulkILk419tIgPfSXMZg/X6k9mED9lSbg+P35SFHoiEnQw2YIJuCXd
         xQ3A==
X-Forwarded-Encrypted: i=1; AKwUvByLU8ChLL0vfzyWATS1wQV+TaT/FiWumcHbgNgXKwnRyCQPv3SbkN1mpkegagzQY6+C4TPWcmvK2Iom0I3HTw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKS2fNlABPetOH6qsmu7zdvO0BTlyLay2gwXmudfefAyIpHk7zz
	PN23gfCvxT8KCN8bjaFBO5SaaZi6Nm3yhtLoqyqD2vkxTolppGwc+6zFI8H2eBHibR605scmAL6
	V0Xt+BBJV1EKU4rKl+m4cSdx3cSrI4H60xJ6u6u7n
X-Gm-Gg: AYBFou2pV6W5662InE8FoNORnO5Q6wUMC7gsxoGkIvh//oLKNW73noQinBE9UjcpIjq
	Gjl4HYbLLgbp0JlwvHLkwJZEaokjY2dvd4UaeQ0AJp9s4XrffKbnd8SD9BPgYdoFYZlHR1Njo1d
	VoV/kXBabWqVFlagHoz8xlBlYWWnGirvVF8z+PDrgzj+JsRnNTxGLjHtK/q1joLlIzq5sxV6686
	2cV4Q85irXsHzb6a3oU7JMVzOHHU2GVzJFK8QtJuCLEAZJVz5uESMUw56spoM4p6NCH1IdvRCNB
	nR1djp46mzneR4s7sQeZRUeXSbLx37DUz4+Yv4KRTPW32AY7Zqbr
X-Received: by 2002:a05:600c:4f48:b0:4a1:7a69:8f27 with SMTP id
 5b1f17b1804b1-4a1f384e61emr198185e9.4.1792453028060; Mon, 19 Oct 2026
 16:37:08 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019151243.1595858-1-gprocida@google.com>
In-Reply-To: <20261019151243.1595858-1-gprocida@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 19 Oct 2026 16:36:30 -0700
X-Gm-Features: AclHuK9KKccht0LTphkjEe9VOUDvKx0_Jrumhajjler9MUZc4WeHWNdfkMKuz-0
Message-ID: <CABCJKudpnWmkths4YczDuXzAaV0A3YMtHHztUPbBTpUAdh5bng@mail.gmail.com>
Subject: Re: [PATCH] rust: exports: emit ___EXPORT_SYMBOL without C declarations
To: Giuliano Procida <gprocida@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 8:13=E2=80=AFAM Giuliano Procida <gprocida@google.c=
om> wrote:
>
> Previously, `EXPORT_SYMBOL_RUST_GPL(sym)` declared `extern int sym;` so
> that it could invoke `EXPORT_SYMBOL_GPL(sym)`, which required `sym` to
> be a declared C identifier for `typeof(sym)`, `__ADDRESSABLE(sym)`, and
> (when `CONFIG_GENDWARFKSYMS` is enabled) `__GENDWARFKSYMS_EXPORT(sym)`.
>
> This resulted in the compiler emiting DWARF debug information in
> `rust/exports.o` describing every exported Rust symbol=E2=80=94functions =
and
> data alike, as a C `int` variable.
>
> Although `rust/Makefile` sets `skip_gendwarfksyms =3D 1` on `exports.o`,
> the bogus `int` DWARF entries were still present in `vmlinux`, where
> they conflicted with the true DWARF types emitted by `rustc` and
> confused DWARF consumers such as debuggers and ABI analysis tools.
>
> This change defines `EXPORT_SYMBOL_RUST_GPL(sym)` using
> `___EXPORT_SYMBOL` directly:
>
>         asm(__stringify(___EXPORT_SYMBOL(sym, "GPL", "")))
>
> matching the `__ASSEMBLY__` path in `include/linux/export.h`.
>
> Omitting the C-level wrappers from `__EXPORT_SYMBOL` is safe because:
> - `__GENDWARFKSYMS_EXPORT(sym)` is unneeded because `gendwarfksyms` runs
>   directly on the defining Rust and helper object files and is already
>   disabled for `rust/exports.o`.
> - `extern int sym;`, `extern typeof(sym) sym;`, and `__ADDRESSABLE(sym)`
>   have no effect in `rust/exports.c`: the symbols are already emitted in
>   separate translation units (scraped via `nm --defined-only`), the fake
>   `extern int` declaration never produced kCFI function type IDs, and
>   `___EXPORT_SYMBOL` already emits a `.quad`/`.long` reference to `sym`
>   in `.export_symbol` that satisfies both ELF linking and LTO module-asm
>   symbol resolution.
> - `DEFAULT_SYMBOL_NAMESPACE`, `__DISABLE_EXPORTS`, `__PKVM_HYP__`, and
>   `__GENKSYMS__` are not used by `rust/exports.c`.
>
> Signed-off-by: Giuliano Procida <gprocida@google.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
