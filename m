Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCBD8821
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 00:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717718403; cv=none; b=t0+9TtyFk0eA7sGPR+E8OIP833UVfRDzV7ItjFT/e9SJCpaU3bz+Bwyc8RaIjeKw87rLDjBOeRWkSiYJ2vu9RzES6N7NOtZsbJw+K4B3IDTunYak39Sq9dlbwSKa3BEU2RQGjJYUNU1UO4GarS7xJLelLvMcdLav2MYVQjiQd1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717718403; c=relaxed/simple;
	bh=x1P0GE60wBP+X414z2KyKZowaudVzwSK/yb/MDl2mlc=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Ne2SdAZhZuDvZbw1+sgdmBDS3Ye/27FUQGuFltn1EZJfn+uJez/ecEYIFVy+Y8BsREnWmJi+V6n8eWOlzsckARaqZIWzEe8ih8ANlldQ5oG5uh2m6kK95cbrNZ6VrxArAPcL8yLD0pFLcitpiIkI2Ob+RHXZ0UGyKE3+JJ5wViY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqYOZ+HB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqYOZ+HB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f6d4f9b2bbso195245ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Jun 2024 17:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717718401; x=1718323201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VoyLoyvL4A3j8fQYLp9/H5CN2yF8l5uL4KFV4ekGGDg=;
        b=jqYOZ+HBMCp0R0aM0sIoto7F6GRqQy/Rb1L+Pt2w0lgt/rX5Xnq7dovGfrW0XXxKLP
         GAFAC9ATjKs0iReA1vgWc+NJMQI09zN7ThaMl45QdOLKQ+491o1cH5yBSKqI0M/9hWGg
         yH0mXyF7JyrC3IxEEhXxEkm4i0dAuGehWSBqQA+PJSBAZuf+3UtiMbHxOLiw/dZECGXq
         uAFPlorKM/PYEWFfxw8YgXgW3wuHYWa7KtIc7aHOSCEO9svd6lpI/p9GhFf5jsKTjssn
         rX+hOvjsWVmLsUE6DaHPc1WzO2UI/iDzum5qSI7peMopNhgGT8PSfBk0zBRqBWRuO4+e
         T3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717718401; x=1718323201;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VoyLoyvL4A3j8fQYLp9/H5CN2yF8l5uL4KFV4ekGGDg=;
        b=C5vD73o9O08zAjO+pMoPEmZ2llY0B20rlrqXJ9oSyuNokB6FIT8NZDDNAqlPi6uJ0+
         1oCW8jwqXwDmVuzKcb9VIoq2Stp75ueexXJRg/Dt85PAikCE2ZwO40b04ytrYIWIadQp
         BlDujO56d8uYj93y93lG/NJgpVlnmtDjfLV4IX3MKiQOxIQi1IBi52q9mVqkz9mLeXAy
         EpjAPAnZ3LtfkyTr65E6Sd2A2n9WJjaXTtz21zq0RvBsIgC3EPM1QXH97wLpbruhLVN9
         MX7jOqPNPVQFk2DnGnkXHF3MnHwseGW4ox9LHZ8iYUxDRvr0AaHowBl4LbBJoazM72D3
         yUyg==
X-Forwarded-Encrypted: i=1; AJvYcCUrJZ9HQkdJdrdAGHRqL4ohlXnGakAc3jGbOuufFlZgciU6UjAeyyFS1t0kVmxoCNTkhfeXOdommi1lgwFl/4NrtTFWSxidWZ+oE2YEVc4=
X-Gm-Message-State: AOJu0YwuxD0psVDaICMTQkQ58Fhb1O+BXaPIEJlAOr5YqNUeMHqk6lxK
	E3d5pRZFMAUMZ8sO4/76HmBrNAbirvsuIKdJfzbL5DOvlw4p4o5S
X-Google-Smtp-Source: AGHT+IHYixBk8awZuOfD6j3C2Lg1Wjg/TRATdQS0mzoeFk6fK/fobcPmuK6KrZ9Y1pxKgw0oGoZyGg==
X-Received: by 2002:a17:90a:5912:b0:2bf:bcde:d2b0 with SMTP id 98e67ed59e1d1-2c2bcc7052emr999749a91.4.1717718400623;
        Thu, 06 Jun 2024 17:00:00 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c29c22060bsm2316283a91.17.2024.06.06.16.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 17:00:00 -0700 (PDT)
Date: Fri, 07 Jun 2024 08:59:49 +0900 (JST)
Message-Id: <20240607.085949.1576690208305265961.fujita.tomonori@gmail.com>
To: tmgross@umich.edu
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, benno.lossin@proton.me
Subject: Re: [PATCH v3 1/2] rust: net::phy unified read/write API for C22
 and C45 registers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CALNs47urAkARWg+e4eAqXDpOJFUjoe73WZxYHjL-_DvvzWtOZg@mail.gmail.com>
References: <CALNs47sQeXZExxQK-vdx0zh6-aC376KYLbLcS6_e2rsFe_piZQ@mail.gmail.com>
	<20240607.080236.199306626197602234.fujita.tomonori@gmail.com>
	<CALNs47urAkARWg+e4eAqXDpOJFUjoe73WZxYHjL-_DvvzWtOZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 6 Jun 2024 19:43:55 -0400
Trevor Gross <tmgross@umich.edu> wrote:

>> > This might not even need to be public since it should probably only be
>> > used as a method on `Device` (i.e. `my_device.read(C22::BMCR)` rather
>> > than importing the trait and using `C22::BCMR::read(my_device)`).
>>
>> If I drop public, I got the following error:
>>
>> error[E0603]: trait `Register` is private
>>    --> rust/kernel/net/phy.rs:181:25
>>     |
>> 181 |     pub fn read<R: reg::Register>(&mut self, reg: R) -> Result<u16> {
>>     |                         ^^^^^^^^ private trait
>>     |
>> note: the trait `Register` is defined here
>>    --> rust/kernel/net/phy/reg.rs:19:1
>>     |
>> 19  | trait Register {
>>     | ^^^^^^^^^^^^^^:
>>
>> (snip)
> 
> Oh, I did mean `pub(crate)`.

Oops. Indeed it works but I got the following warnings:

warning: trait `Register` is more private than the item `Device::read`
   --> rust/kernel/net/phy.rs:181:5
    |
181 |     pub fn read<R: reg::Register>(&mut self, reg: R) -> Result<u16> {
    |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ method `Device::read` is reachable at visibility `pub`
    |
note: but trait `Register` is only usable at visibility `pub(crate)`
   --> rust/kernel/net/phy/reg.rs:26:1
    |
26  | pub(crate) trait Register {
    | ^^^^^^^^^^^^^^^^^^^^^^^^^
    = note: `#[warn(private_bounds)]` on by default

(snip)

