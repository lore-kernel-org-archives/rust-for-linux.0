Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FFC3DB9B
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 18:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711390726; cv=none; b=RP1pDZquAGxfDqGKHAqWC+W7yGR5S+YDJ/2Y5VqoQ5O4hFGaHskyaVpBY1CFaCR6brgevZytMBrt4NREM2uGbRjbwrXFUOgyF3v/NKG0gRWXzbpfA/JbZ7xHZny/0ED9yyoNFuDoDiAxWA7+ludYJn691I/cl27buxLsb08aj+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711390726; c=relaxed/simple;
	bh=elUiqJTvAYdGzopmAo5Uvvb6bI2FhG9bkFwgckDVJZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSgMtSMhhqM4hMUnSN3W0MQP29WCSifbRuBM1+dilk5tR8tadp83jCAHnZ29YLU+PrSpuvyfIBGtUxu19EYtkkMOMMP+f1eksQBlzaI3gbRnVy55GPNiGcJPNbR4Zam+i2Hst3YzcQskJLrsGJsjCjmR0IcNBPXpgxuWApUUskg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGDGHzjH; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGDGHzjH"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e6bee809b8so4000248b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 11:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711390724; x=1711995524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elUiqJTvAYdGzopmAo5Uvvb6bI2FhG9bkFwgckDVJZ0=;
        b=RGDGHzjHGOy24jQ5xLO27Tr0VUEcvjBrk/+TcZctcVqRNFhJDzLXbzCdB9maCSa6KZ
         U3ZtW9T6p7yQQeAF9wKzBDVA/LGCgRdjBqhGEvzpKvBJurner2Ca85skiWyraYAqpnWo
         almznwoFrSKr/lcKXgeN7rMcPW0/JX83aoGDZvlGnbzesqtr0MDUsJijFwTyTHuVnqr9
         NJJ86JjSy1H9HIbhc79cLMmkVjgZK3xF3TORNhuAyOAuXBznP8mNx3K/5aguhaXKCvQa
         0BBTEM7619ZCx7QHLamRCGOJhR32BCzQMg1mbQknBxKU7e9IGdzqLMh+W3L7Zwdy/lU4
         Styg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711390724; x=1711995524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elUiqJTvAYdGzopmAo5Uvvb6bI2FhG9bkFwgckDVJZ0=;
        b=FtkawuLeEr4ql870uKTAtjAFYYFJx0wRazLWGwB180ruqFuGh/dEVL/HoOvs9Npf/e
         S5cPpKRlgR4oqGe7MLMRuD+YcB0fwXCrLbVEC/uxL0OWMoBl7P/rkTakUl08ZkuZ7OuU
         nsnFHJukGhAz7TLBRCWI8Clfpyzv6t52iYkEdS25LL/cRNA/hT6Swb43HJ2KOzrFgJas
         2BbzXyTCNI8yei6g1LZo7MuMMQB4wDYzAZskukYAsAzcVIkxJlCQ1JgejLgMN8qLtw7Q
         BDHa91HioOwhD8EmLw6T0xj33cXBfcQpktwrRb1gXrQB2glmgelleMMCBCbppmfVO82E
         7swA==
X-Forwarded-Encrypted: i=1; AJvYcCVShaTKERAFORm3frTxR+T0Uwl3Uq2aoNkwJeQbqEgpROazusYRFNU1A3bfAzog34ZT/DPwSjJ47lOB7zvguu6V7wsT+Y2b6F+p+6SDOLo=
X-Gm-Message-State: AOJu0YwXKIHw4hcnKYt0Kut7vjb9X+kjumdNJRGxeVqupHnrCEonfy3O
	tCZVuah6pFgv8cfAoXUaFvQUdI2Xfs2jnQ3UhVEqwddXKKtyy+Ro20qiz5Q2Y2iUnsjs/Bkx3jw
	cH75WccCaJQd6OuZXzNrzVr+NSDA=
X-Google-Smtp-Source: AGHT+IGXuTSMTH1Xmsa4XS33Fl7mJkCgXtkE3YoWXprmjgzGUmJ6723rlVGoIVMyVdzJ1eCIA8FYtmJ8PKmc/UCXbYc=
X-Received: by 2002:a17:90a:658a:b0:29f:6d8d:da34 with SMTP id
 k10-20020a17090a658a00b0029f6d8dda34mr6262444pjj.24.1711390723971; Mon, 25
 Mar 2024 11:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325174924.95899-1-dakr@redhat.com> <20240325174924.95899-2-dakr@redhat.com>
 <CANiq72n+ufjp3HfDQKqFdbzv1_WErH+oYLF=g9gW6DYG0XAy8g@mail.gmail.com> <ZgG8BUk9PgvdXaYl@cassiopeiae>
In-Reply-To: <ZgG8BUk9PgvdXaYl@cassiopeiae>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Mar 2024 19:18:16 +0100
Message-ID: <CANiq72mjNjvkZAVK-HbiRJotoUgyreepTVP2fJ4QNdfxPuqx7g@mail.gmail.com>
Subject: Re: [PATCH 1/8] arch: x86: tools: increase symbol name size
To: Danilo Krummrich <dakr@redhat.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com, 
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com, 
	David Rheinsberg <david@readahead.eu>, =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 7:01=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> Huh! The patches, especially [1], seem to be around for quite a while. Wh=
ich
> also means people were hitting this beforehand. Any reason a fix did not =
land
> yet?

To be clear, the patch I linked is older than the one you linked (that
is why I linked that one).

I don't know if there is a particular reason -- I pinged recently in
the thread I linked above [1] and mentioned Sergio's patches too. I
guess they may be overloaded, but it would be definitely nice to at
least have the `256 + KSYM_NAME_LEN` fix/approach, even if it is not
the cleanest.

[1] https://lore.kernel.org/rust-for-linux/CANiq72meap5C9bkj5rNDE=3D0U5gb5O=
KwDrrTSrVRwJbkAPWgUsg@mail.gmail.com/

Cheers,
Miguel
