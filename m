Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03307F
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 02:31:51 +0000 (UTC)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C7AC2
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 19:31:46 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a707bc2397so993759b6e.0
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 19:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695609105; x=1696213905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqSIC1lo0wAQwvO7Uu7S2aPNOJnadQJZvA7aRJClP9M=;
        b=KE1ZVSennf36bpAdwU/tS1ZD2CwbOplbO8AJ0iXdnBlgf164a9LYkxsvo1AIkyrt6u
         K8D4dnjcmPYLese2CCSBOoaql/p1xGuLkfWlUTPXi8zNeVzzsSY4rIvE1bzeIg23AJrY
         67+b1CSaxk+W0R050TwJdPHg/TQ8duLP87zkd4o5G9QOJbgHDBHZ5EkeOT6+o9ZEWzX2
         FmGhBmHnoeJne0PXhrLGCEUWCrRbFtZA+iR3VLzK2EuXeekctTilBIa8wlnM3G6mOU90
         3lvoa7g6TPqJbhs0fNU/3hoRiWR1mOx2ae1gYNl00M5Klvvg26GMpzkkjWBDjrO7TCK0
         +8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695609105; x=1696213905;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AqSIC1lo0wAQwvO7Uu7S2aPNOJnadQJZvA7aRJClP9M=;
        b=Et6OHmnX6xwGYUxuZyppCtnVracYuszkRAwU2VMkEJbKBzwcr2Z7xfGpUbydzjpBRc
         aFs1y7EwckIc017NQ8DaCSkX/54h2lxMfr1S23gPaa1uCBQkDAOJ0CEOxK7dMx5pM5pf
         EwutAC/tOHZNk3hFm0ZHTRspcOGNYJCygnonWMV2aLnvqF8XPOdHYUQQaXp6FUbGZS2k
         EYLLiv4ZSJc1pTrC8ODHtZIvHYK9E2PL0tpWCG794IaeuUgQFPjZRljYi+XwJ1bOzD2w
         QeE9/2yWUENIaOG8DIEP8r2IiBy7yyN4YPw0wG10gmrSxlsTCumIvnUDeENce64Z1VFo
         Xtcw==
X-Gm-Message-State: AOJu0YyfYbb45Ck38t4dI+KN9Yqm4ee4U+DIV4PlvIP0+QO+Jhi9uDZD
	BAMnX0i8cleZuwKal9dHtOOVEFOFHQ6dbIJC
X-Google-Smtp-Source: AGHT+IFuL+f8bkFMwv3wDhVeWrcYs61vnboI0hTRFOSoGo3dlxRQuXfD2sr1hUl7Nkmc9M0s2iLlxQ==
X-Received: by 2002:a05:6808:14d4:b0:3ad:f535:7e9a with SMTP id f20-20020a05680814d400b003adf5357e9amr5807923oiw.5.1695609105573;
        Sun, 24 Sep 2023 19:31:45 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id x2-20020aa784c2000000b006884844dfcdsm6939317pfn.55.2023.09.24.19.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 19:31:45 -0700 (PDT)
Date: Mon, 25 Sep 2023 11:31:44 +0900 (JST)
Message-Id: <20230925.113144.1386170821862173008.fujita.tomonori@gmail.com>
To: benno.lossin@proton.me
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 3/3] net: phy: add Rust Asix PHY driver
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <f99d93a0-52f7-ed2d-67ab-40a8b2927e89@proton.me>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
	<20230924064902.1339662-4-fujita.tomonori@gmail.com>
	<f99d93a0-52f7-ed2d-67ab-40a8b2927e89@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, 24 Sep 2023 13:33:05 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

>> +struct PhyAX88772A;
>> +
>> +impl PhyAX88772A {
>> +    const PHY_ID: u32 = 0x003b1861;
> 
> Why are you specifying this constant twice?
> Doing this solely in the `impl Driver` block
> should be sufficient.

Oops, leftover from v1. fixed.

>> +}
>> +
>> +#[vtable]
>> +impl phy::Driver for PhyAX88772A {
>> +    const FLAGS: u32 = phy::PHY_IS_INTERNAL;
>> +    const NAME: &'static CStr = c_str!("Asix Electronics AX88772A");
>> +    const PHY_ID: u32 = Self::PHY_ID;
>> +    const PHY_ID_MASK: u32 = !0;
> 
> Why is this some magic number? It should be
> a constant with a nice name.

Fixed, it's already a constant in phy.rs but not public.
