Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE319639
	for <rust-for-linux@vger.kernel.org>; Sun,  2 Jun 2024 07:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717313075; cv=none; b=b1BOiCJswIzZkALN8h1Vxpfbb1PAbr3+Aaza8Y1qdwPfxjfxUFJqjZX+WPkkA408Upl5uzXWBj/LvrCu6oP2VpLYlGGboTLgdDV696NnpeLRL5VdQmLXSfs62j9POxqnnFQ0woUld6DMMlY1MNVLd97cilKut8LMf0OnRyKAih0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717313075; c=relaxed/simple;
	bh=KgJPrY3ZpO1R+AzCeOlkwJFsxIoaUbSkj1HMawNZqtA=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=u4pbZ3Q0AswAgeHQv1cWZSO4PHZFJtdifPEJIAygn6LFEdpy4eiM/Px2BjsfLBd5fUd8v68TgIAwDyPko/Li6mAv4vunCMLR573tqV2env80gzywUPoItOQ5hejvzlsaDfpe9fTztLUx8QhLM8l4YaZ6LHBQ8UScNyVHqAAvv34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlnqpKaR; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlnqpKaR"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f8e9876117so300973b3a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Jun 2024 00:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717313073; x=1717917873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbvNEVAskRHmRUEOIDnTZNkKaPjXlQTSk4z3p4esv/Q=;
        b=MlnqpKaRmPCZ09QQxuncxCQ/M/ruVBKFK25CS1/ffxZ0DqRVycBmatRphiIc7747KK
         HGkVWX+S2Tk1K/C3eDFGsXy12UQKQZe+KpSxUU4RuwRQFnFVqGl1GpoGNcb+hF7OOIRz
         m9WxRt8HE6ttxFbAYjDlNmQVMw2iqY1E9VY+cZYTej8+D05WII2PlYqg7UL2I69FRn//
         csjBA/mvq3EHjSJ9QX8rMGdrWmukelzK/RrblQSZ1g8ya0lCT+eG3geVIcwuuTu8oyNy
         Mr61BjczYFLrAQtz0H+ojpIJsHjYVvaBlNkuEeZIHBciOwnoLQIL/p2ONJE42+DgzzQw
         XmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717313073; x=1717917873;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SbvNEVAskRHmRUEOIDnTZNkKaPjXlQTSk4z3p4esv/Q=;
        b=iKL+30abDfLQLgBLC34ttNHiO9C9IQvnvHam/tt1/4+5LMo/3lP90EfATEp2suPXkr
         mVCTmfGjOZ8oefplnNwptTn3ahxvK85NTFfMIDoLTXOYfhuc7tyaNTanLiLFiaM+MhZk
         WXl+EJl3JpG0Tr/zh7EOaUJf9d8owiB4JcW9C1F+r567ePTlo5W2mJrMGYEfEVmKVoDj
         jgLeZI5sIUjvZhtYPqfDw38b6rVHM/ewN3HxKBe7yjpjqywvsSB/eZXKgFGgpxu1WQ6v
         JCyYTdwc0Hg8F5qE6cwfhEEfesACObdomhkpKHePvGErxuUP7wnlmRv173nEe8JouAv/
         0VQA==
X-Forwarded-Encrypted: i=1; AJvYcCU/hKKE3kP2qlEVdcJfihWwrmg3pD+6UJ6PtyCPM+KXVe+mEvwHZsLJ4Fz3unT9CxLnn4Y8sKRpCAzn6dTslK74sKvDRwq4U6YTgMhKir4=
X-Gm-Message-State: AOJu0YyKicydPtWL7/8HttZCoxTSosJPgc50QmzdpzRo3cQLU5hZEvvg
	/ESZ0coc7uUa/eoaZbJcWIYipwxuYn0qIt1RVjSwLIzhaiUMymP19yXK9w==
X-Google-Smtp-Source: AGHT+IFg7iKpKnMVVskdsAK4w5WiUqYan/xqz9JCNqNjjs/LirnDbRAG999Y7HnoU6tpIbpTdIFlJA==
X-Received: by 2002:a05:6a00:2c8f:b0:701:b7ef:1644 with SMTP id d2e1a72fcca58-70247916578mr6410230b3a.3.1717313072751;
        Sun, 02 Jun 2024 00:24:32 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702425e0aeesm3689562b3a.87.2024.06.02.00.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 00:24:32 -0700 (PDT)
