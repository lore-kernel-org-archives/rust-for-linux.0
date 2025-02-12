Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6670111AD
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Feb 2025 00:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739321862; cv=none; b=fZH8jYTU044tEQ+Jx7X51pXhKNSElCUiIDWxgt6szr4dKQguS0r53m98B7pmZhyaUU2trIVrnMkbYsTcbNKgft1e8UwKoHNBwZlvSNAIKwLaEoajQCWqVcRd9wgYygwKk7yvc/j6AOBTy0GKMS9PoR3E1a/bWQ75U+X478m95po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739321862; c=relaxed/simple;
	bh=ZE/ltet4LHK7MQuN1AESeTZTqaYdweE9eCvmTMUDYtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c37QEVlwzEC7oYFQ/EKJlJMz0MBb9A/JCFPWdx3m987OeB3SkWsACEIUTHKYCd1r314UHVEIyR7+xVY1+zNQIs6wPExHucsf9ErxdqmZ6Hjr/bAIL3ZBhw2bwMUClRLfluCOFDT5mXmebhzWjZYyY4NeJJVZHio74opsPyvheA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JMr4TRva; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JMr4TRva"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de6d412ee9so2002a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Feb 2025 16:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739321858; x=1739926658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyBGo4NEk4ou27pmwT3GiAGuDVYoMKwfHMTAe8m2fBI=;
        b=JMr4TRvaqlNFiKx8JVsg/H0R7HDryH23nWtJdbVZUG0VZ7BAW4qBrqGmmilcxeBAyx
         aLhw5pdOzRfofnKqH8J95ClvXzJ+BDfiY56/aPK2dP+fm5UotpeyUuVmbgWMYiWHqOR2
         sgVch/gO9PAVHfz3UfcKVMUiSu57cwf9DkkuE0gMX+bzRJ1SvoiKWGLASR2ISfe95sKI
         1B0o1ytFzqGwp+H6VBC5zibKYjZoAD8OcJ70WsxUGNMGrRuEx3fnvRwyKoDaXWMcz7vb
         mE5n3DB4hoBUuvtLydJCXKyFGNHUhiADDz2henDJGew0JoO/yqfAlAvwh2fSv/+4xFcF
         eltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739321858; x=1739926658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyBGo4NEk4ou27pmwT3GiAGuDVYoMKwfHMTAe8m2fBI=;
        b=V3rPL10R4yI21iOlaYCje4mYgvH8kN4TXHNPhl4hdOj3UjroEOASIQ8q5sEm+RxkBR
         UfYL0txMKId/lyV9XyJZkoJHNSfcckB/iiOf4BEyXn3LMfmFs0GNk7JOSHHkaYnzdHPL
         p1j6fxGcyU1gOqxMZndFRYso3fwTYFXG5pob8CaPm/enSbYhBqsRCQlWluOD3NIiwRom
         SGmkX9WMJlrHh9WVXpQgHxewfg+2/iBHaIrjCG8Lsq8pBVG6pNn3oQuCzCy9TR2WU9aK
         QsgjlwnWFrd0V1rj1iTCY2MbGYjT9aZ1taqe7659z281xJy0hClQOrhtpHwTDPZAKlQd
         u1vA==
X-Forwarded-Encrypted: i=1; AJvYcCVlyMmsUl6uBGjTkbqfuwWIfCCcL83MwNjSaxoTxWf9ZOlvsmv/HIgnIgzHSiofJorLWqMtp2UomsGdaarCyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6gTJRJRqx3NmlWcx5gKyPLEpv8K2kp/7ildn8dJrgnk1StziI
	gamZkYFWHBW+z0GAIx644tbLTDrH7ZXQI+oBAAwdDKpxDzgS08aWx7zlLSjxq/PtJNofpS/5WVU
	Q6v4yBgt5RN8026E8n04tACCRf/Fc14FwFVoQ
