Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97C527C15C
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Jul 2025 17:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390659; cv=none; b=Yg7ZDTwx7zO3gWdf7hmiaxcWcDfHuUhfq8lpqXp1kA44FwFFjsEYknwXNYNj9uuz2e1KgzfGVSxjDQxc0PZ7ypWrsYQHJN9YQNrgliCjefeSidNuJf7sMQx6PNaIZLk9B2sTVmfGBOSLGI+oRjbo1UBTjjOPXbQmT1H1cZm0gpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390659; c=relaxed/simple;
	bh=zXorP0aHXYEM7YGD8CdDJaNtPHdWDyvo5IePuvsVQ1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGPnId9JMWwCsa6NOnlPDFRlsIn+lOfqEaRUU2XBKe9W0VDYrZcZQNgL4hS01XnEs1INQXawLOBNEFN8IIoXQY4fr0GM7/WlIqWWr+MdN2QrwO5M3a61pt1i8jevZlozr2oe3bvlgnLBABC5OKcMDygn8J4gxZvy3IQ3t9B3FC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MjkQpnuI; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MjkQpnuI"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6098ef283f0so16557a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Jul 2025 10:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751390656; x=1751995456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQNkN/ZgyhuKuim3tffdar1QYfhVDSTf7v9swXpgSLs=;
        b=MjkQpnuIO/8UbDJWYXVRZhRclXw4rftbwonZq/zLBbAdVbk/PiTpgGHf/PFgpgBL2F
         R7pYG54P6tIb8S7uUF8Q1jkskTuCOPvsosf9a1esO0XanMAaOKpsLzCxtY5EdbyT3Aaf
         hsPncFJzJXjz+B16XxjSTnykx9x24eInLz5VmmiG0zPgkDTeASXy+UrDXLEP12pJ9ZMb
         6NIRYK+ObPJbwl53BG148MrmFWg0RGxpf9c3kYX4x2H3hslRXImvB6XG0kB6oy5jDeT3
         8xnb2BEi9b7GSSsFRy+DWT45iBCuru/KluXoIxd301QINm6KQE5KxXUE1+CF5i81cFni
         Hftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390656; x=1751995456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQNkN/ZgyhuKuim3tffdar1QYfhVDSTf7v9swXpgSLs=;
        b=PB19y3xE0znhCGSLMJD07o1YK7ktwqn/EutR3BcwZQAR7d4UKSltHkvBZEVCWDbD7n
         VLGwGl+znC8nrT0BiTlM36lTJyEUtqbN8zyKyY/+8nd7vEqjwMv6vjboRcflo0ji2tGk
         MomRBaD8X8ZWfTmJyn6gSyqP1IFbU3YWrDCvYUVpHY3t4UC2vPlrs8Guz03mP2WnhUbR
         vhWpcl15vbbPDz3zPfg/V5sVeoLBhrgf/GZRJd0ORSa8j2kgfHY2Ja66jTAxAb4B6BH7
         UCBY4EePAI0q7dBggIScbmgg90w2uqk1A6GnHXKSsAFu8CvqsS83SsMeNBGwTZWjwhw4
         bbEw==
X-Forwarded-Encrypted: i=1; AJvYcCXfnyikPHJO6J4IgupPBwMoY0cgplHaGNqFdlKAOspN3UkOYz+eEKD+ohmIiCRM0Cf4FYLbL4hf9Pj7dOotRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx87hf0e62mCu5C3AY0aKTjt2z0PIQG6QZzjOcPZ8k4RsQFbnnF
	SGIggUB3hkW6m/Zea5TibGeiXD1XAHYa7M7MAB0UPrDDoaZ3lycwIBUngEl8bnEeX7XRCia4QGj
	sRPr/lIVFHdNWYi33V/c8kQDekoMw5TuxzTnsNk/f
X-Gm-Gg: ASbGncuQrhZKP8KpYU+6CqSPI3CmUuA3TncroikTY1jWP5QHkFYlceI9t3m+NT/ib+e
	py9ZAlGl8lGWHxxY9XS952e4b26JkvXX1+3ETMI0gOdJ9lnq/OJ8LCyr/4BiDZTzhTbCejGlfB/
	j7QFgAFPNGoy13zuPxCX1ZGaYqp2QHOVEeeMLnaC1trAvTATAx65IGk4Lf86wRdRlCvoI+Hzpk
X-Google-Smtp-Source: AGHT+IGhH9LZcfaTk04JJmUrOjkTq7VQ1GKaFo5Pj4fM5cCZrHXRkP5priFsjf6di2GqQgivM7JMchuH4R3ybVvXIQg=
X-Received: by 2002:a05:6402:1d55:b0:607:d206:7657 with SMTP id
 4fb4d7f45d1cf-60e4ba76fddmr30992a12.2.1751390655895; Tue, 01 Jul 2025
 10:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-6-c6526e413d40@google.com> <2025070148-primer-stillness-0409@gregkh>
In-Reply-To: <2025070148-primer-stillness-0409@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 1 Jul 2025 10:24:04 -0700
X-Gm-Features: Ac12FXy0gxiaMyTy9WQGgYK34RtWEzDFpqk47coJhyeL-x7WameSHxw2w-MkJYs
Message-ID: <CAGSQo00UiOUAgYODhXT9BWLW0bXoCxMzt9fV2F2aiTEOG1vwyA@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] rust: samples: Add debugfs sample
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 7:03=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jun 27, 2025 at 11:18:29PM +0000, Matthew Maurer wrote:
> > +        // An `Arc<Mutex<usize>>` doesn't implement display, so let's =
give explicit instructions on
> > +        // how to print it
> > +        let file_2 =3D sub.fmt_file(c_str!("arc_backed"), my_arc.clone=
(), &|val, f| {
> > +            writeln!(f, "locked value: {:#010x}", *val.lock())
> > +        });
>
> While cute, is this really going to be the way to describe all "custom"
> debugfs function callbacks?  No other way to point to a function itself
> instead?  Look at "fun" debugfs functions like qh_lines() in
> drivers/usb/host/ehci-dbg.c that is dumping tons of data out.  Putting
> that inline here is going to be a bit ackward :)

Good news, function pointers are legal to pass in here as well
already, I can add that usage to make it clear.

>
> So can you show an example of a "traditional" debugfs file output with
> multiple lines that is dealing with a dynamically allocated device that
> is associated with the module (not the static example you showed here),
> as that's going to be the real way this is used, not with static
> variables.

Sure, do we want to:
* Finish creating the driver struct early in `init`, then call dynamic
`.create(&str)` or `.destroy(&str)` `.modify(&str)` type things on it
in `init` to show how it would work
* Actually wire up an input source to drive create/destroy/modify
dynamically (e.g. I could implement a miscdevice) - if you want this
one, do you have a preference on where I get my input signal from?

>
> thanks,
>
> greg k-h
