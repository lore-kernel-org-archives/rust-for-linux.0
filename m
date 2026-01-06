Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDD922172C
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 02:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767667920; cv=none; b=aGntdYHbL54MzsvNlNbFhbqSNdDD3rU26/QnfgaiZEhWKE8r/5kTkgFH4vCSJP1qfDs+yxiRSrm8WS8zxZpoAqW0AA3URPyESgxHvTOMz4ie1VGyujsKAJbNTwEJavR2BVkUy6Cp8ogfR/TyKFzYUGM00tCSZTKYeaZ1zs8BTFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767667920; c=relaxed/simple;
	bh=DTnPdAGyi9zw8bhtutufgjwIgPG14oeBvECc9opM0Xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QgWjtzYLEZniMcGIfLIOOejgH2z+cEJnyuVGrY2wg+Z6N1swfyYy5IqMe8T/+HZH1OKPZh0F8clGAPMwUl5XJHKvcJZfPjmrMAF40Pa4wTooHeDTrQlZOgy9m91XQzhNu+3V+0W7vhIhBSZkTseCD/M4KEvpuj3fu6v6q8+rCIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM+E4s6t; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM+E4s6t"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0bb2f093aso5241625ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 18:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767667918; x=1768272718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mME2FgNliNdUv4IE4C+D69aNELo1Zoi17RlupLlFIdI=;
        b=EM+E4s6tHTuD8oPJKcMbwjgHxByIJ2cgPsI/NjTaWcJDjO6SyYvaQvR8zIBsUusykA
         j0qT+gympn70ywL9SGHw9A2V00Dr0mGEV2UlVaU0QQQr3L1j7amT9t2TyKpoUe33Vi0m
         BMZ0pzVIwOEfNQ69SQTEIoBgY49p2IZyG7tnv0FghRM/kd11oPiBjvvhUONRkySAcbLU
         7h/RRX5wjkVdxHAf1rzFVaHE175hMy47yTwPVgHdZjmN4Hnb/Y64oLaK+ik569mwGpmw
         d6BJrecoOh93dpL9iG0/t4fjcCoppHkT1pF2UVDfLTyXsbFkio6pS4cY0+kdHT9YzMpT
         caXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767667918; x=1768272718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mME2FgNliNdUv4IE4C+D69aNELo1Zoi17RlupLlFIdI=;
        b=qK4GuOk3GZEDT1DXh1cxfg7p6+bLW79tDO/9VSMv70bqtXYRHOpTFPTaZk0jFs5O2E
         hmNOgyC8Pn5SiHZSRg8cHWi+AtOWUeta8QpZTi26IN39nAcog2Pv0iMKjeEeGa7H/jkL
         SAZ+68jvv2Lf2u7HZWB86xDpfAtR+y3sxo4grYTB4+0L6E0dUm8m1bsgwvErK0Mo6zCH
         sBkhjFNnnP+XEzbgicF2PrJb4m8QkHctSYsy2pCwbqAT3M2oDRTqT0ZEB/QIDumN/j+s
         MAsJZQG+R+ylt8Ef6Gj697aAstrQ8mda4eHyEKl5kF+drCMvKIo3qQTiFAFchmLrvZhV
         K+lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH2JKe9USyD4oEoZGNHCJUZBCeFCqULui0//cEtNSt6seuA8JRbJJxv73ocMAQkixuqUYrGGmDeF2phqu8jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpmUp17L806/pOb0ZHM7I+9/3K5Dhu9beuvfVzFVSy/8h6IGH0
	mLPgfO+TWyEagl5wclRpwDBKj7dfx3fZTr9QF2Bs/dPq73JQbIsAGnXP
