Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1CF1386DA;
	Thu, 23 Jan 2025 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737648288; cv=none; b=bcJ808drqmHa3fNC7Hl/mnogJqc2A0vKfz08TBqYObIsJM5sgzijGK8lSJTrUe4VApSBDhfR7Kv5/NSJ2hx7Tkek3TyYFoXcU6N2/WVUAlOTcsh7Sa/8Y3iqDrMsClL+niyj9G1W8sCLJ/MNlHtPfEjiCEcIkmGgCZ9QJxIrpN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737648288; c=relaxed/simple;
	bh=b0jwwa+ckzFC5ZMMdC6uNqRYsEntJcXph8Yb0WcLrCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2e9TjLG70I+uaXpDsSbx713Lvy24ufGxTcZck/2O9qUNYfG5Kn24v+BEPuz60OYC2RvzYdciZ/xlB6l6emnBDOIgKi22XEBslH45aU5o4sO17NJzrsNWepFg3GXu8kyyDFMkwXnT3FLf2RPIjXU1QS1jhIgCvr9t8YgyQtCcMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQ2PDzne; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQ2PDzne"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so11374155e9.1;
        Thu, 23 Jan 2025 08:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737648285; x=1738253085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AjhnZZ2Yx8u2d09FTgCuJuFgH1rtuHSXI+TgI60WvCc=;
        b=MQ2PDznegQHQDkSMslASRtXuMezqGi1SsKQFoMjTbItQXgIg3CrEXeD/hTvlbUbTo0
         7luMksX+Zl5RkK+F8MZWQPH7VXkSMO4OnexnuFN0GGlgBEsyHIdzpzfRNoI376xfrzl1
         pLolCWH6fVXEU91sIMtAXN6ZWRgcPAldDsQCMcetzCSaxylCh/0gs+XTMojqWR912ro1
         fq9axAMrT2cIYrpITNAw8Au+3HiYSjZlertnMhlG425e4cprQiaZBEy1vUNJreijTspk
         +kRUVp055514l2vEYpTGv5hFJ6kMefYMshTQx8ciVXynIAO9dbh+NlJ+lwXdCkn+Lfut
         /OoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737648285; x=1738253085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AjhnZZ2Yx8u2d09FTgCuJuFgH1rtuHSXI+TgI60WvCc=;
        b=I6PqbhPap+4blpyy+v5BmsPSoN/Oo30NdMJ/4sUXz5maqlHLx+g7saeXV2UU7v8dTp
         DiiAxlkE7FCbmnSS9PtHToBYfKMlmPVdbn7zNVaUr8onQGBYXg/y/b63nNPK1v9o1cpN
         /N2ajNwIk/NJVxI/r0WDbt8NvW6R6H6/LZC7r0x4DUxXJVT31ji2CdgO/QanIBKzAZiU
         etZMy/DnMXeXfwlCvieMs6cBA1Ct1P0Q/EsCMwC2G5wtPisUL9iVaO8Fke8ZLlX/snKe
         pATW3nB+2mKDwVgjS/mTK8ECii+xN7lY4D5Ns0y2PaxHsgTU9EkV6kyLgrRk0s7iTF7D
         M/3w==
X-Forwarded-Encrypted: i=1; AJvYcCUZA06iZrNqqKIqvLPZ7+D0j5wgFK2P/hAvV7/w8d4TEWp68W3RlD2wHMMXc2VkqgViM9jkbhz2bWsypVg=@vger.kernel.org, AJvYcCUmVfNGgn/kFWlk3yKueqVO858A14tDmRgDWdj5qeg2SQTTCGfbn2zyxoDJWm+RlcJi4p8hmSi891kvyPm2Jr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB8odVi58392hze+6sNycb4+DiPjaFc7da//tdbzgiKPv8SqkS
	IHv+8b67nGXo+bieHmLitnft/vaTl84+iJEdqgD9e1U5zkOj/S+o
X-Gm-Gg: ASbGncvNO6aoy0h5SnbYOgNHbQBeFXgE6d3guYXdhGmO0QtIUu9xjQyuquSYAb85SPu
	D9iec4cqutsm2phpDqFidBLFmRH++ArD6fO37VhHYsKpKHwJGppAxp7Mtx79cHQuY0jPA+6eyoh
	gBzAzeXXH65qdCGUIuqfQ/hay4R36k+O8C+33eqk3LyKczny6Sae474VFMthW04/lg0uiEmYNYO
	9DYM9/uwflrLTe0UdBYvykE+5ZcBE4Fb0wPjlX9P2TLNSU19LHqK0o10bVyFt0rruaM2rBvzwkP
	XPr4gXjbB1YleySS5g==
