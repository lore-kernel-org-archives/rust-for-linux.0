Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C75520FA89
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 10:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737542874; cv=none; b=M4xH3hZTTm3DqMeJEtY9StKaWVRjf4n9On2M3dvoOQ404OAM969+KseVAOPWGLUPwBp03JATVTayIdmqvtug00hmB0ofBYkqmcIFMHVWkuq/9O2AIcJ6AvASnlry33vXcAwelHDlt9kdr3/xBAC9BAf/xnC2L4OvYmfOAeZ7gJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737542874; c=relaxed/simple;
	bh=YiEVAGJjaoNTHegqcY0gFKrNQ+Six7SlC5lmq+DYv20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aV3I8R80GZrtY60lw4lCo3L1DMmErDzrXtaYI2pfrFm2t7TPHlO9DjGxbBkF+Oiut09Qos0s4xV5p+uLuRKPcLpQB5TsLjyTYPsM5QxOiW2YwBks/Nsy9v9uMduUlHblhW+dQymzsoiWa3RNvgzM2H2V+ANsaItoBe0jtO+xU7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sz0oUUgb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sz0oUUgb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436249df846so46060805e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 02:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737542871; x=1738147671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAMlvwzH+Ng/xl8muCU+t8wbB02LbrBAfMtlAQeLQ9M=;
        b=sz0oUUgbC7IqK5ZkxsftRW7pzh8cqxL3J5GYBA5Hb3J0BC4yVCP36mTvqcJHIMd9Rw
         3OS+EpklNFw7ebYd69EUN5QaSCQ2uEGG8RuN5wR+yB8CvOfGIxNqU+zLB+YdjAaQvZEX
         Om4ZOklIroW6k1XOrtgqK2VEUreFKQ5tr5A5gztEU/jwPcFX0Tg3Igt35Ia1ROPdw8KS
         aSVxFThTK1D2CuTLeJcU/JkAmqSZEkd6OJwJTdWzHhIt5tUGBNcprjaRmsoud6G7v+1p
         G+BfhQ+4QfjuJ5STA1HVaLqW0LNhK5iZQ6JM0MqYKsFpErhTlBxFwtrxWmM8cxBSzPf3
         u5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737542871; x=1738147671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAMlvwzH+Ng/xl8muCU+t8wbB02LbrBAfMtlAQeLQ9M=;
        b=txlYoqYUh+m3q0aQ+hvk0YDKxu8SrGaHbKM7MmbP/wbBIOYi876VTZaIssaZEdKaF2
         csJ7mAa3ML7kghS5+mu+ZFm1ixX9UQfxPdOVh9rSJ2RAJv5YgCad8gr41Wf8kZ90QvvR
         dlt+ipZIehfBQxYDJLTveKo4jHf9z6q6G/PRMYIgqJsrFuYcHV2nTJ9u/NjFhC5U37Kd
         iP4Ra+2/Ff83c/rrYlUeamQLiBASzmjg7Ke/gR6hWraW4fyDtIOq0yNWzwcOmhDrSM3A
         1ErdRBx6NNFaZp586W77N5IsfUZ3/e4hFn6fqcgXRP1U+X5L1aqDBqX35/eJwd3yDYFM
         sUTA==
X-Forwarded-Encrypted: i=1; AJvYcCXOsf7ceMaNxQCngrKp82Zg4d/0r3YC9eQxn+MiaUPjD2uYPFKWtQIuQP7X4+hjrafvauWzLFzfbmK6xe6rWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yytk2WDDJjFAG6ipJrqHyA0odoG8aW7sIX/jT1RwEBpn+z6idH0
	AANkYwu/mtzquneGJtsy8bj3phY7nSiqlsdpOYAYJ7ITfqUZMA5QtwjgtF7SFN9G2IE21GGAQmv
	CNmlGgOrKhG0zo0WIQMNDO7i7htE8vv3clOkb
X-Gm-Gg: ASbGncvkV45kXRZ0CzGWjTuRRyzq3JNOVb/cZ52rapjVe0B8cnV4HfoaYzn4vqTlTS0
	qWn7lETKmDzZkxLxL7PGdCF2n7zFxuCeqhb0MtCowdXbhWqHlwG/vHXewA707jt8i0/+Zt7Y2n3
	Kzlt7J
X-Google-Smtp-Source: AGHT+IFWavTmDRB8/jgeW8CJi5BRkOi2cZqt1vFzTf60svaw9Mn+2HR3yMBzEoJQuwOHoEXEXAzAvsgUJWm6mSgipMM=
X-Received: by 2002:a5d:588f:0:b0:385:f220:f798 with SMTP id
 ffacd0b85a97d-38bf5655b12mr18111784f8f.6.1737542871130; Wed, 22 Jan 2025
 02:47:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72kqu7U6CR30T5q=PvRam919eMTXNOfJHKXKJ0Z60U0=uw@mail.gmail.com>
 <20250122.155702.1385101290715452078.fujita.tomonori@gmail.com>
 <CAH5fLghgcJV6gLvPxJVvn8mq4ZN0jGF16L5w-7nDo9TGNAA86w@mail.gmail.com> <20250122.194405.1742941306708932313.fujita.tomonori@gmail.com>
In-Reply-To: <20250122.194405.1742941306708932313.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 22 Jan 2025 11:47:38 +0100
X-Gm-Features: AbW1kvYPNCJ_OEMhXw5wZW68xizrdf7gH6-wZQQhXhiBoEIM8R03-BQuIRCiqTY
Message-ID: <CAH5fLgiEqd6uAzx5bkSDzst6hB0Ap=FAB7tOs96+WBL-pHN+ZA@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] rust: time: Add wrapper for fsleep function
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: miguel.ojeda.sandonis@gmail.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, anna-maria@linutronix.de, 
	frederic@kernel.org, tglx@linutronix.de, arnd@arndb.de, jstultz@google.com, 
	sboyd@kernel.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 11:44=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> >> >> A range can be used for a custom type?
> >> >
> >> > I was thinking of doing it through `as_nanos()`, but it may read
> >> > worse, so please ignore it if so.
> >>
> >> Ah, it might work. The following doesn't work. Seems that we need to
> >> add another const like MAX_DELTA_NANOS or something. No strong
> >> preference but I feel the current is simpler.
> >>
> >> let delta =3D match delta.as_nanos() {
> >>     0..=3DMAX_DELTA.as_nanos() as i32 =3D> delta,
> >>     _ =3D> MAX_DELTA,
> >> };
> >
> > Could you do Delta::min(delta, MAX_DELTA).as_nanos() ?
>
> We need Delta type here so you meant:
>
> let delta =3D std::cmp::min(delta, MAX_DELTA);

If `Delta` implements the `Ord` trait, then you can write `Delta::min`
to take the minimum of two deltas. It's equivalent to `std::cmp::min`,
of course.

> We also need to convert a negative delta to MAX_DELTA so we could do:
>
> let delta =3D if delta.is_negative() {
>     MAX_DELTA
> } else {
>     min(delta, MAX_DELTA)
> };
>
> looks a bit readable than the original code?

At that point we might as well write

    if delta.is_negative() || delta > MAX_DELTA

and skip the call to `min`.

Alice
