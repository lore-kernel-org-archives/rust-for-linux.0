Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C61337100
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 14:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058726; cv=none; b=sk+Lyki9K6MX+PY4dOESqCINRg3fpdMZ8efsvZxnfA2i+3unTybbyZDJDSpaE4eGmcOsA37ogc8Y/T9LR9KM1gsBjc1Er22VGioDh+vHEINStUkaRPeRRmrLz6ic8bgHc8YssFz6k4n6dt8d1U9iqJfIGol+VOh7B/oJRuWYP20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058726; c=relaxed/simple;
	bh=Gyq+NjhiKqVLnuujXH69Hqyu6MFhqZ78VaI+VUb+2E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9ah3OZt2MEyhgkQ7D7zaqFcPqu+gMIg9jrBaYMMcOvIUUFzPuE/pcqSN/dGvCexHDnhJVWR85HYJJh8fdcdToHGP/t+nuOTK1kLFE1l2iQRxJ7eVE5ZYkE7zTQaCyIxO6tBgdUAs5enZsrLmnk7PijGdP4K+fN7suBwR1Wpvh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVIOfilx; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVIOfilx"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-26808b24a00so7274145ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761058724; x=1761663524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gyq+NjhiKqVLnuujXH69Hqyu6MFhqZ78VaI+VUb+2E8=;
        b=RVIOfilxT7vxYb4x6snRYd8d/y6G/FudKfAxPUTZfn+2ZWZwDIwP5lAvAReELTbnqv
         H4ybI72f5a0j6SOW268kgDXwTJ+eAVWlhEEnOyP26fplCqeYpqxTB7p/rfZb57Ibw7f8
         re2rhVoNQIgZpO1qZsXSVrmQkLv9U0uJSZ6/loaxTAp2K2pO9PQjGxYwGbRqqq1N18ju
         dIdRxiAt/nznHZOaOKT7LQYeK74ek/3E/23+WFmq7JVdn3XcBDcVHW7M7KrFtHoXenYD
         E3ooBA4MslSofOwDX3wtlKIwkj1DTk/g2AxVKe0RiiPSek5jJ0OQsHsmP4EwFf5kNhg8
         wfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058724; x=1761663524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gyq+NjhiKqVLnuujXH69Hqyu6MFhqZ78VaI+VUb+2E8=;
        b=prwvUzIjQR2QyC+/+ztCBI2flHXA1633s5YoL8gAHPotFdibP/9dIhN58Lr6Fb53EF
         5ulzTQZz4OnRwpypF6qFXJWl+kRGSgLFYWtsL2Ud7p7jwfNAuL6sV2PiKRcJuHdKb6qQ
         bcIgcEN+Ej3b3sV4R5oE3OLudcSQig/23Ki51OI25+HFaPpeqeYunPcqG54IjSN+fL5B
         0ZpvoZmUIocYekTxkewxc4CSaC7gWUbyUVdPNgVqIuwMPdHpRCX5c4lHupOYhjz+WjZn
         dYiJHx+z7OkpQq2xi/OyumquaRHiZbBQcdIMS7YqfQ+EaZUPPAETo4+ZmWZ4LV/gEkD4
         U9Nw==
X-Forwarded-Encrypted: i=1; AJvYcCX5V7VwZFdpCCxkhQJDvFKdreQjr/6m2O04Tofw8+uUXKaHszfKvFmBvJOMOYa6t/nmxeIZ0MPx4NNvKiVWSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymvzne6xQnVnSgKaCNLEh0ujGLonFK7jPP5aRK6EnPmAReIvfH
	3jvQmzVPhq4tR0r4bFHMmC7GAZGQN7le9RlH/XgK7vQ2aH3Pq5m+tllaZF9eCeokL1D+rYJ584n
	kn0xRmOHFUT/ag83QkWUZssVp3r7py8E=
X-Gm-Gg: ASbGncucrr/NbssKC0imSB81UQ9atGs4fCG0+4aShZBex9z8jwNXKsU1Uw3sqgW/X7E
	7bgub3GsnqymBzGQd9TjQx0iKu1AXCA/MUcMLJLrsWWNHgOqiDT464IAR29ax9Q5vC0EJTjdX4c
	KNjAkCtQ27Ihw3ZDP47cxYFyW799qyX+JGol7PdgpgROzRg/DvLHlYGjcCg32S0YOS1hMtNZkF0
	GnGpUjzgHQ3vgLl/vdMc0cDq8mMYMpQG9AjwXB5X5ZJzEUEgucav2dLekhLNYmHH8dfVLKb5YKE
	Dh/+bglHboV1kUQo8Ojy3dTu9EN1GITvaeLbVNX76XnqQHkW0hmrZI/UK5CfSXDhqzBFSOl9huL
	trv4=
X-Google-Smtp-Source: AGHT+IF8U7aHVuqLNukPYI1Z6fbz7kccYaz5TMejDf5NetEDaXPajidIApPI7hCnWhm6BSXxWODHy3+BBqh1rlaFwGs=
X-Received: by 2002:a17:903:2bcc:b0:269:85aa:3776 with SMTP id
 d9443c01a7336-292d3feca86mr22781715ad.11.1761058724495; Tue, 21 Oct 2025
 07:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021071146.2357069-1-fujita.tomonori@gmail.com>
 <20251021071146.2357069-2-fujita.tomonori@gmail.com> <DDNZL452A8JR.K1AA7LHZEXW8@kernel.org>
 <CANiq72m+uAWyRf6y6vAKjCQnwsMqVVGQx3VrHW1yAp4a-5eWew@mail.gmail.com> <54328318-c235-413a-a069-5ea93f1dcb2b@kernel.org>
In-Reply-To: <54328318-c235-413a-a069-5ea93f1dcb2b@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Oct 2025 16:58:31 +0200
X-Gm-Features: AS18NWB0fLmSfGSi59zQ3L8rJftxfYIoazmWWuxcCF_4YjbrFrne7KAPBys4oJA
Message-ID: <CANiq72=eOYk=WM5xfMkHj-REYjedYiYNakVvfto-AUL5E0O8qA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: add udelay() function
To: Danilo Krummrich <dakr@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com, 
	daniel.almeida@collabora.com, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	ojeda@kernel.org, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 4:46=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Given that we'd have a WARN() for any value passed that is > MAX_UDELAY_M=
S, and
> given that WARN() is considered a vulnerability if hit (Greg, please corr=
ect me
> if that's wrong), this would literally become a vulnerability generator. =
:)

Yes, but only if hit in a way that can be triggered by an attacker,
e.g. user actions, not in general.

i.e. that is why I was saying that someone could end up calculating a
delay value based on something e.g. user controlled, and then gets an
edge case wrong, and hits the `WARN()`, which is the "bad case" and a
CVE would be assigned.

A `pr_warn_once!` plus `debug_assert!` (or similar) should be a fine
way for having EB in functions, which is a useful concept without
leaving it UB liek in C nor going with a full `Result`. I can document
that combo.

Cheers,
Miguel
