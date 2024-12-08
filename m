Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A30B1DA23
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 22:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733695775; cv=none; b=BJKSWHIkgJISag6GsIa7lILf0cPGrM9VtAqWppoyLHwg5CZcri7Rrd25qG8kxCUWuHC0EQIOkHF2T9j1u6HEgO4tJgr/EGVqo/o+axxXbwltJ11R29pJCVM5CPaW4+uQVLjFhxuSfAuvZ9rr4JKal/Z5rc0BLBUB+qyywqaU7aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733695775; c=relaxed/simple;
	bh=g5jeksqc3s7ldsiw5Jkao4jxSZn15T8aYztzDktqnCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uH9FjWm+bBQXTLYUI5+0EWiUlOZ98Nh1C0tXP150xVw/Jp4JmyM4qxzQ5brLp84tpU1C8TTdw0L44Hdm6A7BPXxoOaTMbbjfUdOmyImfi9pnwnG4/+OXkCeqFjCG/kOIPFxmvpYo5tDDZSc0gpU06efNayPU+LH1hPTOMAvebq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NytbSLAd; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NytbSLAd"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ef60e500d7so23458757b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 14:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733695773; x=1734300573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5jeksqc3s7ldsiw5Jkao4jxSZn15T8aYztzDktqnCI=;
        b=NytbSLAdgyJqGr/zGCPwOkdFbo9rQyzR9OFjXv6ItvHvIY1bEvJRokA1xnf52KnbAH
         M6TAv4gzJgKsn7kfw8yMBqYjKLzLnABv1yHrZQ5aukFRZppuWiRNBPejQ9PmvYrKNXlv
         wXfWXO8uwgUdaivOW3FCob0ni8+6+6T4eODrZ2qHEB1NF7MOaYio4LNBnKQ49v/5QOJg
         1a8SAMWcxbkBkbBeWMSZul9myBoTYou/JJhzXNafxP3hFCbDl/R8duRDyZLhRE1ORSFm
         A6erZruJlmeWXcpoPHhYKHgQcuB635mPY10f67ygnaV90AvRrus5a0iWNTn7AdFafvLa
         rAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733695773; x=1734300573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5jeksqc3s7ldsiw5Jkao4jxSZn15T8aYztzDktqnCI=;
        b=ZuNndLeVdMYiEFWcz2Sp8e6sJReZWrqGiCL0Tbfb0CGv/3nDBcP+or530D3B2kyo9U
         hg6CvfWV1nr4n244jz4ghwRQ3+cy9d7SnaEAsxQrLE9t+Y4L8L25EeY7PCxZ+gdqBXAK
         S4ZC1WxPc+eNYg7YYN0CHljAoeaPD0BmMD3Al/ueW5gO4J/L6mwhngso+zplApAyi31O
         IKc+CYqmCKquYv/5VAbL+eEdOGcTcaFb1rEDZSdkp5vuZwzhigvICw7KrhuSVRT/6ffa
         MEJwDeBgd582AnOWcal9eOeZLlUnMZcFEcCc/75RFybqpfc3ttXYRTTsiJdbNDKpY9K4
         4LEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWifjJnSvt0TIyW6w5Y4g1B0bBjsu5/zmHu17dAlQdf4yP9nVC0LZ7wS93l5tj1tg0VVp9KzUc8H+e5OBjlDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4HkCuwCB3lc/HPUV3vLYtXl3wgWkByos+MyQsodfswePybrxV
	RL2VbafhP6Ka5L9MGv+2uTrxfRvBblyiG/qEQCq5ulDaiW/XZiG/hRsXcQvhQiD7IwtcOVCL/vf
	kVDFFQ7iGdoQN7fnhNMPvL099VLw=
X-Gm-Gg: ASbGncvgULauTo532mJ5htlOXoX/j5Gg5AzDxOlbbJYUJQAXLdFGwG+FelQ3l9m0STT
	64CiavGTVOx4cZ9lsNa4bslEG5CeDeLA=
X-Google-Smtp-Source: AGHT+IFs0qZDkZSV7wzbCTEnjASucEtBDTgzIFDF2ogrm63AWZl9r5MqVxJQLMvisn2AsZuB0JwDBdsPPjLjNhWqG4s=
X-Received: by 2002:a05:690c:6102:b0:6ef:9dbe:9f82 with SMTP id
 00721157ae682-6efe3c6048fmr94140637b3.29.1733695772949; Sun, 08 Dec 2024
 14:09:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z1X7ZO0wd5XEFFvC@tardis.local> <20241208205018.52930-1-dev.json2@gmail.com>
 <CAJ-ks9k-b01ohLZDARpxx+s+cOFYqpfojOgU_0Pdp_0-MO_QiA@mail.gmail.com>
In-Reply-To: <CAJ-ks9k-b01ohLZDARpxx+s+cOFYqpfojOgU_0Pdp_0-MO_QiA@mail.gmail.com>
From: jos <dev.json2@gmail.com>
Date: Sun, 8 Dec 2024 14:09:22 -0800
Message-ID: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: add #[must_use] to Lock::try_lock
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <alice@ryhl.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I may be misunderstanding what you are trying to say, but the guard is
> created, and the lock is acquired.

Apologizes, I had a misunderstanding of the macro that was being used.
Thank you Boqun and Miguel for providing clarity, much appreciated!

> It'd be great to mention in this message (and perhaps in the code)
> that the reason this annotation is necessary is that `Option<T>` is
> not `#[must_use]` regardless of `T` being `#[must_use]`. It might also
> be handy to leave a breadcrumb pointing to
> https://github.com/rust-lang/rust/issues/71368.

Sure I can do that, thank you for the suggestion!

Thanks,
Jason


On Sun, Dec 8, 2024 at 1:58=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Sun, Dec 8, 2024 at 3:50=E2=80=AFPM Jason Devers <dev.json2@gmail.com>=
 wrote:
> >
> > The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
> > currently does not issue a warning if the return value is unused.
> > To avoid potential bugs, the `#[must_use]` annotation is added to ensur=
e proper usage.
>
> It'd be great to mention in this message (and perhaps in the code)
> that the reason this annotation is necessary is that `Option<T>` is
> not `#[must_use]` regardless of `T` being `#[must_use]`. It might also
> be handy to leave a breadcrumb pointing to
> https://github.com/rust-lang/rust/issues/71368.
