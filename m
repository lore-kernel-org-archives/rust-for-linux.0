Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DA216133B
	for <rust-for-linux@vger.kernel.org>; Wed, 29 May 2024 23:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717025314; cv=none; b=oOjvPyxPoWw93mP0GAl4vueQXCKPOQIhaCOrWe11JKsKSuHhDWhxmyudRWZztIXAlz6vT0IbMPeWl6cY8X9mBdYS5yabkm5iSrP5r83LaslAxu7KIi7KtKifwtxPyVvITk0djSXNqfPiNPSLFtJyih3erHdr60oFSitZh5XrjZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717025314; c=relaxed/simple;
	bh=HpJS4g7e8D1JFJ243Y0WfjqkmhB3p1tdZZ1nwJHmygs=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=te7wGfT9LtINz81wipNrA3rBU1UIm5fAFM4QcSdev+Oixi2HDPDHEXxVfahgsUjesfWvu/TKomUYNQh6k32NB83yF7HaykS8DHGJYywK/MKcC+mbzrf98N28xdFs3muKDxSHcYOvSPimoxYdtxvMPBVu/EGROhlaNdLsp7Bi3go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAhPN2i3; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAhPN2i3"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2bfc0b5e06fso35014a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 29 May 2024 16:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717025312; x=1717630112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CbHtrgyTy3hlnL/xrFUFy4gX8XK+D4Wz02/A1kHTNU=;
        b=TAhPN2i3Xm+WEfggr5RC1+rvzAmZ7nFHODhxbnC+RFL+pSIWcVxNBAr7UG08mmG+Uf
         +uMj6Js7hWoHnw5G+IrRrvvRTVeLUpbCwxuXKj3egzRtYvsiq41fTvwf6/ji+0pZglfo
         5hnj/UzS7jJPABrNYYvDtHPTQE6Oen2nHpprV/qsjjfPMn7Hgp2/XtmybEweQDNdXVVK
         q8WsALp6Y2T001A7g4KQxgSw6Gx3SjoOxKgPf5Px3hz0nSyn5daIfr/qUl7QKVIVi1SU
         y1T5Hasdmy0Dzl/v4vyuNXmjcLzvx3zc1KGN5VrA5K6/dyEzBxPaj+vM5mnCGQCGqi1N
         opGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717025312; x=1717630112;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1CbHtrgyTy3hlnL/xrFUFy4gX8XK+D4Wz02/A1kHTNU=;
        b=QW9nyLW9IifHEKPVdS8Go/MVHVQpoCEmKvI0X5JncBMyMFczVeVG4MLcpWaYTpULKP
         NKkbqPcgxlzi5sChPk+y1enq3ZOVB79/oGythDexQ1hGi1Gwbu9AUD9WH7YKRgTQ0Fan
         DtWnYes4Fu83cFIbkVmPk0Qm+Ykg/cAXMzbc4Loo4uyGkCPKmZ4svL2QtfJEz4xvgRXh
         oCjZfSXfKCdpoIAXA+kndJ0G9f/6K87kmS+FubaqhexAnYzQybcBLK4xzr++AjFWR9bm
         40fP+uAnAUcdMM/Em3Z4AR0xeywHf3lEEpY8nrtpADqZyOwn+QLQFE4czEFB0nWz7QmV
         3vyA==
X-Forwarded-Encrypted: i=1; AJvYcCXiu342uohu0KB45V6Zx9tuJSN+rAJX1dsQBqU2Ne3mpwumOigBRnI6XYlslqda5NGi//6gXFiwQWNbEu0Nx7tmWO8V7b+yFkaP16aU6U4=
X-Gm-Message-State: AOJu0YzZ1nunlfh/e66VTei5ojVWe9YpwM/yjO2SM0PH2Y+rm5KVu3uL
	bG4W0qBhnd/OkmurB9tT36Ee8LBCGIuoCX5RtMAVBVZr1GaNqN6e
X-Google-Smtp-Source: AGHT+IE1OtjMwHtpI5sgyloFG5EHG3kwe46MRMtl7GShic69l2ObaEr6JnwIz7681roQpRkx2eLWJA==
X-Received: by 2002:a05:6a20:1001:b0:1af:a5e8:d184 with SMTP id adf61e73a8af0-1b2646a3a95mr445927637.5.1717025311753;
        Wed, 29 May 2024 16:28:31 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f48bb6163asm69304775ad.37.2024.05.29.16.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 16:28:31 -0700 (PDT)
Date: Thu, 30 May 2024 08:28:24 +0900 (JST)
Message-Id: <20240530.082824.289365952172442399.fujita.tomonori@gmail.com>
To: gregkh@linuxfoundation.org, dakr@redhat.com, wedsonaf@gmail.com
Cc: fujita.tomonori@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com,
 lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <2024052950-purely-sandstone-36c7@gregkh>
References: <2024052816-makeshift-irrigate-cef5@gregkh>
	<20240529.092821.1593412345609718860.fujita.tomonori@gmail.com>
	<2024052950-purely-sandstone-36c7@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 29 May 2024 21:57:03 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

>> For a Rust PHY driver, you know that you have a valid pointer to C's
>> device object of C's PHY device during the probe callback. The driver
>> creates a Rust device object to wrap the C pointer to the C's device
>> object and passes it to the firmware abstractions. The firmware
>> abstractions gets the C's pointer from the Rust object and calls C's
>> function to load firmware, returns the result.
>> 
>> You have concerns about the simple code like the following?
>> 
>> 
>> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
>> new file mode 100644
>> index 000000000000..6144437984a9
>> --- /dev/null
>> +++ b/rust/kernel/device.rs
>> @@ -0,0 +1,30 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Generic devices that are part of the kernel's driver model.
>> +//!
>> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
>> +
>> +use crate::types::Opaque;
>> +
>> +#[repr(transparent)]
>> +pub struct Device(Opaque<bindings::device>);
>> +
>> +impl Device {
>> +    /// Creates a new [`Device`] instance from a raw pointer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// For the duration of 'a, the pointer must point at a valid `device`.
> 
> If the following rust code does what this comment says, then sure, I'm
> ok with it for now if it helps you all out with stuff like the firmware
> interface for the phy rust code.

Great, thanks a lot!

Danilo and Wedson, are there any concerns about pushing this patch [1]
for the firmware abstractions?

I you prefer to be the author of the patch, please let me know. Who
the author is doesn't matter to me. Otherwise, I'll add
Co-developed-by tag.

[1] https://lore.kernel.org/rust-for-linux/20240529.092821.1593412345609718860.fujita.tomonori@gmail.com/
