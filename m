Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBFF142E86
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Nov 2024 09:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730885201; cv=none; b=CegfmDHP3XxFRF+6uAyuwtTlJiQd+z3IEjTcr07kuxT2cdrRkSdZAf5xRLO4npH+Lc90e8eerK5m5mcCsTizLCK9mvd5O2d8AuZGFWm5wP9iGCljyPorabAwYiUunig7ki/A++a1LjGw0Yd6rzSIFOwo5/QZP/UxqTZQtIIWNxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730885201; c=relaxed/simple;
	bh=TunAs1T2tgk2hY15Y5XgcyfzIFZNA9/+E/VtQi9agB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QyRMmlh3h1Cw9eD+bl+klypOVSQzJcyiiCWu/YnAE+Vfdk5LefzO8B4tfVpbIDgEesBSGgxcJ+JIQ4CUSFPl3ghgKwQALwrfLEKhF9lmDJoYalG9fPPSHJtwVdy/LKAxshm4Tz7G8nJnnyFSPwH6wXuD8VpfQKAvR3RAidLevRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lc1N6VvX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lc1N6VvX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315eac969aso3624465e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 06 Nov 2024 01:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730885198; x=1731489998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TunAs1T2tgk2hY15Y5XgcyfzIFZNA9/+E/VtQi9agB0=;
        b=Lc1N6VvX5Nu/HQPZbfv0YqtDQVIYewrubASrXChESsgf0h6tR6riDmZfMlc+d1sJOA
         KWJY/oCwEJMeqAlHQv4rhtPRxZFAgvQgN+OBv5NDPjX4l9lctb/NI9WIzd4pAUnRSUiq
         +aSiaDnKObbzhBupBUnOz/IchB/irzx3chRF2QZRJVfP2wj4zQK3RXeckAX0mhweA1GI
         TYxWA7j4dLsXZ0dSIHpfGKshmMpe5nxC8yaTrg56Whr1AhxCZSZuLTe1/4geDuNgfHy7
         sen3/JD8iWIv1EyTE9gpbY8LM4U5qSadCTiI2//VKFrhjJu/qublTb9ZgAqp88C7wf3X
         jzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730885198; x=1731489998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TunAs1T2tgk2hY15Y5XgcyfzIFZNA9/+E/VtQi9agB0=;
        b=b9DKKh4b5Qc1mF539aBchjOXozLqbr1NkXRjoNBEc8pkf3b2eQgThIlwsf5WteeX6z
         DC6ZhN/F6OZiAbSeHM119YeEYsrhqbg5M8+q/1khWOJI3loqYYJKggpZ0zcMHaoK7NRM
         w4zsRDtWC5CgQ8PbmPlb8o5RIvf+lBmbA3RgqpZXZSlgzeN9Sk+VAMO81pQMN22zQlaB
         beVT9RKRoTE+8y+1LSx8WC3zsXjLWpKlqD7CXqMy//phRkm/SfJlZ/wHjK+o6w7Iy5uA
         TGHQm/5Hqcm4mFVeZJwT0rvpLpgZtk5LmYTz/Bq4D/BYbCZEcFjrv/YwbF9e+41PCvcD
         Vn4g==
X-Forwarded-Encrypted: i=1; AJvYcCWg7wyQnoJ+OlY5fdzPbnRRR9DnIZ67U16UuWIpeVG79HUfqSXKr/7G0Zq60QF9TdgZqRTXi10CErvXeSPTnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOXLw1OVAuliFuaNLEKIDJs690QyQUMEWVVPPTmX1vkqRDpona
	I3V3OHeiiVfIIZLxkfP7IhICgevZhIa71jmNo2FscoVKoDAggGEiuZe95UcaYZghOGWGpmDUHGG
	W5Fdhj8D03Kbnd6rDITf0MlXcWBG9kKbQyync
X-Google-Smtp-Source: AGHT+IGplkY/eZoHgEhP9lHLNzRc0r7VwTup0qtkfO1lfCQnZZdby7BFstha7qnAZwAHFo4rV2ibu3S2ZDM8cYFMc6o=
X-Received: by 2002:a05:600c:3c96:b0:431:57cf:f13d with SMTP id
 5b1f17b1804b1-432a9a7567fmr15059335e9.3.1730885197725; Wed, 06 Nov 2024
 01:26:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104-simplify-arc-v1-1-a4ffc290f905@gmail.com>
 <ZylNvC8enwPG4IQ4@Boquns-Mac-mini.local> <CANiq72nQ6b1wO6i6zWW6ZWeQFN4SJVB28b216FDU70KmtCbaxA@mail.gmail.com>
 <CAJ-ks9=xW_WWZXB0CbDvU-3otkYs-TY+PSYeiPyidM58QujC3g@mail.gmail.com>
In-Reply-To: <CAJ-ks9=xW_WWZXB0CbDvU-3otkYs-TY+PSYeiPyidM58QujC3g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 6 Nov 2024 10:26:26 +0100
Message-ID: <CAH5fLgjXXE32k2VuC9yGrNG7ib5vo7V+fsvRxWG0ijopK7MDCQ@mail.gmail.com>
Subject: Re: [PATCH] rust: arc: remove unused PhantomData
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 9:13=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Tue, Nov 5, 2024 at 8:29=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Mon, Nov 4, 2024 at 11:42=E2=80=AFPM Boqun Feng <boqun.feng@gmail.co=
m> wrote:
> > >
> > > I believe we need this `PhantomData` to inform drop chec [1] that the
> > > drop of `Arc` may result into the drop of an `ArcInner<T>`. Rust std
> > > `Arc` has the similar definition [2], you can find more information
> > > about PhantomData usage on drop checking at [3].
> >
> > Hmm... But they use `may_dangle` in their `Drop` and we don't (and we
> > have a `Drop` unlike something like `Unique`), no? Or am I confused?
> > i.e. if I understand correctly, that would have been needed in the
> > past, but not anymore.
>
> Doing a bit of archaeology I found the reasoning for the presence of
> `PhantomData` in std's `Arc`[0]. The TL;DR is that the presence of a
> type parameter `T` implies "owns T", but `Arc` owns `ArcInner<T>`
> rather than `T`. Thus in order to get correct dropck behavior it is
> necessary to opt out of "owns T" using `may_dangle` and opt into "owns
> ArcInner<T>" using `PhantomData`.
>
> Please check my understanding; I couldn't find detailed documentation
> of the interaction between `may_dangle` and `PhantomData`. If this
> sounds correct, should we add `may_dangle` to our dropck? compile-fail
> tests would be useful here.

We don't *have* to use #[may_dangle]. Using it may allow more stuff,
but it's not a problem for it to be missing. We probably don't want to
use it since it's unstable.

Since we don't use #[may_dangle], we don't *need* the PhantomData
field. Having it doesn't change anything.

Alice
