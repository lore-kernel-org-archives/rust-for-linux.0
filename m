Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5685234;
	Thu, 23 Jan 2025 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737626581; cv=none; b=rVdO1Fyaif9Kx4EzIx1U923PRL8aHocIZUhpoh15tIdTRafgUqxF9sEdCFRHmuCKCGsaqAK5TuuoX+ZuIQwc2jHAj8roQSxOKpU+lIL2i8VJJhq77a4zsoDriiUsW27l8gTisDtv/XjatwAK3tpGnXMEqoER/i0wMFx2QvJaIx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737626581; c=relaxed/simple;
	bh=9kLKxg5Wl8QuI1Pu0A0az5n0XGjm6K028zf706D5W2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5ppZLSN7vix749ZTmFpMAL6GbFOG3DCJoVqs+S6aOKZzJpgIGMufsR3Q3DG9oOAuZXk9zxYpGUQIsQQ5a6tmnMoYA7DPFruCGXhWzVJ80NGiQMvyws688CTqcAqvJaAr57qNkPw8ht02byfYOeM4D7FcK6Hc0Khof/n68/C9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZYs2d1j; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZYs2d1j"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab2c9b8aecaso134418366b.0;
        Thu, 23 Jan 2025 02:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737626578; x=1738231378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nn7f1QDRjABiYdfBrDPZUt0OEho92iQ25k7YCXNjVxI=;
        b=bZYs2d1jdffCV1r7AHYhBflidXSXrKtRr0suH4dvFzaG7pAYaWVGpnC+R4nfAnpRYg
         i53xlHyGNfIOO1z8mYZBGhaZu9aty1/PSx+/mOyCyATIroK+7GINTGBprrIDd9/nWwfS
         YnAIzsh7ZP28HljBrbjX1qPBPrUDA57HXq2j4reyAuMdk4uuvEm2bvIQXtrYWQr5z4Aa
         PhjY8Lv1nGzotr2786d72Zyw4iff3CySIebt4voXFyx/k8YH5B2tRekdU8cnolQtf7DQ
         rFa0YgC2Uer7bcZSh7+pnvNLaQ2dlF+dXlN6FhbZbO7uYaAIUinido4bLgSe6bP4Zu+L
         bXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737626578; x=1738231378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nn7f1QDRjABiYdfBrDPZUt0OEho92iQ25k7YCXNjVxI=;
        b=MwqqLQA3jV9ZmgDvoAAW/8oqvLq2llKZ8+Cf0KdM6c5CJ1c92nJ5SkJzsuTfZhQtNZ
         y83Z5pRf4LsTPaWk/oOcVVe2C/KeZWGraKWhDqc0dXK8w4Artvg2l1rJAXG4HD0ObhqR
         EVeUPL5y9xfk/n3ZQDuNT6XjUvpYAs8E6nKeTvS3HB/UEdnJI+GnyuzNdxt/pjKlau7B
         N2/286IAzW3Op3uc/7ZWWZ3Q3RNbeswPPKw8WfKnyhRnwfoSOYDhjdYM90o7jzaCoA96
         mEypjzreOOmU6cn+gMkOIIzmzxaLkgD2qravx7xLNNNeiftYHtRxAzdaWflnTrq+0GDE
         UXmg==
X-Forwarded-Encrypted: i=1; AJvYcCVxZDz+wpMl5WEsKewdHCqjBrC8Ly242vVYpa409ULZbBJR/VxcXcB+l9Pu3wSeH3BRkclvCPD9lT69T/38Yao=@vger.kernel.org, AJvYcCWMD0tzgKutZ2n7cvo0V6eNUcRmgr4XxD0Y3r/vGxh1FmTo1Mn++YQkgleuq6dGsV2mB+cCWKERHvk1q5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUVfeyu1dQn+0/BOkTrBtLYFnNH7Fh1cNmzuYETflbJMaq+o5L
	wKDcRBF7QfrzZQ5MjqANpAw84DZf3ErIqKsfeEiYYSIB9j82JPhT
X-Gm-Gg: ASbGnctQ3JHnh0piaQVHuQ1wM0fmUkWC4WjeoINnma2mKbwFIzPJch3Ms6KWvuqmpH6
	Rj/43Fdjr/rgCIEbfpKZGmOZ/RZazYEZ3vveEFectca/pNBR9aeJl0steUEeSOt1AuaSDNh9N36
	KbpXM1rO+a2Njm52HQdaYuAwNQVma/9m0jVhNk8XdIBAwXzrZumOq19wmchREf2vdiMCFTN4xUM
	lstV98CYLVnPXE1DzQNAx57D52KqjA0VZmmlaqK0MCxXzDv8mEo4VTzjcXplXqyuIHiMpKKsh2d
	w/P1UpwtHBDfQw==
