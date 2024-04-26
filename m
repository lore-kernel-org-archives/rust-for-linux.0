Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8568620
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Apr 2024 01:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714093860; cv=none; b=eNlh6QeG7DIEkHdpSVvuvbZMikBATeqI4pKm3CvgaAzlgQoKGh2jmTCYPO7DUpgEo6OpYFmK2bPrTuXjneaF0rwZBS3+djEuZomQxbq02otMCGuqhRfNs/azfHvAX0A3+vNLVLyg2WkKyYZQs7qHHT+MEA7F/dPdb+yOsTkUSBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714093860; c=relaxed/simple;
	bh=p8wJQ07SEnVl4K3Ia4Nz3kJ3Xl86k/Nt/jI/jFdSOZo=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LmUIp0mC8SOH9YvxKlIbQKuLLNB0bpwI/gI/SQt4RjzE+TFrBfFYNFKNa4JKCpfOvG1qu6ScOEd1nHF2i+/uso1ow8OI7NdJ6QTE19/zMCky+NhlOKedOLywjcT/ZXaw0pGOXaezQThHGxVOzgJR9u3EFHFKxAuG/AvVG1jLDLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEDQTZev; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEDQTZev"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ab48c14334so379705a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Apr 2024 18:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714093858; x=1714698658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=walhYUXDXoL6ubUAjs9uc6vQNBIwAdOmqHoiQojJQcM=;
        b=XEDQTZevvQZ1fZKi8HIV+ysE11rvhBQPnVQkNLl0sZuYF+Xv7rTg/Q30io7IS/RufD
         ezLhnYoRM7iZeZUfGk9m7hEY7v/9zP6O+gfVEkNT96S+aM6+7oK3norMg7j3mM5dhe+Z
         pzjoTBuykibGSBQsHO9ze9GcF4ZN+jDSEzpxVP2GYB/BrVG2itJg4f2b/2Q/vHZ7Q8Za
         HlGpypi7BYy8HJ7ZdGxdZfqs+2Z8WMugOHvYriYMOihMLIJlvknr98gmFMBNXl4cGsz3
         1p2kyISbP6qu9NfrcHHM9+R6+gOrXfGDyx3gPvNOUYe7Na6rr1JXTMJ4Isedwpkhm7tB
         +kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714093858; x=1714698658;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=walhYUXDXoL6ubUAjs9uc6vQNBIwAdOmqHoiQojJQcM=;
        b=ONeEvFm8gYJFrp5Nfseu89OZ+shNkE+tLey99cEZXJJuLPdZaJ2VLOnAg7QIV0PmZ6
         jyfMJFoQfJ8088S5NAEuZ1Au8+egoeqtcjHvMYbdWmHTwuWDGbLbLNlXWpRW5Gvyua3y
         PX2nw+43ARmzyz520Isc2ozxgnYFQTSgwvVhSsqj237VRL+GvrmDMbUpfdc0SRl6eYLz
         xsdrnJB6oEyNEvDo9X0SiRP6rMQrgSdZ1VMP89bEfXAOtpNzH+J/9O0o2H+zj7PTzmhu
         Dy7GjT0LUj/sE888KsOgViIRNEBToHpSi2VedC7sZ+Mj29hxhVRY4oQJtHz8kSJHrCYr
         LuuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUouaDtNHdGb5uHup5j56e+CXmpAktism1oI7HFTiYOYtSgcFzXyeXKK5ZAxtUyi3pTAoFy8FWvjdLouj1+xFi+S1ukNlBT2F2Ca4JqLm8=
X-Gm-Message-State: AOJu0YwtSbpLd8UZfMbMYRL9JaGryS25nfsl8LMleO5I9KxOQv4BEqJT
	CQ1rF++XjNUX1GG0tWYa4t4UZItLJngAl3hoYw91n5+e7AYkl8B7R+Lhiw==
X-Google-Smtp-Source: AGHT+IGGGqKF0eve8bMsNANLPEu6pWkxkhf5hI72d/Yf1kSY4qcjgToSY72TMN1Ri313JvnLVfOddw==
X-Received: by 2002:a17:902:db06:b0:1e8:4063:6ded with SMTP id m6-20020a170902db0600b001e840636dedmr1428339plx.1.1714093858162;
        Thu, 25 Apr 2024 18:10:58 -0700 (PDT)