X-Gm-Gg: ASbGncvrOUU6pQfD4dufIqFbWkbJsYf0AGpPfgZQ14bPtpyGigQ2c701oemYblxt5UB
	3SqOUsaJEM7Fhoz3JAQBcxCsBmInDB5RVZWwTsqZ3GMW/MZRvutc2Ut2bXhyCxzO7czz4do12hR
	SOeTWcpUepfODSGyHAoXL28WBHXqs=
X-Google-Smtp-Source: AGHT+IGGry5l4RQEnuSdk6aioJ+bv1rbvIM1o5se3iV5Jtj1b2iEWNaQAzttrNeymsRtOervTIxy8hxdeVXm7d1+3Ag=
X-Received: by 2002:a05:6402:ca5:b0:5dc:ea60:45aa with SMTP id
 4fb4d7f45d1cf-5deb0dc7a96mr19983a12.1.1739321857927; Tue, 11 Feb 2025
 16:57:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210163732.281786-1-ojeda@kernel.org> <CALNs47uBcyTmBdTBAPXiBcAkE0-4tih9j=VAv1rRcTcf_c2yTg@mail.gmail.com>
In-Reply-To: <CALNs47uBcyTmBdTBAPXiBcAkE0-4tih9j=VAv1rRcTcf_c2yTg@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 11 Feb 2025 16:57:25 -0800
X-Gm-Features: AWEUYZlRV6pF3AGbc0XvrMoRFXalIUrBnJyNWQn2iVM9raDE_v1HBIS8LQ3IxnI
Message-ID: <CAGSQo00rWwhcT0SjhUn_e3o+TyCP2stadHwANkmE7-AEeSHBAA@mail.gmail.com>
Subject: Re: [PATCH] arm64: rust: clean Rust 1.85.0 warning using softfloat target
To: Trevor Gross <tmgross@umich.edu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Ralf Jung <post@ralfj.de>, Jubilee Young <workingjubilee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I successfully booted this on the emulator (with some additional
patches to our system unrelated to this issue), so

Tested-by: Matthew Maurer <mmaurer@google.com>


On Tue, Feb 11, 2025 at 3:10=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wr=
ote:
>
> On Mon, Feb 10, 2025 at 10:38=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> =
wrote:
> >
> > Starting with Rust 1.85.0 (to be released 2025-02-20), `rustc` warns
> > [1] about disabling neon in the aarch64 hardfloat target:
> >
> >     warning: target feature `neon` cannot be toggled with
> >              `-Ctarget-feature`: unsound on hard-float targets
> >              because it changes float ABI
> >       |
> >       =3D note: this was previously accepted by the compiler but
> >               is being phased out; it will become a hard error
> >               in a future release!
> >       =3D note: for more information, see issue #116344
> >               <https://github.com/rust-lang/rust/issues/116344>
> >
> > Thus, instead, use the softfloat target instead.
> >
> > While trying it out, I found that the kernel sanitizers were not enable=
d
> > for that built-in target [2]. Upstream Rust agreed to backport
> > the enablement for the current beta so that it is ready for
> > the 1.85.0 release [3] -- thanks!
> >
> > However, that still means that before Rust 1.85.0, we cannot switch
> > since sanitizers could be in use. Thus conditionally do so.
> >
> > Cc: <stable@vger.kernel.org> # Needed in 6.12.y and 6.13.y only (Rust i=
s pinned in older LTSs).
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Matthew Maurer <mmaurer@google.com>
> > Cc: Alice Ryhl <aliceryhl@google.com>
> > Cc: Ralf Jung <post@ralfj.de>
> > Cc: Jubilee Young <workingjubilee@gmail.com>
> > Link: https://github.com/rust-lang/rust/pull/133417 [1]
> > Link: https://rust-lang.zulipchat.com/#narrow/channel/131828-t-compiler=
/topic/arm64.20neon.20.60-Ctarget-feature.60.20warning/near/495358442 [2]
> > Link: https://github.com/rust-lang/rust/pull/135905 [3]
> > Link: https://github.com/rust-lang/rust/issues/116344
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> This is consistent with what has been discussed for a while on the Rust s=
ide.
>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>
