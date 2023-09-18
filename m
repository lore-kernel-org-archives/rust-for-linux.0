Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C59566A
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 08:35:30 +0000 (UTC)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353D28F
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 01:35:29 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-56f8334f15eso258220a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 01:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695026128; x=1695630928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYrY92p9CKf86pBL8RGbeuaubduhcQ+S2obpNz3xkSM=;
        b=RuKwhKQvnWEcYKEvf3kyH3KICbbF50ksSPT6JbAXVCKD6c9CJS1tE8vVyn4Ov1TRGw
         699vDiX5f6t7ux95a/otVq0DlsWMyh1AwrK8BGKwWSveuMKdrr5G59jncSE1osedOEdy
         MeqJhBaWYLliE5xMKqnON1M70gPqZ1Xf9tVM217cAbz6lQqLRSvIFa4gGUBu2IfVriC3
         RvTBnLQIifvpf/hNI9vH7WWMiJj96pLQpWrbl3ohmKnnXa0Ixq2vj4gnwXmFdq6w7nDn
         3KSUfnTKlXzGdHM4Yy2brSJj71/OuUcyhBi5lPZGRJP8lWvOdyWnlisyIqDIVkP2Mg90
         l8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695026128; x=1695630928;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aYrY92p9CKf86pBL8RGbeuaubduhcQ+S2obpNz3xkSM=;
        b=uPI/UA7KAVXzKqZBjlfR46/m6nErbBHnxGCFeVYGlvYHzFMfQXTc+wfyP4FhQ66NIO
         zpKQBJJITSu+EQJQOzsk7gg+Ct5ZHFlCFgELBcZrCBCuRytDlzVmSWCymiTxiI1Wc3FG
         eGwfeGnxoNtuo0outrQc0UbhzBSDt/CKvltQ9TqYa/XhsQOFfbIyTa23IqsHWx6ak4Jc
         NtWxcYnU2omscMfyDhsAZTJvrQCw2iLNOuPm75GTu6SgLWi+/LNnouxcwI/KkAThxxBS
         JplAYDtr6x7rW98sluug+X3BMcRjlJsL8lVzcX4eukkl6iAqd+5Nyo74cOuoM8Ur60Cu
         PTWw==
X-Gm-Message-State: AOJu0Yy5K/JsLSw5Z6mGPOLr01PeW+g7jkMDo2L5TMPAQT7JZpCDHBAS
	55exD+pwHvyLssWvPutuojk=
X-Google-Smtp-Source: AGHT+IFcsLBU11ZUuM1T8AIIJ/n3PObtwCH0CV7JyxOsb2YmgAw63T44bk3Mm3Q3PMYtubXrYm9YIQ==
X-Received: by 2002:a17:903:32cd:b0:1c3:6d97:e897 with SMTP id i13-20020a17090332cd00b001c36d97e897mr10068287plr.5.1695026128404;
        Mon, 18 Sep 2023 01:35:28 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id bh3-20020a170902a98300b001c55d591f07sm2051157plb.260.2023.09.18.01.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 01:35:27 -0700 (PDT)
Date: Mon, 18 Sep 2023 17:35:27 +0900 (JST)
Message-Id: <20230918.173527.1946752214085636243.ubuntu@gmail.com>
To: andrew@lunn.ch
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <0b6f8110-b4fd-4d20-a97f-9d7df26c23f0@lunn.ch>
References: <52517bd0-66fe-4275-bef1-afabc906e836@lunn.ch>
	<20230917.202804.2074374258417179605.ubuntu@gmail.com>
	<0b6f8110-b4fd-4d20-a97f-9d7df26c23f0@lunn.ch>
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

Hi,

On Sun, 17 Sep 2023 17:46:39 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

>> >> +    fn read_status(dev: &mut phy::Device) -> Result {
>> >> +        dev.update_link()?;
>> >> +        if !dev.link() {
>> >> +            return Ok(());
>> >> +        }
>> >> +        let ret = dev.read(MII_BMCR)?;
>> >> +
>> >> +        if ret as u32 & BMCR_SPEED100 != 0 {
>> > 
>> > PHY registers are u16. phy_read() returns an int, so it can have
>> > negative return codes. But if it is not negative, the positive values
>> > are in the range of 0 to 65535.

Sorry, I should have commented in the previous reply. ret can't be a
negative here due to how to hanle an error in Rust.

let ret = dev.read(MII_BMCR)?;

Here '?' means that if an error happens, return with an error
immediately. So the ret is set only if dev.read() is sucessful.


>> A negative is an error?
>
> phy_read() can return values like -ETIMEDOUT, -ENODEV, -EIO etc to
> indicate something when wrong. So you should see the general pattern
> of:
> 
>         foo = phy_read(phydev, MII_M1111_PHY_EXT_SR);
>         if (foo < 0)
>                 return foo;
> 
> After probe, the probability of an error is very low, and generally
> there is no recovery. So not all drivers do check the return value.
> 
> There is also a second C problem here. Because a PHY register is a
> u16, you sometimes see code like:
> 
> 	u16 reg
> 
> 	reg = phy_read(phydev, MII_M1111_PHY_EXT_SR);
> 	if (reg < 0)
> 		return reg;
> 
> which compiles cleanly, but is wrong.. The folks running static
> checkers then report the bug.
> 
>> If so, this function should be:
>> 
>> fn read_status(dev: &mut phy::Device) -> Result<u16>
> 
> No, it needs to return the negative error code, or 0 on success. This
> is a very typical pattern in Linux.

This is a way to handle an error in Rust. If a function could return
an error, it returns a Result type, which is either success or
failure. Either could carry an value.

Result<u16> means if success, it carrys u16. If failure, in Rust for
Linux, carrys an error code from C side.


>> >> +    fn suspend(dev: &mut phy::Device) -> Result {
>> >> +        dev.suspend()
>> >> +    }
>> >> +
>> >> +    fn resume(dev: &mut phy::Device) -> Result {
>> >> +        dev.resume()
>> >> +    }
>> > 
>> > Can we avoid this boilerplate? A lot of phy drivers will make use of
>> > genphy_foo calls in their struct phy_driver. It would be annoying if
>> > each driver needs silly little wrappers like this.
>> 
>> you meant that C style like
>> 
>> {
>>         .suspend        = genphy_suspend,
>>         .resume         = genphy_resume,
>>         .soft_reset     = asix_soft_reset,
>> }
>> 
>> is clear than Rust style
>> 
>>     fn suspend(dev: &mut phy::Device) -> Result {
>>         dev.genphy_suspend()
>>     }
>> 
>>     fn resume(dev: &mut phy::Device) -> Result {
>>         dev.genphy_resume()
>>     }
>> 
>> right?
> 
> Yes. If you really must have these wrappers, they are not specific to
> a driver, so should be placed somewhere common where any driver can
> use them. There are around 60 of these genphy_ functions. Because what
> a PHY does is mostly standardised in IEEE 802.3, PHY drivers heavily
> use these functions to do the core of the work, and then deal with
> vendor extensions and vendor bugs.

Understood. I think that there are other places like this in the
kernel, operation function pointers that could use generic functions.

Rust people, Any opinions on a different way than vtable macro?
