Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CDE22067
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 17:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726507059; cv=none; b=s3/Dcx3xrePDBkt4bMwyfUs1p4HLMohXvoX98VpAEksnY70UoKkY10y4DF03PXUTA9KRO13XgkNC6+ll/sDS9+fTq//80xR2BywExiSHnS/DMtgjd6MAF5982T/e3yet9SQSOLEfzRdPE05pXPgDdSvv79o2edfnG6MUOcyaNgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726507059; c=relaxed/simple;
	bh=6keYaJfWNVwJ239lzBAce9EzZrIEkgiFzV6zkdQZgpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZq6nA80jDdpxHPWjpvlf1++nAf/gzpWWtPEg8i+r+heNA/CWmbPWV+Y/jBi3dbURbCM8Fgv/Chfi70V/5xIGZwRQi4C/jOP9LLZQgdIOMpKMzNySienFA67gApFdWUMs4yI5BwtZmD+rt9GP0y95P0mJf5AZ8RIoNsfqUCMgJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=piQpACHU; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="piQpACHU"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4582fa01090so20881cf.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 10:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726507057; x=1727111857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6keYaJfWNVwJ239lzBAce9EzZrIEkgiFzV6zkdQZgpQ=;
        b=piQpACHUz4LwzREf5RsWWmeA+6kA0JWFl2mm+MsMv7V5s7MbbqM9Jzp2wC4jr6rlvR
         7ttbHiG7JcJxJZ9dch9fd/5LuRsQT/75OfFNhgtVhsLe6+fqnrdddkHU9M5KazCdIaqG
         86u6tLbwsKEUAPTzezarEYdZ5RKUYLMuOkMAnCnbHF5KnMO9iHr8tSjwE8pG7886GHbI
         N6kER0xtzB40ej9corBRAd0HkRMj156kGY3h92C2RvjT3pDbTUTftUdqy5YVd6ebDzP8
         DH23W+I9Q6dX5fbBuqrIpP221+3ucpUOglJcaQCK6jkR8oGaWEfhPg85rhOPlS2AG1Qc
         oGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726507057; x=1727111857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6keYaJfWNVwJ239lzBAce9EzZrIEkgiFzV6zkdQZgpQ=;
        b=Ic4gDyezda4wfHi1WwVh0EVzEekSN7fdrPItRkwUkMMSxMHeebBghQqGsoZOkg2ylN
         s43S1+Y+0XBe9RKZ/3vyCZ32RiuLEytKc0qw2/VJy1uG50Bvud2RReRN+e94MCrcWMwJ
         zZtGgnXV3OyCmvMvTV+EjPqCGAYbG2mrepJb/ccpHUuhN4NKKxKg7K9HAx9xqGKc90Cc
         LawdHZuVwKHwZkvZqTiazpLwCgTvFXvX5bsyb2NMq26QkTeBZf2bt/stbJtLR+/1rYgI
         /v3Es4tUzwQ/VVI2ejpJJ/MY20tYORmJEWBhCmrkArfslL9ZceZ4hHWENgVHqxES6Trz
         pmvA==
X-Forwarded-Encrypted: i=1; AJvYcCUkTB/3rU7wCI/Z7raO2glNoftjMkmSqBTRXrFH4IIOXsicBqLYRJRCI9FuxNzalBzp8hq2paSEekexfIBVdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/MXoMIDuidtFDQW8vj0zZ1ok6LpLFLp3qB4ef+CKOr6BWob5V
	WxQjDmzVuWbRifN0sKOmb6dEt4hekF8m22cUAZBIxjRYFqbdXPuq5ZbtRA92M87iK3l+uV21mvR
	Gy8shXR+5/iRbBZbYH/119Alk9dDlnYx88SUB
X-Google-Smtp-Source: AGHT+IFcVX088+ey3z2cQ6RmhwUINPwhV70o74F9agOzt/uHpXfiS+bm3eL5YY63RoffVV2uxhLxtCRQ9NaMhFCJ33Q=
X-Received: by 2002:a05:622a:c1:b0:451:caa6:bcd8 with SMTP id
 d75a77b69052e-4586452ab55mr15263031cf.21.1726507056793; Mon, 16 Sep 2024
 10:17:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913213041.395655-1-gary@garyguo.net> <14389f99-dfa9-4646-a24e-e5eef1beacf0@proton.me>
 <CAOcBZOS6BAJ1FTFkB3x6jdag_hL7zrLbFy7TxkvZWKxRZ_+ggA@mail.gmail.com>
 <CAOcBZOTcoPEk2Bo05gj66cHiqKxTR7j1z9U_j+Jeh1oCjtOKXg@mail.gmail.com> <20240915005213.7ee8b814.gary@garyguo.net>
In-Reply-To: <20240915005213.7ee8b814.gary@garyguo.net>
From: Ramon de C Valle <rcvalle@google.com>
Date: Mon, 16 Sep 2024 10:17:24 -0700
Message-ID: <CAOcBZOT1pLJx43+Mt=qe9T728PRv-oHUQGSbHwvyMnhuT7WMFg@mail.gmail.com>
Subject: Re: [PATCH 0/5] use custom FFI integer types
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Makes sense. Unfortunately, the cfi_encoding attribute doesn't work
with aliases because when types are encoded all type aliases are
already resolved to their respective aliased types--maybe if in the
future aliases have their own ty::Ty representation it'll be possible
(e.g., as in https://github.com/rust-lang/compiler-team/issues/504),
and the encoding could even be deduced from the aliased type.

On Sat, Sep 14, 2024 at 4:52=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Fri, 13 Sep 2024 19:51:01 -0700
> Ramon de C Valle <rcvalle@google.com> wrote:
>
> > Since we're doing this, may I suggest that we use
> > https://crates.io/crates/cfi-types by reexporting them as kernel::ffi
> > instead? By using those, we would also avoid the granularity loss of
> > normalizing integers and using the integer normalization option
> > wouldn't be necessary. I could accept any
> > contributions/kernel-specific changes that would make it easier for
> > the kernel to use them.
>
> I don't think integer normalization is a big issue. Sami said the
> granularity loss only results in ~1% reduction of unique type hashes in
> https://lore.kernel.org/all/CABCJKuc8ue1y7WBPo3YRRoDeGUFpRon4at=3DWa1rQjr=
XzOGpt9w@mail.gmail.com/.
>
> As Alice said, if the CFI annotation works with type aliases then we
> should switch to use them. Without it though, I think it's quite
> inconvenient if we have to use new types for all FFI integer
> primitives and add a ton of conversions. I'd prefer we still use type
> aliases.
>
> Best,
> Gary