X-Gm-Gg: AY/fxX6D4HOG3dOuklgb36FDMJyHH44O3WsZ2IMWCcA+Z3lM/sr/R6e8/gY35qc/uxr
	9kUMdHZvq7fRvWO3jkNo6E231fW5/Gdh/j/5dkwmj4E4WFFHB6qiR4sqXCy6+EENTbW94eahxDn
	jPP2on3/zVCGmX4k9Wjagmw0wtD9M/yMSgcAcACGfNPqxf47Rnvb8hjar8JPrJOnbMVHVpo7Ars
	Drodpct8EPUmS5yALmPljDtI8xxk9Wc3phJGxYCie/TEnDUNOiyqJGmwKyVvi71Ye9Gu8Mc6MRO
	glWayVyXd2JjskkL6y7Q/TlOvmnuG/rnFzyL3DkQsROxVQbyRwdvfYvADLMapYFpjfPiAWPDk3z
	JJSdYabSYvA2WRPHnA0hJ04jqqvxMNeGcTE3ZsX6xVFP1JWlo+hBApN9YIIS+Dg8EFNR7HWs8Ud
	5KYARyyw/tpekgPwGVhHPEdlhefg7gePH/nahVy+4+yiDzbjo=
X-Google-Smtp-Source: AGHT+IHqDO50RFlN1sWCZ9F0YlFD48YZv72A+9RcYtax3wH7I4/iNbpOrvyJmtS60ORtcEiq31M6bQ==
X-Received: by 2002:a17:903:1108:b0:29e:9387:f2b9 with SMTP id d9443c01a7336-2a3e2cb23b0mr13186195ad.24.1767667917935;
        Mon, 05 Jan 2026 18:51:57 -0800 (PST)
