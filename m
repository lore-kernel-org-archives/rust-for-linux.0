Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3146D165F02
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Sep 2024 16:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725899839; cv=none; b=XoAsewCvh3quPJHqvEO9ysp6jbZhe2aCyFD1Mpia3uzDMdgDsW7GNNUmCEvOMHVmnC5saFplW9r1FBPftcm8T6pEs+t2b1GnCYecYXL5s0P8LJ9P8Q2gjxkq2+VeWVsgP2tMluCLyyO2/yoD3l6tzXbPDXjQLSfx5iHeTlBF7aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725899839; c=relaxed/simple;
	bh=Vor9A51MY4LbHBQym1omjXXtWBlRMHBeYzCg0Ctn6GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDcr9FTaDbjkYk51r1OqGkPY5urdrIkIGsSmVjNnZZ0tlQYEq57kYz48BF4M7Ci7PRlRCdDXavGCrpaZNIFa1bs31FfFszClhuoMhpjUa0Blyn3L7kvUiLclxMrnkDUDOVvc0kyiA4+gjb5/iVWDYe9qNDCapb4G4d/e4NNO3Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HyMk5ex8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HyMk5ex8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374cacf18b1so2667572f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Sep 2024 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725899836; x=1726504636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVb7FZalp+hymwW1x9wgZGuiq1blreq92SNrbnhzt/U=;
        b=HyMk5ex8ajDB02NENOTjzqHs6Q87jKZQHT/TsJsGbjSjx+fcVy/wSoRv0pM0LzgoIe
         Zftjt+EFR9hfpTHdxG23nM64LdlC166ccGN+XKoe5Ehlpgmux2CmYGqZf9bkAElx+u7h
         OC+Fjo2Ki20yIMaOLZ8FwVB5OtH/ZwEJL7OOf7fI0SQECcTPyVljCaTNbCLgKHBB2wLT
         jeYZxafML4M5ap1/99RmvoT+RaVHsEryZab00PjxhX+RbMbS9PVF8sm74NaTw5UPWAQG
         coAmlAMmw70B7daoPIMCXubUbKKDOAr4PENt5yYDL7c7V29vskeGpcakMSQfUEkn1ex4
         eOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725899836; x=1726504636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVb7FZalp+hymwW1x9wgZGuiq1blreq92SNrbnhzt/U=;
        b=BM9YlasaWElf9VI2e1oEybonF5XKndbvctgeLu+/xbdVg/RUEZ6r2UHAnlqscymHaa
         EaU6z4Tq3oTJJ3Cgj2Dm+wrrV/ZGV9xTEoonJ5Maqop/1B2fKGyVpC0IG2Vws0869caU
         Iwo2LeQOhh/D4JJW5hLvL5J7DOhtFtRtSgI1iwNygFnNH20HwP+YuCGvA9EDFEsCNh9y
         K6M3DTDQjKN6IlSnKmxtd9YVezKpo+ZTo3hCnY7oK3ECo9zQgCZRIq0GdYCueV1sEZGi
         96+vxLjMffqt1BbXuKkUozEL5J+8C5HpB8V8OQj7A8YqWK+9r1E+PyIpVrjapw2Om7tl
         3nfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH5/DBZ5t+gpECO8IEKiDyuJeRhkwNwC1CmRnir8uOzaKLUpv/jQ+ngR5M1Oqb13EviMxci6Ev51yZR0WA/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo7vnZAVULZWwQ2kOIAc1c7qVLCIfs3BQTAVmpK2ihQ5bzAOkX
	MpdLtXv65DVmRLegonj+/od9jMmHlCxLLNkCMvDK9VWTQ2KbiUrKzCol6fFyzq7bZ7PPnERbLGS
	XfbWarapj3ads18MaVxiKYPmOLGDgkTQQaGty
X-Google-Smtp-Source: AGHT+IFqGpX0VmbgWSC7nk1slW1l+OrKUWEzp/PMlH2GO3N0F90G8DHQsjE9OjeSQ5wBmNMyvA/uZ9VRq3o5WHdPitE=
X-Received: by 2002:a05:6000:d8d:b0:374:c4e2:3ca7 with SMTP id
 ffacd0b85a97d-378926858a7mr5320757f8f.5.1725899836155; Mon, 09 Sep 2024
 09:37:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905-rust-lockdep-v1-1-d2c9c21aa8b2@gmail.com>
In-Reply-To: <20240905-rust-lockdep-v1-1-d2c9c21aa8b2@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 9 Sep 2024 18:37:04 +0200
Message-ID: <CAH5fLgj6aCNxXfANt-0duhMfujQdOip9AjtX5yRraXQ5QaDReA@mail.gmail.com>
Subject: Re: [PATCH RFC] rust: lockdep: Use Pin for all LockClassKey usages
To: levymitchell0@gmail.com
Cc: Andreas Hindborg <a.hindborg@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 1:13=E2=80=AFAM Mitchell Levy via B4 Relay
<devnull+levymitchell0.gmail.com@kernel.org> wrote:
>
> From: Mitchell Levy <levymitchell0@gmail.com>
>
> The current LockClassKey API has soundness issues related to the use of
> dynamically allocated LockClassKeys. In particular, these keys can be
> used without being registered and don't have address stability.
>
> This fixes the issue by using Pin<&LockClassKey> and properly
> registering/deregistering the keys on init/drop.
>
> Link: https://lore.kernel.org/rust-for-linux/20240815074519.2684107-1-nmi=
@metaspace.dk/
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> ---
> This change is based on applying the linked patch to the top of
> rust-next.
>
> I'm sending this as an RFC because I'm not sure that using
> Pin<&'static LockClassKey> is appropriate as the parameter for, e.g.,
> Work::new. This should preclude using dynamically allocated
> LockClassKeys here, which might not be desirable. Unfortunately, using
> Pin<&'a LockClassKey> creates other headaches as the compiler then
> requires that T and PinImpl<Self> be bounded by 'a, which also seems
> undesirable. I would be especially interested in feedback/ideas along
> these lines.

I think what should happen here is split this into two commits:

1. Get rid of LockClassKey::new so that the only constructor is the
`static_lock_class!` macro. Backport this change to stable kernels.
2. Everything else you have as-is.

Everything that takes a lock class key right now takes it by &'static
so they technically don't need to be wrapped in Pin (see
Pin::static_ref), but I don't mind making this change to pave the way
for LockClassKeys that don't live forever in the future.

The patch *does* introduce the ability to create LockClassKeys, but
they're only usable if they are leaked.

Alice

> -        T: WorkItem<ID>,
> +        T: WorkItem<ID>

Spurious change?
