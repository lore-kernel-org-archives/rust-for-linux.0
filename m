Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900923932E7
	for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 07:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780126868; cv=pass; b=BBAaFm6w79qfbQ1rOQo56Vkt1wGwlJQ4k2dLMVR5M04t0QkbpOOCPhRtzCVPYUBB23LAlrRIQj5sIbUTGBqzk7oi1+o7BwmZfE9hwYe/uEeY9I81Q3ZXWpDvSrLO1mTSiHRKDw2+1G0RNDyFrj6JBBlwcoU18wNXcvJ0s7mru0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780126868; c=relaxed/simple;
	bh=L3UEWLmXReuYoCrmgUMxQKkIqL6gBhu9SHlnPE1kURQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8266nBkB07xELweBw2MrVfovyNakDuw/h2rj3tXe2URYXw6F3xjfrHymwrj5D4G+p9OYrHrZXqrsZI7BkTlr+MFEvVW/zn1+pj7CPAPUJsJvzUgwJJmZmDTpIJM35GBIHGml1LLCVXPYBUo4b4VCeIFR6z+7sApCtrkFFE5tJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6zdXdOH; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6zdXdOH"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-134a84f0aa7so551963c88.1
        for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 00:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780126866; cv=none;
        d=google.com; s=arc-20240605;
        b=Rt2Qifv66IY6T8fZFoDSdvHXVA66v5kiJfOp6CvtCzFsN9MsncWxAZe6J/1CU2TdI+
         6KKLR+u0aVE06E/VbXhj7np1Z73DcLCzvEhIiTznkT/xIGjQr5S9ULgcKIMUK5JphQOR
         PF2MEru0tQ8puGszo1Tx+cs0QRecsMXUutBW350r029DrcbDe2bQQHttrLLeoa6qin5C
         bbl08TqMfvJt5MJvxzAGzyngLtpaB4JyDTa7EPDKaIesz70SQQHzeTQdAgJKFb2U63zy
         i7p2ZAaEjwq54M5VKSRQ4qu8Tfj+axcC5ByL/ZIPq/KwUIQdGT9TVk1ya+6GGd5PNIMR
         WJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qpr9VE3elbZ+vLOG6raofIn6zipcaovFd851fDkQwe4=;
        fh=rODWTdyFLkGljgvvPfFc7/+5AMQGQnrXUwnDyJ1ivHY=;
        b=d37+ZBALvp1UxzfpSYgNb0xb4ejjlWWZVw+RGkLZc9SxBlQTQ/FxCONNFnQxwiIVSt
         jq5pPtdbttl0MJTP8KB4ZDWxPqoJ58xIqMR2NcwMEJa77LQ3bR2jLqlH7tdsHjKeeJO9
         AiS3kVPjGOszNINvkjTmDhkmP/Fw4yC5TOuRjqSbk4d+g6iOIBsLIGuABpNUHU/Eqv/z
         06d8AnxRvdGGk32wJ3gRBRdPSiAH6cWWED5sZHRR212RJjeI0pX08rGGHGY73vhHhMKb
         L7ZjOlfKWuA2oeDwsT0WOjP5ks1O0k6Ma3REIyOROq/pGA2fSzT9HzuyJEkk68ugndMj
         f8eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780126866; x=1780731666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qpr9VE3elbZ+vLOG6raofIn6zipcaovFd851fDkQwe4=;
        b=S6zdXdOH6Uvp4Nn7whRLu2u8b3L3jP76XleCLwCZ66wt/9ccL6g+35HzCVWSgzJCtW
         Lw0MjUjz6bb/WDpnFow47nITnn24qZPYlNHbDKKZMvixVIkdJERWtXNEh1UmsQKlgDMY
         +gfXL9cqPuaZbyVwOvmRlduejoVbPmUVVRAGhqgWjuJUFvYMB9ify3Ebtg7Lp5K7Drcn
         uFRS3wAzepbqoZSqQ1YU2WcoovwrCFwEFaoHsPdl9iIw3tb8nOqnjVSzsDm33PW0tAyq
         uXzKnkaAK5UWnMxng6+jAagBfvnbS8I+QZVdoS5puDKEo7ofBC+Sg003nM4qdzWmSgXy
         iJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780126866; x=1780731666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qpr9VE3elbZ+vLOG6raofIn6zipcaovFd851fDkQwe4=;
        b=Q+E9laeE5Cng7VCf9JN3STyQuiczKVSrqWd4V3LFvHjxSjBgmCD9lFt4TSr3Pyqqbu
         sXGRLFk1PecDVJQ52eJzk5UoBmDErNsiQTrXJy5DizWZYkbBnBsHoqOPGDY+SPCLfM1E
         TkkFV6lztEfqCK+1W85pBqN9HN3s9YyEV1JhzqCEee+3IIF2lbHp9kEYt1F21bqfQTWQ
         pUn7sNv+ZAQXSPZWtKFUambftotRJQUXhoin9KF8QTL6IUKDhL2XYQgusrUd6b9EscZ3
         NZDHACRaAek03vPxY/IB/9uY2+7Wj3i3KheFSEPPWiGOKorbUijamHwErcf21bPJq3aM
         wyUA==
