Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544A8195
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Sep 2024 11:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725363101; cv=none; b=PaDV0SitYmNdwtZdzAHr6tpKx3oLXnvxwK0A4caKANhepFJUV9r4tQSQTR/Vlbl70ctAPo1UMOD9O04+tNgTuEusRVdrbRxikdCFgZmV87JwTwU7btCl/AoUgVYtZXN1puYjb4LN19sRrOb63u5GHEq2bm8Tnm7e2kmAJSwOmQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725363101; c=relaxed/simple;
	bh=qsjcn1tKB6e1zBjRyJwbtyxU18n6uv/HHYFBuu9TaDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g09/2yfGQA2rbmxGaa9R0xkzHJVuQt45zMeVHjjKRqXNmX/4hW8K1FMtqWhYq1e5RS6xMgZ4NJ5/m5f9XRjW+u6G7Lx0MIxXvh6C0ySqsR7bZSJQwfK4Zr7kPBKzfYZbteEk3WZ8BTkHnZGnsmI8ZFBms/QOuCj1K0acdW3ppIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fwd+fPxT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fwd+fPxT"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-374c0a8c7a9so1922767f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Sep 2024 04:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725363099; x=1725967899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsjcn1tKB6e1zBjRyJwbtyxU18n6uv/HHYFBuu9TaDc=;
        b=Fwd+fPxTDOgjapAXPppRoZVCJp2LaADsl+Rwz7xWAWW21LKGg1Z6G8rjKnmmayJff5
         ZSQDt9pFTw7iEGp8tWmF8gK/H10h4kthfmmhtIBD8u0mSr3MuqAxRMZKqzqV2g+EKjHC
         WB6agbCemd3Dr7X3Togx85FfXcItSkrmt+VerKsmoytgnJX6Xm+jeZDTYu+TgTqzNfsD
         BbkafCmk22eFYfnZTGByuI67sTzatjVugYBEtdK2WisK1mhmKXC7KMX+xeMIe+7xFXhz
         QM6l461FyLMEL8HaA2aItNEEtPL0ybWOyvEtj7rwifgG6m4dQ6ZbdbizLW/4xthz6SaA
         sKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725363099; x=1725967899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsjcn1tKB6e1zBjRyJwbtyxU18n6uv/HHYFBuu9TaDc=;
        b=cw7dxNMvSHwl/1gW9NLJmFOw2syTuTOVURxtCxPH5mlRn/sKrsEyOo2BLJhjgyu+P2
         /tCUCGSaLO7yjgki85AZYaJ2Wa5oyVVsQ2J1lLWibQEkwz3ATV4lYVxgjDo8YFTnj53m
         DBxyWWghEd+nAlnI7thCDJnl5BBTqESKqExLykGD567V1xp9dvuyiJ6MNOXXz5pRyTMJ
         5VB8b0jdqMziMohySxFGcX5UONU5v7dJ+1VemUybFng5PH+HsV1uo81jRFOMeJTSvbEw
         i9UB4/T8N/h5H6dQqc0CeRdUJoj+ppRUu2HzM4lOQssMcKRU1H1idRaR3SPVa+4Pp/VY
         ix+w==
X-Forwarded-Encrypted: i=1; AJvYcCVKas0KEDoRngHRZCNWWDyYTPL4fSn3lQg5MKFpTX7qH8Ed8C0qCKbeTxkGLDIUVjN3Xf4WXLOJ55dhmnHhIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5IYPihyn454Ud4C6kmQDblD3lUMS+KTYySjlF1YmCrMx1d8TM
	FS5fka6B+u2tdBgDY5r2TL7lDjXzY+4LikWFleZQ2KBQCsGAwyn/w/9Cb6Q8KxbIlx920tPnT0Z
	gA3x5bXs5gujAQFhJtRPOaGvm3uqAa3wQSBSC
X-Google-Smtp-Source: AGHT+IEaThavlAXYAaELQyLlGLHSJ3E+td/aLmWG7YfQepbn/Gc1yG+xLqcfKkRIWc6/8gSi80xDwbDOFOafNdN5Mbg=
X-Received: by 2002:a5d:5e11:0:b0:376:75fc:3a50 with SMTP id
 ffacd0b85a97d-37675fc3ce3mr869340f8f.55.1725363098364; Tue, 03 Sep 2024
 04:31:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903091700.172734-1-benno.lossin@proton.me>
 <CAH5fLgihM6OeuVrAhSXAqb9RDKBa8p7+EOsFuuqkGu-OzoapZw@mail.gmail.com> <c86fdb23-497c-4f5e-9dc3-1683fb494dc5@proton.me>
In-Reply-To: <c86fdb23-497c-4f5e-9dc3-1683fb494dc5@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 3 Sep 2024 13:31:25 +0200
Message-ID: <CAH5fLgh7Jpi3XfZMZ15MxCiRX-+QbrJZst+SpjeSx2aK0dwm0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: sync: require `Send` and `Sync` for `Backend::State`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 11:58=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 03.09.24 11:30, Alice Ryhl wrote:
> > On Tue, Sep 3, 2024 at 11:17=E2=80=AFAM Benno Lossin <benno.lossin@prot=
on.me> wrote:
> >>
> >> `Lock<T, B>` implements `Send` and `Sync` when `T` is `Send` or `Sync`
> >> respectively. Since this does not depend on `B`, creating a `Lock` tha=
t
> >> is `Send` and `Sync`, but with a `!Sync` or `!Send` state is possible.
> >> This is a soundness issue, thus add the bounds to the respective impls=
.
> >>
> >> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> >
> > Currently, B::State is set directly to `bindings::spinlock_t` or
> > `bindings::mutex` and these types are pretty unlikely to be Send/Sync
> > on all kernel configurations. If you're going to make this change, you
> > will need to change these types.
>
> Oh yeah you are correct. I did try to compile it, but maybe I missed
> some config options, since it didn't complain?

My guess is that it only happens with lockdep enabled.

Alice
