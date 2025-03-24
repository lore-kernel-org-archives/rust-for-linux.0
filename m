Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC4F1A2C06
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 22:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742854080; cv=none; b=lxeSX+aDWcXVV9rhA7iZ5x0+esct2oEiPif9f2oBvCzrsHPuq3JUaqBjty9WjwuuqpV0NIWUTbaC/pilNBKh/igaDCrV6kVVb4UBbPB4Kr4PJBOLS7bOUe+R/XygRzG2Y5N2Wq6t9oxetc7mUEWYdP/GdtGOnIS2FsQCoIoNEv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742854080; c=relaxed/simple;
	bh=UfqBs5MgYG1A/80yw4gqmWQGfWQnkNWPt+zs77tJ2vM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q5GTNM503QjtKLPN0Ly4nFFj1lBONLdYLp1E/u/wMQhBcXSGIJgj1JvzyzJum3O9voxmkvezrXEt2qAME+VBxL4ZMxe1oFyS4dy16JcXYjXZiHrz+hCu4Jfx7AtjEaXK6Ze2Q5tvq5xKWx7/Drrh/t33Stjd19V5HQ9328hxiOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFJyltKq; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFJyltKq"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-301a6347494so1245074a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 15:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742854078; x=1743458878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpV3TAA/Iydpj4WaNNQkUnwLj0zZXO7hzM8FhcJyJoI=;
        b=GFJyltKqcWgcMqxbAylusfGo9dEhe7rC0VG1WuV1Cq7SUaGHnOcCwXhgktEr/r/8OQ
         gyowiHOodApiFoBC495Oac3S6FmjdVpby/AeyDVeCessVhyP2NW8yW5E50Y5B57cbQo2
         zkwMFZ2Qaky2NRfP4QELApRkIqxwVR4FfHmDvbfrwuGDoBWlD2Bidkp58EwbT2oXHap3
         2FhEIbCIZHO9i7HDpjkRFFFhCIbApXliGxOXG3/m2voJGpk6PeOxXNnMopDoMk1jdDl4
         /zINFI+SI26oJBs+crcpd4G+/RIn4+eOLEV4VjUCSeExEUNwQcVxWI7exmo62Gfwfu4b
         aKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742854078; x=1743458878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpV3TAA/Iydpj4WaNNQkUnwLj0zZXO7hzM8FhcJyJoI=;
        b=Knl1mYLXRWnSCqasUNJf6OWXodYwGBDfJnk6qdGB+fDB6yUjubTMlH9pDow4I1s6xM
         aDKC9UjCvQGNCZWelfJvL9rN6Y8kiLLCn7KSawyXo4LKwzQjuU6GvgM+ctmHBYrWSDRC
         mmgUsENEBl0KaqU5s7QbUI1GJmHsS3DxV2OuAC15w/dnpowosU7kWRQ/28cLgYcPWlEb
         4dTuTy6TNz1J2wKAKx/cBKKx6ceOqYDzMIqzP379QaMNTf3tzQY5S4oW20EVmf7/MYnN
         XuWx3jYaCwNKH3TMnezXw8aZG9+hiP2TJdZcUxsOvRE24DA9XRlslQt8FAm1/bHDGpO1
         73uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPXIUqdds13JKOSP5Q+RH+xqFVyHQg4WPNl5SVclzvTqI9HFdCv9K32tmcrQjhHeGyqfrt4WpyWPoa07aMZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhlSIzA9KkwV+D/1jt1MjzmYlWx2Vnn38hJIWkr5v8hlsdK2oD
	lbi3nYQ8bvj2q15gvU1WQdlkilazxyvkFKj14U5EI6tuTRr+QhHvYVT5Pq/Ubwp8thURBmfz+b+
	UFeiJCICGLALUToZT4Bja7Aja5TBvE04ILq4=
X-Gm-Gg: ASbGncufSWFoOQYsnPaMmd1/OzGBXPqM30jM+Xnh8jZnt5gIkD0D6WTr6jvv7cqQwS5
	4Bw8nQrw464UQNvz412eAaR4r6ZPBuqkt2594hiL8YpGMNoYk4A41JTaPX1Yx6UT6sF95CMdnkX
	mXcJG68vUbzwwQvHyabVZPP11/JQ==
X-Google-Smtp-Source: AGHT+IHv1f90vHcMEaTBjO9tCdYzCPqaiKz6lcYIMaEuMLX0Rd/1QP0eBe6NG3wN4aqKgtaO6OCvJCWr9k2RMQE9E8c=
X-Received: by 2002:a17:90a:e7cc:b0:2fe:7f51:d2ec with SMTP id
 98e67ed59e1d1-3030fb1fff3mr8647573a91.0.1742854078212; Mon, 24 Mar 2025
 15:07:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324184403.868691-2-altan@ozlu.eu> <CANiq72mTL=vStohG+H2Xzu5i6O=XVjj7k1tKi7wWf09PCShe0Q@mail.gmail.com>
 <32b45da5-3c32-4d6f-a29e-1b0df06f9726@ozlu.eu>
In-Reply-To: <32b45da5-3c32-4d6f-a29e-1b0df06f9726@ozlu.eu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Mar 2025 23:07:45 +0100
X-Gm-Features: AQ5f1JqFw8uP9eaEaTYPr_QhKSep7iVba_bBliNNuLMKiupK4VgBrgC3pSzkggU
Message-ID: <CANiq72=Fb4X9LnB5S6-ntWBki2KGh0R1ndHZYhspRSXQb_acOg@mail.gmail.com>
Subject: Re: [PATCH] rust: static_assert: add optional message
To: Altan Ozlu <altan@ozlu.eu>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 10:44=E2=80=AFPM Altan Ozlu <altan@ozlu.eu> wrote:
>
> `const_format_args` might not stabilize in the future,
> please see https://github.com/rust-lang/rust/issues/108595#issuecomment-1=
457030352
> So it make sense to keep it as `?`

That feature is not meant to be stable, but the docs of `format_args!` say:

    This macro will be removed once format_args is allowed in const context=
s.

That is, it seems like the intention is to eventually allow
`format_args` to work, and I assume then `panic!`, `assert!` etc. with
formatting will eventually work.

At least, I don't see a reason Rust wouldn't want it eventually, and a
quick test in nightly seems to work for a simple case.

Cheers,
Miguel
