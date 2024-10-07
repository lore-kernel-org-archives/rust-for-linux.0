Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BC918BBB7
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Oct 2024 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728290500; cv=none; b=SD/BsOnWBOlqaRYUl3V+0iRgtk41lpvRQ1eRZ94vfgB4frsdtcyMXTJv5l4Qeh1z6mUUJ/LxjuTWHUK/epzGyM6HiN9aBiSCg0KD5M96y+/Zm8NWYtXrdfvNZZ1p0KVDscfEm6OCnRSHSbB1HTRlJtK74YaMiiC+zogehVDkq6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728290500; c=relaxed/simple;
	bh=lZq9penah7gAuMo7VonFN6z7LH5CuCz+KTWzrVG0Kkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pk/qyoSFW4SuZEMNsYQ4HMxhug+YplcLV2eugwXXcqZyK02NWlEo60GQN904FB30saHk+7bdxLcR2HaFsnGQUSMubttswEKZY50Ej0T6EqutngXsEISSgkofTNBGarwk5QBBttuLCsgNt7qqACLQzCMMUBk5Uxbw9tke2ayNNz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3hM/k9lL; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3hM/k9lL"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37cd8a5aac9so2164032f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Oct 2024 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728290496; x=1728895296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZq9penah7gAuMo7VonFN6z7LH5CuCz+KTWzrVG0Kkg=;
        b=3hM/k9lLi4Lrhjpkdhvk7bALNKUdSPjDlAyaNHCY+7KAAW1qvf5B0sKPhZVU+qlHzY
         /TgWNSeETECbzwLv/CqLDctjwyjpub6v90FzdFa/8+pHCH8mP46bLsuqelOYdAbBEgUE
         zLVt9wXC/k/80SRkGiOiEGca2M8w4/pmhss9JCkd2RNEPSJjaD3HmzW33yWQ1KISeiBJ
         /y4Kw5KcH/p9MUny7MAzjm8RswvrJrmliOiUF/415+fBDE2qtXSJryXm1uxUsCTqflll
         9kpM+x6THpwe0t7En1MWDG4qGVhpxwRFmrxRoxD8pdj1RNBr9UzYM9dIsRiNGCc1G9oA
         PwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728290496; x=1728895296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZq9penah7gAuMo7VonFN6z7LH5CuCz+KTWzrVG0Kkg=;
        b=v/COPPldFP5ufh5J4l+tSyCzB6w3AGaW92OI43iytGYQI3G4ipm/XGlVntXdt9EQT9
         arc9vYFd2XTm41h+scdepJ8QzHRXyuMCCa2JT1XurqXLOfNdRKfc3yTVED86e4d55VSW
         ggG1lSAJwL6jSQ80GDdwGEAyBapjSozy5H0Q+uxoYDvpLCmhMB+ff8Oj7Cc6oKULcZSw
         EShodBg2QvCnBfLqLEfg+3QoO2DpiyFohyVfuHiy/7xvUdDg1oYdKK2e+A42yKsxqIo6
         bpx1FqSlxuqEJ9vwFgpD0nte9jIbtUcPV3mOZ34HC584WaAtjMinWaRw2eNnIa2qdNVZ
         XGBA==
X-Forwarded-Encrypted: i=1; AJvYcCXNFMcWuTqm//UGddzWbXJckhVvGIsjqyT+T7/ZMgQ4Agmzd3mNKqASvqV+CbLeIyh15EEzL1rMSJ6kkpepYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD8uPP8TACbl6vOohPkxb7Rfv+BbO4sFQKiG4WpJtbIEkevmjb
	8pQtO8CuVbHFYBlGuuFYV0xXLH0JXL7YWzVu4B9fftqlfh8uuzUlP+hy0kf9ZyurVcDuOyRZPdA
	+u82rMIFI5yma6SEY7uBDqIdDtLFUwP25BzPQ
X-Google-Smtp-Source: AGHT+IGTRgHCCYQ9wvmh2HAydK1cwGiHD4ib1IG2CJRk6JiPA1BuIRNRo/7C2CaH7YWebj5QH1G8ucz5efiqpGwNw7o=
X-Received: by 2002:a5d:6149:0:b0:37c:cd71:2ba2 with SMTP id
 ffacd0b85a97d-37d0e7bcdf8mr5314481f8f.38.1728290496403; Mon, 07 Oct 2024
 01:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005122531.20298-1-fujita.tomonori@gmail.com>
 <20241005122531.20298-2-fujita.tomonori@gmail.com> <3D24A2BA-E6CC-4B82-95EF-DE341C7C665B@kloenk.dev>
 <20241007.143707.787219256158321665.fujita.tomonori@gmail.com>
In-Reply-To: <20241007.143707.787219256158321665.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Oct 2024 10:41:23 +0200
Message-ID: <CAH5fLgirPLNMXnqJBuGhpuoj+s32FAS=e3MGgpoeSbkfxxjjLQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/6] rust: time: Implement PartialEq and
 PartialOrd for Ktime
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: finn@kloenk.dev, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	andrew@lunn.ch, hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, anna-maria@linutronix.de, 
	frederic@kernel.org, tglx@linutronix.de, arnd@arndb.de, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 7:37=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Sun, 06 Oct 2024 12:28:59 +0200
> Fiona Behrens <finn@kloenk.dev> wrote:
>
> >> Implement PartialEq and PartialOrd trait for Ktime by using C's
> >> ktime_compare function so two Ktime instances can be compared to
> >> determine whether a timeout is met or not.
> >
> > Why is this only PartialEq/PartialOrd? Could we either document why or =
implement Eq/Ord as well?
>
> Because what we need to do is comparing two Ktime instances so we
> don't need them?

When you implement PartialEq without Eq, you are telling the reader
that this is a weird type such as floats where there exists values
that are not equal to themselves. That's not the case here, so don't
confuse the reader by leaving out `Eq`.

Alice