X-Forwarded-Encrypted: i=1; AFNElJ+X+1vbGBwh23U8EVp14p2+R9PPD/YvfPjLRdO/m4TDKL2IQFCzSu16MRAU9TBWU1bXmDI/+Xz66Ymy/Ww+GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyZZMU+ZUIa77Vv1buQ30i8R496PqouJasWisnts0oUFECG4tY
	HgjzSjmKZhaXKQgFs7lF5FswspQJdA3c9k82jekozHP9ILVKH5CyTsdd9AYuX3FGgETwsKy2Erx
	4pz1k1XyT8DFIZwUft4wsdWw3RoB5DEY=
X-Gm-Gg: Acq92OFS9x1NcCUtZ8NW/x8vghueBSvD1vbluXzxTLQ2G4Dh4eYpC4WbUenXcTsolCe
	pLGHIR4juCh3Os9KwMWdiGYXZoXhXWBc27qNXZc8OqCtYhAtpKroNYTC3YoyTVO8PQn/pQoRvFR
	UzXxH/oWlDYwwt2JgoijayVEIOXix7ERs06amer0xLdxUgVe0JtfyRD1/2IrtZs+v1owMuJQ1de
	5igs9N4EQi8Lvux0eos0uO4b2ys8HzwJXIY6eOu18Z7yr8uYxliMluSkJKWNo2ZNQ+mLrQDX3eq
	DRS6IuWP24oGjhiPdillg0EiePcZrhUk7e6K0oKJ21lomo30sMI4d7fF+10BuyuYRio+lm3swG1
	+uvODfneWcWpeyK2qzd2OwKbxZDp1vOzdgg==
X-Received: by 2002:a05:693c:2c86:b0:304:3c33:7afd with SMTP id
 5a478bee46e88-304fa4a75dbmr712153eec.1.1780126865429; Sat, 30 May 2026
 00:41:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
In-Reply-To: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 30 May 2026 09:40:51 +0200
X-Gm-Features: AVHnY4LYzc72_leHtuASvRnfI_XBQ5P_tmJIekDaxm-OGvsoitOo6icCZq7qopI
Message-ID: <CANiq72ny89rMb9y1ysfbBjm=LVhO=51sRd6Ocpy-UOwFj=61vQ@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Due to a rustc bug [1] the -Cforce-unwind-tables=3Dy flag only emits the
> uwtable annotation for functions, but not for the module. This means
> that compiler-generated functions such as 'asan.module_ctor' do not
> receive the uwtable annotation.
>
> When CONFIG_UNWIND_PATCH_PAC_INTO_SCS is enabled, this leads to boot
> failures because the dwarf information emitted for the kasan
> constructors is wrong, which causes the SCS boot patching code to
> patch the constructor in an illegal manner. Specifically, the paciasp
> instruction is patched, but the autiasp instruction is not. This
> mismatch leads to a crash when the constructor is called during boot.
>
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         BUG: KASAN: global-out-of-bounds in do_basic_setup+0x4c/0x90
>         Read of size 8 at addr ffffffe3cc7eb488 by task swapper/0/1
>
> Specifically the faulting instruction is the (*fn)() to invoke the
> constructor in do_ctors() of the init/main.c file.
>
> Once the fix lands in rustc, this flag can be made conditional on the
> rustc version. Note that passing the flag on a rustc with the fix
> present has no effect.
>
> Fixes: d077242d68a3 ("rust: support for shadow call stack sanitizer")
> Cc: stable@kernel.org
> Link: https://github.com/rust-lang/rust/pull/156980 [1]
> Reported-by: Bo Ye <bo.ye@mediatek.com>
> Debugged-by: Isaac Manjarres <isaacmanjarres@google.com>
> Debugged-by: Sami Tolvanen <samitolvanen@google.com>
> Tested-by: Isaac Manjarres <isaacmanjarres@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks everyone!

    [ The fix [1] has landed for Rust 1.98.0 (expected release on
      2026-08-20).

      Thus add a version check as discussed.

        - Miguel ]

    [ Adjusted link and comment. - Miguel ]

Cheers,
Miguel
