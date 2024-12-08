Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62922318
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 19:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733687005; cv=none; b=FiJW85CYyaUVzlowMJNF/KSeuGXeIKsMYEbC07B0BWD7T+EQ7n1zWLRDruQOc6RTNO0NBSECrgYC77b6PCwkaEY/YgOl0UZw/Xqw8UCm3RD3s0H/76IFT4RdllPfRjdyHVNnrtRsfLEjQP5GlLxfLur71ERIvmlBLhy9uaycx+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733687005; c=relaxed/simple;
	bh=kTK9vhO9tDd8yy0etx/tIJK5IiJZ21yUrfNQ6pQl+SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGZLboHCz8eT3SMuK7af6jvy37cHuNSuSfUv4EBXNB7S7bj7ulnZdHusRBh6BM1xvtMbpstUx2ojBhx8+Mz+whjTwhCDekyhdQVCuPDGGRQNBWjanmTGkoE0RHsWMUJqG0SWyl72jGwZUnnXV6y8mwL80BWZUjNWzaY1qlIZZ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9CrVYcY; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9CrVYcY"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6f00da6232bso3352327b3.2
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 11:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733687003; x=1734291803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQR0xYt66UO5eK55iKkJVM8U/DkxHvnWzf/92yZJBwA=;
        b=m9CrVYcYjA0h+mrw7svjmeSwRQPz8wGWojLc03PdUQlsdMT8AtvKQrhNcLmc+3YVj/
         C3bfJNlDxV9PLi65MWO5g/aHO9sO17EXImHvJf3E2Bc7oBFwuwB3/8rIWIybm4L3jJfk
         J6EHnr2Le71n1acClfc3nYKtBI9Jga2A6DuMUJKQMeYZwrqolQT+oSiPFwuTh0H+Bsby
         yj7nQ22CxivkQXNyoghR4PZpB1Vtv8EJMx9NgDQ5mBRXX7XyjTB6QgQXzWaDkBP6Rdur
         Gwv6Qk4zZEcCOHTiRbQIkWqWcWYYOGbd5R8AYjR6wZlREAKbsGRs5o4gxE0rPJ2Ub4Hv
         NbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733687003; x=1734291803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQR0xYt66UO5eK55iKkJVM8U/DkxHvnWzf/92yZJBwA=;
        b=Jb/gBLzi4QnSCJvkbLJZAWgz2WwJALqpU/culU9+AeoQ/DVKH7KUbyx1PJD3/EAOM/
         wS4SiJg3/j/x2ukIk1n/J1dcfbMrYcy6xw48QrcMRbVopPawQPCmEuRqEQBbaRN6dj8d
         Ls2PqAbFQJvRt0FAvuOr7CGUC7s3LJ7QyaW18bLqTsAJ1oA+yiIPE24AIg6PKMVbEWTd
         LP5mV+TuBM/lucBlUyfDNt+2GB+IX6ydz0DnkQUXve17EGk+zhDwFVlnNUdAF4Bzozss
         OWi+8BWhsY+GsEt5wEdClnynrcovDCjBl/6afUcJUHx+odflB4dYrWXLMDBPCw9pVAqT
         FI/w==
X-Forwarded-Encrypted: i=1; AJvYcCXuo2sTZiNngvNfplC8bwY4+xijiczAlul8SfjdSZyGQD2jsrfry8M5sGxFa/EI9sE67Zb9QbzsfkGPGEEE1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw54vcxIltpVHh/cfejKv2aR6ZwUxPm5WE+yLIS+GPnFYCFyI3Q
	aFa7g4PP82u27Zvr8EotwiUTXT1WLuobUMvcjuN/z5iDkX5kQS9bFSrMESAmO2fcyEzuzjhdG/v
	W6hrqEaY9sElpDR/E552JqBq4zZI=
X-Gm-Gg: ASbGncs6dnnerLFSjQu8xxpDEDwn5i9CRaslcMUlOzUYECcWHLFZx5WHQ2por/o8RUK
	LB23c31HZ1LXvSHNdZAaLI77aHxHpEh8=
X-Google-Smtp-Source: AGHT+IEfw+8jmxkI5/19HuZyfuvyq3JPupAvyPUvZkwayka05/cwGOcLUGVtOrEOMju06IkT03OJuAh2W3VrT11zgRY=
X-Received: by 2002:a05:690c:4c13:b0:6ee:4275:5a1c with SMTP id
 00721157ae682-6efe3c6f71fmr96785597b3.30.1733687002910; Sun, 08 Dec 2024
 11:43:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241208184834.50212-1-dev.json2@gmail.com> <Z1XvdgQOzx3A4LSf@tardis.local>
 <CAOJvc-bi6ym6ZMAbDSh4H_L6LQXoTs8oNY07SZ1crzXxY9BodQ@mail.gmail.com>