Received: from [10.0.10.3] (210-61-187-173.hinet-ip.hinet.net. [210.61.187.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8d81sm5284825ad.81.2026.01.05.18.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 18:51:57 -0800 (PST)
Message-ID: <88b1a3dd-e646-4583-bc41-07ff7e9422a7@gmail.com>
Date: Tue, 6 Jan 2026 10:51:50 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 4/4] rust: add PL031 RTC driver
To: Danilo Krummrich <dakr@kernel.org>, Ke Sun <sunke@kylinos.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260104060621.3757812-1-sunke@kylinos.cn>
 <20260104060621.3757812-5-sunke@kylinos.cn>
 <DFFTVRMAFF3S.13N6WCNAVVR6I@kernel.org>
From: Ke Sun <sk.alvin.x@gmail.com>
In-Reply-To: <DFFTVRMAFF3S.13N6WCNAVVR6I@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/4/26 21:10, Danilo Krummrich wrote:
> On Sun Jan 4, 2026 at 7:06 AM CET, Ke Sun wrote:
>> +/// PL031 RTC driver private data.
>> +#[pin_data(PinnedDrop)]
>> +struct Pl031DrvData {
>> +    #[pin]
>> +    base: Devres<IoMem<0>>,
> Please do not use 0 as generic argument, this should likely be RTC_YLR + 0x4
> (assuming that this register has a width of 32 bit).
>
> It allows you to perform register accesses until RTC_YLR + 0x4 with infallible
> accessors, since the call to IoMem::new() will validate that the memory region
> has at least a size of RTC_YLR + 0x4.
>
>> +    variant: VendorVariant,
>> +    /// RTC device reference for interrupt handler.
>> +    ///
>> +    /// Set in `init_rtcdevice` and remains valid for the driver's lifetime
>> +    /// because the RTC device is managed by devres.
>> +    rtc_device: Option<ARef<RtcDevice>>,
> I don't see a reason for a separate init_rtcdevice() method. Creating the RTC
> device should happen in probe(), which also gets you rid of this odd Option.
>
Hi Danilo,

I encountered an issue while refactoring the RTC abstraction.

Following the platform driver implementation, the AMBA driver stores its 
drvdata in amba_device->dev. However,
the RTC driver also stores its drvdata in the parent device (which is 
also amba_device->dev), causing a conflict.
This was already encountered in v1, which is why the design was awkward.

Do you have any suggestions on how to address this?

Here is part of the code:

  // rust/kernel/amba.rs
impl<T: Driver + 'static> Adapter<T> {
     extern "C" fn probe_callback(
         adev: *mut bindings::amba_device,
         id: *const bindings::amba_id,
     ) -> kernel::ffi::c_int {
         let adev_internal = unsafe { 
&*adev.cast::<Device<device::CoreInternal>>() };
         let info = Self::amba_id_info(adev_internal, id);

         from_result(|| {
             let data = T::probe(adev_internal, info);

             // Referring to the implementation in platform.rs, here 
`dev_set_drvdata(&adev->dev, data)`
             // will clobber the value that has already been set in 
`amba::Driver::probe`.
             adev_internal.as_ref().set_drvdata(data)?;
             Ok(0)
         })
   }
}

// rust/kernel/rtc.rs
impl<T: RtcOps> Adapter<T> {
     unsafe extern "C" fn read_time(
         dev: *mut bindings::device,      // **pointer to the `struct 
device` embedded in  a `struct amba_device`
         tm: *mut bindings::rtc_time,
     ) -> c_int {
         let bound_dev = unsafe { 
device::Device::<device::Bound>::from_raw(dev) };
         let rtc_tm = unsafe { &mut *tm.cast::<RtcTime>() };

         match T::read_time(bound_dev, rtc_tm) {
             Ok(()) => 0,
             Err(err) => err.to_errno(),
         }
   }
}

// drivers/rtc/rtc_pl031_rust.rs
impl amba::Driver for Pl031AmbaDriver {
     ...
     fn probe(
         adev: &amba::Device<Core>,
         id_info: Option<&Self::IdInfo>,
     ) -> impl PinInit<Self, Error> {
         let dev = adev.as_ref();
         let io_request = adev.io_request().ok_or(ENODEV)?;
         ...
         // Allocate RTC device.
         let rtcdev = RtcDevice::new::<Pl031DrvData>(dev)?;
         let rtcdev_clone = rtcdev.clone();

         // Set driver data with RTC device reference.
         rtcdev.set_drvdata(try_pin_init!(Pl031DrvData {
             base <- IoMem::new(io_request),
             variant,
             rtcdev: rtcdev_clone,
         }))?;
         ...
         // Register RTC device.
         // **If CONFIG_RTC_HCTOSYS is enabled and the device is rtc0, 
rtc_read_time will be
         // called during the registration process. This requires 
drvdata to be set up before registration.
         Registration::register(dev, rtcdev)?;

         Ok(Pl031AmbaDriver)
     }
}

Best regards,
Ke Sun

>> +}
>> +
>> +// SAFETY: `Pl031DrvData` contains only `Send`/`Sync` types: `Devres` (Send+Sync),
>> +// `VendorVariant` (Copy), and `Option<ARef<RtcDevice>>` (Send+Sync because `RtcDevice` is
>> +// Send+Sync).
>> +unsafe impl Send for Pl031DrvData {}
>> +// SAFETY: `Pl031DrvData` contains only `Send`/`Sync` types: `Devres` (Send+Sync),
>> +// `VendorVariant` (Copy), and `Option<ARef<RtcDevice>>` (Send+Sync because `RtcDevice` is
>> +// Send+Sync).
>> +unsafe impl Sync for Pl031DrvData {}
> Why not implement Send + Sync for RtcDevice then?
>
>> +// Use AMBA device table for matching
>> +kernel::amba_device_table!(
>> +    ID_TABLE,
>> +    MODULE_ID_TABLE,
>> +    <Pl031DrvData as rtc::DriverGeneric<rtc::AmbaBus>>::IdInfo,
>> +    [
>> +        (
>> +            amba::DeviceId::new_with_data(0x00041031, 0x000fffff, Pl031Variant::ARM.to_usize()),
>> +            Pl031Variant::ARM
>> +        ),
>> +        (
>> +            amba::DeviceId::new_with_data(0x00180031, 0x00ffffff, Pl031Variant::STV1.to_usize()),
>> +            Pl031Variant::STV1
>> +        ),
>> +        (
>> +            amba::DeviceId::new_with_data(0x00280031, 0x00ffffff, Pl031Variant::STV2.to_usize()),
> Why a constructor new_with_data() if you already store data through the generic
> device ID mechanism right below?
>
>> +            Pl031Variant::STV2
>> +        ),
>> +    ]
>> +);
