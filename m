Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61931C84A5
	for <rust-for-linux@vger.kernel.org>; Thu, 29 May 2025 20:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748550125; cv=none; b=qE32nzOVVj9pvWJebeQvj6OKllEh8EWUqnlEzGPrUSNh3zma8AGIOpHHrshhmuspoqxVDmdnrt0NFjMN0CousosBaFTqFdca7pqLDCRd4xkm/XHDIUZeUemqeH7BdzEaGcERvhUljiXDULHTZ/nj2EyLXGdN3Hp0NY8KSS4yBGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748550125; c=relaxed/simple;
	bh=88KBlBNDTnic+JsYCxqjG3y9pP7yu3lwxaT4n7CRKtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqPAx+6r0aRDrUTNgFf4Gv1D78uqKg+1/jloctXGxA9++Zd5jwSk2xRQUc28k4cS5W9i8wW0ilLY7VMGyTa4K3z4eBkRH0lWRBnQW2aXQEdC2guRNybrQfxhoaOujNKc4azlo/19CAfm/rsQugGSZh4ZLdSuTdhV/HKhKW0jAyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvFFCQiS; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvFFCQiS"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30e5438316bso162131a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 29 May 2025 13:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748550123; x=1749154923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgmAyy4ntJwzfRdXgrKqd9MI0ZMc9i9sz9xCG6PRwlI=;
        b=XvFFCQiSgoNHqUM1FKSl8GdSFr1QaaN22LYybGydvE7ktqQ9+gtrnAndcDKxl85x0i
         A02+zPXfGMS4fA0ALpz9DJ30Tl2JvRnKHPUhxV4jDfOnSHWfqw8a59qkwg6TPjPPe140
         RHiFk8Cc5IC5cHrjdW8LszcSUArbZU8gO9C6TQw4SQFC8D1UG0lwIp6nsUu1x3KCb6xk
         kBwCZm9BhcN4LBVtjmZ5/ke2wtxXFdW3/sCfgOI4RMU6otgZVoFt9ZbI60g5RK2Owku6
         M32V7XU3JGnHMLPsb3TYzt6LDoyLSVUAnmi759ZOnBa5vmKrtrlChegH+5rb/qaAcGcL
         K+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748550123; x=1749154923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgmAyy4ntJwzfRdXgrKqd9MI0ZMc9i9sz9xCG6PRwlI=;
        b=VQfsYMy6wtT1o60L+0f0HM6UckmUjIwwojV7XRQvWiWDKkaB28QuTYDrgL7PBSR0ps
         A8NowEeNWLna90WS9OtdRy3j8CgqhqYzmuJ+HxfEf/SsDFuFLjo5yT+ysjr3wQIimDeu
         z747Z21V0Us1P/ZkLiQDEWpdU5vEnweXhNa+se4dQSTU1f+9CRjmRFGkPKJer4LLxPXQ
         GDY86Pk46x6qWPcJehXhIkBC0pZj6fXa9E5LYrezPiwYkyJ29Xp/HIX290Oh7FLZrXQt
         TKsl+5wS75O90dwv+CqoaX0b6f6ulwOkIF7TR2LRQmUHROV0jtSAdeR4qctbG7H+bZaR
         vGvg==
X-Forwarded-Encrypted: i=1; AJvYcCXK4H9ZXN93Jsgm3fyNtqxZQbwSDeFlDBmMKrSnuuARCi4XtH7mZgRhH1ANtgI7rrIVLWmUYDKV7SBl3u/ajg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvdD1yDDHz1uUhwWalF3Ss0PSqxaz5b3sTzgjtofuASl+H5PwB
	f42AqKvXSp/dFe+vp6eKLVkNGB20WPO/5MpqJ+uydz50OwJwJktEkGBCSC+cro0+XY53wTZHAho
	1AO0Rx7yEVg7cD6xQmEGSakpWVS7tHX8=
X-Gm-Gg: ASbGncteQf/o84s8+JSCEjiR4Nw2P6ZmHEeC4SaRqnBrZC8GkTXZ3ii2XjhKD+rV6cG
	eVXAde9kwmGCm1JuPb7kHtyi1oI2BTidLPetUkO8G3GLF8K6B1ZGlHeKpIOCxVFsTmxgepjPNTz
	cmRjDoNHGtLNnoBpearDNLxUix3nSb4Rf0KH5zlj85eZ0=
X-Google-Smtp-Source: AGHT+IHpgIjSOgh1Qj7Mmjjg2S1kioHxStupHqnUwyjD3MXc3zLSFqa6SsC8dMBeVyKemBJFmT1tnkbwHcmhlEMBUz0=
X-Received: by 2002:a17:90b:4cce:b0:312:25dd:1c8a with SMTP id
 98e67ed59e1d1-312413ef121mr451752a91.2.1748550122851; Thu, 29 May 2025
 13:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529184547.1447995-1-ttabi@nvidia.com>
In-Reply-To: <20250529184547.1447995-1-ttabi@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 May 2025 22:21:50 +0200
X-Gm-Features: AX0GCFtrtR__gnB8ABZqtsxkj73OV7XVqHWs-DhQu0CepWcp7Jl-bohiS5Ohq0I
Message-ID: <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
To: Timur Tabi <ttabi@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 8:46=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Introduce the sfile (short file) macro that returns the stem of
> the current source file filename.

What is the use case, temporary debug statements or something more
permanent? If the former, what about `dbg!()`?

i.e. can we give an example of how it will be used? (Ideally please
put it in the docs, so that it gets built and tested)

> The macro goes avoids str::rfind() because currently, that function is no=
t

"goes avoids"

> +/// Returns just the base filename of the current file.
> +/// file!() returns the full path of the current file, which is often to=
o long.
> +/// Use this macro to trace your code:
> +/// pr_err!("{}:{}\n", sfile!(), line!());

Please format docs as we usually do (please check the rendered form --
this will probably be a single paragraph without code spans etc.).

> +/// Note: Avoiding rfind() allows this macro to be evaluated at compile =
time
> +/// in most situations, such as the above pr_err!() example.  However,
> +/// because .. is apparently a non-const operator, the following will no=
t work:

This seems like an implementation detail, so probably it should not be
part of the docs (`///`).

Anyway, please see what Benno said, of course.

> +        /// Return the index of the last occurrence of @needle in @hayst=
ack,

We don't use `@` in Rust docs (we do have a single case of that -- I
will create a "good first issue" for it).

> +        const fn find_last_or_zero(haystack: &str, needle: char) -> usiz=
e {

If helpers within macros are needed, and especially if the use case is
not just temporary debugging statements, then it may be best to put
them as helpers outside, to avoid generating all this code on every
macro invocation.

Thanks!

Cheers,
Miguel
