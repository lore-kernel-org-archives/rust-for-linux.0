Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E3612E7F
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Apr 2025 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745682342; cv=none; b=hvw7X33BwMMdDAuxRfUAl3oKwDawQtccdxzP+tdARvfF1nrvaKKZvd3xVf4jnb2Z4+x/vQiQkVMuAT02dYNY6ko8MWrOTRFShL+NdIiANfefEKth7nNrd0KIcLqlMFK52Wro7ul33L/NbLIhCeAKzYRxORx2MFo1HdbmKwA3KDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745682342; c=relaxed/simple;
	bh=zsGuSSgMkpqELyC7eO5oc6nGti8HXzlmRKq7fViP0SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOxNPd2nMGU+HBc4J1QjMl+SYEoBXq3py0ehhXWYVEZf9nLfK6TXlAG2+FL7ugtTjqMAQSLO+rxF1Yml+jMdzFg8MT+wJszUBroHM324cxPO4x1LsV0PENKQExoQDe5GvByJ2i9/1+GN0sb7lmGa6Mu73N6boBCC6VpTmseuvWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jwAf0Vje; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jwAf0Vje"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-601f3674116so901735eaf.2
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Apr 2025 08:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745682340; x=1746287140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wz8Gg4B5hI6TDT0A3Q/3R8lvLikep56DrZXN8aO4Gm0=;
        b=jwAf0VjeypUi0LqfrtmQ9A9bckJkpZs9i4q4AsEYZXy1498kpIunHHw326umdvEWzK
         k3BVPGVL5GvmW9DL9qUxYjJo9F4c86weL3erqXYTOvL0Uhc4uQ8ItaNRb8k8qTS/oxGF
         BZUNj7PMiy8MOU87xF24H9BuQj/NfTK2mQf/ZkoPIWCDjyBBP+I7Hfgp/ltJWoMiXrnE
         HTsDMgusDpCEgsBjbq+nlVqqkpF8yH3gzmNygZa9EGVTfPNzoLyrq74W7oSh9QpZaDXe
         po70lh2kcZ/AUARomWmDkXfpi4boahuiikemfM5Jysb/Af2N29EY+aG/OSWkaW0JwDgJ
         zvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745682340; x=1746287140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wz8Gg4B5hI6TDT0A3Q/3R8lvLikep56DrZXN8aO4Gm0=;
        b=N2up5B78DnsCmESjgvkQlZQMXh/r+o/SUXF9Udn/aC00kORr9hcUNDOTeeq6S86whF
         q2Rdmd7eeIAtNDNCOUqYqzR0ErsHp7DMHo7tIWRv5jo3Ope3cKXW3lPJViMCoEHBiVTc
         wK22wzyIX7H3rTv85mzhMhEdguY9N2I20eSfFvXV+P3cHz0XVZB93xZYO68g2Fk4+h/9
         jQ4WC/IAPx3YVOtV3X8XP1LsbYRIz6hUl2JDEUaO4PN4RyThpJGC4NkDmPeMqx7NQTVT
         ceqPLX7c2RskwpXAq0G90KZyHSTfOWYujtE5TL7y3kAiW1ZKe67RenJ5Wx+Mago1ualV
         NK7w==
X-Forwarded-Encrypted: i=1; AJvYcCWiSmHZSrif93vi0KebsYciWacmTAPK/ioS3qYvB1oRfSd9dSblQ3TVEJSoLydCJDoOHTOnR/e7Wqukz7HPXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR/2VdroXz1O8uf3ohsVUe5V63N0dYTgq5WQ+EULVO9kFA+2Zz
	iCIq6VlNU6/5ap1i/YOmIRFCrH+a/xlqFiuZ/4rWqMWzoBLHnCxuaD05ScPgPU9iJNwqPotQ9G7
	Bo7gdZGCw/I3fhqWK91JNNsr3Vza+TVfLD64V
X-Gm-Gg: ASbGncsQHAO2bI+a45THys8if5jFfULD6e9FNAeHfIYJ0xvYwK+SUZNZrsWOQyDTScM
	H14ItIje9I0A5ylHkAJQLOe4+KxOL+KAic5NMUTYm0/4nKgFBnFRwh0a0rCJFAOfvNnOBh/poFl
	yxitQBgWfH8rXVePeMgyiyvVoXB1dfx/J99EV/9dEC4S/gkKGiMqSmSiKWD9u2NQ==
