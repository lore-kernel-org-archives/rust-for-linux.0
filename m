Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4699DD2E4
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 05:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPs5KoBx"
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745C794
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 22:17:28 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-693400e09afso1694022b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 22:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697001448; x=1697606248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+q3QvuILmqq/DuDVj4CLj5JYkiNE0DVm+JMDNIPSno=;
        b=MPs5KoBxOrfSBfd1+ttA3zvj9lnlIPNywgemHYZ/hwx5DfPn9fR8b1VVujL1MDRMGt
         y2wjFNB8chhJGOMiLwm4lpzLQnUn6LG9fWOBKFAuz7y4OTjWXQ6j5DuTgFrlUSi19z6J
         5I0FA5ETYhfQz1QnnXYPynTLS2Lzz2GINUvvB8PvvcXvCBCuMsbwtZ0Efb47GbtKrzLU
         jAc0Zie8GAv3Mgps3iUy/EhKmaWydu1Q7EN/kW068htLYrjOoLK9IfArpQqIZlG25f9M
         7+ktGQ3JIC4o/yuhKDMrI3qC7fqfdCXS7lOwjpks2a7hZqW2kHjUn67gc3y1+E3DuWMM
         wxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697001448; x=1697606248;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A+q3QvuILmqq/DuDVj4CLj5JYkiNE0DVm+JMDNIPSno=;
        b=wYEGQb09cQSa5Du85TEsKm81mSw5zVNwDonzzqVH5N+CjWpziXtI2gRK5qD2nFqNaw
         h26hpib7zzoikv4Qto/cgM9OxsENDMjHbqr8kWwmmEIbGddnEQamwYkY8nBOtDpbyfXn
         pqArzfTKOp0/oZVJ+377hD3B1Ymx/6pzGBJ61lxlZMGF/tWFh1qioDIHf0WcZtDkfsyY
         4g/dVU+iatbO6R5FuauOA4wK+dORVg+qbStNuUsOdTlRudy8ay+QgGkxFLvwFFjNdwzf
         FS/DpM1fQhu4eXaB+arjTlkChOUm7vxfpu6JTblIETf/oUhm5/9knHXJEWxOCpgTQH3G
         p/3w==
X-Gm-Message-State: AOJu0YzxkLtQKaCdJS4IUHtleGPy+RVWIW8a6719gU9BSJgcued0PZ8V
	EWNMGl4ncwSGmxTEd68sd44=
X-Google-Smtp-Source: AGHT+IEU3Oujn8QOl3LrqnP1NH9UfM+OiBuOVHUSuLWOuUDGwg/viuRSybvf7GWQXqErQYX6okEniA==
X-Received: by 2002:a05:6a20:429f:b0:15c:b7ba:e9ba with SMTP id o31-20020a056a20429f00b0015cb7bae9bamr24087949pzj.0.1697001447594;
        Tue, 10 Oct 2023 22:17:27 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id r11-20020a170902be0b00b001c9c879ee4asm929269pls.17.2023.10.10.22.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 22:17:27 -0700 (PDT)
Date: Wed, 11 Oct 2023 14:17:26 +0900 (JST)
Message-Id: <20231011.141726.2176048658709336226.fujita.tomonori@gmail.com>
To: wedsonaf@gmail.com
Cc: andrew@lunn.ch, fujita.tomonori@gmail.com,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu,
 miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANeycqpV12SCN19hA0dAiTD8XqPWCLy-=7ZT9NVdOjzKNy3d5Q@mail.gmail.com>
References: <CANeycqrwDjcZN2oYzH=HV12cfgeRD7TCpQWvFnyNGR1uXwre1w@mail.gmail.com>
	<6983f638-3ff9-4ce1-b948-62287bb4c298@lunn.ch>
	<CANeycqpV12SCN19hA0dAiTD8XqPWCLy-=7ZT9NVdOjzKNy3d5Q@mail.gmail.com>
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
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, 10 Oct 2023 22:56:52 -0300
Wedson Almeida Filho <wedsonaf@gmail.com> wrote:

>> > > (*phydev).link() == LINK_IS_UP seems more readable than
>> > > (*phydev).link() != 0
>> >
>> > Sure, how about you define and use LINK_IS_UP on the C side? Then
>> > we'll use your C definition and mimic the behaviour on the Rust side.
>>
>> Patches welcome.
> 
> Tomo?

Sure, I'll put this on my TODO list.


>> > > > The safety requirements for `from_raw` are (copied from above): For
>> > > > the duration of the lifetime 'a,
>> > > > the pointer must be valid for writing and nobody else may read or
>> > > > write to the `phy_device` object.
>> > > >
>> > > > You don't explain how the second part is satisfied.
>> > > >
>> > > > >From a previous thread, it looks like C is holding the phydev mutex
>> > > > while calling most of these functions. You should specify that as part
>> > > > of the justification for safety. And for the functions that C doesn't
>> > > > do that (IIRC, suspend and resume), you need to explain differently.
>> > >
>> > > Do you ever consider skipping documenting the safety assumptions and
>> > > just proving the safety assumption?
>> >
>> > Yes, I'd very much like to see that, but we don't have good-enough
>> > tooling at the moment to that at compile-time only.
>>
>> I don't see how tooling can determine that at compile time. Its in C
>> code for a start. Maybe some sort of cross C and Rust LTO if it had
>> access to the intermediary representation?
> 
> One way to do it at compile time is to attach pre and post conditions
> to each function (Hoare style). Then pre-conditions are checked
> locally at call sites and the tool fails (or requires manual
> intervention) if it can't prove it; pre-conditions in function
> definitions are then always considered true and can be used to infer
> additional properties.
> 
> The language used to express the pre and post conditions would likely
> need to be more expressive than C and Rust.
> 
> Anyway, we don't have that now and we won't have it anytime soon. So
> we need to argue in prose about the validity of our safety
> requirements. Tomo's argument is lacking here; AFAICT, it should be
> easy to fix, except for suspend and resume (which I still don't know
> what the claim is).

That comment was updated by review comments. Can you check the latest patchset?

https://lore.kernel.org/netdev/20231009013912.4048593-1-fujita.tomonori@gmail.com/T/

If you think that it's not still enough, why not sending a patch after
it's merged? It should be easy to fix.

About suspend and resume, what should we do? An exclusive access to a
device isn't guaranteed by locking. Instead a PHY driver trusts PHYLIB.

Adding more comments? Or make the functions unsafe?
