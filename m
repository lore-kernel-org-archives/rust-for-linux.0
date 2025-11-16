Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AA6225779
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763291215; cv=none; b=dkXYPyUqkx0REUC4paAxMl6Kfe1rY65MgOF8AjAobuNiDnLIK4NN9jvr6Lc9ocol5KjWVRMRWsFGtB+DLK5F9Sp82ElDkJ3BQPU11943U1IfgAm+B8TyX8RfBWc1iYSr5zSm6L1yA3ix3ACFjrC6KopE9VL9LQ09vwmDQmsfmjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763291215; c=relaxed/simple;
	bh=8UMyf2c3ziB+8wkmaSAqGTOXmL6zebrd8BWEp3o8qvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/J3Vl1T3isGCVAJS3L9iR9Yw2wBdQymglFKruexMmk5yrVB1Ghg7gk40VqLnWiQIN867+pSkD53GLEgaUjechJ0tay+wNvsVJEzPiDkEOfke0heQIqrwD1znaoQfPu2tNm3irkaW0N0Oik1HBftVXVVe7Zx/VtAGFyABAT4UQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAOh/gAV; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAOh/gAV"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-340ad724ea4so694854a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 03:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763291213; x=1763896013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ODT80GyCzzhXBfLdsHQFnDt9G4T7WkMKNprlrvwuMo=;
        b=XAOh/gAVP2T1pNlHIdJdgEnIgqaeskbZhvGj2vodK0FiwcA2h+C35nHi2VO4x9Cv6x
         1c9VRtIiWKSs7EJNCJUtI1vfMQnEfhGaG2ChYeMj0i7rEsqmV8gBFNwmwUR2xFa97Nwl
         gzCvbVEP8n6myoSJpaPIhOFfSWqC38WNU9Pc1almiA7FfA0HwMuKdQz8smapa6Tnc/TY
         JM/d2ylmUFZfANg2prrRYRq1yfKhlFxCjGL6eV448yyQvGk1mboFm5IuwJDj6i+hzDu9
         cXe5Le2QVy9qnMnf/pkGhxM9bz3ObLD+/w+7Hx+c2tbq9Hx3uUbIhzP3EuH6mT7Sjz5r
         amKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763291213; x=1763896013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ODT80GyCzzhXBfLdsHQFnDt9G4T7WkMKNprlrvwuMo=;
        b=uZNeod6eckz8cHX2hue6FKxB7HUzETMiB0WbmK9glRcWwaryD1EbriID1cFvIqwPoa
         v4jxt/zPOlA1QLi3PkaCIe9fpJTrMQIuovVHMbX3T7VuDV4oie1EXGk91EDYl9DlunlK
         JXfgz7N69SWh+LSr1LXJv6OjXzmK2H78SNYvqp5jS+BcFcHnIlXjj+SN6Fv51I4f5105
         VKr8V6cd1cJgezvl3t94LFxBwNBMxCMV9VYuIupraB3PC1MaJrOcY3G/0UVh8QS8ZHps
         xPgEuL/180Khr699CVqI82StplNWKPxVZ5Zr0Y+LFVEF4Zi3iMAp5w1y+GgN/FFqKpHw
         Mprg==
X-Forwarded-Encrypted: i=1; AJvYcCUEtGg1S+rUJwD7+5UK2IqjNqcGEGecTrgYS0IHG/603l1WvESxfcNAE/HIbuC8Ze176FhQfs11n6ZOXYiKJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yznc5BNcR8S9kFlhmkGNNBSvZ4hq2jGRwV4+kVbX65ppGvE/Q2e
	ZRjTO1kz5vQ64D5yRGWIlEiLwJpSly4ZbJ7RjB0dnRvVocGt7a/JuN9chqFy/tXyhxZzjhv4bX9
	YJrqFx3uK6c+1h3wuM8somRUu1hfHpeQ=
X-Gm-Gg: ASbGncv5mQd0jrZoA1EKQAFBtcvBGk1Sx+dOVBhBi30sQWL0DXXvRdrtPjVmboqOf38
	xPDleqOVp8Z56c/U3ZDaFxB77+dWmQfwhYMhlVa0G+rCyTzAStRhilLokjhADUmG16Y69Ez4DDf
	s/0WyanqD0Wq/60gJxNrzZPIoRzobId60hlNrWO9kMpi4F7XYbg1oaHXHCmxHlWO86VdkmQy050
	xav/xN8fdUR0OENlb/pwIg4HWh7cZH6nEn9p/loyrg0WjXJQIX7Hf4qakmux7sc5cun+S7U9ewE
	Y83d3/Z1X0MjQh5NfjZNLHRZw8Be4H+bN96YTHDmPoo3q4F/eH9ez9oEZFM8y5ABDUjre5ZhoDB
	RWVI=
X-Google-Smtp-Source: AGHT+IHJzCDV6fq55ITaeOOiiaybt6X/4+7zmHKCE/n3o7WAQDG84RuJFJ9cP8vjQk/WFCTl/dOE+nNwjBS/jDZeF04=
X-Received: by 2002:a05:7301:490b:b0:2a4:3593:5fc9 with SMTP id
 5a478bee46e88-2a4abd79661mr3026296eec.3.1763291213056; Sun, 16 Nov 2025
 03:06:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114184207.459335-1-lyude@redhat.com> <20251116093805.7918b83d@nimda.home>
In-Reply-To: <20251116093805.7918b83d@nimda.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 16 Nov 2025 12:06:41 +0100
X-Gm-Features: AWmQ_bkgfRAdXRF3Olq9t5A56EKRFwgU0levxZVdWKj1RnRWKw4UYvkV7spI0D4
Message-ID: <CANiq72nueMj-4nmf=s44=AskbRFzHDQgmqfd12Jo89CMyySOnQ@mail.gmail.com>
Subject: Re: [PATCH] rust/time: Add Delta::from_nanos()
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 16, 2025 at 7:38=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> I wonder if it makes sense to remove all the `from_*` functions from
> `Delta` and replace them all with something like this:
>
>     pub const fn from_duration(duration: Duration) -> Self {
>         Self {
>             nanos: duration.as_nanos(),
>         }
>     }
>
> What do you think?

`Delta`s can be negative and only store the nanos -- i.e. there are
many `Duration`s that do not fit in a `Delta` (`as_nanos()` above
returns `u128`).

`Delta`s are similar to `Duration` in the sense that they both store a
span of time. It seems reasonable to support similar constructors,
since they perform similar roles and we may not use `Duration`s.

Now, I agree that other types should not start getting things like
nano parameters or `from_nanos` constructors -- they should take
`Delta`s instead.

Cheers,
Miguel
