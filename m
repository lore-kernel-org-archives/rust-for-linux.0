Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB60C208BF
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 11:03:19 +0000 (UTC)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2F51BF8
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 04:03:18 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d81b42a3108so19381276.1
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 04:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694689398; x=1695294198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5C9za9blCQHyXh1IcLq+8F27J8MaJ/h4uYFjqdXU9w=;
        b=ZiqD8SALJTCjK28u9yfo0mCUwdnxW70Jp+lOtSvPn8Jj8r4yb0RBwxj2kBj4FWCk61
         9ueEwOdozR2gocGT2A/0CzG+1bZw4arPlpynbhLp76RikJUcke7oXdAuDEuJVPXwSc1I
         04VxVrBfCmp7mZEmU6qbZGzjNcwi75g6cSOCnSFnrL8Dzhm/3Rk5Fba0ZWGdUBPBgpsa
         HNHhSpbKgM7Y6MYqpVackoYcdtV203XBYhkvoJxkHA1s07ZxjRkj6FfNqfQyoeyFxDms
         AJtuxuUWUHjw9kJlPY0K/MQB13LUA32jQEYSbhin5ExpiKWZZl0+FfImNFKFZHdUOjTf
         RkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694689398; x=1695294198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5C9za9blCQHyXh1IcLq+8F27J8MaJ/h4uYFjqdXU9w=;
        b=mpdOc6fZBVAJbg0hSA2S5YUl0WzUEQjphekjnSMHkRSTCra/eSzca+aZupx9QlulHP
         K7ehmsgPcJlevO/AHYGbKwDUOLDGeWiAHLIi2q9CBdtLPhfmkB4RbErJ3goV7s9XCENT
         Zp2dkiPwVHhlDtp96Yfjpnmq7CsM7g0UKqqL8ILccVWsc06BdcqY0NnNtjf03Fg/3hDl
         rtQOeuOfcc9bz2yBZUbPR4LWN7WUktoW/pGoyNbjqfZsqeytn1oHfuVBvI+nq/ZojhVX
         yQSY0nNIcyuvbMG2rLgL8nGTQ5J7pqhQmxi7OG+YCQoZ66nShi94oDWc2DLyovfxwo6H
         5JBA==
X-Gm-Message-State: AOJu0YwBerzvD07PIqyQgYdPq2aOHUGmEQQzqeW5ECZPT/lVdfDb2Adf
	6/rFkdXT1Pu0A/hiQVIaDibRkNK/jvornORr0kw=
X-Google-Smtp-Source: AGHT+IEZTJTy8x2kXtQA5A4tMW2CDmTBpVybWemcRjtq3IwrTCDf5PuhXgJKOjFgMvryXTs23J+ecgT12iRPXyPdIfM=
X-Received: by 2002:a25:e6c3:0:b0:d74:6cdc:290d with SMTP id
 d186-20020a25e6c3000000b00d746cdc290dmr4563124ybh.36.1694689398068; Thu, 14
 Sep 2023 04:03:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com> <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
 <CANiq72nPjG2insBR3STcFhKcPo2ORforrinSAYHf18aJz7saCA@mail.gmail.com> <054de168-d56e-4e95-a628-7f41b621ba86@lunn.ch>
In-Reply-To: <054de168-d56e-4e95-a628-7f41b621ba86@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 Sep 2023 13:03:06 +0200
Message-ID: <CANiq72=n1_JwmGKUw4968sMQRyY25=XMzTWufhKGeebfuSoUDw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org, 
	Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 2:30=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> If this happens, it is because the C and Rust code has diverged. We
> want it to be loud and obvious when this happens, so a WARN_ON() and a
> stack trace is what i would recommend. Or better still, some way to
> trigger a BUILD_BUG_ON() at build time.

If it cannot ever happen, then definitely we should do that (and keep
the function `-> DeviceState`), of course. Otherwise, a Rust panic
could also be justifiable in that case (if we are really sure it
cannot happen), or even assuming it and using `unsafe` (if needed for
performance/size).

What I meant to say is that, in general, it is a good idea to make
invalid states unrepresentable, i.e. to have a `DeviceState` without
`Unknown` (and to achieve that, the function can reach for one of the
alternatives above). That way, when we pass around a `DeviceState`, we
are guaranteed it has one of the expected values.

(i.e. if I understood you correctly, you wanted to have `WARN_ONCE()`
without changing the return type, which would mean keeping the
`Unknown` case)

> Hum, does the kernel Opps code understand Rust symbols, and can unwind
> a call stack which is a mix of C and Rust functions?

Do you mean for printing the backtrace in `WARN_ONCE()`? (you get
Rust-mangled symbols)

> let y: u64 =3D bit(34).into();
>
> Seems a bit verbose, compared to the CPP macro BIT(). But lets see it
> in action.

Yeah, that one is a type, but we could have a function or a `bit!`
macro for getting a raw integer,

Cheers,
Miguel
