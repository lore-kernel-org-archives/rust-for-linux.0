Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A661C391E7B
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 05:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339397; cv=pass; b=ZPioQskwGP+Z3Pu4jC8ZLiXc0x1cp7xMO7inkRkx43nosDHgenTmoaqyaOEK6PdAX4jb8aiHk4VtOuhOlu8+gr2H19x91dBNdBjM5UUr1Wv0f/2V6ZAOQPwq6dw0AhBJ7lGIkra61fXm/l0EI1zInpTdDDqA84gUnModX4IVPUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339397; c=relaxed/simple;
	bh=mBlqjGv0CK9F2YrnW7djZnuIsOpu6OSQJCsfQ49kqdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+eLnCu3XfEzngvmq8lzITWBNE0ZgN9nfq5E7mGBkQunjFZB1ohAEcf4JVVqeY88kvGE0DZj64dFBvmjOPODmaijnieW72d3ShGNgepxzb123eSu6xl5GVY42oGRMg8VDsKHKRlLvJ0xi3ojsRqEZOn5Sn1oFpW3sbkxodSpSWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvDnX4tt; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvDnX4tt"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbe41618110so40726a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 22:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786339395; cv=none;
        d=google.com; s=arc-20260327;
        b=B/y+/FmgxgTuTp4QFlxWh6ivkg4ZstkxlufTQcm5AMHjqE3sfRz4a3+EhaPjg6OhyX
         YPoV0vEFXf0viRTnrTueNtSVndIkuhEzf38sGI9sCWhWqPWVXdE1TeNCEYvlKTZkg0Nt
         h+Wz/LOEWrkn3QPFwqRLKENeo6unAC5CYxmyltGfHkeApMQbFUz6Bsmyj+AjFxzoBjZ7
         9hrCF8Af8gRwM3q6ab/et2FfbqeG+mF1b51b5/6Sg+Z2YG/c9ZDqa68wm/sVa2jUSbtR
         dNY39fGzwXTZ9UdERzEvKgCXZUrhiXCz3A3Djs1WYNOO4O2EOhWhWHNVbi8ntrM0ebwO
         XNyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZBJU6Cxj0yWnv1Z4Q5pcnjxqliKb76LiYpxS8M0dq+c=;
        fh=8X10ylr6BAdBtKlFY3JWeH3R2RrU4IAkS3MA5j1+p4M=;
        b=hOb3vfKA+63xDXoqUn7ecAH3HBu0FzzTDP3uTGu+V4SliW3SxPJykImXvx7wfg2kOT
         TuJfaLT79U0qGT1cidf2tBQrFVL8ZhYIndpYFGrXd8deQI1uDAqnptwHPywF+tnXwhvj
         hfocZHeFOX+8+TAETU5z9bHu4DP71XfZX4zmSywZMvrifyIYwqh/xhqTug3zmrkS4Za3
         y5kZJ6UDcORkWkmmwdMJlG3FaA6CnTYr/2bJMusS/Z2SsQK7F2y3i+bGdWTKLP+8voRv
         iIIPoLr5eDAmHapZwOpEvKGbQNWBh4OIym6nHAsRUHzOAA3EaHfAeQTXOPicYZu2osvK
         OZDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339395; x=1786944195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZBJU6Cxj0yWnv1Z4Q5pcnjxqliKb76LiYpxS8M0dq+c=;
        b=mvDnX4ttfzQHypV1Pdo3kk5NzNrcddlicHf+2QqjmzgcbACRcZND5rQh3qtfEseXfy
         WLVbWUvGMOsRNBa2bVyKoAbQP0I67PvWwbSz5uU9SPSQnedhZObeLNR/F0u2ODEGWDCi
         oPeljY+dZ0168yYVIaZWj0Q0PCpfTnPFBF4PghQAnoR8aVshBwI8uiMnAp9FjhHfMspe
         g7okoTyWQFOyxaCx7KGq6c9Miuy/qPKHizk8uAxvQb74hmU/tY7UmQj/QVTinT9HSo5s
         JdHSm8Jq6dpnyL5TdTuDi+GkfZGCvA8WzMY87ocrqZ8CL1MSamiBe15+PwXpVGixQcSd
         2tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339395; x=1786944195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBJU6Cxj0yWnv1Z4Q5pcnjxqliKb76LiYpxS8M0dq+c=;
        b=H2uxgkVEmsc2M1bJ299PUSn6908YrFCWZGj7fp+z1nwJqmslLUd3XYVJai5x/NCe8m
         SfEhjUeKMchzjPX13fpxCSNs/MYGJkRzCkKPMsidnNENWdHW9MBILXYmBseePm+5PgPs
         DKW6sRmk1QBKe0uMHTeJo5Ydpf1LBdchs8SzqQhyTHVvlG3eY8jV0P++96V7/bCvAJQj
         Vf5aEO+PF0iceRdd/vVn1q+3jE6J1RpMixoXRQX0FcKZa3Y9ba8oV8Pdk/as9c8LR9DC
         BHPOtQ00h7BqYVKV37j96hEDn21dK5WPQgJqtj+fr2YwmgYRpKLd3gM7LychjWYuSjGi
         LyhA==
