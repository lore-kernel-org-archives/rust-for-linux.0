Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B382727FA
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754317162; cv=none; b=p8y61r0XYUA57/mcwg2pz45DJ56JZqAUq2O6UwEPU02MbZsr+TkZIos7qCzO4wAVTXQGCdIdhVOf5R6amBwfmrxat++XmSRC3Ylez54j2cmz8vtH12w7XRdSV9Z63qSJb63FVmUXO4jdiX7WDTKwBqUw4izTojF5L4OcFzWZnYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754317162; c=relaxed/simple;
	bh=DT45IrM3oRidqDEqsN0wja9MZrZqv8a7NAwywqEnZ1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oAULzaXZMxfW5Lf2+ZdxEGf3FwR+IT3UyiMYbeH0yq7elp+K/UNxgcGBrwQ2ux5qbXnmBfde6AsX6V5acYqNLeN6dQPKVdKtK1E17TNocI8Zr+c4E2E0nVQqjS1RwJoQ1abKC29bMgFQ1wxF3b9fZms9S420DdqMjEfwe4XEUPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTUUkrf8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTUUkrf8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-458aee6e86aso19322575e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Aug 2025 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754317155; x=1754921955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jkoQ9UXYBG56fZYw9Q4YKc402NpIGoya5dUacvq9ZXI=;
        b=iTUUkrf8/DuEDdQ6ZG/uSwW4+J7MiOSa77vtw54y81Ps6Pn5axu2PabLud7G28JcJv
         G4BGawT21/uWl3U3mecNhc98BW7dKBlkDsSGJ2o4ALKGmu5aFk2SGaQRazUVR5Z7Yk3I
         0Kd0ytax2ldhP894xZtMI3M0AfJgvNxzN/Dgq+WnNgymZ47TOlu4BYIooOW2JhWVv/9Z
         6PvMRTJZJ7L0Ug1omcRlFfNmH/0zYuLWz7XW/6ui4HBMs15l4FH3sFNbZaU7rvj/Saen
         O1SI29D7+QWo1GP6RlDp/OuNhZgYDqWmMX72gycCs0tttIGzbgCszEmDrqRV2JKoQmN1
         /KIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754317155; x=1754921955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jkoQ9UXYBG56fZYw9Q4YKc402NpIGoya5dUacvq9ZXI=;
        b=btCMuRAFKXwHwlRigyEfnTMd3i8d2+L1yKNWSRIB2kj7m5M+lQygIHybmCq88HYEzz
         SR2ylypNxkYXUVBSqJxctqQ/SPDAtjDRAIpdXwGxHik98XLALE7BNjEoRNfvUb2aGAL6
         VfmsclE7Sd8W3cDE4pEzhu267qcTmoUGdLP9zlAJQj8edjUPk6ln4VozWyUXJmBS1y1M
         ORTUjEIUaBDIOiqA0xYsw8upwm/a9GPsfJT0MlZipEH7NyVzlUCfsLJhZLCToPp5KiJ/
         lR9sv+fsC3r7HCzZs7mzmkVIwN/VYr0uxV+COIkq6Uf36XONtrfDMdpVJRDlXzr98jKZ
         uqbA==
X-Forwarded-Encrypted: i=1; AJvYcCUCLnvxkNAGbgelX74lbXiGFV8nCoMxr6IaxntB8JR/Yla2H9yO2ossWNbGbBmW1McCJvc+ugqftoNlw1fjcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoBSE47SJqpIF6OmgKBGjkITV7Yd+hMFrsXwYdrk8CLEUikNMJ
	Np0Ns2vz8cLyucEbIHmD8/J72F16IBRQZgchGL8A30R7E4sR3h+z/oon
X-Gm-Gg: ASbGncuzLUgp2xwyFnlYLJb01FKt2lYPwc/+rwsSbMHkNfijjG0mnu/lYXfaLT6flIA
	R+jULlTkmILDbR+dQVYWdFIZk2RQ58JX/n6G+e89B6X+dR0tu4rP1VM9usY6BT4Oa3UDURYodyJ
	EEWw6RNP/lzaVuauScFxBvggOCRy7/ogD4ekpLXC+hMyk8r2C6/lHZrv4DGlGoK3ncDiQO8BYDc
	lKtMEv4UIKFhdP7IjaXjKVylNzhxEyR/nOjeMeg8+7h8GXLDMvlP3qO23Bdn9ZPMGL3BfNm3v9y
	AMCd5VnXPKjwEYsJDxeoGTJ8aXpEEC0n2whHcsxmYgTPhfPMqesnti3caHOJPXKvg32rasgfow6
	J+f1N2CttXfjzYkg/luYnEUoSRVuqvVxbBj2NCA0=
X-Google-Smtp-Source: AGHT+IFi2Y3wZ0+miZDD/4mrNc/ajT5zgTKvg8IMksJOj9GtLf4sss89db4EWhXRkfytgGDH8VGlVA==
X-Received: by 2002:a05:600c:a46:b0:455:f380:32e2 with SMTP id 5b1f17b1804b1-458b6b30363mr70547685e9.18.1754317154960;
        Mon, 04 Aug 2025 07:19:14 -0700 (PDT)
Received: from [10.38.1.85] ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3c33fesm15945961f8f.29.2025.08.04.07.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 07:19:14 -0700 (PDT)
Message-ID: <ff90c4d7-733a-4d76-a939-b460d66389bc@gmail.com>
Date: Mon, 4 Aug 2025 15:16:57 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <F8F4578D-9095-48D4-BC21-67177F2DDD6F@collabora.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <F8F4578D-9095-48D4-BC21-67177F2DDD6F@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Daniel

