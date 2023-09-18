Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45E15C9
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 06:01:22 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810F3F9
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 23:01:19 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68fc49ccbf2so1463125b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 23:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695016879; x=1695621679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRQgvhY4U4z2ruT7FwvR+MpUWERGJaWWnA2mdcDXq9I=;
        b=hygwErOEVnkaO53q5MbOEHCQNU22Gkf8pxgblmYzNTD5o8MOnAN1d615WKqzI+pTiH
         aTgcibErxewtyDGjBF+wLdpQUDJ/3K6QobSreJwgUDKQKKohg2bMZq6J90T0pzABbMXw
         k2zT/rtFSEOhiN7JnQoiGnBOuz4R7vE28qzz6IjOUdJ7xV85DwEo3ifjXOPn40WfTbES
         6nkOdTYKJkD36wHCT4TQKxuR970OCCJTgyhyycq6X3AENWV9deVOfjvssBoBSfPRAnIe
         IR8KfY0zBUUlo4gwCqatS0/x9CFrlCp9oVleJZd+T0SS89Nx9e++Hen2NHZBFC99y6TH
         drQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695016879; x=1695621679;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bRQgvhY4U4z2ruT7FwvR+MpUWERGJaWWnA2mdcDXq9I=;
        b=W655uwRyUUGcYn+8oRnfJi8ewO3tQr3lUBURxK6qQnoCXh6W23xtlua4EAFb6aylm8
         +IJkuUeXNLThhrfFcR2WOlzpg+giO7zUKnY2OQsTDKY7w3VNBdWqLxmhrK/smkMEGGP0
         vcTrD+/AgFTz1eHHL3Y7ZZecq2COOciy9cNwT7qjAom0aNruxwpyr//ZAO9MB2ybiQXj
         MAVeCURQzP6UfayFX3fFLhDgPuDSz75kUw7ZZHjK+eN15yEKBzOaxaXsVBTIQ1yWXnrR
         AaNGglZTrH3Ho3Ov22fn9cYzsP0rrKt+nQzU7BgZi9iTYwKbuLOHNVU3dxZNVUXlILsX
         0F1A==
X-Gm-Message-State: AOJu0Yx335TGicNktHSvyyoS3vbk/O6FGiFtH3tlq6vd45gOAqQ7GllO
	PqoytalEWrtaOlMNmImDmveTl3dGaB93Rw==
X-Google-Smtp-Source: AGHT+IHoJ7Ee6Yqp4fBkqkBUrSPWdn2YASwHQcAcIe8vLPLiPGEVYKu39vf+X8alUMW+qWIueWOWJw==
X-Received: by 2002:a05:6a20:5489:b0:133:7a67:b477 with SMTP id i9-20020a056a20548900b001337a67b477mr11999061pzk.1.1695016878901;
        Sun, 17 Sep 2023 23:01:18 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id ix11-20020a170902f80b00b001c3a7fbf96fsm3778326plb.216.2023.09.17.23.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 23:01:18 -0700 (PDT)
Date: Mon, 18 Sep 2023 15:01:17 +0900 (JST)
Message-Id: <20230918.150117.870069766992368090.ubuntu@gmail.com>
To: andrew@lunn.ch
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <3fa5407b-c6f4-4e39-a743-812838b94d28@lunn.ch>
References: <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
	<20230917.191708.2174483069021340663.ubuntu@gmail.com>
	<3fa5407b-c6f4-4e39-a743-812838b94d28@lunn.ch>
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

