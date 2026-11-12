Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794493262;
	b=pAlhMVPWOyDUXveqD1/j/+FVUxkORVP1BeE5asnp4BN+DgwGYIZX5mvBL7azU8b98bns
	 H11F5c9ewzqimYHMdxD79sWuhT8bEP8AatrCBGPly2VZO0Xv5UXRveGq94jvi/h9SSIwa
	 m7qNcm6wBs6QFBlItjVrOZVgOZwzgL2QwVtDU+gPR/pZ4+F+sAKkh4n2NvxwXSbzSFrv5
	 qaYnmO0soCFiEtcKPb3IM4RfMuwLMbApJoC2vVn91pnJhjM/oMbw269XceSxjdOaXfbDu
	 0ceV/NELBG2AJNqKFqGUvKqs7rldslHDTKDtXosjnubD0CUf9dfPN996FxGOzVZS4Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OupxHyRM+umbW423wKXJxlldk10XI7UdvUQ9Y9tR3mM=;
	b=3TMCZL3XCT870sLqUYNL0MsI6yty5EJuHsiEMaOlJWW5MJh8FATtwCpkw0GzJdNOoYSj
	 afUbCwiWYHtxcUchrTwQ/oTih6e7E+fLzxbWGm99DbkWKonDKdFac4HntST8/dsCcZc51
	 LvPJ6bZhKrV3g6ahWOmMMm0LyaJHDQJwRgt6Stg0eBUgX4ulaA1avPhr71ipKhEFreZg3
	 zAsdojjX+J4CAX1PhntDbj/1TVGbx/t19N1xJrF6riH52TA9RbJHY1+Bxmj/24SX79dTP
	 HkAQbXbmA3saaKD8rZdTeDkqVLa7QzZdMOjC/ssDsD8vZBV0v1d9RRXTJrXCPcNyRgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RRM5RV3o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F4B606C4E3
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 14:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61F4B606C4E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RRM5RV3o
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-370f4e5cfc9so219124eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 06:21:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794493261; cv=none;
        d=google.com; s=arc-20260327;
        b=N2uWWWRuPz5f4SzUX5RG2mrTf3U6jST9YeQ8pnvmxvFx3MesOUDguH7q572ir4L/qf
         35YhKcQrCooDuqnvvl1g+hffgHT3jDZNKYR6XttY75m7IdTIApxOe7MGdDWUaXHRCKns
         WX+CVTBVtKctW/PddFrxhQLmfnYWpvOj16VRfBnU+f2Fv5U57K40l++04Yn5c+FQOGle
         9sF9pHVnh5MNfvyxH0QEJg6OKI7hua42rrYF0kbJE7EUPPJ+vfB5n3YzvRkoGcmPBu2u
         LmmWKuVzJ8OHfUPduF8W+B2xBVSvkjscp6InwVbcuEuwmgUP/rzEecuJA4YGe1mIQgjt
         /xhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OupxHyRM+umbW423wKXJxlldk10XI7UdvUQ9Y9tR3mM=;
        fh=mYU+rxhH7oglkF+v3JbUaF0EOBmf89lTrZvETk8IJOM=;
        b=YtPGCekqUDTtYj9nm9W2VpvtblDeH9SLo+T03QNSc9Ydt7hfIhS4PSkyT712gt7XqJ
         s+t8Nj0HTVd2IzsBsR++e/gYdkbiaPzcZBM1Ai4IilU+qqm5OlAmjtNtuk2Edit67FwF
         8Dha716yf2UcA4gEHnlWZfRQpDsDbadPExlvaWrLjTUlfmjQ4eUf9O0zjdIc3+rIPulO
         cCHN+M9C1sYAhw+eMELOx1ZDMZORvYqaO1MsTKejD/Ax42pSIX/XuzOMoQ9kzxDRcx88
         SiuA/uQP0jriFkDArsHwJ0k+SnLMm4YHtVkP7OnTUzS3OuXQCeYhJobrLSfXUy2Ind9k
         Dq3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794493261; x=1795098061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OupxHyRM+umbW423wKXJxlldk10XI7UdvUQ9Y9tR3mM=;
        b=RRM5RV3ojFftw6JfMgFPWgXIRbKkVxR0tRVDIzvlKunec9MNBbvAVocoEqhHyB3B/z
         ftOmhOdzJKWfq9jaPn8ZdUCn9WyLwYpmtMDxP7Nm7fVmOA+51Da/fgWbu1ZogdW4Qvj1
         L75YgkvafDPOq6DSGO5je4sjg74Yp4rbHNfmsB8hWdl3YiESJpY94KZ2NjYWKYvezAga
         eRXi4Fg0+vEa+qHmTXOFSvcO8nd1wf6dxPb60MzpqMipgF9zQOC48mdhAx18itjOK9n8
         YJHhYTrr2yDyqEt4vLSq/SLOULOv9pRTLgsJsi5kYqcC48tmmrMMfrdFu0ymwKQ1gKiW
         cbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493261; x=1795098061;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OupxHyRM+umbW423wKXJxlldk10XI7UdvUQ9Y9tR3mM=;
        b=x13kc5E/KaL+vAJcobQC2pGgbf6q/B15xRrvCzT1V1eB+z1a2G66ODdMqgoFf29Lex
         FGA+LT3c4rTyrJJ/aRgNDB9tT3rk4rQDzMGQGbqI8sqSa9IXhCycmBdrJ2F25CYjuxdD
         4ryXD55RE/Ih0SagSuFQcgJWxvbNUvn30PnL9tf4Zf9Tjr05AWcZ5RcMHKYggYTD+Y5c
         ICzzAG/QicFt359eM0uOJz7W5TXdu8aQBb9JSZQ1idu3CqC5oimWaeftxJ3VXm8tBrCm
         2NjYRi8CFzl14LGBqadqymoOihD3VjSOA+IUc4/DzW7MZM+4hRik0TJlLKRzORPDoeTN
         C9vQ==