Thank you for the review.

On 8/1/25 18:14, Daniel Almeida wrote:
>> +
>> +        Self(i2c)
>> +    }
>> +}
>> +
>> +// SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of `i2c_device_id` and does not add
>> +// additional invariants, so it's safe to transmute to `RawType`.
>> +unsafe impl RawDeviceId for DeviceId {
>> +    type RawType = bindings::i2c_device_id;
>> +}
>> +
>> +// SAFETY: `DRIVER_DATA_OFFSET` is the offset to the `driver_data` field.
>> +unsafe impl RawDeviceIdIndex for DeviceId {
>> +    const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::i2c_device_id, driver_data);
>> +
>> +    fn index(&self) -> usize {
>> +        self.0.driver_data as _
>> +    }
>> +}
>> +
>> +/// IdTable type for I2C
>> +pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
>> +
>> +/// Create a I2C `IdTable` with its alias for modpost.
>> +#[macro_export]
>> +macro_rules! i2c_device_table {
>> +    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $table_data: expr) => {
>> +        const $table_name: $crate::device_id::IdArray<
>> +            $crate::i2c::DeviceId,
>> +            $id_info_type,
>> +            { $table_data.len() },
>> +        > = $crate::device_id::IdArray::new($table_data);
>> +
>> +        $crate::module_device_table!("i2c", $module_table_name, $table_name);
>> +    };
>> +}
>> +
>> +/// An adapter for the registration of I2C drivers.
>> +pub struct Adapter<T: Driver>(T);
>> +
>> +// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
>> +// a preceding call to `register` has been successful.
>> +unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
>> +    type RegType = bindings::i2c_driver;
>> +
>> +    unsafe fn register(
>> +        pdrv: &Opaque<Self::RegType>,
>> +        name: &'static CStr,
>> +        module: &'static ThisModule,
>> +    ) -> Result {
>> +        let i2c_table = match T::I2C_ID_TABLE {
>> +            Some(table) => table.as_ptr(),
>> +            None => core::ptr::null(),
>> +        };
>> +
>> +        let of_table = match T::OF_ID_TABLE {
>> +            Some(table) => table.as_ptr(),
>> +            None => core::ptr::null(),
>> +        };
>> +
>> +        let acpi_table = match T::ACPI_ID_TABLE {
>> +            Some(table) => table.as_ptr(),
>> +            None => core::ptr::null(),
>> +        };
> 
> I wonder what happens if these are all None?
> 

C code in the i2c_register_driver function doesn't require id_table, OF
table, or ACPI table to be non-NULL. Technically, there's no issue
registering such an I2C driver. Though there's the following code in
i2c_device_probe:

    /*
     * An I2C ID table is not mandatory, if and only if, a suitable OF
     * or ACPI ID table is supplied for the probing device.
     */
    if (!driver->id_table &&
        !acpi_driver_match_device(dev, dev->driver) &&
        !i2c_of_match_device(dev->driver->of_match_table, client)) {
        status = -ENODEV;
        goto put_sync_adapter;
    }

Based on that, maybe it makes sense to add some kind of
compile-time/build-time assertion to make sure the developer defines at
least one of those tables. If so, I'm happy to think about how to
implement something like that.

>> +
>> +        // SAFETY: It's safe to set the fields of `struct i2c_client` on initialization.
>> +        unsafe {
>> +            (*pdrv.get()).driver.name = name.as_char_ptr();
>> +            (*pdrv.get()).probe = Some(Self::probe_callback);
>> +            (*pdrv.get()).remove = Some(Self::remove_callback);
>> +            (*pdrv.get()).shutdown = Some(Self::shutdown_callback);
>> +            (*pdrv.get()).id_table = i2c_table;
>> +            (*pdrv.get()).driver.of_match_table = of_table;
>> +            (*pdrv.get()).driver.acpi_match_table = acpi_table;
>> +        }
>> +
>> +        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
>> +        to_result(unsafe { bindings::i2c_register_driver(module.0, pdrv.get()) })
>> +    }
>> +
>> +    unsafe fn unregister(pdrv: &Opaque<Self::RegType>) {
>> +        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
>> +        unsafe { bindings::i2c_del_driver(pdrv.get()) }
>> +    }
>> +}
>> +
>> +impl<T: Driver + 'static> Adapter<T> {
>> +    extern "C" fn probe_callback(pdev: *mut bindings::i2c_client) -> kernel::ffi::c_int {
> 
> Nit: throughout the file: I think that pdev comes either from pci or platform
> devices? Maybe a different variable name should be used?
> 

To be honest, I always thought pdev/pdrv/etc just meant "pointer to
device"/"pointer to driver" and not necessarily PCI/platform. If it
actually implies platform/PCI, then yeah, I agree — better to use
something like idev/idrv, as Danilo also pointed out.

>> +        // - `dev` is guaranteed to be valid while it's alive, and so is `pdev.as_ref().as_raw()`.
>> +        let raw_id = unsafe { bindings::i2c_match_id(table.as_ptr(), dev.as_raw()) };
> 
> Wait, where’s `pdev.as_ref().as_raw()` here?
> 
Yeah, good catch. There was a significant rework between v2 and v3, and
I didn’t clean up all the comments properly. My bad.

Noted all the other comments too — I’ll fix those in the next drop.

Best Regards
Igor

