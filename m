Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F82E33D6F9
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598099; cv=pass; b=M5siZPlS0+URex4P/fNUXtBheFEBGffhJNRxnrXvzx+cijMJpKyi/338aKyENjrZLI8FZIuo4GaNv9E3wRZOP4on217Sg/oQ2o7cDuEbHtRBwy8LinjMroHnVCIWj4lcSYfuq+lNQcADgdPegBSgN3iEAM6bJm7RZvEuYRO/5Xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598099; c=relaxed/simple;
	bh=oiOJzAh5GCDekkxzmiAyZpk6ok4wyCpJnQb5vZtuPkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJ/nnau/eic1f/M939BueJ268hEVMtHGCBh8oALWhM1pkcTpyxm2I4GKUkq6dO3E622VEF7VmEGI/d4ivzUgr3rJlo+HOubBKTtscB5V6qlgVzabpxy+yTPC5G6WveCjVTYLMrIMNcdg4tocrJ0mzvgcyTfwmVAYqSoF26xj6aE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcPL6Cu9; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcPL6Cu9"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342c08bf64dso163915eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 05:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790598097; cv=none;
        d=google.com; s=arc-20260327;
        b=NniKeXTrxkEAtEdJPX6ldxTiDlfaDfieBB0/EyL+H8tHNLSsdZ393B+C62PAPKWbZU
         64xl9k3ah0H9EGxICMri56IDPmY8FyzmTJddZn7C23qQLr/SJs/R5jUavGaLrXwhgPpB
         J03iZgpBg17JpgPf2OUh9LWfxQ+Ug84FHPXGL25T+RHoFSnDxFUYIdPt626+4BcalnMn
         iqNDaOey9QqRt6zMqGnOQWUyH0fNKKyV8HvogvzlSRmaw99SGKSOWkjf3NYYqRpRVibw
         xMt4rg11bBFFBDVeYIN+rzZFJXWtaJM6R623Y6olohvulPMpNniLQ3+AYB7s5B5RJH5c
         kTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wW+kBA+Cpt1SUepJVoW2nRQFXA7jpL9oUIIw6VJqh7A=;
        fh=WrqAQ0rQSDYy4H5BtQudVvOOYu2b4I7m1ZMyQQrIDEY=;
        b=TRZFhmP68HAHMl3oEg/4p9W+ZB0ZR8Zy3zGv0DXFYGG1JCveEFu1TRU+oyXjfex5dr
         t1GtSxSDphcBfWxEDxUkK68RPCpvwh9BOLn1aA6tB7gUVHSPoufdsX+SfMovF9RLoog8
         UmnuYiwJeqJpKokcqyTmBbh1o6GPCHGnsS2caerU3I7+4p7OaAfQbiHpFF8HJDqmCL7U
         TM+GHxt+MlKA1jr8MaxG+l0dKC/yINnarQVMKHLwc1kjQ0HqFtgLQY1g7Iar1HxXnlyL
         a7Xlsp5rihc7oYQ4aU3KQ56fU+akP4LxaSRgTFP4XJgccwEUeThwc1IWEGirMxu86Oil
         PpBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790598097; x=1791202897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wW+kBA+Cpt1SUepJVoW2nRQFXA7jpL9oUIIw6VJqh7A=;
        b=WcPL6Cu9bX/LnWKrsZLXNf8mPSu108d3o/GU3x3DkUJZFg18ImlqT5L4oxTmKUgx3a
         lEGTJVITxQZSYRdEsz9PjFbdPPrsliiFp3ega2TCsZ17mwp/b9et+gu0AlEL60hoFNjW
         POtgGDpBxkQRnd4+6A5ISpcE15VQMQSyJVfT+vw8GPp5IL0jE63z+7YybFjvdnhPNozs
         Tc5ygh8tvfQt7u2A17e+A/2um5x3ISgeW23PXznrCYiU9oMuA03QXmfU1xW2X3cKtIOG
         fA/wYIght0Abp93x+7tT9DX/Ews35D1SewsQL+I4ZhRu/f/dyyRdatWo2BVC4vEDg18W
         31bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598097; x=1791202897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wW+kBA+Cpt1SUepJVoW2nRQFXA7jpL9oUIIw6VJqh7A=;
        b=VgiMv6TRZn81FZPBmraDkBB82jppkrT5L+yhVFg4bryEc/je+MA0DDn9cPzYKdHNdT
         vAPiIYXLF6j6wJzqwsl7XPSq7BeMr35zS/Ev595345Xc3lBk9Jtij5gX/AhDHC7FN7Z4
         v+aa3vnXGOQ7Aw+pt/SRIHGkMwHFM0NoFBt/EZkfNkO8VmxLQcWyVQNS0t9VsROAF/xD
         EvXFOcfS80p+k0UcsX7zVDLA+3fvzXwslcdKQPEwwbdrCyspBFlpFikExuRF+4fnVz+1
         EBdI8TXrPr5tvbdzriVTssMu6C0/Yvjjbuuc76CX0BlETnIibAkcZch1FRQE9X5vkElx
         +WGg==