X-Forwarded-Encrypted: i=1; AHgh+RoDYCRFpRgOTPmr6zlmeDs9MXwipYsZgwMXkPubISL4uLFCcD2lk8p5S1tz12oWGcm/Y9tNJNNrfhOQ8i41WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3e4z6rlS8SOgHQCQNBmMTrcMBBHSW430tvJKBfQJ7GaaP0vAt
	29KWvptDAzzbYrSmeciQvN36XoRWzRWQJvMcmHGfghxvTix79Pp+fbo2+QZml83dxhxfv9G8FWp
	Mrb8JJCVp8GLcKAg2DSsjcr+d3Y6oJe8=
X-Gm-Gg: AR+sD12C8u/Vv0ZpCj2SR3V+bacbRYccS4PnNM65jM8uZV+ZVCyJv5md1Ee7XJeBUV7
	OckgT6Mxf7yETKhMSz37mCY48GRkMCPfMGjQcqkmvPZNN3gBwLu8QTXpgC3zP9wPfSWMwnOKTjo
	X9kv+YZEXgGhXh1UKCmu4mqLGRiJE4unGYad/r947Lb6bC2pkv3O14pW67viWvUIwbo/yK9U91B
	HTwKjVmtpWFtt8FC7JYSz7kVn7+cvty/ygFpe85ur+rXq21L/SB+o7zNhDpNxLm8+IWMxMwlGV8
	lglu9/banM2COnBymX/s6SxBZnQZr3A8pBbqEf6rcDQbvZnwGtlIQu1DAJvOL3sHWNOd6w9Z8y/
	+HPxIQrFFUZoE7yvLhVT2/ElQORiqFgxBcAfQ7JtJY/ArPzqmkae1HysYFrCG
X-Received: by 2002:a17:903:19cf:b0:2cc:f4d4:29a0 with SMTP id
 d9443c01a7336-2d0cab0db0dmr347386135ad.3.1786339394792; Sun, 09 Aug 2026
 22:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808022608.1125174-1-tomo@flapping.org>
In-Reply-To: <20260808022608.1125174-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 07:23:02 +0200
X-Gm-Features: AUfX_mx7UAZ0waVAmfgOLdJWTLhtLrDQF9qWBRHg9Vne6wIMf1PfoCij_9dGRNc
Message-ID: <CANiq72m4pmmLaCkwL8vLC3s38rPNbzBCM8t+=h4eh8=FUFiTtw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: bug: skip arch-specific asm in `testlib` builds
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 4:26=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Running `make rusttest` with `ARCH=3D` set to an architecture other than
> the host's fails, e.g. `ARCH=3Darm64` on an x86_64 host:
>
> error: invalid instruction mnemonic 'brk'
>   --> rust/kernel/bug.rs:63:17
>    |
> 63 | /                 concat!(
> 64 | |                     "/* {size} */",
> 65 | |                     include!(concat!(env!("OBJTREE"), "/rust/kerne=
l/generated_arch_warn_asm.rs")),
> 66 | |                     include!(concat!(env!("OBJTREE"), "/rust/kerne=
l/generated_arch_reachable_asm.rs")));
>    | |___________________________________________________________________=
____________________________________^
>    |
> note: instantiated into assembly here
>   --> <inline asm>:1:115
>    |
>  1 |     /* 8 */.pushsection __bug_table,"aw"; .align 2; 14470: .long 144=
71f - .;.short 2305;.align 2; .popsection; 14471:brk 0x800
>    |                                                                     =
                                                 ^^^
>
> The reason is that `rusttest` builds the `kernel` crate as a host
> library: it passes the `CONFIG_*` cfgs of the configured architecture,
> but not `--target`, so code generation happens for the
> host. `warn_flags!` then selects the arch-specific inline asm arm
> based on `CONFIG_*`, and the host assembler rejects it.
>
> This does not happen with the current `master` because `warn_on!` has
> no user inside the `kernel` crate itself yet, but it will as soon as
> one is added.
>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://lore.kernel.org/all/CANiq72n4=3Dfz=3DJNKY0Jdm8BnLa=3DRmHB=
2B7s0bO47YTJ7hygqBZg@mail.gmail.com/
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-next` -- thanks!

    Cc: stable@vger.kernel.org
    Fixes: dff64b072708 ("rust: Add warn_on macro")

Cheers,
Miguel
