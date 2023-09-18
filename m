Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ECD21113
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 16:09:09 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D782526E
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 09:08:33 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-760dff4b701so58756339f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 09:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695053313; x=1695658113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qzZ2KUnsPeMuNFJGdUYCcuxFBHl3Xe4VgrRDfjLFuc=;
        b=elsCAuktgTA4MV3rycHpWa2pGSOj8aYXkZrZs1rnc7pCDjQuQ7IkkldkfVaOZ7Ssn7
         J+YFDizslIlB1TzOzlwnDyUP4D5mRmcKp6h1DwfzdjD9VB2JHfAuiBopvoyOHvn5s9My
         FTuzOA+S+rdK3BhccMoauw5DSHbH0L28/bIiFJR5OVZI9XHzSio3P8PvtrOVqZjA4Y8r
         0zzzJIAljiWQnQ4uiJJsJFd+EZddeKhh/vhw1/ILhJKUvZjKjg+ixSfD4wcqBphuWDRH
         R/c8WHRs3IMcZP3j266UWlwGKV9CnVv0A4rebYlSdqjtr0mA2aZMDHIE8MsRprAxrOG+
         R8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053313; x=1695658113;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6qzZ2KUnsPeMuNFJGdUYCcuxFBHl3Xe4VgrRDfjLFuc=;
        b=nxFjgGVhjWn61fteJX/sGPZJbz+Qru+4mps0nmL50HFfsTRPmybImkEhOT6ylKLGzt
         14UivxzokRYVxpSM7U43GLQ1hk2jzaIu2dj0VOjiApJscDT1aAtQ7mDXp5eF9KFdswHs
         AR6Vs9lxKrhp8TsvQ1+l1xv23QCKwpqeBsmN3bJm6irOpkjfGPqqCcbh1fyUUZGZUYik
         28UfXLcr1aZrN++xEkMrm4bPPt0lPAiHCpbFaWA/pZY8CPnffJFZ4huKYtujIInhctGE
         9EH2Ao42p6jgY27+QiyGcGzM4hSwjk5na/scuBBIsCKK296u7w7AKFlHSFM0DutahCt1
         /PIA==
X-Gm-Message-State: AOJu0YxRQpavSQhrlcDXnevwZ8MIyt5f4iU3/ZhzB0j9bYJ8ANx80MXq
	n1A46FB2rtx/4LbvRghnttTDTNM0QWh2ac0E
X-Google-Smtp-Source: AGHT+IE3NngnUHmh5/3DtrGxQ8an/8kUJf8nYwhn+0T5HoyP2krL21GBODFnaUTcF/07pf5Bsgjcwg==
X-Received: by 2002:a17:902:f68f:b0:1c0:bf60:ba4f with SMTP id l15-20020a170902f68f00b001c0bf60ba4fmr11138365plg.4.1695042547063;
        Mon, 18 Sep 2023 06:09:07 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902db0100b001b03f208323sm8251377plx.64.2023.09.18.06.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 06:09:06 -0700 (PDT)
Date: Mon, 18 Sep 2023 22:09:05 +0900 (JST)
Message-Id: <20230918.220905.1497497848303760774.ubuntu@gmail.com>
To: benno.lossin@proton.me
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <532b57ad-6d35-f0ee-1433-b9b63a91fdd5@proton.me>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
	<20230913133609.1668758-2-fujita.tomonori@gmail.com>
	<532b57ad-6d35-f0ee-1433-b9b63a91fdd5@proton.me>
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

Hi,

On Mon, 18 Sep 2023 10:22:22 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

>  > +/// PHY is internal.
>  > +pub const PHY_IS_INTERNAL: u32 = 0x00000001;
>  > +/// PHY needs to be reset after the refclk is enabled.
>  > +pub const PHY_RST_AFTER_CLK_EN: u32 = 0x00000002;
>  > +/// Polling is used to detect PHY status changes.
>  > +pub const PHY_POLL_CABLE_TEST: u32 = 0x00000004;
>  > +/// Don't suspend.
>  > +pub const PHY_ALWAYS_CALL_SUSPEND: u32 = 0x00000008;
> 
> I think we should create a macro for creating flags, it should create a 
> newtype and
> work similar to an enum declaration. On the newtype it should implement 
> the `Or` trait
> for allowing `PHY_IS_INTERNAL | PHY_RST_AFTER_CLK_EN`.

You are thinking about something like:
https://crates.io/crates/enumflags2

?

>  > +/// Registration structure for a PHY driver.
>  > +///
>  > +/// `Registration` can keep multiple `phy_drivers` object because
>  > +/// commonly one module implements multiple PHYs drivers.
>  > +pub struct Registration<const N: usize> {
>  > +    module: &'static crate::ThisModule,
>  > +    drivers: [Option<Box<bindings::phy_driver>>; N],
> 
> Why is this not a vector? You have to allocate in `register` anyways.
> You could also use `Vec::try_with_capacity(N)` to initialize the vector with
> capacity for N elements.

I thought that this is simpler. What are advantages of Vec over this?


>  > +impl<const N: usize> Registration<{ N }> {
>  > +    /// Creates a new `Registration` instance.
>  > +    pub fn new(module: &'static crate::ThisModule) -> Self {
>  > +        const NONE: Option<Box<bindings::phy_driver>> = None;
>  > +        Registration {
>  > +            module,
>  > +            drivers: [NONE; N],
>  > +        }
>  > +    }
>  > +
>  > +    /// Registers a PHY driver.
>  > +    pub fn register<T: Driver>(&mut self, adapter: &Adapter<T>) -> 
> Result {
> 
> The way this function is used in the driver makes me think that the 
> `Adapter`
> type does not have to be public. So I would suggest to change the 
> signature to
> `pub fn register<T: Driver>(&mut self, name: &'static CStr) -> Result`.

Ah, right. I'll in the next round.

> 
>  > +        for i in 0..N {
>  > +            if self.drivers[i].is_none() {
>  > +                let mut drv = Box::try_new(adapter.driver())?;
>  > +                // SAFETY: Just an FFI call.
>  > +                let ret = unsafe { 
> bindings::phy_driver_register(drv.as_mut(), self.module.0) };
> 
> This call exposes the driver to the C side and thus it is able to be 
> modified at any time,
> which means that in Rust it should be put into an `UnsafeCell`, better 
> even in this case it
> should just be `Opaque`, so the `drivers` fields should be of type
> `[Option<Box<Opaque<bindings::phy_driver>>>]`.

Understood.

> It would also be a good idea to pin it, since the C side will rely on 
> the pointee not moving
> and it will prevent accidentally moving it.

The above drv is touched by only this file. What possible cases where
it would be moved?

