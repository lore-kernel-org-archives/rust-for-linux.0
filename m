Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCA91885AD
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Dec 2024 10:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733481628; cv=none; b=kc4Vqu7IRH/Uk6ZA0crDTe3lZ7FB7nKGA9XYJXkS1CG09v4eijqy0iWRa834CE9tW1f8B8200ww2l8uG6ipIcT14aCfnaW0l7Q4zvhXU+WGE2EZsT6bj3UzL4t7kda7Or6lfI0BK7OZKTc0lQ/TcOy7yjz/99GwLvohZUywxa8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733481628; c=relaxed/simple;
	bh=4b6JbIxkrcACSYVKUqWVhPcw1Gwr93RFWwqSH6ROR0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+7q6YZiQ3VAGcoaTqbyc6hUiTddyL43Y9pTsgguHxAJYmIYp8EuiF730papHCmJpaNzxPkagzLmPJnTk2lgeE7Cwx0G18IRomeEKKAwCz7YsP29Ik/mIOF7s8vg7qrysuRB/MC/BMziVHXxk56g5u1SZYNPzaavhY25ZIHMFdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q1MyN2vH; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q1MyN2vH"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e35912f1so1418049f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Dec 2024 02:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733481624; x=1734086424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4b6JbIxkrcACSYVKUqWVhPcw1Gwr93RFWwqSH6ROR0Y=;
        b=q1MyN2vHm+SmwRq2L5F5NB8xXJcuRcoTBooM4D+Gb7U5dyPZUnZEryLH9sveo27fIp
         YWdc0/bMMUPvExLQXjC8Xr9Ugvn2F1aKma3nw1E2tlzUAQPhDyMzzvZn/PhM4sndS4s6
         qQB0CGpEVGRJjvM/yTWoSgj6joGkTvw6HvETdhzMprjhS5tYMmHRTewoB/W6GgYQ8l6L
         LvpETgJTApQKpJzxaLhJKyzHXWuqaczCXNU96U9IzndZqw4sTsy5hgq6jCL6coDSts1M
         uOfO9raUgkmpo/eA5U2fAl6XoFO2ttGkWfoapCqw9PiDAjLL/n7/fuvHOiEP2jc0t9U0
         5x2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733481624; x=1734086424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4b6JbIxkrcACSYVKUqWVhPcw1Gwr93RFWwqSH6ROR0Y=;
        b=qpem5syyffyuzCwmGWaeqNGm5w45ZEADzjqxL7OrQAS/WoBdN49ywAh/akA7LzlZQo
         3IOn61aIe03NnOeKSwwcJGJNSnD5PU8VMWbrHOQ36sYBuPfXQs/T6/+K/2kFdprFmUnW
         cM71X1JauQJ3zOC4UaMSb9LTDl7YvwojXcRhLHBJxFefLTHtMuNloemunJHUVhAMsATg
         qPQGzrp5Q3ru4Q+DH4yQIrQvVEAzUlTfICljH66N9kNZdq57GH0IblyCxlXwr6tluHIL
         Zw7W50QjFH7O+WpcV0dDWxveXAotI+lOI9rxLiIsrrH2xc9VOY5T1UOumOyFTOGLcVQE
         OEtA==
X-Forwarded-Encrypted: i=1; AJvYcCVu4wFzFBLOJTjAS45U/vvEPVvQOTxbBNA/ajbRhzkDVjG5dckro3yvWeLe8TWl8PsK6BEzgYQ6/BE9u2/Dog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIjz2Eh1dBQpHq2Ya3tjmcBOyW68Hcyd/4gOspQS/NJ4j3uxUH
	u924pT2DzW0n60Waqlnh9WM2jEGDheHlJgmg96k7DfrzoEF5cdGCTu/ONGmGc+XsXWemAkYGguN
	HvAG4Lo3NpWPcA4Yj0g5Biw61/YYKNhN+3S3C
X-Gm-Gg: ASbGncuDbKHEyeX7ELgFArUcqb5UnxxhKIdC4PA8Si3O16RYe3xmQcJeq8TuGi0FWlA
	VGtrEDDpEcKF9pd1MVy51nqNM+OG8dshr
