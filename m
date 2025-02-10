Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685101DF735
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Feb 2025 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184958; cv=none; b=oRd1vzIRuV/1U/8o7f/kApkc9ogvD3L7RVX7v+k7Gu/El/OaiPj88du6by8gmkJodAD8tWzd1Z3YEHj3Rrg/d91/8Ows6CDQbY5LiuJwp/tijc4yF4y6A61hwfrytDZaLBBCxmvqMJpao3xVYPGWoctQE+wEt4bTrM++5yQHQjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184958; c=relaxed/simple;
	bh=//LYQuCFG3v94faeXTCT1MGaKMbd2T9XtcvmvzC9Omo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYhX5A79YzINfCKEbcQ95V+1f/qiuoiBeBIPy01h7GRdzw+ocaH+UdS6Fy4Vai+iK4BcVO9+e8fJJhUgU1vGndf1l0hGo7FNqGHibUSPtbxxPF43p7FMA9GD8QZavKzO5p7Y7xnev1lPxeiPfq24GSdx/ZBz1WmAXCXFRJofuB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b5zHibrw; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b5zHibrw"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e451fdcae2so16819726d6.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Feb 2025 02:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739184955; x=1739789755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PP3w+vTVYydNJ1RlabO4o815qYqNgmeRSTRCNdNosM=;
        b=b5zHibrw5179r0ibAray3bMc42pccJvVsUei5tPtf10ngGi/o3mjCR6ccMqufEdFWc
         ihkel4TPCqezVBpmHFD/gsbTrTxJWzcl8U9+5HE0GUoTZjWBNS6iaaa3coIuupVV6x6T
         sBLNLib6SbS0kYBUOIYYXYPE1yPdpet2bkQMRmn3D3OJVTZVCe/QTG8knCwpvy+oNKvk
         KaPmeQRilZw6gTGrcaif3JoHlTLLPzq1+5cSkMUjClh0gz6ySNw+n89bjvFwBmRJhbQZ
         YuteFK2rxZYjuatd4Ee15ggYf6ti3ful/EUX24iIjkSrzbzxJtBEsAzSpL2kJoHyvVV6
         f3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184955; x=1739789755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PP3w+vTVYydNJ1RlabO4o815qYqNgmeRSTRCNdNosM=;
        b=WX4N3/NJ3D7kr1IRhSjeUP5ialZzRmS34BymTRzWtNdrQE50ABK7WcnolP8LnqzyUm
         JwXNyw+yjs00CRCOBa/gsJwlk6un9bvoc0OzVInk+3u9qbyPIAfCYiORa9OP0b6tuSle
         snmK30mCCcQdV4uTV+yn0b4uGXs3B2w9LBbJbbPCPH04QQ2ooRbMLw15l43hdFqiwgEe
         y917DrjEpmYD6Vp1QHYUWgZkRNGgnRkJKOHt95svaA2GxiuTJkMxSCSsdCXQ/zDP4A+Q
         EjplogV9WiO9LX8lj7Bzvit8TeatVDA+l8waQuLkuFNbjZtfq1UsLCJxbg5oKxaUvhfT
         D9QA==
X-Forwarded-Encrypted: i=1; AJvYcCUDxDx409rgiTGV4H61CP5Aob7mrTeWSFyaTSTWFLkHuo0YLv743XMwu0VFW7YSWsHuoSzdrLPq1kKCrmIh3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQD5kAepb+b5f6mZXI6ogezZVPTV6p7nSPwxukis73INejV+d3
	ZnpBdW14vws/M2p/2+KVyPHM9y4B8MBYL4j5z0PSyurAiDhh+EhDLDrEnDaY7kKizg03CDAQcx1
	tBKs93wXBqMLKP9f4I89d8J5/w3jyYeAhiqrI
X-Gm-Gg: ASbGncv5byNSu9/qMOzLu1MdSttbajHkPnDsTL4ugz3wawmVJmhRXHSjJJDOa75feVr
	cXSljpZ4ZcnVoM2oqpGH35Z0+ECQK1Mz5eQ3ms8QgN5ZqdttkwbAJl9PmwsP1/c/V0IGF6rEIJg
	==
X-Google-Smtp-Source: AGHT+IGbyeQ6k7fTxoDJJzi7UjIgV6Ed+wDw9pNMs0X4k3lIOqkog+znGoY1veJl/t7QLUdG1EyukBv6t6QGtJ4uJ3I=
X-Received: by 2002:a05:6214:240b:b0:6d8:890c:1f08 with SMTP id
 6a1803df08f44-6e44569d333mr178824946d6.26.1739184955157; Mon, 10 Feb 2025
 02:55:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208-rust-kunit-v1-0-94a026be6d72@weissschuh.net> <20250208-rust-kunit-v1-1-94a026be6d72@weissschuh.net>
In-Reply-To: <20250208-rust-kunit-v1-1-94a026be6d72@weissschuh.net>
From: David Gow <davidgow@google.com>
Date: Mon, 10 Feb 2025 18:55:42 +0800
X-Gm-Features: AWEUYZnLrdE820e1YCxGYIPmD7_zxAEMVcFxHPATm37BvJ0XwCqWLuIDtdgVRBk
Message-ID: <CABVgOSmZEowbLCJepA0bkTHMnt5xhXE5sHoQz2kNhmMo3N9vwg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: pass correct target to bindgen on Usermode Linux
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-um <linux-um@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 8 Feb 2025 at 21:32, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> w=
rote:
>
> Usermode Linux uses "um" as primary architecture name and the underlying
> physical architecture is provided in "SUBARCH".
> Resolve the target architecture flags through that underlying architectur=
e.
> This is the same pattern as used by scripts/Makefile.clang from which
> the bindgen flags are derived.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---

(+cc linux-um, but I assume this will probably go in via the Rust tree, any=
way.)

Thanks very much: this is enough to get Rust-for-Linux working with
gcc under 64-bit UML on my system.

However, this is actually a bit of a coincidence -- and there are
still some issues with 32-bit UML -- as the UML Rust flags are
currently conditionally set if CC_IS_CLANG. This is my fault (it was
to work around some bugs with older gcc), and I've sent a patch[1] to
fix it. (Though note that 32-bit UML/Rust still hits issues with
atomics in the block driver, so you'll need to disable that for now.)

Regardless, this is a significant improvement, thanks!

Reviewed-by: David Gow <davidgow@googl.ecom>

Thanks,
-- David

[1]: https://lore.kernel.org/rust-for-linux/20250210105353.2238769-2-davidg=
ow@google.com/


>  rust/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 8fcfd60447bc89ba2c66a4f341288db2387b0956..a94fafb91d7d743c6c1b22484=
79c0d723964e5c4 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -245,6 +245,7 @@ bindgen_skip_c_flags :=3D -mno-fp-ret-in-387 -mprefer=
red-stack-boundary=3D% \
>  # Derived from `scripts/Makefile.clang`.
>  BINDGEN_TARGET_x86     :=3D x86_64-linux-gnu
>  BINDGEN_TARGET_arm64   :=3D aarch64-linux-gnu
> +BINDGEN_TARGET_um      :=3D $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET         :=3D $(BINDGEN_TARGET_$(SRCARCH))
>
>  # All warnings are inhibited since GCC builds are very experimental,
>
> --
> 2.48.1
>
>