X-Google-Smtp-Source: AGHT+IFBonUB0dybhykZaWG1lE35DbT9+uimB8yFqTNpVs2WtmP3fHyGcRnKKE9wgII/s+cHzhhppQ==
X-Received: by 2002:a17:906:4784:b0:aa6:5e35:d730 with SMTP id a640c23a62f3a-ab38b16300dmr2223560866b.24.1737626577569;
        Thu, 23 Jan 2025 02:02:57 -0800 (PST)
Received: from [10.5.1.156] ([193.170.134.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c636b4sm1051141266b.15.2025.01.23.02.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 02:02:57 -0800 (PST)
Message-ID: <bc096b1c-2e33-4234-a0ac-081b05d8cd7f@gmail.com>
Date: Thu, 23 Jan 2025 11:02:56 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
To: Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com>
 <2025012243-myspace-woof-1d1e@gregkh>
 <CAH5fLgh7QyVSgqJZM-krHmF87c76a84Cg6PyT47TYjMsN9iwZg@mail.gmail.com>
 <2025012236-tall-untried-1d7c@gregkh>
 <CAH5fLggZ-7Rb=98JF+KkieY_H13mRVLB+T1umOrQib3ah78M-Q@mail.gmail.com>
Content-Language: en-US
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CAH5fLggZ-7Rb=98JF+KkieY_H13mRVLB+T1umOrQib3ah78M-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 22.01.25 2:06 PM, Alice Ryhl wrote:
> On Wed, Jan 22, 2025 at 1:40 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Wed, Jan 22, 2025 at 11:11:07AM +0100, Alice Ryhl wrote:
>>> On Wed, Jan 22, 2025 at 10:28 AM Greg Kroah-Hartman
>>> <gregkh@linuxfoundation.org> wrote:
>>>>
>>>> On Sun, Jan 19, 2025 at 11:11:14PM +0100, Christian Schrefl wrote:
>>>>> When using the Rust miscdevice bindings, you generally embed the
>>>>> MiscDeviceRegistration within another struct:
>>>>>
>>>>> struct MyDriverData {
>>>>>     data: SomeOtherData,
>>>>>     misc: MiscDeviceRegistration<MyMiscFile>
>>>>> }
>>>>>
>>>>> In the `fops->open` callback of the miscdevice, you are given a
>>>>> reference to the registration, which allows you to access its fields.
>>>>> For example, as of commit 284ae0be4dca ("rust: miscdevice: Provide
>>>>> accessor to pull out miscdevice::this_device") you can access the
>>>>> internal `struct device`. However, there is still no way to access the
>>>>> `data` field in the above example, because you only have a reference to
>>>>> the registration.
>>>>
>>>> What's wrong with the driver_data pointer in the misc device structure?
>>>> Shouldn't you be in control of that as you are a misc driver owner?  Or
>>>> does the misc core handle this I can't recall at the moment, sorry.
>>>
>>> There's no such pointer in struct miscdevice?
>>
>> struct miscdevice->struct device->driver_data;
>>
>> But in digging, this might not be "allowed" for a misc driver to do, I
>> can't remember anymore, sorry.
>>
>>>>> Using container_of is also not possible to do safely. For example, if
>>>>> the destructor of `MyDriverData` runs, then the destructor of `data`
>>>>> would run before the miscdevice is deregistered, so using container_of
>>>>> to access `data` from `fops->open` could result in a UAF. A similar
>>>>> problem can happen on initialization if `misc` is not the last field to
>>>>> be initialized.
>>>>>
>>>>> To provide a safe way to access user-defined data stored next to the
>>>>> `struct miscdevice`, make `MiscDeviceRegistration` into a container that
>>>>> can store a user-provided piece of data. This way, `fops->open` can
>>>>> access that data via the registration, since the data is stored inside
>>>>> the registration.
>>>>
>>>> "next to" feels odd, that's what a container_of is for, but be careful
>>>> as to who owns the lifecycle of the object you are trying to get to.
>>>> You can't have multiple objects with different lifecycles in the same
>>>> structure (i.e. don't mix a misc device and a platform device together).
>>>
>>> Ultimately, this is intended to solve the problem that container_of
>>> solves in C. Actually using container_of runs into the challenge that
>>> you have no way of knowing if those other fields are still valid.
>>
>> You "know" they are valid if you have a pointer to your structure,
>> right?  Someone sent that to you, so by virtue of that it has to be
>> valid.
>>
>>> If
>>> the destructor of the struct starts running, then it might have
>>> destroyed some of the fields, but not yet have destroyed the
>>> miscdevice field. Since you can't know if the rest of the struct is
>>> still valid, it's not safe to use container_of.
>>
>> That's a different issue, that's a lifetime issue of "can I look at
>> these other fields at this point in time and trust them", it's not a
>> "these are not valid thing to look at".
> 
> The memory containing the field can't have been deallocated yet, but
> if we provide a safe way to get access to those fields after their
> destructor runs, then that's still a problem. If there's a field of
> type `KBox<MyType>`, i.e. a pointer to a kmalloc allocation, then the
> destructor will have freed that allocation. We cannot let you access
> the field that holds the KBox after that happens because the pointer
> will be dangling.
> 
>>> Storing those other fields within the registration solves this issue.
>>> The registration ensures that the miscdevice is deregistered before
>>> the `data` field is destroyed. This means that if it's safe to access
>>> the miscdevice field, then it's also safe to access the `data` field,
>>> and that's the guarantee we need.
>>
>> I'm confused.  A misc device should be embedded inside of something
>> else.  And the misc device controls the lifespan of that "something
>> else" structure, right?  So by virtue of the misc device being alive,
>> everything else in there should be ok.
> 
> This patch proposes that the way you write
> 
> struct MyDriverData {
>     // lifetime of these fields is controlled by misc
>     field1: Foo,
>     field2: Bar,
>     misc: MiscDeviceRegistration<MyMiscFile>
> }
> 
> is
> 
> struct MyDriverData {
>     misc: MiscDeviceRegistration<MyMiscFile, Inner>
> }
> struct Inner {
>     // lifetime of these fields is controlled by misc
>     field1: Foo,
>     field2: Bar,
> }
> 
> in memory all three fields gets laid out next to each other.
> 
>> Now individual misc devices might want to do different things but if
>> they are being torn down, that means all references are dropped so any
>> "container_of()" like cast-back should not even be possible as there
>> should not be a pointer that you can cast-back from here.
>>
>> Or am I confused?  I think a real example would be good to see here.
> 
> Christian, do you mind sharing the example you showed to me?

Sure

#[pin_data(PinnedDrop)]
struct LedPwmDriver {
    pdev: platform::Device,
    mapping: Devres<IoMem<MAPPING_SIZE, true>>,
    #[pin]
    miscdev: MiscDeviceRegistration<RustMiscDevice>,
}

impl platform::Driver for LedPwmDriver {
    type IdInfo = ();
    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
    fn probe(pdev: &mut platform::Device, info: Option<&Self::IdInfo>) -> Result<Pin<KBox<Self>>> {
        dev_dbg!(pdev.as_ref(), "Probe Rust Platform driver sample.\n");
        if info.is_some() {
            dev_info!(pdev.as_ref(), "Probed with info\n");
        }
        let mapping = pdev
            .ioremap_resource_sized::<MAPPING_SIZE, true>(pdev.resource(0).ok_or(ENXIO)?)
            .map_err(|_| ENXIO)?;

        // Initialize the HW
        mapping.try_access().ok_or(ENXIO)?.writel(0xFF, 0x0);

        let options = MiscDeviceOptions { name: c_str!("led0") };
        let drvdata = KBox::try_pin_init(
            try_pin_init!(Self {
                pdev: pdev.clone(),
                mapping,
                miscdev <- MiscDeviceRegistration::register(options),
            }),
            GFP_KERNEL,
        )?;
        Ok(drvdata)
    }
}

#[pinned_drop]
impl PinnedDrop for LedPwmDriver {
    fn drop(self: Pin<&mut Self>) {
        dev_info!(self.pdev.as_ref(), "Remove Rust Platform driver sample.\n");

        if let Some(res) = self.mapping.try_access() {
            res.writel(0x00, 0x0);
        }
    }
}

#[pin_data(PinnedDrop)]
struct RustMiscDevice {
    dev: ARef<Device>,
    mapping: &'static Devres<IoMem<MAPPING_SIZE, true>>,
}
#[vtable]
impl MiscDevice for RustMiscDevice {
    type Ptr = Pin<KBox<Self>>;
    fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
        let dev = ARef::from(misc.device());
        // SAFETY:
        // Stuff?
        let ledpwm = unsafe { &*container_of!(misc, LedPwmDriver, miscdev) };
        dev_info!(dev, "Opening Rust Misc Device Sample\n");
        let res = ledpwm.mapping.try_access().ok_or(ENXIO)?;
        res.writel(0x80, 0x0);
        KBox::try_pin_init(
            try_pin_init! {
                RustMiscDevice {
                    dev: dev,
                    mapping: &ledpwm.mapping
                }
            },
            GFP_KERNEL,
        )
    }
}

#[pinned_drop]
impl PinnedDrop for RustMiscDevice {
    fn drop(self: Pin<&mut Self>) {
        dev_info!(self.dev, "Exiting the Rust Misc Device Sample\n");

        if let Some(res) = self.mapping.try_access() {
            res.writel(0x10, 0x0);
        }
    }
}


I removed or simplified many irrelevant parts, the full driver can be found here:

https://github.com/onestacked/linux/blob/c9e2ef858e4537d33625cdf2b5d20ef4acfa9424/drivers/misc/ledpwm.rs

This driver was only an attempt to the assignment of a University course in Rust mostly to see if was 
possible or which abstractions are missing.

The driver using the patch can be found here:
https://github.com/onestacked/linux/blob/rust_ledpwm_driver/drivers/misc/ledpwm.rs


Cheers
Christian