X-Forwarded-Encrypted: i=1; AL+hErGMgDM+IWwQaP7eLR+1PKMqhza6QASMMzu/9ZkpCvMcqd1VDabMx96zqelvDZBeN+dGBzWi2SU+j08G67Ef+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+eroNH2i1d/io6LdPRtTAR6qfi772KJ3ZR+ufCTKCkO3fNhagz
	8h3UVLUZ2pgKCEjzg2ZGWBgY2ZYSYhEJG7tZXJh3dXVR3OHIKX8L7NjVBB2h5qHjmVuETT+llrD
	Lp8dt05tCDTHUaPleySqpePHfJ+2anUM=
X-Gm-Gg: AYBFou2n9yzGX8ScybWTRRis/5EOFg52zt8V6jvsfGRSDiVY6/Btj/XsnoxdvVqMfvn
	c6DKvMTypPcAJZQah5ebsyRWq8oP1lH8tVBf27l3XRJ4EfDQExQd4K1LGyfpgFfp0r0zpLuO3jN
	nx0YJzcr22w0Dt/HV95OKwjNNp+DNyFRlwIcWaETd4uUbQWmPQ2YIsqeLzbwptQk9958J1uusDF
	aszW+MNEqQ5LmEWD01ewO50+kLfsnAt98vwYZMTnbxV5adT3le+XHrTjWvuE0GIi8IPwSWy9D/p
	LrSkPewQHHODdh/Lt+sGnQDIrvvBm2G+goilFwEc85bh+IXkzYo6OBAPNcT9TamK6nPM7U+lmjx
	Afrs5AYU5rZnvFf82Cnw6MClu9iqrUltH2G/xdU7RQC5VJHR5pvTRiEznP6NhKqAl+GxPQ/Pc/d
	Zq/gaBKO4D4L9er6eHGcV59XxZWIRVZJh/ObjucRMvFuZcrHnF5goR7vAXfCKbXU+SXSViAR915
	k5wLmyoWkv0K0j3+oyq7acklBG2yeE1s6El9vew0O9bvpzJgdQ0SYXsN4arO96H/a58kgU=
X-Received: by 2002:a05:7300:7aa5:b0:36a:e7a:e89 with SMTP id
 5a478bee46e88-37685c76d17mr9166936eec.2.1794493260363; Thu, 12 Nov 2026
 06:21:00 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112121512.1670347-1-gprocida@google.com> <20261112121512.1670347-3-gprocida@google.com>
In-Reply-To: <20261112121512.1670347-3-gprocida@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Nov 2026 15:20:46 +0100
X-Gm-Features: AclHuK8Dsnej4GxSZdQmdf9s-8C89r0Ozx2FMVSaC8sIWGqdgayIjlPcXZdV2eI
Message-ID: <CANiq72knbS_-8ekPfMbaF9Z2V7=DSCLdbxECb4d8o-vv=CYJMA@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] rust: convert exports.c to assembly
To: Giuliano Procida <gprocida@google.com>, Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 1:15=E2=80=AFPM Giuliano Procida <gprocida@google.c=
om> wrote:
>
> Previously, `rust/exports.c` defined `EXPORT_SYMBOL_RUST_GPL(sym)` with
> `extern int sym;` so that it could invoke the C `EXPORT_SYMBOL_GPL(sym)`
> macro, which requires `sym` to be a declared C identifier in scope for
> `typeof(sym)`, `__ADDRESSABLE(sym)` and `__GENDWARFKSYMS_EXPORT(sym)`.
>
> This caused the C compiler to emit DWARF debug information in
> `rust/exports.o` describing every exported Rust and helper symbol,
> functions and data alike, as a C `int` variable. Those bogus `int` DWARF
> entries ended up in `vmlinux`, conflicting with the true DWARF types
> emitted by `rustc` and confusing debuggers and ABI analysis tools.
>
> Convert `rust/exports.c` to `rust/exports.S` and emit
> `EXPORT_SYMBOL_GPL(sym)` directly. Under `__ASSEMBLY__`,
> `<linux/export.h>` expands `EXPORT_SYMBOL_GPL(sym)` straight to
> `___EXPORT_SYMBOL(sym, "GPL", ...)` without requiring symbol
> declarations or emitting bogus DWARF entries, while also avoiding a C
> compilation step.
>
> Signed-off-by: Giuliano Procida <gprocida@google.com>

I guess Suggested-by: Gary?

Cheers,
Miguel
