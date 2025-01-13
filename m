Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4D3240222;
	Mon, 13 Jan 2025 16:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736785219; cv=none; b=c8J0q8kEkXYtoU1VZDODjTvyo6WM35kzfHxnOSCq3NoW/TgilwYbLbEehDmCsYHFWdMTk+ej7fOR9PNykdtFdcPju2aN9QOAPCTZATrc30Ud1pOl8nsbROu1BoqzabGTCdqWNfEnMMIulX+Cjrbd27m9+KjibtA3Vg6WnuZpxrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736785219; c=relaxed/simple;
	bh=e/9dICMTHmLxZCv/r6Vcv3idYCdjGrwSFyC8KTMIFM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXTtzJT8j8xh5SiKkbxrM/m1UALuSh7XrESUUV24J4H4c++F0vs2co8f4qfGAIdxi3DmSTGEWSAo1Jgui6OWgZ5zEF4rR4+mFKMJWESS7kqJ9waHvdo285uc0ZDrPj+3idL7XXYB80Xr1MhRLBaz/CyqvSjAxPEQhCmYkYGxpOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfLSlztK; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfLSlztK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee94a2d8d0so941826a91.2;
        Mon, 13 Jan 2025 08:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736785217; x=1737390017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/9dICMTHmLxZCv/r6Vcv3idYCdjGrwSFyC8KTMIFM4=;
        b=MfLSlztK+w8Wwafj5LzxLwksbhnQ6G4tV2sLOzhDI8wmobv1WPnSQrTrsm+EOGdJm/
         2/GNQ7WJRrNtNQr79fQaVqwFxMAWu6XOhwuU/ikj7iKajsJBwMYANxexjNNw//P7wIVq
         4iA4YZJBAK8kMOsDG5FNyI6aAz06SRAoM7yAT+rB1ou6msSo84Iz6NC5zghBZKQGEBUw
         cQprtXeCkpwi69NZBclFeXpnMNam1InQM759g9pLHhHo7B1bKvo4FlmCyYgoQ7j/m391
         hAeOGSmUo9Srg1hApT4ZOGcB9DuwWPW9nruLCueyZbPPYxq7yxids/EJ82STO3yCgh9S
         p8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736785217; x=1737390017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/9dICMTHmLxZCv/r6Vcv3idYCdjGrwSFyC8KTMIFM4=;
        b=J635hN14uJLZsYjdHqshqgXWZ/qVfxwjuZyUhTQNv08JON2CSq2Uu3jV8uebZEfnjy
         bDyuyWbkB5NOf/Qj37GBOkTWZiGzb+yPEm0ztikkpZziyRhzDxJR5J9Fxo1/a7ERMLx/
         yoDdYGZ1emjG3BMSV30SHj13NBMSg0PvuijmsduBdc9sN5OqPsq9UT3XO2jrgiN8ixlt
         hWk04Cq4GGeh3WuNhpIfcNeQzRLXlL1CFkKuvBt9SGsuI6vdrLpCX6VZYb9rKusZNWp3
         cbyjoxrlLNYXF/ZFhw6KgoExdSIlAwaVCW37ypZUJO69Rvx6m5yXiLtSCaW7J007VYZ5
         TEww==
X-Forwarded-Encrypted: i=1; AJvYcCVQDTWtgGvqXfgl94IURVpVk2KG3F8aos8N4/pH87VyDEAl9ZqGH3heQIWqQe7ntTTuC6/tNdM8pEeFIdM=@vger.kernel.org, AJvYcCWBNO4V6ni3I/HmoE+Zo89g5hfRrXTAqvj6Sex6/J3dgHzhr9dyK4xY+s2yZjIrPN80TYWTiSZh+vi8WxFNz3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzLifJv7MszfBS1em3Q1cTW7h+AmDFeYQAds2BMM/rW0dj6ENZ
	BX4/46fVcfEdsO+Kg0rRrxHCv9/M7qMwXLE0LRtEGVV9wd481tcrTgI1aboqMN1/Gi2yQgNJi+Y
	i6JluNN63yeSz4E5Kwk9IsR+eALQ=
X-Gm-Gg: ASbGncvG+fKwZU9QblKTB2ICtXdeyB7PgzBokl+7kn0O5U41ppVko3QJNo+BjVius9Y
	/5U2dcnATUkUl/PsLKdYfjDHa4RWf5GAYTsEBaA==
X-Google-Smtp-Source: AGHT+IFvvk6FBV0au2JqWGI5eh/OoDbM0u3JDyy2M9x7ciF0F/nIIxMQEpK+/36FvNJXrdUxGK1mk3NfdMQGBIrv5xE=
X-Received: by 2002:a17:90b:2f07:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-2f548e55126mr12065218a91.0.1736785217277; Mon, 13 Jan 2025
 08:20:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120-borrow-mut-v6-0-80dbadd00951@gmail.com>
 <20241120-borrow-mut-v6-6-80dbadd00951@gmail.com> <fc667065-6951-436c-9329-77e94a64f614@kernel.org>
 <CAJ-ks9kaj0rjNAW1CWW-qDrLvFoVY_8Q5P8ZLO1N3Tz2o_wSfg@mail.gmail.com>
In-Reply-To: <CAJ-ks9kaj0rjNAW1CWW-qDrLvFoVY_8Q5P8ZLO1N3Tz2o_wSfg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 13 Jan 2025 17:20:05 +0100
X-Gm-Features: AbW1kvYgYFGql41U5eUw2PDPag4KF7lK-OkF-jsNid5h6A4dcpyrKR3Oq0M5srU
Message-ID: <CANiq72mfE=m-dQ6HCaGT68wxj=ymZXpxGNgqVKN5tDHeWEkb8Q@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] rust: add improved version of `ForeignOwnable::borrow_mut`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 4:46=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Agreed. Miguel, can you do that when you apply or should I send v7?

Of course, I will adjust them, no worries. (Thanks for the offer!)

Cheers,
Miguel