In-Reply-To: <CAOJvc-bi6ym6ZMAbDSh4H_L6LQXoTs8oNY07SZ1crzXxY9BodQ@mail.gmail.com>
From: jos <dev.json2@gmail.com>
Date: Sun, 8 Dec 2024 11:43:12 -0800
Message-ID: <CAOJvc-aPx0eS9rTKnJgKTyKHU+EtgfUVYno2oKTJUP7UqDhu9w@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: add #[must_use] to Lock::try_lock
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <alice@ryhl.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Boqun,

Thank you for the feedback, I am new to kernel development and
appreciate the response.

To answer your question(s):

> I don't think not having `#[must_use]` will result in the locking being
> unlocked immediately, do you have an example?

You're correct that the absence of `#[must_use]` itself does not
directly result in the lock being unlocked immediately, my mistake.

How I understand the issue arises when the result of `Lock::try_lock`
is called and its return value can be ignored, the lock is never
acquired, and no guard is created. Making the caller assume the lock
was successfully acquired and proceeding with operations as if the
data is safely protected, e.g. calling `lock.try_lock()` and
proceeding with critical section code.

The use of the `#[must_use]` macro annotation will ensure the caller
cannot silently ignore its return value.

I believe the annotation can be revised to:
`#[must_use =3D "if unused, return value may be unhandled, leading to
potential race conditions"]` ?

But would love to hear your thoughts and suggestions!

Best,
Jason


On Sun, Dec 8, 2024 at 11:40=E2=80=AFAM jos <dev.json2@gmail.com> wrote:
>
> Hi Boqun,
>
> Thank you for the feedback, I am new to kernel development and appreciate=
 the response.
>
> To answer your question(s):
>
> > I don't think not having `#[must_use]` will result in the locking being
> > unlocked immediately, do you have an example?
>
> You're correct that the absence of `#[must_use]` itself does not directly=
 result in the lock being unlocked immediately, my mistake.
>
> How I understand the issue arises when the result of `Lock::try_lock` is =
called and its return value can be ignored, the lock is never acquired, and=
 no guard is created. Making the caller assume the lock was successfully ac=
quired and proceeding with operations as if the data is safely protected, e=
.g. calling `lock.try_lock()` and proceeding with critical section code.
>
> The use of the `#[must_use]` macro annotation will ensure the caller cann=
ot silently ignore its return value. I believe the annotation can be revise=
d to:
> `#[must_use =3D "if unused, return value may be unhandled, leading to pot=
ential race conditions"]` ?
>
> But would love to hear your thoughts?
>
> Best,
> Jason
>
> On Sun, Dec 8, 2024 at 11:11=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com>=
 wrote:
>>
>> Hi Jason,
>>
>> Thanks for the patch.
>>
>> On Sun, Dec 08, 2024 at 01:48:34PM -0500, Jason Devers wrote:
>> > The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
>> > currently does not issue a warning if the return value is unused. This
>> > could result in the lock being unlocked immediately, which is unsafe
>>
>> I don't think not having `#[must_use]` will result in the locking being
>> unlocked immediately, do you have an example?
>>
>> > and unintended. This patch adds a `#[must_use]` annotation to
>>
>> Are you sure this is unsafe? Again do you have an example showing this?
>>
>> Regards,
>> Boqun
>>
>> > `Lock::try_lock` to prevent this.
>> >
>> > Suggested-by: Alice Ryhl <alice@ryhl.io>
>> > Link: https://github.com/Rust-for-Linux/linux/issues/1133
>> > Signed-off-by: Jason Devers <dev.json2@gmail.com>
>> > ---
>> >  rust/kernel/sync/lock.rs | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
>> > index 41dcddac69e2..f6a5e83ff685 100644
>> > --- a/rust/kernel/sync/lock.rs
>> > +++ b/rust/kernel/sync/lock.rs
>> > @@ -147,6 +147,7 @@ pub fn lock(&self) -> Guard<'_, T, B> {
>> >      /// Tries to acquire the lock.
>> >      ///
>> >      /// Returns a guard that can be used to access the data protected=
 by the lock if successful.
>> > +    #[must_use =3D "if unused, the lock will be immediately unlocked"=
]
>> >      pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
>> >          // SAFETY: The constructor of the type calls `init`, so the e=
xistence of the object proves
>> >          // that `init` was called.
>> > --
>> > 2.44.2
>> >