X-Google-Smtp-Source: AGHT+IF8yfvzoPg+mwLQsS8oLj5YOX1CsFTqvFqAArzcubYzYvhVdzTXuq4R7PKdVsHpwellV09n354CjxUnnlRs1Lk=
X-Received: by 2002:a05:6000:2cd:b0:385:e877:c035 with SMTP id
 ffacd0b85a97d-3862b3f5655mr2073492f8f.53.1733481624282; Fri, 06 Dec 2024
 02:40:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206090515.752267-1-lee@kernel.org> <20241206090515.752267-5-lee@kernel.org>
 <57c35f7f-76e8-4e21-8288-c66a1b6e7069@app.fastmail.com> <CAH5fLgjauL-1QbnkVVK34COD_Ch_rcdpUEMKBsC9HB-TKWNscA@mail.gmail.com>
 <2073da49-37c6-4add-9450-47842d05cd79@app.fastmail.com>
In-Reply-To: <2073da49-37c6-4add-9450-47842d05cd79@app.fastmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Dec 2024 11:40:12 +0100
Message-ID: <CAH5fLghxCn07bHgfqMJz3p=ak6f9KNOWVUtiCmT1nmKvsk0OwQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] samples: rust: Provide example using the new Rust
 MiscDevice abstraction
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 11:31=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Dec 6, 2024, at 11:09, Alice Ryhl wrote:
> > On Fri, Dec 6, 2024 at 11:05=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> w=
rote:
> >>
> >> On Fri, Dec 6, 2024, at 10:05, Lee Jones wrote:
> >> > This sample driver demonstrates the following basic operations:
> >> >
> >> > * Register a Misc Device
> >> > * Create /dev/rust-misc-device
> >> > * Provide open call-back for the aforementioned character device
> >> > * Operate on the character device via a simple ioctl()
> >> > * Provide close call-back for the character device
> >> >
> >> > Signed-off-by: Lee Jones <lee@kernel.org>
> >>
> >> Could you include a compat_ioctl() callback in the example?
> >> I think it would be good to include it as a reminder for
> >> authors of actual drivers that every driver implementing
> >> ioctl should also implement compat_ioctl. In C drivers, this
> >> can usually be done by pointing .compat_ioctl() to the
> >> generic compat_ptr_ioctl() function, which assumes that 'arg'
> >> is a pointer disguised as an 'unsigned long'.
> >
> > The current Rust logic for building the fops table will use
> > compat_ptr_ioctl() automatically if you specify ioctl() but don't
> > specify compat_ioctl(), so this already uses compat_ptr_ioctl(). But
> > maybe that's not what we want?
>
> Ok, got it. It's usually the right thing to do, but it's easy
> to get wrong if there is at least one ioctl command that actually
> needs an integer argument instead of a pointer.
>
> Almost all command definitions are for either no argument or
> a pointer argument, and compat_ptr_ioctl() works fine there, by
> doing a conversion from a 32-bit pointer to a 64-bit pointer
> by zero-extending the upper 33 (on s390) or 32 bits (everywhere
> else). Integer values need to either a 32-bit sign-extension
> or a 32-bit zero-extension depending on how the argument is
> interpreted on 32-bit architectures.
>
> I wonder if we should change the prototype of the ioctl
> callback to always pass a __user pointer and just not allow
> the few commands that pass an integer in rust drivers, and
> worry about it only when it's absolutely needed.

One option is to let the Rust Miscdevice trait have three ioctl methods:

fn ioctl(cmd: u32, arg: UserPtr);
fn ioctl_raw(cmd: u32, arg: usize);
fn compat_ioctl(cmd: u32, arg: usize);

Then when building the fops vtable, we do one of:

1. If `ioctl` is specified, use that implementation with compat_ptr_ioctl()=
.
2. If `ioctl_raw` and `compat_ioctl` are specified, use those two
implementations.
3. If none of the above are specified, use null pointers.
4. All other cases trigger an error at build time.

Thoughts?

Alice
