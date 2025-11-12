Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CF83002D2
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946035; cv=none; b=FeZdiVMt6CFIIunVtztacek8ZO+70SbkE75mKp5c/LWOjwevTUmvwB95Vn+xFgIYrn3MvAFGBt11n6iu9Ox3MTOi1PaHtJpRwCmZjb78nkry2DhoLXZ/dfFGafjZZ9izawqyBLHamQCXAMdcs5WjBVgk5rcaEEZXAleHRiofX+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946035; c=relaxed/simple;
	bh=HKRQgb7qkXFEXY0rIg9AQCQabb0xmTPYzrOWr+EJXY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/w+r0DEu1SPzSMw2cJts9aUGlii+oAe2BQ1zgIu6yOFpEIpplDCiAkQI2GFL+HWPfw1FjhiJMrlpzSbUswcGkmerviHLysWfboLP4xzfpW56illAqxCDy2wT6jYW+BgGf2g4y6xJarCG4d6qAZWCkN9q9bqyd5/gBd82NU31h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBdcHOPS; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBdcHOPS"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-295351ad2f5so717455ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 03:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946033; x=1763550833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKRQgb7qkXFEXY0rIg9AQCQabb0xmTPYzrOWr+EJXY8=;
        b=FBdcHOPSk/RCte6K8VHG3Ca0v2zHxnekNbAxUvgw0m7tRPb6I/fuKEJ6JfEeGex7Ub
         mTlcYU9o9m/OLM3cfAaKQsDHEY9fEuuAMMkDfsIkXyu54ubQol6cFryQ3hI88bhs5AfJ
         0Z6YFEDuDTzYpxwSXiWZLe82VCx2iA6zz2COnL4gZm0aE0mpRgOP9JiwQwLX/n3M23R/
         mIwv0LLFvFG89IWTwUBWrkafu1Xc9eb8+9/kiDkSPwfWaScjig5jt5WK8gYEtyCVjvaO
         LGyrfRs47PDHXl3iTk57VX1bvdmbnopU5U0fERG06YSXJFummkiqe13o5a2EOTFE352+
         BX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946033; x=1763550833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HKRQgb7qkXFEXY0rIg9AQCQabb0xmTPYzrOWr+EJXY8=;
        b=mn6BqNyQMwv4KnffHl43l1x/6wctD+1U1xLh1haidej8g/GVUrZ1YeeKQcZmJNxWOf
         Z/8Z0CTnvjU9nSDcsQXXjryf3Tl86NeY3ag+KPi8dQ6e+JEmBohRcp2SQAD0R/732GGN
         bOEiWrFnBmbrsWwQorhE7A1are8ixDv7LqffHp49wlGQUYwU9/KTyJBc8LfZxmi68yHp
         bHCJ84PS8F4waTHW1VKD4VhOyzg9zPFUAirFhjvnx0S+Kkt/HK2YWeoLP9kS5JuCUTKL
         KwY9ZqJp1X9hH7uP+o0vsJHqyGy3i3r+JJiihS2k2Z12RXWz19OkzaUYc/lhTLWZ4H+H
         +lgA==
X-Forwarded-Encrypted: i=1; AJvYcCUzFQcYsrc+/7+8MDDaD9/e1eff7fZYkygFqINQEo0U1Wc0Vj5f+4HZ4anP31cXNzc6MWfFRCNMtDiz+S2dhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY3G/ziURzgs85+VvwM27PPKWyDY4Fuo/j0gZxbv9FDzqVrzlR
	s0391Vlm7YRUWXDSpCt5SKvHfmBu0YkcJ2GBtNVdGb8CTJfasiFuYwoQtk7X2RzgZVpd2SnAFPa
	Ejrgk4I16upeSigkN2XN7RrPLAKPMlew=
X-Gm-Gg: ASbGncttRNK8xiUx1+3AYDt6pUjBlaUKrw/fSoBg6e3aQU0PIgzzls4D+XShhhoJXL3
	78cMZjkuqETHWvBWfuhRAsUlnI7eNt1vgS5driAKm25MDQjPfO8AHJZT1NAbaALoNkBhyJGu/ip
	6mWPJJ4m8AzHehXDEQndRhS3TM8CAhBIJs6CRcAS9P6A+3X9OhYApku383s5v0ikSYV6V03xgOW
	Z4lcXXNdjDRxv617lRT8iTiTGYFjAdG7+8uofOcSaUZzLl25JUCIDVpxOtm864Qqaf3+cc0xBW2
	N2Ja/Lgn6Ras9hp+HN5V7PD74oAllkboMQaJH1Tr819j3gqrcP4irvCWLYntwwiD+o/QdpaWgKw
	IIfAsxIxjrtsECA==
X-Google-Smtp-Source: AGHT+IEMVOPLQ0kfBxj6LLguRfI9eu1jQSQHIP8wiKHhwLHRC1rvaWObMB1+XwvZaSaxDEkp8LUmHo0FgkmnVhYp2tM=
X-Received: by 2002:a17:902:e84c:b0:297:d764:9878 with SMTP id
 d9443c01a7336-2984ed48799mr19398545ad.3.1762946032845; Wed, 12 Nov 2025
 03:13:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-3-ojeda@kernel.org>
 <8e58087b-17e6-4362-93f9-f9aaac6c4476@nvidia.com>
In-Reply-To: <8e58087b-17e6-4362-93f9-f9aaac6c4476@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Nov 2025 12:13:40 +0100
X-Gm-Features: AWmQ_blP421Ww4skNX1IA86Afm7j4Lia0EL-t0RKvHyVdfTUWYuVKwSCLUjZdhU
Message-ID: <CANiq72nssjH0dZ5Yso8fp3sjHOMK2YYyfZG+uG_Fb_09xd5=vw@mail.gmail.com>
Subject: Re: [PATCH 02/18] rust: kbuild: introduce `core-flags` and `core-skip_flags`
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 8:18=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> I agree that switching to ":=3D" for this kind of Makefile variable
> is a good move. However, it should be mentioned in the commit log
> so that it doesn't look like it was accidentally introduced.

It was meant to make it consistent with the upcoming additions since
this commit is essentially about that, i.e. it was not intended as a
drive-by cleanup (which I usually oppose), if that makes sense.

I will clarify in the log.

Thanks for taking a look!

Cheers,
Miguel
