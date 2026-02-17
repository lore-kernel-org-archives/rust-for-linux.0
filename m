Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3644729AB02
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 20:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771358620; cv=pass; b=cpstOrwdfNCJm/CpiUBWY9jeqlSIZNEhhBqfAnpbuvb+R2vS+43P3FLGPMw9hurA8azBp7SAe4NiD8nXkt7h5KF0ts/pJO95EZHmr2ebyNP/OWFts4cTTPlHSAKbr4O0NPrbrYRJBMGL25NaoC6BOEX6J+a5XN4sC+GDwjwQ0Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771358620; c=relaxed/simple;
	bh=8IGzT1pKK0tMKZWS/9RzMNxACO8Kd0m/tndhws/hoUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=go0LdM4cEPQBqyTG6avD28RuirhCo7jc9gdb7mMDfgHQNMasRc1DHI7+egns2BHW1f04KaKIAMiWtU0SXBMKFSoZM9m9FjaYiw2Ljh8lwsYAOhQBYHiHS0Os8rMwVszXqLcJkDoqIPOlVfjOsy35bnYQx5mkSOEwP/ZeLaU4j5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SRxb4j0j; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SRxb4j0j"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso27375925e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 12:03:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771358618; cv=none;
        d=google.com; s=arc-20240605;
        b=F6W2wtt7nUrhTxrsYmCrW0zqtlyKhg/CaHEDdnFPlWSTGAobUa1uG9TAjHJru0PGdi
         Du5RCHQ3GTm2cokwTHmRbfC6rodQbiRz/lKNr24nIM8lwlCnBjm8zyQxGDGSQcMMT3jr
         09hf5FCfv3K1rYKV30G+DYTI+HLmHkc3TB/SMFiB5ywS1g85q+GEJjpGSo1m2kx6vY2t
         6t9ll7NyJMnCW7zHH3qeLMLaA2/WeZXuAcE9uZWf7kV5chPv6KrCw0aYtexmwko8IJ5Z
         7O4U+vCOoywkHSlPvjRZQCGYoxkr4/xL2TRqrXOgJgdUz9itZ7wt/jPwC1sZCKdRrQp5
         2vwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8IGzT1pKK0tMKZWS/9RzMNxACO8Kd0m/tndhws/hoUQ=;
        fh=qqPhVOycEewRoKseiU829ANuVHqywFOKWQmaN3t65vo=;
        b=T7aCuDuQIfqxEfUbh3eBdvRYjFH2xfZFRIvGDHsM9tjrPuhF2QlO+ONefPlTOE1gMk
         k6oSxRSbp3DgSJKGD8WRJyRoUlTwlgYmF7eZSknqBObOfIhmtQ1HFFdmGROMUAPIw2Sq
         SbRUexwuR8A3T55zWfPUpKcgz/8/ZLWJ0Do3t53UA/ShDvfCRT7EVTpl935kpTD1kAbS
         5mWFQPViAo/qezX22kDnZWM1EhbfAX6NVEH1yNp/328cr0MWtyJTTh49BxlJcePfyABM
         UelPpessEMMhvs2NXJ6pv3Wv+cP6CnEViz+NY2DfRO+hwzHhL5YZq4yYyt5IHjRyS++Z
         1M1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771358618; x=1771963418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IGzT1pKK0tMKZWS/9RzMNxACO8Kd0m/tndhws/hoUQ=;
        b=SRxb4j0j9WoZPeeUqH8rtRqzQurkubEpeCASblUZFLiqfqNCCzkMtdJQpklyaWF+ys
         49V/uxHw8eO6RCQJOQcAB/AZ3JSk9d1tSs44Qt69PXK8+6tsvgHqokfbDYz22SrCMFWv
         X4bA1HmHZ07xEY+xIOV+icifmwi/6Oe1a0FLy58WRQ99YVP4pU815QB87wPd09B4eaXJ
         qhB1MA5JRFEUhJXvFcf5et2tcL9J5njeU8SsXX43VG/VZ0PGBKv/SkZzIHXhsEO6fNC5
         P5MyydFDGIYnPFnGdCOXZAOm6x5cKw7ssHdfBlA17RnuIDdPp6BHomCn02HP4Oof8uYb
         PAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771358618; x=1771963418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8IGzT1pKK0tMKZWS/9RzMNxACO8Kd0m/tndhws/hoUQ=;
        b=ccAYq2H4Gh9KmTjwxVUwKzTYmws/0mFnmozIan9vN0H65ORhiL5tO6muZTfLKZBdwR
         VNBvVfjtHBgGrzDOsf6n2MQ4UucAyJarmwlxsYZuZcy0YgeZhPGHY5M6Nh2yCQovwlKu
         7CZKMeGuCNfUljNrhC38VLTLUIZkIOX+7sUeyBUgiZJCh2ylhzJ3i3+ZoyIzi7HpyFZi
         y1XPPHt97lTW2v1VDgHdE6QItj0bX7BnMFY/Q4FtfU5ymyj49zWaKKMLIem5xInEV6Zj
         cSds10fpQqeL6PDJGYGc4NOXgP7VjIE8ZA/8QkhLfaRvRykPZ8QGX1EaH4HmcjbVO08C
         oTYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCV7TCssdifVR9RU0PZZGplG6uALCtVx9OsbZ2T7kJtbpxtaok7uB0MO1c6BTefj+Cqap5GtJyUgaSjKj36g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYf7J5um9QMFBVNhTJ034/eOvJ76yumY0gd+COmo7+ERLE6WFn
	7y1D6PJEU4dc3egALcpTVsmh5wsalij72czkPMzJc5TGIXH11Y+kvUIQdxFH3JV/NCti1/zDyZL
	mtpc8lFJgC/efczbPj+ymZzWakZWnIviKazzy/TSo
