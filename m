Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14F11F426A
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737474043; cv=none; b=n1z5ZrXufI83AymHdNkWvTVqDrMiv4IPLc9Zh+wJaSoi6y+jMIPDp07f/5oG8q0BwJcnyt3WNtE0V8xHzWUi2WuzbJwNEIbSYseNHH1hrHuGnAjCLwXn4WiGKvfJhPolSObAxoPcKEP/kl+LAPUMOSqrcc5KIsH6Pw023mMH8Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737474043; c=relaxed/simple;
	bh=a7tFju1H1A7l0USr8MnBFZ6f2QWnkewIkUA/s2JDb08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bc4wQrKGGq7ZXm6tz/FrA8rf9AVFFhS7ueHBRPy1MNe9eOg5RMbrlyBCWJWTRnWTJYBvYZM9EFhqQCOO+6FrxRvKmAw3u+ocVpBKSKSDh6CHSMgyrISExr2FYvsfVVKlBL0QGNFCRWeJlCZMLk39TRZMVU8J4xxxh7LFQttr0xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3WZhoIcz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3WZhoIcz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso40742915e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 07:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737474039; x=1738078839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7tFju1H1A7l0USr8MnBFZ6f2QWnkewIkUA/s2JDb08=;
        b=3WZhoIcz8kkag7iRmZreGHqd4IZavuvuqifGgGW1kfMMowQtZ8Rty5SxgNwM/1e7LC
         7aTIBqh94zP+CL6l02Sfti3pourF0ZPpy74xvg6KTAxipN4jOq+T6O3NW9YN5Hg2JKpZ
         wRX6o/trbWRuUnZzTyBKpC8UUw5BYcBw6p9g/SUmp9Us0W0mosI9B32B0Hnj/GbEM4AY
         rGvxfFnLH7fFiJEsgghq1TATYEr+QsOATPhjGlNJcss/CdrswqV8ebzpVnstamTX5t3o
         z/CaE7iOEqRIZ6zrEYGsR2KAhYCchAeaez7R4P0RJwxU39KDuNlXNVh+znEqBLHnhq8h
         CvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737474039; x=1738078839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7tFju1H1A7l0USr8MnBFZ6f2QWnkewIkUA/s2JDb08=;
        b=P96KmZI3YIimj+W4BggOrzgdaNj5QDwDTnY3WZg5B8NLD2ikPZgMcX75GHp4bgnu9f
         /y0myFSKaI4CTflLsOHnGYlZ5p0PIL/1kfC91DdQzTDdS/AOkLcJd4aw/+4gWgW+dvWy
         X96RtOv7DjMUYmRyD4u7+5IQUrgVOJEvUrCKTvAd6tp8q4/08ajIGtW4Vun9k+DXcUrI
         xR0zPcNdkpHe+rmonvAIrk602xLgioiJyqUasKjAy1bXcyHctbiQm1TWgRxgod4A0hw6
         3Jt4HKdYN49MlWJc8sh0TaZLLKTlwRcDN6spY2+Rg/GQbql5ymRDWoZwMecDl/qrQUwa
         pb0g==
X-Forwarded-Encrypted: i=1; AJvYcCUyqZoMvmWz/eHTActHnSDBQUJ/wPXJJFa2GROk0L7EdOq79QCZWSi6rZJCakOjhTUu+buIyg2cLlzJ9IHMZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOFMkBUOFXT4VMfFUxB+24KRju1bFtg+91uzoYlR8Og20dS5al
	j/IEUnxCqK2xV8mTDl8w30inbRulSzKP6p4G/lHKWWq2hlBjpnc0nHMPLq5AovesO5Ji+0GB81C
	s54kT2oNOGpdftCGGvtCjY13S4Q6jfD5LdTpS
X-Gm-Gg: ASbGncuS+1zJhldmHb8v5OFnT2zHVYLa5ZcZhuXge53E20S7ifPO6zqZk2oh4pCJyUf
	rEV5qKiBrYtaNSaojyAuIs48Yl9UDvl/2LFA759MZSakB/LZHLcyt6e9v76orVx118+abYX91wz
	ytPvkvVw==
X-Google-Smtp-Source: AGHT+IGo7y3TIzYmCyfFnbDDT2HZnQjfPIAMvOx+2+9c8nAzb8yVRZOgFrTvixqVlXjsaXMtzKE0viPrLDUn03CNDQU=
X-Received: by 2002:a05:6000:1a8d:b0:385:f062:c2df with SMTP id
 ffacd0b85a97d-38bf566e6bdmr15869254f8f.11.1737474039152; Tue, 21 Jan 2025
 07:40:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-3-edbf18dde5fc@gmail.com>
In-Reply-To: <20250119-b4-rust_miscdevice_registrationdata-v1-3-edbf18dde5fc@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 21 Jan 2025 16:40:27 +0100
X-Gm-Features: AbW1kvZ9P7YAzqEVyT6PEqJZp0XoYRYY44lMNgMXdd42Wge7vuQc9yf1VrLph5M
Message-ID: <CAH5fLgismQ4whAKswp843T-=q_1+C7DB1qqg6rqk013DGr13iQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: miscdevice: adjust the rust_misc_device sample
 to use RegistrationData.
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 19, 2025 at 11:11=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> Share the mutex stored in RustMiscDevice between all instances using an A=
rc
> and the RegistrationData of MiscDeviceRegistration.
>
> This is mostly to Demonstrate the capability to share data in this way.
>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

This change causes all open files to share the same value, instead of
it being per-fd.

Alice
