Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C01C187E
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Oct 2023 05:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="nzLnkJsF"
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E4FBD
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Oct 2023 22:41:15 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59f4bc88f9fso40956157b3.2
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Oct 2023 22:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696743675; x=1697348475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCb4+UxH6VOx93WA8wa+Sb6s6TIg+WvR43TpytW6CYo=;
        b=nzLnkJsF9VcVb2smT8/0i6FNDtEwwtbsv6GJ73++0BgDhLv51UKndPJRWZBj6+UkRY
         YM37uNiYzUobsdEY9p91fX3epzXxg+SQafrN0tZ9em5gcCzz6VtucNwpXmHQMkctsAbA
         fcj6WbrY4TDIrFNZBc2InQjCjyEKDYXZtPGh996fJiWuENakMX0cyQW6rZUT96mVK4Ti
         CfNGSr1cITJ/Awg88R68v0QtayYvv+Sf9AyZ5OJVvXc6pCpBWJsad2Jy8p6HFA88qCw9
         L7GRMN4Kvw+v8qf/1nfZ2QTE3qCFBhAtZF3T1yL9Y6iYOIeEDajIE6vkbl+dg+gmiLLM
         W3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696743675; x=1697348475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCb4+UxH6VOx93WA8wa+Sb6s6TIg+WvR43TpytW6CYo=;
        b=BozCYrodG50Hq264HqRj2s1WETFdG1D/B4hnGLocB9X/lU4xZFEKUmbeaLtaaZW0vA
         qdkHNERUV6h0F7S8te7hxQkgKZqUDDbhbZSMTCwFYOawQde9zfsYgKqPK+/5RAI4L2ee
         xCjRaCor2F+GmzP5Bgl/B00B2Rlmi/L7MKIMQSm4E9+LjpL/9ypgxdPwzuecrFY3Ipfb
         Q/xuK37C5goNaZyayRdP5rfMoIeWvjA4SL1rrGgG8Ooxaqj/on8iLQo7K/XAvqJE4A8b
         l+J8bIYyCYAoc56gqrozVkULWrG4CZ7LHFuki/tpoXxcNo338QPrUprqWFCxuu3tTZMW
         lrsw==
X-Gm-Message-State: AOJu0YxO24OGMIKjj0yGexy6v4kq7OHcxQJ/FuscEpKKJXhMQtNjvpoD
	nUTpy8dbO866XHEr1swaZOlB9olTA8aQtfHaMpac/pQavOc8Q/FQWkG1dg==
X-Google-Smtp-Source: AGHT+IG7CAHeV343kwOXw+s1arT79L8yQuwHXEmqFvrnHVrMxPcTGVs2/R5kuaWpladeD6jWZz3JodNt1cWKhnI27Gg=
X-Received: by 2002:a81:8491:0:b0:59f:4e6d:b569 with SMTP id
 u139-20020a818491000000b0059f4e6db569mr13248266ywf.4.1696743674934; Sat, 07
 Oct 2023 22:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231006094911.3305152-1-fujita.tomonori@gmail.com>
 <20231006094911.3305152-2-fujita.tomonori@gmail.com> <CALNs47sdj2onJS3wFUVoONYL_nEgT+PTLTVuMLcmE6W6JgZAXA@mail.gmail.com>
 <96800001-5d19-4b48-b43e-0cfbeccb48c1@lunn.ch>
In-Reply-To: <96800001-5d19-4b48-b43e-0cfbeccb48c1@lunn.ch>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 8 Oct 2023 01:41:02 -0400
Message-ID: <CALNs47s0bpyL1Zo9VmXcyG2X1SKLB3WZdrG+OOCfWi_uQUiYjA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	greg@kroah.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Oct 7, 2023 at 10:48=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
> After reading the thread, we first have a terminology problem. In the
> kernel world, 'user input' generally means from user space. And user
> space should never be trusted, but user space should also not be
> allowed to bring the system to its knees. Return -EINVAL to userspace
> is the correct thing to do and keep going. Don't do a kernel splat
> because the user passed 42 as a speed, not 10.

Yes, sorry about the terminology. I was indeed referring to a user of
this function and am still figuring out the failure modes (thanks also
Greg for the corrections).

> However, what Trevor was meaning is that whoever called set_speed()
> passed an invalid value. But what are valid values?
>
> We have this file which devices the KAPI
> https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/ethtool=
.h#L1883
>
> says:
>
> /* The forced speed, in units of 1Mb. All values 0 to INT_MAX are legal.
>
> and we also have
>
> #define SPEED_UNKNOWN           -1
>
> and there is a handy little helper:
>
> static inline int ethtool_validate_speed(__u32 speed)
> {
>         return speed <=3D INT_MAX || speed =3D=3D (__u32)SPEED_UNKNOWN;
> }
>
> so if you want to validate speed, call this helper.
>
> However, this is a kernel driver, and we generally trust kernel
> drivers. There is not much we can do except trust them. And passing an
> invalid speed here is very unlikely to cause the kernel to explode
> sometime later.
>
>    Andrew

I didn't mean the suggestion to be a way of handling untrusted input,
just a means of providing a fallback value with module author feedback
if something > INT_MAX winds up getting passed somehow.

Agreed that this is more than necessary for such a trivial situation,
the original is of course fine.
