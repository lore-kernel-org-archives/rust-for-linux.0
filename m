Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553021FFC50;
	Mon, 27 Jan 2025 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985360; cv=none; b=SmZsA0faR9jwyFd9Q552ubk7vDhnE5ZAo8IRnRIWB9etvnos6/SoRudbQhYzakJnof6xVRmRHmaR+OK3cVebh7WaEt0EK2KNzuH8g9HDnjKkmPA1JiEIcsXaLproUTMvBLonK4qn1R9ZNF1k04C2jBnWVTmVOUC5O0zsE+eM5v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985360; c=relaxed/simple;
	bh=B7Yz5/RM6szmKDpJyDH52Tv74A+9KFCmI5915IOxOKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=geoovnNBvc9ZwEGboZpM4B0uGYUHwWZ3f8RQS87i+CuQ+/7i5e9K7+HcTYi7TaNZvG2CQEssTQ7G6ilJaik2IDndNF436FncO/LnBH/6dA7dtihNcM8gQKusOVNBAR9bZfnv+zDHRKTajaosJoGMEafb8V67Fc/9fE82ijRQlzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4kGIeOO; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4kGIeOO"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee4b72d4d8so891137a91.3;
        Mon, 27 Jan 2025 05:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737985358; x=1738590158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyhlN/XDWXXYwJEb6BTGJoFdrAkuKg8+1MExHfFaHGQ=;
        b=R4kGIeOOskc3KxqSVwFPoKTDQbTgWSEp4mal6kwBCgaLnWhM7njA9RWzJ5R1Lwk1iX
         BvnVNqZFr9N6QEApm295lDhYDlTE31Ded+U8Tab9okC80d8bhnj9V7dn08Z76ImJKFZr
         8yXY5QUQ8cd3fXJzxxCLfxyv+EvjJax51wVm8Nwn9V2P/SRrJIj5micCNRlUcQckcfaz
         lBG34TvolQkuMKdLvImYET53Ai34EI+S9i4bOHAV8KyNBBwdyRIPKsoyc1hrxWIrLls1
         7YQEuhqB2ps05XnHwHf2LsEWfjld9iB1005LH4d9dH0dMjwp62krTp6Gp5ymsfJn+noO
         MXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985358; x=1738590158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyhlN/XDWXXYwJEb6BTGJoFdrAkuKg8+1MExHfFaHGQ=;
        b=oCWOdFnCny/i2dwpt1HEngEtNuVaMpKjqktFo6SHH2hFQvK49ptN3PJlIVuD8g/oYl
         vnHM+5IbOBToo3bhMiM1dmRYLMbR16O0LDg4IwDZHk6hpV1IR0CXev2vDpwtXCx6d0K0
         rNW3l9jOYKHIvvkW3m1O83Ndg8aGY1o5GaCYvNoHvO1ni2rLnGzlSx2JVgBX518LUGNL
         T5Y5hl30vQfE78oFso+r9QzPXhFCIeSurOowHVZbsSAbl/ha3OtJI9I7TSN/PYuIs9wc
         S1I6YZN7+MJuOSn1w94P/S5NoSQQhstzzsMf8Z91t2FYHKFYQyJF2f9LQig9lVN+iGIs
         2uGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI0tWpHTNhA7CUnbX5wqiXgcWrEE2sv8wtdsdMv2G+UE2go1+7USxphDkND6ST4dTKFBbD9BHPfLu2yv8sxJs=@vger.kernel.org, AJvYcCVsXv0Eg9yLsnI69yKe6bptbn8B6N2xv4XsbgqVzBeX7fi6dFjf8rrIZ5Qh99ZJr/OyfSIMM49HxB38sNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLVNbW/E75KDV89/pcTUpReMyeMKPmkPe4LO4DlR1YJFEqAZtf
	QJxDG4MLBizfDEjeCQpAHY1TR3nJg4QHyE9EkeOz5eOMEjpdqfLfBagBmcTkWPbrxXLHJJLMpXZ
	p9YfqOaaYVMDcYvHveAstddNBEPw=
X-Gm-Gg: ASbGncvBwaGo3B7nxPBj8rqQvULyA23IQYPqYll6cVEx5PVWYMxUKnoOub7pp8CSd7K
	sFwqbYI3KJoySWQrO4jxGKAJf2ZQt5tN2mxOAZ5Ixw8Yi5H0thIVR2nXYbtrQgQ==
X-Google-Smtp-Source: AGHT+IED9bxBnS7BawdYIvLqqALM8SHIHDgywrLMKeyx+dT6lNuUZZoXBOD0u5PIYvUkki6z0McAhNSpHu0Ke5yJmV8=
X-Received: by 2002:a17:90a:d64e:b0:2ee:d372:91bd with SMTP id
 98e67ed59e1d1-2f7e3efc78dmr13027750a91.2.1737985358584; Mon, 27 Jan 2025
 05:42:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com>
 <8953765e-d978-4a91-bc81-9ab154ac2255@gmail.com> <CAH5fLgi-CJCveLmc6hFdAYOhpRULovDh_Cix4FyV=kBeg9oiFA@mail.gmail.com>
 <912d9ba8-4cd1-434c-ba32-5c74ef4c12be@gmail.com> <CAH5fLghaE6fC0riAch7Wj94ZqNx86mi4ytBhCzcR7KCcw6ZqVQ@mail.gmail.com>
In-Reply-To: <CAH5fLghaE6fC0riAch7Wj94ZqNx86mi4ytBhCzcR7KCcw6ZqVQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 27 Jan 2025 14:42:25 +0100
X-Gm-Features: AWEUYZnUK0wOMW6B98pcm6MxCUNMXZP2nA9_jTo3WetEGLaG3krixkkR2MogA_Y
Message-ID: <CANiq72nNiy9ShJn1Jcy6UwWbhs066OiJv-bV9fa3b0CYCroJmg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: miscdevice: Add additional data to MiscDeviceRegistration
To: Alice Ryhl <aliceryhl@google.com>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 2:33=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> You can expand Rust macros by invoking make on the file with an .i
> extension, in exactly the same way as you expand C macros.

`.i` for C, `.rsi` for Rust.

Also, Christian: the Rust one currently it works for leaves, e.g.
drivers and samples:

    make LLVM=3D1 samples/rust/rust_minimal.rsi

Eventually we will add support for others.

I hope that helps!

Cheers,
Miguel