X-Google-Smtp-Source: AGHT+IHHQxRwCxw/j4n7hk3cQJGVXPt3xk2axl3yLBBOhLKMohlFugrrSFernPCj1e0W8iF2DvNHIg==
X-Received: by 2002:a05:6000:1947:b0:386:3835:9fec with SMTP id ffacd0b85a97d-38bf58e8b7fmr19552668f8f.44.1737648285002;
        Thu, 23 Jan 2025 08:04:45 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4b75sm51153f8f.100.2025.01.23.08.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 08:04:44 -0800 (PST)
Message-ID: <82f3f5ec-82bd-4356-a817-84f033499f34@gmail.com>
Date: Thu, 23 Jan 2025 17:04:43 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>,
 Lee Jones <lee@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com>
 <2025012243-myspace-woof-1d1e@gregkh>
 <81cffd91-6b0b-4f09-a5c8-e1697975502e@gmail.com>
 <2025012337-wired-sensually-5c49@gregkh>
Content-Language: en-US
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <2025012337-wired-sensually-5c49@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23.01.25 5:00 PM, Greg Kroah-Hartman wrote:
> On Thu, Jan 23, 2025 at 04:52:26PM +0100, Christian Schrefl wrote:
>>
>>
>> On 22.01.25 10:28 AM, Greg Kroah-Hartman wrote:
>>> On Sun, Jan 19, 2025 at 11:11:14PM +0100, Christian Schrefl wrote:
>>>> When using the Rust miscdevice bindings, you generally embed the
>>>> MiscDeviceRegistration within another struct:
>>>>
>>>> struct MyDriverData {
>>>>     data: SomeOtherData,
>>>>     misc: MiscDeviceRegistration<MyMiscFile>
>>>> }
>>>>
>>>> In the `fops->open` callback of the miscdevice, you are given a
>>>> reference to the registration, which allows you to access its fields.
>>>> For example, as of commit 284ae0be4dca ("rust: miscdevice: Provide
>>>> accessor to pull out miscdevice::this_device") you can access the
>>>> internal `struct device`. However, there is still no way to access the
>>>> `data` field in the above example, because you only have a reference to
>>>> the registration.
>>>
>>> What's wrong with the driver_data pointer in the misc device structure?
>>> Shouldn't you be in control of that as you are a misc driver owner?  Or
>>> does the misc core handle this I can't recall at the moment, sorry.
>>
>>
>> I don't know the internals of (C) miscdevice good enough to know where I'm
>> allowed to store something, since there is no private_data field.
> 
> You are right, I was wrong here, sorry.  A misc device either needs to
> be "stand alone" or embedded into something else.

The struct miscdevice is "embedded" in the Rust MiscDeviceRegistration, 
so it should be fine if I understand you correctly.

> 
>> Not sure how the lifetimes of the whole device and device->driver_data are.
>> But even that instead we use that we will need a rust abstraction for that to
>> allow safe drivers.
> 
> Agreed, so let's make it work properly :)

So keep the current approach?

> 
>>>
>>>> Using container_of is also not possible to do safely. For example, if
>>>> the destructor of `MyDriverData` runs, then the destructor of `data`
>>>> would run before the miscdevice is deregistered, so using container_of
>>>> to access `data` from `fops->open` could result in a UAF. A similar
>>>> problem can happen on initialization if `misc` is not the last field to
>>>> be initialized.
>>>>
>>>> To provide a safe way to access user-defined data stored next to the
>>>> `struct miscdevice`, make `MiscDeviceRegistration` into a container that
>>>> can store a user-provided piece of data. This way, `fops->open` can
>>>> access that data via the registration, since the data is stored inside
>>>> the registration.
>>>
>>> "next to" feels odd, that's what a container_of is for, but be careful
>>> as to who owns the lifecycle of the object you are trying to get to.
>>> You can't have multiple objects with different lifecycles in the same
>>> structure (i.e. don't mix a misc device and a platform device together).
>>>
>>> So a real example here would be good to see, can you post your driver at
>>> the same time so that we can see what you are doing and perhaps provide
>>> a better way to do it?
>>
>>
>> The `struct miscdevice` is currently the first item in the 
>> `MiscDeviceRegistration` so the  `struct miscdevice` and the 
>> `MiscDeviceRegistration` have the same address.
>> I can use container_of! if people think that more understandable.
> 
> You always have to use container_of! in case things move around.  If the
> location is the same place, then the compiler just optimizes it all away
> and doesn't do any pointer math so it's fine.

Sure I'll change it to use container_of.

> 
> thanks,
> 
> greg k-h

