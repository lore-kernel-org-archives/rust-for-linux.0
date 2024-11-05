Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F08C1EBFF1
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Nov 2024 20:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730838063; cv=none; b=G50KFW+w/G2qMmNXU9SBKRTqMzTqwFZvXtRbbvH9iPL0WQTvGIgSP4CT7hMruQKwp5bq9XOUtRc6N96uxh8j17PVB7MxS39iAmkM4kwYc1n4pRy8Hbe96bRmeQ90Skgf6MpFLQyvw5n6iIMKu1X7Bg57QNV/wkgpWpHPRxEcWjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730838063; c=relaxed/simple;
	bh=5R/lLN3/PrKGOuDwgAKSQDkF20MfwWzMyZURNB3hjKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFHWu0CfOpBxMHNFw6VrL3tdYkDAhxNIlw/LS3mn0dsL1iwJtA5c71oF5/XwYSvpg+Y4r6imM9e48Ch+dTl10AlkpctJCrPuHTEmf/r6x0biZ9NuD1Q6vOFNVy59M047bMCFnPafimxWTybldCM9bW9l/jRx/RqiG3sMSBI+LoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnBc20wE; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnBc20wE"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e2e31aacbbso616604a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Nov 2024 12:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838061; x=1731442861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5R/lLN3/PrKGOuDwgAKSQDkF20MfwWzMyZURNB3hjKw=;
        b=CnBc20wEujlTEPXwLuslnImpZrjAK6w+xNAVUzoJn4EuSNY0qjxugCXOJQFPYzgMTZ
         JZXCPEALCd+wmEO1Fj3bhLJ8MGJ1To4Oudbdr2WWmZfi/B3dqes3rq2DAozsPwFcBkw7
         nX5qTALco7p1WFBUHH+DOjWNN1diWTfYRKHSETlmpr4t7jp3H+Sj1jPLcN+6EAHwvww3
         k8H2cF5scQxj4p9gKR2A8WP0lDoicOasrFSAvG9UrumKF+GceuYp8gmu9XjIahJhHQxn
         5ENaZTyOsSvvjarRKyUHTqM1hvNqn9kHoQZbcHT+BKgP8nQxjubUxdpjGs+bcY/VGc/I
         w3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838061; x=1731442861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5R/lLN3/PrKGOuDwgAKSQDkF20MfwWzMyZURNB3hjKw=;
        b=beUqd/C9u5tNRFnUnDm3xlwGhyH22h5DCJGjHYkG/zmq9s41oFVd8smUzNbqdZObGJ
         lwEcQdB1FpL0iaNNwO9T6QdJNp4FiRlob4rWa50ebwr1QItWsE2TmrBv+mLHtLUFKQo8
         r+wTYjaJ5iHHWb5ZNylC/KKSG62qZyRf8OuUdoAZLP3YogBvoh6w+c9HXN2uX19nmO1D
         bNTAt7TsblEDH/YcgJwYilXHe7EXmhTZ1lVYwQQ57HqwGFPVrPa92bG1in3/4bzZtw84
         mD6x7axgf79Vx+FlzAUjbYndgm3FO+nmgrvaqJyNZGpBdUnw34YlLA/WVwTEO0/ZCcWb
         gshg==
X-Forwarded-Encrypted: i=1; AJvYcCWFm0sBRTiTq9WHDacB/ZB6yH9vtK2GOjEUxxHFFq3INeGiBz1USrKt/XRUxJ/JZtFcUhPeOJslfOR0loWZiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMZH3FQArWZFajqYHi2hKIKW8YDXOPT+1ejeZRJLiJ1gi8N0qn
	Ug6mYYh8MFEe0xNyRxILTh05OP3GmIZ2L3ZORSfGolP8moLYvBcuBobvzbRquzt1aVrvlkRNAFR
	c6ubeFCRnMoSYqFsjf4Vn1+EjCBQ=
X-Google-Smtp-Source: AGHT+IHTiUB3QL8bBYDkaPjY3IDxycfcVH+rsrV9jjxKKL/YS9aDik+Le6yIdp3tgiS9VtufRSsCzBx7teI5cFlkJC4=
X-Received: by 2002:a17:90a:1549:b0:2e3:1af7:6ead with SMTP id
 98e67ed59e1d1-2e8f11a9c22mr18421914a91.5.1730838061468; Tue, 05 Nov 2024
 12:21:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104.110803.2105992905862489345.fujita.tomonori@gmail.com>
 <CANiq72nNMM5hCMa=hDbvpX6AVR5L2pswdQJ3AN05ynHx2Z3Q0w@mail.gmail.com>
 <OAtDBYR--B-9@tuta.io> <20241105.083343.2243442761267649401.fujita.tomonori@gmail.com>
In-Reply-To: <20241105.083343.2243442761267649401.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 Nov 2024 21:20:48 +0100
Message-ID: <CANiq72m1TrB=HpxABWEvOaYwXn6yZOJFHtyYnnvDLVyCSLbOcA@mail.gmail.com>
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: jens.korinth@tuta.io, rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 12:33=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> I think that all the architectures that support Rust implement WARN_ONCE
> in assembly. The simple wrapper for them doesn't work.

As far as I can see, `WARN_ONCE` uses the once lite support, not the
jump label one.

Which is why I assume Jens picked that name.

But even if that wasn't true...

> I assume that we simply can't cut and past the assembly in the C side
> so it will be complicated.

...we will have (going into -next as we speak -- Steven just picked it
up) a `RSCPP` rule that we use to expand C macros that end up in an
inline assembly string and then paste into a Rust file (cutting the
part of the file that is not part of that string).

It was added for jump label for tracepoints, precisely to avoid
duplicating the inline assembly.

Cheers,
Miguel