X-Google-Smtp-Source: AGHT+IGVX6xyyzk7BrsSRq1Du2lQKeFPIJ1wlJbXc/q66nYf69PNExhyd8riE3+LNrMzT/os4Jg+FiWU7xVVjhJHv8I=
X-Received: by 2002:a05:6820:4c07:b0:603:ffc3:60f4 with SMTP id
 006d021491bc7-60652a42ac0mr3447248eaf.1.1745682339548; Sat, 26 Apr 2025
 08:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com> <20250423134344.3888205-6-bqe@google.com>
 <aAkbw0jEp_IGzvgB@yury> <CACQBu=XaOohewMnLj9PvgR5rYBxzYSXf2OAjCzUY=GFTJ9L=+Q@mail.gmail.com>
 <680a6b54.d40a0220.27afd9.5e84@mx.google.com> <680abbce.050a0220.144721.78ac@mx.google.com>
 <CACQBu=VEATxHmFvt0TKbb+Hx5jeEGO8SL733=0m8LNnX6S+ZKw@mail.gmail.com>
 <aAuR_0om4FI5Pb_F@Mac.home> <CACQBu=VkFT5yDuDz098L+S+tGvtGHMvm4FaZ6p3sr9VCp88jww@mail.gmail.com>
 <aAzZsqK5Gm7aooys@yury>
In-Reply-To: <aAzZsqK5Gm7aooys@yury>
From: Burak Emir <bqe@google.com>
Date: Sat, 26 Apr 2025 17:45:26 +0200
X-Gm-Features: ATxdqUHZfljnJaWz86FI_5Sj9VPW_bltrBwF3N5Er_0YbVDjz8s2ZOmzc3uj0NA
Message-ID: <CACQBu=UQLHquztim+=ZGjS-EcQabQ7e2HPc9WEJXSJB1sQjGMA@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
To: Yury Norov <yury.norov@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 26, 2025 at 3:03=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Fri, Apr 25, 2025 at 06:17:59PM +0200, Burak Emir wrote:
> > On Fri, Apr 25, 2025 at 3:45=E2=80=AFPM Boqun Feng <boqun.feng@gmail.co=
m> wrote:
> > >
> > > On Fri, Apr 25, 2025 at 02:20:13PM +0200, Burak Emir wrote:
> > > > On Fri, Apr 25, 2025 at 12:31=E2=80=AFAM Boqun Feng <boqun.feng@gma=
il.com> wrote:
> > > > >
> > > > > On Thu, Apr 24, 2025 at 09:48:17AM -0700, Boqun Feng wrote:
> > > > > > On Thu, Apr 24, 2025 at 06:45:33PM +0200, Burak Emir wrote:
> > > > > > > On Wed, Apr 23, 2025 at 6:56=E2=80=AFPM Yury Norov <yury.noro=
v@gmail.com> wrote:
> > > > > > > > So? Can you show your numbers?
> > > > > > >
> > > > > > > For now, I only have numbers that may not be very interesting=
:
> > > > > > >
> > > > > > > - for find_next_bit,  find_next_zero_bit and find_next_zero_b=
it (sparse):
> > > > > > >   22 ns/iteration in C, 32 ns/iteration in Rust.
> > > > > > >
> > > > > > > - for sparse find_next_bit (sparse):
> > > > > > >   60 ns/iteration in C, 70 ns/iteration in Rust.
> > > > > > >
> > > > > > > This is a VM running nested in a VM. More importantly: the C =
helper
> > > > > > > method is not inlined.
> > > > > > > So we are likely measuring the overhead (plus the extra bound=
s checking).
> >
> > Alice and I discussed that it may be better to do away with the extra
> > bounds check.
> > Micro benchmark, for the upcoming v8 that has the bounds check removed
> > (and the test changed to >=3D, as requested):
> >
> > [] Start testing find_bit() with random-filled bitmap
> > [] find_next_bit:                 3598165 ns, 164282 iterations
> > [] find_next_zero_bit:            3626186 ns, 163399 iterations
> > [] Start testing find_bit() with sparse bitmap
> > [] find_next_bit:                   40865 ns,    656 iterations
> > [] find_next_zero_bit:            7100039 ns, 327025 iterations
> > [] find_bit_benchmark_rust_module: Start testing find_bit() Rust with
> > random-filled bitmap
> > [] find_bit_benchmark_rust_module: next_bit:
> > 4572086 ns, 164112 iterations
> > [] find_bit_benchmark_rust_module: next_zero_bit:
> > 4582930 ns, 163569 iterations
> > [] find_bit_benchmark_rust_module: Start testing find_bit() Rust with
> > sparse bitmap
> > [] find_bit_benchmark_rust_module: next_bit:
> > 42622 ns,    655 iterations
> > [] find_bit_benchmark_rust_module: next_zero_bit:
> > 8835122 ns, 327026 iterations
>
> So I'm lost. You're going to keep those hardenings, but show the
> numbers without hardening on VM. Is that right?

No, I will remove the bounds checks where they are not needed for safety.
Indeed the latest are numbers without hardening in nested VM.

> Can you please show the numbers on bare-metal with the final
> configuration?

Sure, will include in v8 cover letter.

cheers,
Burak