X-Gm-Gg: AZuq6aLS3hxBzqzxwsJTrFUooqWXmBVrPUU5QTU9bE/OmGObFQ1TDrlsIWON9hJYvHx
	mP3rLzYZaC3pl40Vmr4KT4kwksIqfmYjAdfto7RSxWMGwCQ+ofLovimriryl8wZo8JqK21nGW7Q
	87PRIprDKxH3FGtbM7vv/F7Su/gzMYg0iOoign2tBYccYm71mM22y8Bh4oJA51AVZzCh1dgboe0
	aerSO52bKdX7d8acAQNniUklnvgR5phDRYlpZi9ndkFe3e4A0sPwAmn6wDZNqRZu6A4Xc0nDQWJ
	AvDhvJ+hANfSki4/2FsrFiyvxPPbVQb7yoqt+g==
X-Received: by 2002:a05:600c:4fcf:b0:483:6f82:9723 with SMTP id
 5b1f17b1804b1-48371043085mr263576225e9.4.1771358617090; Tue, 17 Feb 2026
 12:03:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217-binder-vma-check-v1-0-1a2b37f7b762@google.com>
 <20260217-binder-vma-check-v1-2-1a2b37f7b762@google.com> <CAG48ez2O=_Hd7EjjLSAh36xtOMyX5MZ47xodWkU3FyEar63TnQ@mail.gmail.com>
In-Reply-To: <CAG48ez2O=_Hd7EjjLSAh36xtOMyX5MZ47xodWkU3FyEar63TnQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 17 Feb 2026 21:03:25 +0100
X-Gm-Features: AaiRm53OywEZ-9snmQAwJUPw_yVph9JnQVbkwj0vQh6FVln0Kgy98BO_f8V9K3Q
Message-ID: <CAH5fLgiM3+2URibfBNQr5X80bKvZnwA_tBjHpE-d_FHye7w1ug@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust_binder: avoid reading the written value in
 offsets array
To: Jann Horn <jannh@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 5:35=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Tue, Feb 17, 2026 at 3:22=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> > When sending a transaction, its offsets array is first copied into the
> > target proc's vma, and then the values are read back from there. This i=
s
> > normally fine because the vma is a read-only mapping, so the target
> > process cannot change the value under us.
> >
> > However, if the target process somehow gains the ability to write to it=
s
> > own vma, it could change the offset before it's read back, causing the
> > kernel to misinterpret what the sender meant. If the sender happens to
> > send a payload with a specific shape, this could in the worst case lead
> > to the receiver being able to privilege escalate into the sender.
> >
> > The intent is that gaining the ability to change the read-only vma of
> > your own process should not be exploitable, so remove this TOCTOU read
> > even though it's unexploitable without another Binder bug.
>
> With this, the only remaining read from the ShrinkablePageRange is in
> AllocationView::cleanup_object(), correct? If I understand correctly,
> that is fine because it can only drop references on handles (which
> userspace could equivalently do via BC_RELEASE/BC_DECREFS) and on
> binders (which would probably also have its influence limited to the
> process)?

Yeah, that's the idea.

Alice
