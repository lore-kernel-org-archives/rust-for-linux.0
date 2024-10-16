Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E54820262E
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729068353; cv=none; b=KPxululK/yRPgw2G815TYppMhP9lnHIcc8Wz2azyA9/z+W43aY63hobnBm3zPATCmE7DF5FnbQ9So3DQPPc7ZvMtTv/2AIDS4OD/L51yCCP+LQASdeRG1uJqLVZrzE2BZ7vHBpayziUk1MTTG1NbXjGgDTfoqWNgpcondnzC6c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729068353; c=relaxed/simple;
	bh=tPKp6FH8LM1Ajw5jVA0FwWcF7dwxBVDEain5oorsqTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cO7sJmezNGcO9DFkhKpiMlgT051Iy1xoeDHks253UOzc/3jb9/8rkPVWAsoifnWn+XO0HijGaYhgVELWks1rEUIv+HLIbnp9v8cKQQeH05/EE9DtjCC2vtCVIMW5izKjM1Ey8l3C2nNNXSK7bZeiE2KY/hJe/XZFp6f8W0x/trs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SfKADv2m; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SfKADv2m"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43140cadeaaso13776365e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 01:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729068350; x=1729673150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQiVeIaORBH2LY7uDomKs6E4i7KqxzjBgaxWXE9AZW0=;
        b=SfKADv2mKZRcNwzcOQ/67XtZzJQmZFvI7+VHEe74XlSDDFkb2vzTQ4RC5dm993B7xe
         fvINbtnVUAXyPOzV2WW9lqyxffP8eOYBzShaXzxUnhcN/Q+5KeXBOou0QnAjVIgpx6TB
         Gegb6YGU/Hi/0E9Kc9jAit4sTGREJbA09oAkpjIqYc+7drdnugv/7C2/GqOBG5Qsv/TD
         DMmaFFThsrqx+Ru0QkwpB4GbBgz3xazx6VYxNB4/vpcCkGxGwqTZ/pIgWThDLKwAgvqN
         kIeCMmw896wqU767tRzgwY2hoUib0o4CL5oajAOg8PLiCnfduH3S40GLSRNea/ZH88LB
         L7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729068350; x=1729673150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQiVeIaORBH2LY7uDomKs6E4i7KqxzjBgaxWXE9AZW0=;
        b=vx0BzuqEetL/Cfi0GNbGaQT7Gy3ZdGJU/lH7+/uuQ2Zgq552+nmXx2JS5f2pbpnZzE
         FwUK6iGjEtES6gSPMCef1xVf1vxpyYQKZgVR7uYjb6WCt+6+KhYNqrz0G20BfZp5PJTp
         PQZO6NiuKHGQ5dLBs5oOBKhh8JJbHdJUmdeKtvHYthlflZuhsrya19cvcifDiplWXJnN
         4aNIfDkUFeRsr8gYkSWMI5VwzfKAPKLq5V+okR1tfNlIydgt8f6VEtXUcLW10oxhW1Nv
         W+0y0o/AbENOdXFBpUX4nQoEgWEKWacgZEUUSMRBbY8keTcjuYSCT6Jzwuk/f9C5honu
         /UcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT/IF+ZNYN8VenJKWm9BEY4bdO4Q10Fc1UwwQW6ygzF0QzTZhWufNmQI+NyV6dTZDQDWP3nSR+MLVkcQ+w5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ2eLToTmUFlO03EpNh49k/ibWiuAhDmOzZ1NPpczxIRAmyLnX
	j/mLxt/mGlD1jKnZZVP05teiDtQ5ABmJqtKVf5n7zfw15POUmKOG7b0T2HS4MmQL0Me8gnZZ10x
	3ATFnh3JLqbR9kv+BM4rKsNcHMSIu/GlXgje6
X-Google-Smtp-Source: AGHT+IEbvkLiD3zm7BxQJHYNEE6NWiMmGECFe/F6qDAJ/wKkj0TAQEjKK/20MFLf1QqFy6Y1NBbcy4BMRW1uYhU95hE=
X-Received: by 2002:a05:600c:384c:b0:42c:c1f6:6ded with SMTP id
 5b1f17b1804b1-4311df55df7mr156042515e9.29.1729068349781; Wed, 16 Oct 2024
 01:45:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016035214.2229-1-fujita.tomonori@gmail.com> <20241016035214.2229-8-fujita.tomonori@gmail.com>
In-Reply-To: <20241016035214.2229-8-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Oct 2024 10:45:36 +0200
Message-ID: <CAH5fLgjk5koTwMOcdsnQjTVWQehjCDPoD2M3KboGZsxigKdMfA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 7/8] rust: Add read_poll_timeout functions
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, anna-maria@linutronix.de, 
	frederic@kernel.org, tglx@linutronix.de, arnd@arndb.de, jstultz@google.com, 
	sboyd@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 5:54=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
> +/// Polls periodically until a condition is met or a timeout is reached.
> +///
> +/// `op` is called repeatedly until `cond` returns `true` or the timeout=
 is
> +///  reached. The return value of `op` is passed to `cond`.
> +///
> +/// `sleep_delta` is the duration to sleep between calls to `op`.
> +/// If `sleep_delta` is less than one microsecond, the function will bus=
y-wait.
> +///
> +/// `timeout_delta` is the maximum time to wait for `cond` to return `tr=
ue`.
> +///
> +/// This macro can only be used in a nonatomic context.
> +#[macro_export]
> +macro_rules! readx_poll_timeout {
> +    ($op:expr, $cond:expr, $sleep_delta:expr, $timeout_delta:expr) =3D> =
{{
> +        #[cfg(CONFIG_DEBUG_ATOMIC_SLEEP)]
> +        if !$sleep_delta.is_zero() {
> +            // SAFETY: FFI call.
> +            unsafe {
> +                $crate::bindings::__might_sleep(
> +                    ::core::file!().as_ptr() as *const i8,
> +                    ::core::line!() as i32,
> +                )
> +            }
> +        }

I wonder if we can use #[track_caller] and
core::panic::Location::caller [1] to do this without having to use a
macro? I don't know whether it would work, but if it does, that would
be super cool.

#[track_caller]
fn might_sleep() {
    let location =3D core::panic::Location::caller();
    // SAFETY: FFI call.
    unsafe {
        $crate::bindings::__might_sleep(
            location.file().as_char_ptr(),
            location.line() as i32,
        )
    }
}

Alice

[1]: https://doc.rust-lang.org/nightly/core/panic/struct.Location.html#meth=
od.caller
