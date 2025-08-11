Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3F72E3706;
	Mon, 11 Aug 2025 10:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908888; cv=none; b=gLkVQbS7wWsDNj5/pJxHPyxV+EqCEYsIJStKzbbLXKvldftAANOHVO/4VahCq6L+Z2ebge9NOLgq3rduEsqec05G0P0KEnvQDaVhgi5jeoRRc3+DYzgk6SEKYnzIFjSXT0MG9nygPN/UJkxfVTFAisHOwQ23zMFgTpOk7VdnqUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908888; c=relaxed/simple;
	bh=/X+sP/Hh6w18py2AYwAGPNJbZ99FmHOg1QEU09mLtYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ET40AxKCjlJHS3hkxkfI7gJko1JEWBCRXm2hw2hZfZ0rN64zIRV7d/UsfzBa5G97nJ6L0T/1GnL6WcxdjVohZqgLQka+IJ7XapoxYpbUfZUb96Jh+vMuu2KUTEVkqWoryiIJ783A4lUMR/yiolmzo/2NJGfWKHrDyYKy43L8w1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afYpmjNu; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afYpmjNu"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23ff92d05acso8635885ad.0;
        Mon, 11 Aug 2025 03:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754908886; x=1755513686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/X+sP/Hh6w18py2AYwAGPNJbZ99FmHOg1QEU09mLtYw=;
        b=afYpmjNupFHX3GvK5KsmQxaF5dlyAbY5kpgK3/jtxqBKTi0nHhhdGFlkG4KmFfpB+t
         vg6I+Kuwhex3Kokn7BPHwaUo28Do25wzQHAb/+EDAjnZAkXHtErv0sid8Q7phavBPgZL
         LnA+7Ef20P7mA8kjjQU9n5W3aAkuzVQoG0IlDfld4x8tPO5D5AP90ZjpnINBsBMGeOZH
         NW5PLX8K+kGUWT44lFrB9dSwm583By5LJvGW83CNUHB4zA5ZUG3chuL5MEE9cG/kQUZN
         cRjv8EQMpji1xlZtnw7OAsJXMF/XhAvbYSAwXdWd5dvaV85DvCU7CTBeMjCFRcA02g1u
         NOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908886; x=1755513686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/X+sP/Hh6w18py2AYwAGPNJbZ99FmHOg1QEU09mLtYw=;
        b=aGE7smAJAT5Fgh+3zimbO7xu3PZRBbdGDwrTPjbDvLgiw3oSfjORLSQxf1BOWMmig4
         QSgPGXud1yanm7Zoppqej/eu10JsPsuhA8yQFcRtPhf8z9gdF6A3uKz2bynFzgj+beKD
         qVhvoCMEK53jLfCU7JLm3YcPj2vHGFvW/w5j0OIZTJZuKjnZXMz8ubQtNP6lw6tZSmO0
         3/lVLGGQSyXc7Ps/x7YRB8dp6Xf98lyFtkf+mvvBCXEmVOldwh7oNHXEyPGww8CVTf42
         3rs8IROvS6I+5YHzvi6GsmX3gHEEX+QRIZ+ZrH3w1SaDjIFQBjfWnBquj1Si1xmWwtOf
         /oeA==
X-Forwarded-Encrypted: i=1; AJvYcCVbTVlqApYUcYZT+NoTEdGajCTTT6ts9kQrEZsJ055qKV+d7D7q/nWn9YmHS0q/4M8JwFl1lUQETsGecMFL4/o=@vger.kernel.org, AJvYcCWKcgpunwa3AonM01QbuluEJ5pdcqcCBYmESMXW0aApKnqCoBXMDbo1IPMz+75BvDyAqfZUg1qrBDZa@vger.kernel.org
X-Gm-Message-State: AOJu0YyzepFWQRfIue9J2vNW0isRZjYVceMe6GN6UpGNIscvMquqwpLL
	FIWxB6kZR7vIFh5zRVM8x2GmUnc1PMOgabX3vSan7X9PxrKEDZENf3rBj0avWS3V9yIevomFtz9
	J4Dpi9o7JQkzNsUPSPFaDix84W57+0uw=
X-Gm-Gg: ASbGncu985+ixw8CNOthwLZrKI9ERmBsKUJkoGoQUmaKOsisaf421qM8sSeYwSXjB8c
	3Z0IzJS6pAoIoklhm/jAK3YUtErlJwFBoy6zkSD3tX60MiMXJlyLZNZMIQoIvuP4Psm0nZFRnBV
	mVsapx1WgXOEvGhOhF2596C1tfwm/pFh8R7NfJSGx+5U65phuKBsW+oqzI5v/HmOzMNf1JXLH+P
	DqR3Kxq
X-Google-Smtp-Source: AGHT+IEEsefh6ehKMQyEDikvv0IymD2B0QN7n/qwEJ8Zh6DPd/OYF2u55DpB0tku4UXSg0I/rl+Xzn82NO1O1c3GA/s=
X-Received: by 2002:a17:902:c40b:b0:240:52d7:e8a4 with SMTP id
 d9443c01a7336-242d38c0f5emr56403315ad.7.1754908886105; Mon, 11 Aug 2025
 03:41:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <175489428990.9320.6825335165759789458-0@git.sr.ht>
 <CAH5fLggrXbaOu8D2eFL+UtrNSqbm8H9sfgjDJzVJXMEgjBkffw@mail.gmail.com> <BQ1zitrkA-R0VKTOh7flS5oVZcEp4APN_GMEn0ZIxW7NaJ3HKwEl-o5Nw_xbvu40PUjQzCmzySKUKnPST0mD15jCPlziFqmORQqHqBSSnJo=@weathered-steel.dev>
In-Reply-To: <BQ1zitrkA-R0VKTOh7flS5oVZcEp4APN_GMEn0ZIxW7NaJ3HKwEl-o5Nw_xbvu40PUjQzCmzySKUKnPST0mD15jCPlziFqmORQqHqBSSnJo=@weathered-steel.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 11 Aug 2025 12:41:13 +0200
X-Gm-Features: Ac12FXy0BnP6LZaCgIPJj59F99U1QeSorkrvW29smVbPMvuluejVuQ24K0Twa-A
Message-ID: <CANiq72mj3cv__MZ-HXh6mR7yZS2srnpy2SjQFnnbPBDHNfDVxA@mail.gmail.com>
Subject: Re: [PATCH linux] of: resolves TODO for copy_from_slice
To: Elle <elle@weathered-steel.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 10:52=E2=80=AFAM Elle <elle@weathered-steel.dev> wr=
ote:
>
> I tried to find the MSRV before sending the patch, sorry for the noise.
>
> Since this is a pretty low-priority patch, guess it can just hang out unt=
il the MSRV bump to 1.87.x?

Yes, but that will likely take more than a year, so we will forget
about it, or the code may change anyway.

The other option is using the unstable feature, if it is really useful
etc., but for that we also need to wait until 1.85.0, since that is
where `const_copy_from_slice` was available. Luckily, 1.85.0 is
possibly our next minimum, due to Debian Trixie.

Thanks!

(By the way, please try to avoid top-posting on the mailing list:
https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interle=
aved-replies-in-email-discussions
:)

Cheers,
Miguel
