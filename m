Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724713C30
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Jun 2024 04:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717215652; cv=none; b=eqidvSYVVNt0/kQFQqGpEX8LN1rwBYOwV+z8aHi9mYIvbLKSpHk4ATUQyCjMr3sfXNvSaf3rE5Ta3w2v34kRwtuTohbs8/hT5QGwlMAtuVQyItRwbeEudsuTZH1hzXXKULPq1eQRyp8sr1oWJhYdPaqxkJWEvfLhAQlK8R5C2uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717215652; c=relaxed/simple;
	bh=gRx/KzzPwhB4JlYhF0jJ5wbH9lA4xo3Jbf6rubN5Bc8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jeKULLocWGbTw/f6X6wjuzmZ89HQD9ue/ei0eCh1KlXzAj+H6C6AeehkkekMDRAc0UHCuRkjJ+Mg2GF0FWI0DRNBtJ3zxwJB7nmTnYjO00kEg3RmlyyfsjX5kP8DDhEuFEqTlzZXDzRhoseeoYkYfmUQJQTJUCqk5cMF1N0rZIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nktSq74X; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nktSq74X"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7022c872aa1so59428b3a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 31 May 2024 21:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717215651; x=1717820451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLoDdm+otmxD4sV2gn6nCfbyDiRELPqRU2JUKFEHrhA=;
        b=nktSq74XncQrnB1kcRLVM/AZ1d/JImj6Mlw44h/m/LDDttu1s69T7tDFLaXq5l/Ask
         e3CjRezVsWMI3kFnxbcTYo+ZR7eXEG/nDJlbqyW3AfekGrKg42NwdUch3wJpUvvBFfx+
         lgvdVlL+FNg+xfH1uRrIBypK6l/OkTMGKb/4ya1ZXLE4PLovUjSadmdfGAgwd6XYeZ8b
         LAcPzDcCltbtgh+rTyQd7vyuOEMX5u90lk/VBDn6W2buwG+ruJOqANEh9TNxmrb1DOsm
         Dj9PTvRmfo2YF3eTnLguKzSZKxwYcYwDX/SB8WqPdJiBlN/5597rcSWGFzXSGNBa6kGG
         oRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717215651; x=1717820451;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PLoDdm+otmxD4sV2gn6nCfbyDiRELPqRU2JUKFEHrhA=;
        b=tYlgrBM/aiv2chgGRIk8ujmg5ljUxiytf592eiBa4zze2qRoPfFzx+clwUYYHXiAJ3
         WY1SB4O47yH+J2xlqDWPAwofpG1RNrsay4/rZdiLuPRglr5BWB0xIlign76y51EyRL25
         3CB3ynA3lfOIp/DjVQEqZErzTleuOv1OlRxkkPYTOMB0oDXAQmk6pI0FZU8rMwZgSrpR
         Wm3W/BNB62N8gceaS1b7oOj+pThPfNPo0hfLBz+AllxsRn0XwA4zpYY8bpHWzNaZ3Ppb
         lKy8MKWo6BfGh6D/q7YLpB1RZECwZhG9iJZCvjAxl27oORezSAxp7cOyJS1W4rTuJ3Q5
         hydQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhGT8RkbqoW4/HIU7v5rXwt2tyTCbNjdjjbRoFdh/MDiQmK1cs003jYymZB95MbqwANkKYD5jCbi2K1HKIsW2AnbP990+lwC1sVMzrOoc=
X-Gm-Message-State: AOJu0Yw2evPAW2c3WUTW2BIi+6oHxEpXRV+Cwtz18vkW8jhse8O42ra9
	lJbihH6qJfQnZNXCAbDdBqs8QM+l2L3gIy2OIQvlhnXqrh2RLIRB
X-Google-Smtp-Source: AGHT+IF1j+NnQqnGPbACXwKCXTDdyJ4kfKZYkmHbSYPCe57WFHmLGnLwZ8+8omI/EpaUM+XJljepdQ==
X-Received: by 2002:a05:6a00:6585:b0:701:bde7:c857 with SMTP id d2e1a72fcca58-702478c7471mr3781960b3a.3.1717215650517;
        Fri, 31 May 2024 21:20:50 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702425e2c18sm2203045b3a.93.2024.05.31.21.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 21:20:50 -0700 (PDT)
Date: Sat, 01 Jun 2024 13:20:37 +0900 (JST)
Message-Id: <20240601.132037.1757081254736477214.fujita.tomonori@gmail.com>
To: benno.lossin@proton.me
Cc: fujita.tomonori@gmail.com, andrew@lunn.ch, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1] rust: net::phy support to C45 registers access
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <62cdc40e-1852-4444-80f2-d26fb45018b4@proton.me>
References: <20240527.104650.353359058235482782.fujita.tomonori@gmail.com>
	<62cdc40e-1852-4444-80f2-d26fb45018b4@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,
Thanks for reviewing the patch!

On Thu, 30 May 2024 08:02:35 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

>> After the discussion on C45 register support, I implemented a more rusty
>> solution based on Benno's idea (hopefully, I understand correctly):
> 
> Yes this looks similar to what I imagined.

Great.