On Sun, 17 Sep 2023 17:06:35 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Sun, Sep 17, 2023 at 07:17:08PM +0900, FUJITA Tomonori wrote:
>> Hi,
>> 
>> On Wed, 13 Sep 2023 22:11:57 +0200
>> Andrew Lunn <andrew@lunn.ch> wrote:
>> 
>> >> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
>> >> +        unsafe { &mut *(ptr as *mut Self) }
>> >> +    }
>> >> +
>> >> +    /// Gets the id of the PHY.
>> >> +    pub fn id(&mut self) -> u32 {
>> >> +        let phydev = Opaque::get(&self.0);
>> >> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
>> >> +        unsafe { (*phydev).phy_id }
>> >> +    }
>> >> +
>> >> +    /// Returns true if the PHY has no link.
>> >> +    pub fn link(&mut self) -> bool {
>> >> +        let phydev = Opaque::get(&self.0);
>> >> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
>> >> +        unsafe { (*phydev).link() != 0 }
>> > 
>> > That seems an odd way to express it.
>> > 
>> > unsigned link:1;
>> > 
>> > It is a bitfield of 1 bit. So why not simply == 1 ? Or even just plain
>> > (*phydev).link() ?
>> 
>> The accessors is generated for bitfield. In this case:
>> 
>> pub fn link(&self) -> core::ffi::c_uint;
>> pub fn set_link(&mut self, val: core::ffi::c_uint);
> 
> So Rust has thrown away the size of the bitfield?

No, sorry about the confusion. The generated code to get looks like:

pub fn link(&self) -> core::ffi::c_uint {
    unsafe {::core::mem::transmute(self._bitfield_1.get(14usize, 1u8) as u32) }
}

The second argument is bit width.

pub fn set_link(&mut self, val: core::ffi::c_uint) {
    unsafe {
        let val: u32 = ::core::mem::transmute(val);
        self._bitfield_1.set(14usize, 1u8, val as u64)
    }
}

The second argument is bit width too.


>> The function name should be something is_linkup()?
> 
> Naming is hard. At least for the moment, anybody writing a PHY driver
> is going to be using a C driver as a template. They will see code
> like:
> 
> msc.c:	if (!phydev->link && priv && priv->edpd_enable &&
> teranetics.c:	phydev->link = 1;
> teranetics.c:			phydev->link = 0;
> teranetics.c:			phydev->link = 0;
> uPD60620.c:	phydev->link = 0;
> uPD60620.c:			phydev->link = 1;
> 
> Since it appears your must have a getter/setter, i would keep with
> get_link() and set_link().

I'll use these names.

>> > Now we are getting into the hairy stuff. Locking is
>> > interesting. Rather than duplicate all the interesting stuff, can you
>> > just use the high level C functions? In fact, the driver you posted
>> > does not need anything other than phy_read() and phy_write(), so i
>> > would not even bother with these yet.
>> 
>> Yeah, I can't figure out a clean way to handle this.
>> 
>> The realtek driver uses them:
>> 
>> https://github.com/fujita/rust-realtek-phy/blob/master/rust_realtek.rs#L33
>> 
>> It implements .read_page and .write_page so read and write without
>> locking the MDIO bus are necessary? Can we do in differently?
> 
> This locking is not nice, but it is mostly hidden away in the phylib
> core. We probably don't want to duplicate it in Rust. So i would
> suggest you wrap the high level API, phy_read_paged(),
> phy_write_paged(), phy_modify_paged_changed().
> 
> rtl8211e_config_init() does:
> 
>         oldpage = phy_select_page(phydev, 0x7);
>         if (oldpage < 0)
>                 goto err_restore_page;
> 
>         ret = __phy_write(phydev, RTL821x_EXT_PAGE_SELECT, 0xa4);
>         if (ret)
>                 goto err_restore_page;
> 
>         ret = __phy_modify(phydev, 0x1c, RTL8211E_CTRL_DELAY
>                            | RTL8211E_TX_DELAY | RTL8211E_RX_DELAY,
>                            val);
> 
> err_restore_page:
>         return phy_restore_page(phydev, oldpage, ret);
> 
> This should not be time critical, so i would turn this into
> phy_read_paged() followed by phy_modify_paged().
> 
> rtlgen_read_mmd() is different.
> 
> phy_read_mmd() takes the MDIO bus lock and then calls
> phydev->drv->read_mmd which is rtlgen_read_mmd(). This is why
> __phy_read() is used. So you are going to need to wrap __phy_read()
> and __phy_write().
> 
> Or we need to take a step back and take a long hard look at the
> locking and try to clean it up and simplify it. It might then become
> possible to duplicate the locking model in Rust.

Understood. I'll drop read_lockless and write_lockless in the next
round and think about how to handle realtek.


>> If abstraction code just declare a function, a driver always need to
>> implement that function.
> 
> Ah, that is not going to scale well. There is something like 250
> struct phy_driver at the moment. We keep adding new ops to that
> structure. I really don't want to have to modify all 250 of those
> structures when i add a new op which only one or two drivers need.

Again, sorry about the confusion. Trevor explained better. We don't
need to do such.

