Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4852222C9
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Mar 2025 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741680403; cv=none; b=dShk0WYyZmkuz11c1hHp6gcCCuxB6R/5VddXTWHpSJAes/LjAaCfHg9DKXlXDMNDHfUmjN+RBpyTgRTS0mq8OCmHpC9QcdVb5S0X9p8kbpvh/pAODwi73VW1sGyP5bPAJleEl8QdU0im70mmjqjxmrL2VB/svJc3r3pq3Capo7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741680403; c=relaxed/simple;
	bh=GqsHdypcLuJf8lTVxKP4YCkbR9d4MU9dFUFykzw15j8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jECydEc52+c9bivdiO9KGjp14wwW2fKdU5G5Drw+ZBuxI9SIKDt4Bs03w4aHYmkf1JsHSCCGL2Mljwfoe2QfiCGLKhnElrZzCBDQar1X1VTI6qTjmLhKpbYiSFjZXQg1y5SNw515T+nbULDJTyll+M0CfqkGOzsS5X6UUZvbusI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eZdIfRay; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eZdIfRay"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf446681cso10802135e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Mar 2025 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741680400; x=1742285200; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+xcm0K1L7sxdR65HoWG0zR/e3ats9JqNWJReeEzbxwI=;
        b=eZdIfRaydJldutouRnhboKjmJt3txSO5ejItY67ZgKeyGB17410Rci9Rfq7vrgvNQQ
         9N/easXZw0AIVzNm+yoTcL7mTr4nbwZTbfkXtQWNtuzfaA95FpGKbhAfwzGxkyExnuUO
         EO8KmPgzKom9oZ1GeM3UXgPIK3579KKA7adl1RbXzjQRLwRJXYm+uui8yWsMfHY2gmj0
         ifhOSzN1DBvSifC+I0ZV0OOuCG9D34iDlcy4jkXwzMR8uVyWm9kJGlc+Xs6JQUx1fl/l
         7bvmbUS8oBKP/npM5HdabPUxR2sfrFrthUhLBqg7jVbUE5+omZCkYzsIhbyI7UcoGZIY
         PeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741680400; x=1742285200;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+xcm0K1L7sxdR65HoWG0zR/e3ats9JqNWJReeEzbxwI=;
        b=VAMgPq5hIS237UhkH4j+ePism5I5FYJw4wYidOmX8CWU+w0Kqt+8CCGzrb1R2xUdXG
         Gdi8Jj7Ychy+zdoaSOt2aX3ZyDehG+yX4ptHmG2vyE/DX/+1gyseyTe3PIfZiPN7LeLc
         W23KHExtxH44AgLg+13yI6VWVjSF2+yuZwYQylmV+1JYov/cWhsOJ7skkfTheUEjxisg
         ORvi/3K5kO00QVsy0Q6CW5BjyLn0uWwYaKOQ5mg40ofJeDhcYNFqZZ3PFqUYfxoQPmU/
         yA9vp1MlsnBa2I5CzC6nga2zBgWrticmNGOHF2ue754kjK6mkVbh8tpX5xBi4jwld4vV
         NNIg==
X-Forwarded-Encrypted: i=1; AJvYcCXVv2mA9TT++zZhBKTfUdP0PnIjEup+z8BhUQws+W4gs+jKKwWk2hANj4E5luO2dZoMKNxJBf0FQiJzf1ADnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzezh4/v7j2ukOnknbjCAdOTG0ls/F47OpW2ctPg9L//TpxlE/j
	QYiLlcKZNwM8hS7xJYsZ3n4t3ypIZp9Oud3Dl/vAIpYwJgpBZtcqVLeYm3MzWylAGGMRjvJP0Mk
	86vxoJlpKpA6Bug==
X-Google-Smtp-Source: AGHT+IGcrrTZTG+W6fZIwGjmzmkf4h8EJ1uAraxQiM1Mg0fkq2kWsZ8HARHFOyd2xy638gr8elcSnBE/hFQsuNY=
X-Received: from wmsp32.prod.google.com ([2002:a05:600c:1da0:b0:43c:f3b7:f2d7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64cb:0:b0:391:40b8:e890 with SMTP id ffacd0b85a97d-39140b8e9f4mr9380366f8f.22.1741680399906;
 Tue, 11 Mar 2025 01:06:39 -0700 (PDT)
Date: Tue, 11 Mar 2025 08:06:37 +0000
In-Reply-To: <jesg4yu7m6fvzmgg5tlsktrrjm36l4qsranto5mdmnucx4pvf3@nhvt4juw5es3>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <jesg4yu7m6fvzmgg5tlsktrrjm36l4qsranto5mdmnucx4pvf3@nhvt4juw5es3>
Message-ID: <Z8_vDWjk2LpBqLre@google.com>
Subject: Re: [PATCH v2] rust/kernel/faux: mark Registration methods inline
From: Alice Ryhl <aliceryhl@google.com>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?PT91dGYtOD9xP0JqPUMzPUI2cm5fUm95X0Jhcm9uPz0=?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 10, 2025 at 03:51:38PM -0400, Ethan Carter Edwards wrote:
> When building the kernel on Arch Linux using on x86_64 with tools:
> $ rustc --version
> rustc 1.84.0 (9fc6b4312 2025-01-07)
> $ cargo --version
> cargo 1.84.0 (66221abde 2024-11-19)

Is there a reason you didn't drop this from the commit message?

> $ clang --version
> clang version 19.1.7
> Target: x86_64-pc-linux-gnu
> 
> The following symbols are generated:
> $ nm vmlinux | rg ' _R' | rustfilt | rg faux
> ffffffff81959ae0 T <kernel::faux::Registration>::new
> ffffffff81959b40 T <kernel::faux::Registration as core::ops::drop::Drop>::drop
> 
> However, these Rust symbols are wrappers around bindings in the C faux
> code. Inlining these functions removes the middle-man wrapper function
> After applying this patch, the above function signatures disappear.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>

On v1 I replied with:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

So you should add that to the commit message when you send a new
version. :)

(Unless there are changes that require me to review it again.)

Alice