>> https://lore.kernel.org/all/20240415104701.4772-3-fujita.tomonori@gmail.com/
>> 
>> I'm not sure so I sent a RFC patch to rust-for-linux only. Once I have
>> something that we could agree on, I'll send non RFC patch to netdev.
>> 
>> 
>> Adds support for C45 registers access. C45 registers can be accessed
>> in two ways: either C45 bus protocol or C45 over C22. Normally, a PHY
>> driver shouldn't care how to access. PHYLIB chooses the appropriate
>> one. But there is an exception; PHY hardware supporting only C45 bus
>> protocol.
>> 
>> This adds two ways to access C45; RegC45 and RegC45Direct. Normally, a
>> driver should use the former; let the PHYLIB take care of how to
>> access (by calling phy_read_mmd/phy_write_mmd). The latter calls
>> mdiobus_c45_read/mdiobus_c45_write; C45 over C22 isn't used.
>> 
>> The API to access to C22 registers is also updated to align with the
>> above changes.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  drivers/net/phy/ax88796b_rust.rs |   7 +-
>>  rust/kernel/net/phy.rs           | 218 +++++++++++++++++++++++++++----
>>  2 files changed, 198 insertions(+), 27 deletions(-)

(snip)

>> -    /// Writes a given C22 PHY register.
>> -    pub fn write(&mut self, regnum: u16, val: u16) -> Result {
>> -        let phydev = self.0.get();
>> -        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
>> -        // So it's just an FFI call, open code of `phy_write()` with a valid `phy_device` pointer
>> -        // `phydev`.
>> -        to_result(unsafe {
>> -            bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.addr, regnum.into(), val)
>> -        })
>> +    /// Writes a PHY register.
>> +    pub fn write<R: RegAccess>(&mut self, reg: R, val: u16) -> Result {
>> +        reg.write(self, val)
>>      }
>> 
>>      /// Reads a paged register.
>> @@ -302,6 +285,195 @@ pub fn genphy_read_abilities(&mut self) -> Result {
>>      }
>>  }
>> 
>> +/// Reads and writes C22 and C45 registers.
> 
> You used "PHY register" below, so you should probably use it here as
> well.

Yeah, fixed.

>> +///
>> +/// This trait is used to implement multiple ways to read and write
>> +/// PHY registers.
>> +pub trait RegAccess {
>> +    /// Reads a PHY register.
>> +    fn read(&self, dev: &mut Device) -> Result<u16>;
> 
> Do all registers have a size of exactly `u16`? If there are also

Yes.

> registers with `u8`, then I would prefer an associated type in the trait
> that you then use as the return type.
> 
>> +
>> +    /// Writes a PHY register.
>> +    fn write(&self, dev: &mut Device, val: u16) -> Result;
>> +}
>> +
>> +/// Accesses to C22 registers.
>> +#[derive(Clone, Copy)]
>> +pub enum RegC22 {
> 
> I think we could just name this `C22`.
> It might also make sense to move all registers into a `reg` module. What
> do you think?

Makes sense. I did both and like them.


>> +impl RegAccess for RegC22 {
>> +    /// Reads a given C22 PHY register.
>> +    fn read(&self, dev: &mut Device) -> Result<u16> {
>> +        let phydev = dev.0.get();
>> +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
>> +        // So it's just an FFI call, open code of `phy_read()` with a valid `phy_device` pointer
>> +        // `phydev`.
>> +        let ret = unsafe {
>> +            bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, *self as u32)
>> +        };
>> +        if ret < 0 {
>> +            Err(Error::from_errno(ret))
>> +        } else {
>> +            Ok(ret as u16)
>> +        }
>> +    }
>> +
>> +    /// Writes a given C22 PHY register.
>> +    fn write(&self, dev: &mut Device, val: u16) -> Result {
>> +        let phydev = dev.0.get();
>> +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
>> +        // So it's just an FFI call, open code of `phy_write()` with a valid `phy_device` pointer
>> +        // `phydev`.
>> +        to_result(unsafe {
>> +            bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.addr, *self as u32, val)
>> +        })
>> +    }
>> +}
>> +
>> +/// Accesses to C45 registers.
>> +///
>> +/// C45 registers can be accessed in two ways: either C45 bus protocol or
>> +/// C45 over C22 bus protocol. Normally, a PHY driver shouldn't care how to
>> +/// access. `PHYLIB` chooses the appropriate one. `RegC45` is preferred over
>> +/// `RegC45Direct`.
>> +pub struct RegC45 {
> 
> Same here, this could just be named `C45`.

Changed.

>> +    devad: u8,
>> +    regnum: u16,
>> +}
>> +
>> +impl RegC45 {
>> +    /// Creates a new instance of `RegC45`.
>> +    pub fn new(devad: u8, regnum: u16) -> Self {
> 
> Are there really no common values that you would use as the parameters
> here? If you want to add any, you can do so via associated constants:
> 
>     const COMMON_REGISTER: RegC45 = RegC45::new(/* ... */);

I think that there are combinations that are often used. But they
aren't defined in such way, I guess. I suppose that the developpers
are familier with a way to access a register with devad and regnum.