X-Forwarded-Encrypted: i=1; AKwUvBz0OHE2BsdPIA4gMwtXV8+AWN2FsrpFewCUKc/IaZbOC8ISUk+ocVDsWHSHDDgvVQpJueR8P6nvTWG1HATVfQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJmwuE+1BBgerk0ntrAm+OAEBfP+3bbogUnPgtWCgj3AtbelEUs
	pL4ZrLi2Ik/HIskRO9knRQ/fYqx+p6iV6CV/hG0Fd/IJDmhjzPMM0cad/qrZx5vRfLpF5fDVnPr
	MUIjqDg/66VvX4oGuQWpToOIBllYAmNs=
X-Gm-Gg: AYBFou04gP4N83lDLEHwK+HUZd/Aewg3k/LU87IZkblUn2mF40oOB+xkHPLtg4+h4zy
	cliP14tk6Qy4YTKBOhCFIjKKHenE6ZT9jK6L5nzEmGHz2gpMAeeYV6gtvYpXnxB//xZs20btL2+
	COGadKx32Md7l9UF/Z2Ed6wZLb5Ro7DZzoH0yf3ekRQBj0h9QwbpimSXAVVvFF+Xdo1NQyFoEs5
	bKLnw5oNX9dTk6a4X4OHQ8Y93vSI8eoErTQ7KYBQz7FleP8op4k7Zyc/G1w19EAPVSHT7Y1fxvZ
	+aGLDb+ZsJG1wMcLyTs+VCHRDwnqSpBYG6YHJdbg7zI8Fged1AqB1d9os88YG4qi6khtLyCZXEI
	pFaRz7Z4wqP0vxR2UcvHvBVc06uF1dVdQ18WqdG8a9djQlsCP2n38JbPsTah770HOA4s4VvOGt1
	hRM8nJ20TnBP0LKePdjMy7tzyUC/rxKz59IhGbu4vnk2ZGe3AA7ec=
X-Received: by 2002:a05:7300:de0b:b0:341:f4d6:d9a5 with SMTP id
 5a478bee46e88-3427169be76mr15164074eec.1.1790598095923; Mon, 28 Sep 2026
 05:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921115708.4009754-1-gary@kernel.org> <CANiq72nR-QzR3zOiV=RL4je4U8m_hCsPhOD3SxAcjc+4VCrMsw@mail.gmail.com>
 <DLQWWUKZ61KN.1X8VCC2YLPD53@garyguo.net>
In-Reply-To: <DLQWWUKZ61KN.1X8VCC2YLPD53@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 28 Sep 2026 14:21:22 +0200
X-Gm-Features: AclHuK8ncUNTbZ31O7I8Q9x8vu3w0Yp2ed77b6bv8_kyDXsORDHq3MTG00hhWhM
Message-ID: <CANiq72mOC_-6hzd=dG3YJoaLi=fYCZ620CaSXZv1Oo4ja2v5gQ@mail.gmail.com>
Subject: Re: [PATCH] rust: proc-macro2: enable `proc_macro_span` feature
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 1:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Another thing is that pin-init's diagnostics test suite is built with Car=
go,
> and the build script of proc-macro2 will probe if the nightly feature is
> available and enable proc_macro_span automatically. So if this is not ena=
bled on
> RfL side, the diagnostics can diverge from what we expect.

Doesn't sound fun...

> I think the self-ref one is the main motivating factor, because the diagn=
ostics
> with that can be confusing in general. That said, I have improved it much=
 over
> the last week, it seems that it is not *that* needed anymore.

Yeah, that one looks more important to have indeed.

> So, none of these are really big deals and that can be said to diagnostic=
s in
> general. But I think the change needed here is small enough that any impr=
ovement
> can be used to justify that. I also submitted the proc-macro2 change upst=
ream
> too: https://github.com/dtolnay/proc-macro2/pull/542; if that is merged a=
nd we
> later update proc-macro2, we should get down to just a single Makefile li=
ne
> change.

Ok, in that case (plus what you mention above and the examples --
thanks for those, by the way), I think it is fine either way.

I added it preemptively to the "nice to have" section in #2:

  https://github.com/Rust-for-Linux/linux/issues/2

Cheers,
Miguel
