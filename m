Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFAB3587B2
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150365; cv=none; b=uNaIZQZEUXo4PtnLOEW3O0jf1pmbPRpStCxo/gksJtF4uDCczI1ltsFcrT7WHdDxrqUeZo94ItFD7vwaGuY1VzWWFXIEayW5aH6evzLH5z82Q/J5uN/RhTr8ig0/FZFZmcyZtOen+FysiSI3/uA/fDG67t6kpVJv13Ev6tBjTFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150365; c=relaxed/simple;
	bh=gIw1kriFuplFJlOu4lyyAKijl5rEMdkuXjxlFUcX/H0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eIL7/g12NFoLY+MSOo1AGUUeb5Ia3Pywl959L4ZYv0ZoA1DAAsI1aWHUEA4VH/NrQ8sbfNgMYFlp3BwRTo0o0cOD+fiah8fUjThkSV5b7sr6+UBPvGoTRgE5N4nZ0xRBnevPOwAyynqmndXCHXDQctLZp8IYEZGlUc5SWLUEWWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LmHf6n1o; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LmHf6n1o"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63c44ea68f6so13102a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 09:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761150362; x=1761755162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIw1kriFuplFJlOu4lyyAKijl5rEMdkuXjxlFUcX/H0=;
        b=LmHf6n1ofLAjq8HgFzzJBvd5LqVEikKJdlTMHoz69g2WAJZAZvMxUwh5URrt74XG96
         rmc5c7RMF7O4qweeUq5/p7zVP7XdmFO74WjqiWX8MsY4Bpg7FTuq3VWpt0VAdtr9tQbr
         sAsSxzo7hsXK2fOZ6cCp3R0P/kzrk5k4qr8MqJoFvs2vFWV/f4dXzEvHDJ7/XBbnplcC
         J0055dbo+jBOGV/K8cRD70lzQ9GNU5j0KOO6TtSAboqk/s3bLPrztk9TuVODXGUGvIso
         jey5EhsM+/XOx6xoV/axU4CKr1Qjt+S1GqLTncalj7aDMCLEjo4/5NMiks8T/8dycdT9
         5BBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761150362; x=1761755162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIw1kriFuplFJlOu4lyyAKijl5rEMdkuXjxlFUcX/H0=;
        b=PLAdj0rIYBttyAMZnMblExtQ2BYM2K7YyZG9d/Udknrb41J2dQQqAHuHApZ0niN8xj
         DoxDI9ZrhuAmCb3jHv5Aio506iOtL9hKqsu14CEzyuNqVigYmHwHJFxVkxk3hsLt4EzG
         lKz9dvbQmpbVMNkk1hG36jo3r87zMmbPWVGJRyZBDxikOAXPTKJeKjqwWFlZYh41vBhL
         s2oWSl6Ymb5lKKpIvLsOVqu/XZxetynPi8QNTg32VDse1sOSrvaw2MNq95cQioEK/Jzs
         p9YTrRxrnHbXvOKXdsJaBdYRcWxeOYkIvinzC/a27lPrKPk50iTd1HctqlTIUW1sWHA/
         MT5g==
X-Gm-Message-State: AOJu0YyEnYimWxVvAVos8xaRsAwmnAN26lB5OsNYa6tXsWljq/enXX20
	WruO+j+FGBmB0F7v9uC1IYGxUtm2jxQtr8PIlMTIj6bz16TLX4bko9EUCswy+qxHCxThiYw/bsO
	hQgvCEDk5YDDXMIeeHzVwV0+U7IpMc0QqEa5TXYV2
X-Gm-Gg: ASbGncsn0gnjxzxd525hBhZ+UYzghqyTroMTMTbq19m23z04eWXhBBx05Ew4Ib17ueZ
	YJAp0fvrbgT1ruNxDVQYGYUKrD6LEz9diTq74nXkkJw0RMaMMi7vxM3i6ffEgRyvkNFVNqXCqbS
	k/TwGyiqo4nv163dXkKL8/5yFfQSddtoLQ+7FMfOo5u6okC515uP+wGtK6LfarZ7/CYtr2vIu3w
	TMMsuGWzwQD3w0FvZREdDU7EhpwiaY2wLkbc8hQD+nc8nKi632c3TRQxgQ+FgxmrVFz/VuCvOLc
	NMTXK6GlZ77PVpw=
X-Google-Smtp-Source: AGHT+IEkvw6aGBiyj17QM5779QXlZYvCVowncplpH/uSCnE1bqWGQ2ML0a40foJQ2EvGykJFnPbW/Xu6ziwwDK3dt1A=
X-Received: by 2002:a05:6402:14c4:b0:63c:4ca6:605d with SMTP id
 4fb4d7f45d1cf-63e1d983a91mr47142a12.1.1761150361564; Wed, 22 Oct 2025
 09:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022035324.70785-1-boqun.feng@gmail.com> <20251022035324.70785-4-boqun.feng@gmail.com>
In-Reply-To: <20251022035324.70785-4-boqun.feng@gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 22 Oct 2025 09:25:50 -0700
X-Gm-Features: AS18NWBnbWpnEFlfGFR8ot6NPG7P_TnmbfK-bFy8u2QTY8SZZlNCsPcjGEOE11Y
Message-ID: <CAGSQo039P_FK_D_dOr_5t8C6DOQPBKu_WamqLQijqfcT-gsFqg@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: debugfs: Replace the usage of Rust native atomics
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 8:53=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Rust native atomics are not allowed to use in kernel due to the mismatch
> of memory model with Linux kernel memory model, hence remove the usage
> of Rust native atomics in debufs.
>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Reviewed-by: Matthew Maurer <mmaurer@google.com>
