Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF3E20FA
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 10:17:14 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C4812A
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 03:17:10 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-68cc1b70e05so848640b3a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 03:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694945830; x=1695550630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pRiiEiJJEtj8Yhmorw3dKTyG9+Jnpg9e6pPv8vaYkU=;
        b=EB3yYM+sd4qEFpmHeU5vtB15lDNpfOlnCqEYg6NRZNDy9CKoarBVHwle7pdPVyhU7c
         yc3GRDOhDUe7pbcHjJ5i8PvXzl/f5supIl6TXEFoH03CsEAzDj8E3z03Xzss7KrlNL5u
         i2UDEGXHCOBs6vd7vDChWS1N60ezIcpKLaxIpC/CUdNCpmBu+QgGDhCf3XxiEnkkEkK9
         77FLJE5XaZhrxbW45mG49RIUXfTwpd+w2nvxZFMIR2V3hqoiGApARbnh7wEELbsnaNEW
         +w9NyDNMvtrhC1j//Y/y9A6P6DhWn8nrPrTPZKW1z6meWkB+9wsepWP2osx5Tjq9p8sQ
         IIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694945830; x=1695550630;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5pRiiEiJJEtj8Yhmorw3dKTyG9+Jnpg9e6pPv8vaYkU=;
        b=GprTCf9356ygi47wyy4Fh8wVwsJ77Z7mrY3hoFAZ2AQxNMem92uPg05yVpNYtVMRqY
         IIUNG9js1U/w3yWB0V7D6YR3SKafvAbhVWV+w7Zu7Ut8Gyvu3nVd/xTb+yB6heFjGg7a
         j85WSDAA0gctWu0OHVoUh6mQaOA4RuIurYWiTPgWG2Pvfq4sKCqxgKK6S3O4pBSoIrmE
         Hh9y++vR/ew4k5jlX3H/FiNfLllB/I5FH7W0afNi9Lu9hkoYY8Ei3kwX69LR1pKCv1nK
         8zjAY2HO8mZZ+mVM/gcGIcZWbhWiXWqZ2fo5caaaawIseMorFiXyFFQCLp+LLwpNXzgX
         8U6A==
X-Gm-Message-State: AOJu0Yw+J9AvgfgQNlB0Wztc9JAxm8IgNDCaSu7M2fS6O0gd9mhFz+fB
	y/Ldp8WxkSZ5O+W6aiBipzuc9T85iFlLiGbO
X-Google-Smtp-Source: AGHT+IEkePnRukw+cq9fIRUkZkERnj2K+qX5QErXb4QhlP1ik9ztOodEpsmtS617bRIOevZ9f9tECA==
X-Received: by 2002:a05:6a20:394c:b0:13e:1d49:7249 with SMTP id r12-20020a056a20394c00b0013e1d497249mr7521008pzg.2.1694945830030;
        Sun, 17 Sep 2023 03:17:10 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id n17-20020a639711000000b0057412d84d25sm5157453pge.4.2023.09.17.03.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 03:17:09 -0700 (PDT)
Date: Sun, 17 Sep 2023 19:17:08 +0900 (JST)
Message-Id: <20230917.191708.2174483069021340663.ubuntu@gmail.com>
To: andrew@lunn.ch
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
	<20230913133609.1668758-2-fujita.tomonori@gmail.com>
	<ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
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

On Wed, 13 Sep 2023 22:11:57 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

>> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
>> +        unsafe { &mut *(ptr as *mut Self) }
>> +    }
>> +
>> +    /// Gets the id of the PHY.
>> +    pub fn id(&mut self) -> u32 {
>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
>> +        unsafe { (*phydev).phy_id }
>> +    }
>> +
>> +    /// Returns true if the PHY has no link.
>> +    pub fn link(&mut self) -> bool {
>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
>> +        unsafe { (*phydev).link() != 0 }
> 
> That seems an odd way to express it.
> 
> unsigned link:1;
> 
> It is a bitfield of 1 bit. So why not simply == 1 ? Or even just plain
> (*phydev).link() ?

The accessors is generated for bitfield. In this case:

pub fn link(&self) -> core::ffi::c_uint;
pub fn set_link(&mut self, val: core::ffi::c_uint);

a bit weird for 1 bit though.

The function name should be something is_linkup()?


>> +    /// Sets duplex mode.
>> +    pub fn set_duplex(&mut self, is_full: bool) {
>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
>> +        unsafe {
>> +            if is_full {
>> +                (*phydev).duplex = bindings::DUPLEX_FULL as i32;
>> +            } else {
>> +                (*phydev).duplex = bindings::DUPLEX_HALF as i32;
>> +            }
>> +        }
>> +    }
> 
> How is DUPLEX_UNKNOWN handled? Duplex is not boolean. If we don't have
> link duplex is not known yet, so should be set to DUPLEX_UNKNOWN.

Understood. I'll fix.

>> +
>> +    /// Executes software reset the PHY via BMCR_RESET bit.
>> +    pub fn soft_reset(&mut self) -> Result {
> 
> I suggest you keep to the genphy_ naming if possible, to make it clear
> this is using a generic PHY method.

I'll keep the genphy_ naming for all the genphy_ functions.


>> +    /// Reads a given PHY register.
>> +    pub fn read(&mut self, regnum: u32) -> Result<i32> {
> 
> I suggest you get hold of a copy of IEEE 802.3. It is free to
> download. Check out clause 22 and clause 45.

I've just started to learn.


> There are two registers spaces in PHYs, defined in clause 22 and
> clause 45. These are known as C22 and C45. C22 states there are 32
> registers which are u16. C45 has 32 x 32 registers, which are u16. The
> core of phylib is a bit messy, but phy drivers have a clean API. To
> access a C22 register phy_read()/phy_write() it used. To access a C45
> register phy_read_mmd()/phy_write_mmd() is used.
> 
> I would suggest the comment becomes "Reads a given C22 PHY register".
> 
>> +    /// Writes a given PHY register.
> 
> Writes a given C22 PHY register.

Will fix.

>> +    /// Reads a given PHY register without the MDIO bus lock taken.
>> +    pub fn lockless_read(&mut self, regnum: u32) -> Result<i32> {
>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor,
>> +        // so an FFI call with a valid pointer.
>> +        let ret =
>> +            unsafe { bindings::__mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, regnum) };
>> +        if ret < 0 {
>> +            Err(Error::from_errno(ret))
>> +        } else {
>> +            Ok(ret)
>> +        }
>> +    }
> 
> Now we are getting into the hairy stuff. Locking is
> interesting. Rather than duplicate all the interesting stuff, can you
> just use the high level C functions? In fact, the driver you posted
> does not need anything other than phy_read() and phy_write(), so i
> would not even bother with these yet.

Yeah, I can't figure out a clean way to handle this.

The realtek driver uses them:

https://github.com/fujita/rust-realtek-phy/blob/master/rust_realtek.rs#L33

It implements .read_page and .write_page so read and write without
locking the MDIO bus are necessary? Can we do in differently?


>> +/// PHY is internal.
>> +pub const PHY_IS_INTERNAL: u32 = 0x00000001;
>> +/// PHY needs to be reset after the refclk is enabled.
>> +pub const PHY_RST_AFTER_CLK_EN: u32 = 0x00000002;
>> +/// Polling is used to detect PHY status changes.
>> +pub const PHY_POLL_CABLE_TEST: u32 = 0x00000004;
>> +/// Don't suspend.
>> +pub const PHY_ALWAYS_CALL_SUSPEND: u32 = 0x00000008;
> 
> Does Rust have the concept of a bit? Anything like the BIT() macro?
> We have seen bugs where developers have not realized these are bits,
> and so have defined 1, 2, 3, not 1, 2, 4. We can avoid that sort of
> error by using BIT(0), BIT(1), and then the next one is obviously
> BIT(2), not 3.

I'll try bit! macro in the next round.


>> +/// Corresponds to functions in `struct phy_driver`.
>> +#[vtable]
>> +pub trait Driver {
>> +    /// Corresponds to `flags` in `struct phy_driver`.
>> +    const FLAGS: u32 = 0;
>> +
>> +    /// Corresponds to `soft_reset` in `struct phy_driver`.
>> +    fn soft_reset(_dev: &mut Device) -> Result {
>> +        Err(code::ENOTSUPP)
>> +    }
> 
> This is beyond my limited knowledge of Rust. The PHY core assumes for
> most of the ops in phy_driver it is either a valid function pointer or
> NULL. We have code like:
> 
>        if (phydev->drv->soft_reset) {
>                 ret = phydev->drv->soft_reset(phydev);
> 
> and
> 
>         if (phydev->drv->set_loopback)
>                 ret = phydev->drv->set_loopback(phydev, enable);
>         else
>                 ret = genphy_loopback(phydev, enable);
> 
> So the default cannot be a function which returns -EOPNOTSUPP. It
> needs to be a NULL.

It will be a NULL if a driver doesn't implement.

This is not Rust stuff; kernel Rust specific. If abstraction code
implement a function, a driver doesn't need to implement it. If the
driver doesn't, the function pointer is set to NULL.

If abstraction code just declare a function, a driver always need to
implement that function.