Received: from localhost (p4300206-ipxg22801hodogaya.kanagawa.ocn.ne.jp. [153.172.224.206])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902704800b001e868e29fabsm14390059plt.251.2024.04.25.18.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 18:10:57 -0700 (PDT)
Date: Fri, 26 Apr 2024 10:10:55 +0900 (JST)
Message-Id: <20240426.101055.990464946230867124.fujita.tomonori@gmail.com>
To: benno.lossin@proton.me
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC v1] rust: add 'firmware' tag support to module!
 macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <c613d60a-4136-4a4b-a2d3-9c849b245cab@proton.me>
References: <b66e7e78-35bc-48df-9e3b-0a57996491ad@proton.me>
	<20240420.101421.329379978497339506.fujita.tomonori@gmail.com>
	<c613d60a-4136-4a4b-a2d3-9c849b245cab@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 25 Apr 2024 15:35:44 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

>>> What do the strings in the array mean? If there is documentation on the
>>> C side, please link to it or explain it again.
>> 
>> I can't find any on the C side. They are used when building
>> initrd. How about the following?
> 
> What does that mean? For the other fields, I know what they mean, but
> when I see firmware I don't know if what I am thinking is correct.
> A couple of questions:
> - How do I know that I need to put anything in that field (and also what
>    do I need to put there?)?

If you implement a device driver which requires firmware and the
driver is likely added to an initramfs image, you need to put the
names of firmware in that field.

> - Are those firmware files in the kernel tree?

I don't think so.

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/

> - How are they "used" when building the initrd?

initramfs is used before the real root file system is mounted. So
device drivers in initramfs can't use firmware on the real root file
system. An initramfs image needs include drivers with necessary
firmware. If you put the names of firmware in 'firmware' field, the
names are embedded in modinfo section in the module file. A tool to
build an initramfs image can use that information.


> This might just be my lack of knowledge. But as you did not find any
> docs on the C side, I think we should take this as an opportunity to
> improve the state of things.
>
> You don't need to answer all of the questions above perfectly, but
> provide at least some starting point to learn more.
> 
>> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
>> index f489f3157383..19175b3e7172 100644
>> --- a/rust/macros/lib.rs
>> +++ b/rust/macros/lib.rs
>> @@ -35,6 +35,7 @@
>>  ///     author: "Rust for Linux Contributors",
>>  ///     description: "My very own kernel module!",
>>  ///     license: "GPL",
>> +///     firmware: ["file0", "file1"],
> 
> Changing the example is good, but "file0" is not really meaningful...

["device-driver-fw0", "device-driver-fw1"] are better?

Can you tell me your proposal?


> It might also lead people to believe that they need the firmware field,
> so I think it should be its own example.

You want to add the complete example for 'firmware' field like the
following?

/// ```ignore
/// use kernel::prelude::*;
///
/// module!{
///     type: MyDeviceDriverModule,
///     name: "my_device_driver_module",
///     author: "Rust for Linux Contributors",
///     description: "A device driver requres firmware",
///     license: "GPL",
///     firmware: ["device-driver-fw0", "device-driver-fw1"],
/// }
///
/// struct MyDeviceDriverModule;
///
/// impl kernel::Module for MyDeviceDriverModule {
///     fn init() -> Result<Self> {
///         Ok(Self)
///     }
/// }
/// ```


>>  ///     params: {
>>  ///        my_i32: i32 {
>>  ///            default: 42,
>> @@ -74,6 +75,7 @@
>>  ///   - `description`: byte array of the description of the kernel module.
>>  ///   - `license`: byte array of the license of the kernel module (required).
>>  ///   - `alias`: byte array of alias name of the kernel module.
>> +///   - `firmware`: array of firmware names required by the kernel module.
> 
> I think it is fine to keep the entry in this list, since this list
> describes the types that are expected for the parameters, but please
> extend the docs as I detailed above.

Where you want the `firmware` explanation? Extending like the
following works for you?

- `firmware`: array of firmware names required by the kernel
  module. This field is optional, used as a hint to build an initramfs
  image with firmware included.


If you want the explanation of the 'firmware' field elsewhere, please
tell me where.