Date: Sun, 02 Jun 2024 16:24:28 +0900 (JST)
Message-Id: <20240602.162428.1539328419375401243.fujita.tomonori@gmail.com>
To: benno.lossin@proton.me
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, tmgross@umich.edu
Subject: Re: [RFC PATCH v2 1/2] rust: net::phy support for C45 register
 access
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <1def4559-d812-4426-94bb-b668f9ccb824@proton.me>
References: <20240601043535.53545-1-fujita.tomonori@gmail.com>
	<20240601043535.53545-2-fujita.tomonori@gmail.com>
	<1def4559-d812-4426-94bb-b668f9ccb824@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sat, 01 Jun 2024 12:21:14 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

> On 01.06.24 06:35, FUJITA Tomonori wrote:
>> Adds support for C45 register access. Instead of adding read/write_c45
>> methods, this unifies the API to access C22 and C45 registers with
>> trait.
> 
> The short commit message only mentions C45, should it also include C22?

How about the following?

Adds support for C45 register access. The abstractions support access
to only C22 registers now. Instead of adding read/write_c45 methods
specifically for C45, a new reg module supports the unified API to
access to C22 and C45 registers with trait, by calling an appropriate
phylib functions.


>>      /// Reads a paged register.
>> @@ -302,6 +285,169 @@ pub fn genphy_read_abilities(&mut self) -> Result {
>>      }
>>  }
>> 
>> +/// Defines PHY registers.
>> +pub mod reg {
> 
> I would have put this into its own file under `phy/reg.rs`.

I'll do.

>> +    use super::Device;
>> +    use crate::build_assert;
>> +    use crate::error::*;
>> +    use crate::uapi;
>> +
>> +    /// Reads and writes PHY registers.
>> +    ///
>> +    /// This trait is used to implement multiple ways to read and write
>> +    /// PHY registers.
>> +    pub trait Access {
> 
> I think `Register` is a better name.

Ok, I'll go with `Register`.

>> +        /// Reads a PHY register.
>> +        fn read(&self, dev: &mut Device) -> Result<u16>;
>> +
>> +        /// Writes a PHY register.
>> +        fn write(&self, dev: &mut Device, val: u16) -> Result;
>> +    }
>> +
>> +    /// C22 registers.
>> +    pub struct C22(u8);
>> +
>> +    impl C22 {
>> +        /// Basic mode control.
>> +        pub const BMCR: Self = C22(0x00);
>> +        /// Basic mode status.
>> +        pub const BMSR: Self = C22(0x01);
>> +        /// PHY identifier 1.
>> +        pub const PHYSID1: Self = C22(0x02);
>> +        /// PHY identifier 2.
>> +        pub const PHYSID2: Self = C22(0x03);
>> +        /// Auto-negotiation advertisement.
>> +        pub const ADVERTISE: Self = C22(0x04);
>> +        /// Auto-negotiation link partner base page ability.
>> +        pub const LPA: Self = C22(0x05);
>> +        /// Auto-negotiation expansion.
>> +        pub const EXPANSION: Self = C22(0x06);
>> +        /// Auto-negotiation next page transmit.
>> +        pub const NEXT_PAGE_TRANSMIT: Self = C22(0x07);
>> +        /// Auto-negotiation link partner received next page.
>> +        pub const LP_RECEIVED_NEXT_PAGE: Self = C22(0x08);
>> +        /// Master-slave control.
>> +        pub const MASTER_SLAVE_CONTROL: Self = C22(0x09);
>> +        /// Master-slave status.
>> +        pub const MASTER_SLAVE_STATUS: Self = C22(0x0a);
>> +        /// PSE Control.
>> +        pub const PSE_CONTROL: Self = C22(0x0b);
>> +        /// PSE Status.
>> +        pub const PSE_STATUS: Self = C22(0x0c);
>> +        /// MMD access control.
>> +        pub const MMD_CONTROL: Self = C22(0x0d);
>> +        /// MMD access address data.
>> +        pub const MMD_DATA: Self = C22(0x0e);
>> +        /// Extended status.
>> +        pub const EXTENDED_STATUS: Self = C22(0x0f);
>> +
>> +        /// Creates a new instance of `C22` with a vendor specific register.
>> +        pub const fn vendor_specific<const N: u8>() -> Self {
>> +            build_assert!(N > 0x0f && N < 0x20);
> 
> An error message would be nice.

I'll add.

>> +            C22(N)
>> +        }
>> +    }
>> +
>> +    impl Access for C22 {
>> +        /// Reads a given C22 PHY register.
>> +        fn read(&self, dev: &mut Device) -> Result<u16> {
>> +            let phydev = dev.0.get();
>> +            // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
>> +            // So it's just an FFI call, open code of `phy_read()` with a valid `phy_device` pointer
>> +            // `phydev`.
>> +            let ret = unsafe {
>> +                bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, self.0.into())
>> +            };
>> +            if ret < 0 {
>> +                Err(Error::from_errno(ret))
>> +            } else {
>> +                Ok(ret as u16)
>> +            }
>> +        }
>> +
>> +        /// Writes a given C22 PHY register.
>> +        fn write(&self, dev: &mut Device, val: u16) -> Result {
>> +            let phydev = dev.0.get();
>> +            // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
>> +            // So it's just an FFI call, open code of `phy_write()` with a valid `phy_device` pointer
>> +            // `phydev`.
>> +            to_result(unsafe {
>> +                bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.addr, self.0.into(), val)
>> +            })
>> +        }
>> +    }
>> +
>> +    /// MDIO manageable devices.
>> +    pub struct Mmd(u8);
>> +
>> +    impl Mmd {
>> +        /// Physical Medium Attachment/Dependent.
>> +        pub const PMAPMD: Self = Mmd(uapi::MDIO_MMD_PMAPMD as u8);
>> +        /// WAN interface sublayer.
>> +        pub const WIS: Self = Mmd(uapi::MDIO_MMD_WIS as u8);
>> +        /// Physical coding sublayer.
>> +        pub const PCS: Self = Mmd(uapi::MDIO_MMD_PCS as u8);
>> +        /// PHY Extender sublayer.
>> +        pub const PHYXS: Self = Mmd(uapi::MDIO_MMD_PHYXS as u8);
>> +        /// DTE Extender sublayer.
>> +        pub const DTEXS: Self = Mmd(uapi::MDIO_MMD_DTEXS as u8);
>> +        /// Transmission convergence.
>> +        pub const TC: Self = Mmd(uapi::MDIO_MMD_TC as u8);
>> +        /// Auto negotiation.
>> +        pub const AN: Self = Mmd(uapi::MDIO_MMD_AN as u8);
>> +        /// Clause 22 extension.
>> +        pub const C22_EXT: Self = Mmd(uapi::MDIO_MMD_C22EXT as u8);
>> +        /// Vendor specific 1.
>> +        pub const VEND1: Self = Mmd(uapi::MDIO_MMD_VEND1 as u8);
>> +        /// Vendor specific 2.
>> +        pub const VEND2: Self = Mmd(uapi::MDIO_MMD_VEND2 as u8);
>> +
>> +        /// Creates a new instance of `Mmd` with a specific device address.
>> +        pub fn new(devad: u8) -> Self {
>> +            Mmd(devad)
> 
> Is there also a range that makes sense to exclude (similar to C22)?

Not, I think. C22 saves 0x10..0x1f for vendor specific registers. But
C45 has VEND1 and VEND2 for the same purpose.

Andrew, we need to allow a driver to use reserved addresses (14-28) in
C45? If not, we don't new() func to allow a driver to use them.

I overlooked some addresses in 802. I'll add const for all the
addresses in v3.


>> +        }
>> +    }
>> +
>> +    /// C45 registers.
>> +    pub struct C45 {
>> +        devad: Mmd,
>> +        regnum: u16,
>> +    }
>> +
>> +    impl C45 {
>> +        /// Creates a new instance of `C45`.
>> +        pub fn new(devad: Mmd, regnum: u16) -> Self {
> 
> I really like that the first argument has a proper type now, do you
> think that the same is also possible for `regnum`? Or are there no

I think that it's difficult.

> common values for `regnum` (that also have the same meaning across
> devices/drivers)? In that case, keep the `u16`.

Many are defined in the specification. Drivers might use registers
undefined in the spec for some reasons, I assume.


