Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D941CEAD4;
	Fri, 24 Jan 2025 11:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737718948; cv=none; b=j2FAWYpdUHFaYniwRt0Q2LjbTw4ygHfXk3THbVgEhx4ykbQVvD3mVJL04hGpjH5ZS0+Tem+OHJCFbWC456ZUN/S1OMx71WO8imMoHMfkYvvde2WX59GjHmtztHWCW2u9+zWzQTNBkgrN2SXHyyPBNxVyz13NBxie8P6GynkzK8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737718948; c=relaxed/simple;
	bh=sL5EkKnY0e06hbGL1dBuaGa3tKvwgdC/PVXNTbfFmkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ehztRxeKAkZxzx8y9C8Ic0e/qFVvS6rAX/bhSTS8z4WSUBaGiSWdnCJx8JVQFEJb5P7awMfV5MHnITfM72KPuR7rpwW0qbSaUpDxA0dYUX/wsHtgcsmohCURlfNDoJEBYyShZbsO2yYaCzxOPD2+rxEnWw8sqo2/RU2Zv4O/K0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bohJHf9B; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bohJHf9B"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so20132695e9.2;
        Fri, 24 Jan 2025 03:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737718945; x=1738323745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uoUT/7dCTpSSK8rvKcd8RsKrxSPpFHYzPN0Z/cDHlio=;
        b=bohJHf9B+PgNn7tjncWW1zMe7+J8M3DwFqxJpqfk3+tmSOUoE6jZvZiZsMRhRNXhOk
         68x0RBdiq0AUMCHC8e49unHHJO1qSXkJCjq24Z2zdCtuPymLpPHsKb3JchfqlEjDZDY0
         P/MgYC0n0DMifJW+Y9V6yLIXD6J+7V2VLA14lI8TPOjkNVdUuJ714TTKoLJNvoKVdaXz
         PEUikyqcu7lSBLJUOerFYbgQ6VGT2dB/wQn3yMRHJS4Aocaqk7XdNkKOHBwaFuP9mFDe
         YzB4Wj2gnd9Zqt0C0Bro8sI+GOHMno955kAYQlZfhMBEVREBEUILscSt4NKPwyMmT81b
         JBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737718945; x=1738323745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uoUT/7dCTpSSK8rvKcd8RsKrxSPpFHYzPN0Z/cDHlio=;
        b=EtQMuf64wI4yJtU2RHLz2rGNSoJ5dsXpVT/k51MEK0FvR38d3+MoUS400A3Scb3b8Q
         4uwiBgS7QGbAcMTVcL8BoDxIb7KXAX/MNTXaLYQvD9NuyVsbDUGQosmkIjeFPUYAA2dT
         C2d3nfMwkwQyAOrd3wj2JlE+ahLXGUAackv12aIjGxxWctsPypuFxf27sPRCAXyi9C0q
         C0JMLKHWAcpTcEdBvYin5m44A+bHHnr0C71xBCQ8FqduHYMcISeMH88ZY0ydxRZahYcZ
         RxldJIZRthF4GjW8wXWkfjZ/Mzof92ZfRnlykLuhMUy41jbyCzlk5OpaGGGa+KlascOW
         Hciw==
X-Forwarded-Encrypted: i=1; AJvYcCUDqt9Ui8jvBO8yczQOwzSCknmlbpGTO+edxf1yNhc4CWz9s73XWTDqkdcFUXUr+uyX9orUsoRDDKG9Wx4=@vger.kernel.org, AJvYcCXwFUICEB380cDUjfPjI41nfCTN1D/x/Op532cqLPMpcHDtxgseZI8bO5Zr8fM8V5WbvSMZJC5yjk86L11cKsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7gwxnxMYHAGfTqwAZlNrenydBJV0NZhF+MLrRU69PCceF01vk
	ou1etLj0lv097SOHoihCujXT6tTtyvheXeF+hX6Cnbb/nW2iVJeL
X-Gm-Gg: ASbGncvN4qgbYlN8au589LEM5sHQzRHl9QIDK3dYp4GZHev7C2G8uZae2cgfYqvBW2e
	xtvy/FW7+Z0pOuyhCqRWJKQcrYUXPYMBEBZhf0W/PyADzoSBTr0VhdGGoAla0LsR/xGbRJeBWpb
	/zhFw3JTgiUL6odCQMZUd7jUhTWmwDuf+vAlvhEsGOY1rgDRbnVzA8JkWaiQQBrfCnfmkU9ZvAT
	gGOHC8FHHw0Rgsh7KqGuZdG03M3F91vlCMXw90zBE/6itSI7I2PEhsnsa0w+9ldwTc51jZVpRJ5
	aX2vSz/92CL/laqeWA==
X-Google-Smtp-Source: AGHT+IFcm77hXfvSbH/eN95Q/ZwXvJEiEj+YvFU+OGPBIkHg9CiNb26GDA+BDm6k0gnX4uWsFvlYKg==
X-Received: by 2002:a05:600c:1ca9:b0:434:f297:8e78 with SMTP id 5b1f17b1804b1-438913cb65fmr295762615e9.7.1737718944447;
        Fri, 24 Jan 2025 03:42:24 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b1da8d4asm49274825e9.3.2025.01.24.03.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 03:42:24 -0800 (PST)
Message-ID: <85c74182-71e8-41de-b13c-05da5ceab04d@gmail.com>
Date: Fri, 24 Jan 2025 12:42:23 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] rust: miscdevice: adjust the rust_misc_device sample
 to use RegistrationData.
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
 <20250119-b4-rust_miscdevice_registrationdata-v1-3-edbf18dde5fc@gmail.com>
 <CAH5fLgismQ4whAKswp843T-=q_1+C7DB1qqg6rqk013DGr13iQ@mail.gmail.com>
 <7a84da97-504c-4d1f-9c98-3a152e348c73@gmail.com>
 <CAH5fLgg5tjFowQq=LWQ2BtGVqHmdMMp=9Uxm4BzSy+UiXGPhZA@mail.gmail.com>
 <2025012418-legwork-chug-f08c@gregkh>
 <CAH5fLggCLSRfiAGnb9ZDRdUsMrBxWDjbVSxVqtdduDi5D1vQtA@mail.gmail.com>
 <2025012443-music-fester-b33e@gregkh>
 <CAH5fLgizP9YQZrDfpG2QW6nP_VV7SfQ1uG2LrBGeYnzv31n1LA@mail.gmail.com>
 <2025012401-paradox-hypnoses-b717@gregkh>
 <CAH5fLghKx9Z-Gn8z_rZfxSy8tTFkOza9KPhGawwLdDqHbTnFEA@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CAH5fLghKx9Z-Gn8z_rZfxSy8tTFkOza9KPhGawwLdDqHbTnFEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24.01.25 12:37 PM, Alice Ryhl wrote:
> On Fri, Jan 24, 2025 at 12:22 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Fri, Jan 24, 2025 at 11:39:23AM +0100, Alice Ryhl wrote:
>>> On Fri, Jan 24, 2025 at 11:34 AM Greg Kroah-Hartman
>>> <gregkh@linuxfoundation.org> wrote:
>>>>
>>>> On Fri, Jan 24, 2025 at 10:42:53AM +0100, Alice Ryhl wrote:
>>>>> On Fri, Jan 24, 2025 at 9:06 AM Greg Kroah-Hartman
>>>>> <gregkh@linuxfoundation.org> wrote:
>>>>>>
>>>>>> On Fri, Jan 24, 2025 at 08:29:38AM +0100, Alice Ryhl wrote:
>>>>>>> On Thu, Jan 23, 2025 at 6:57 PM Christian Schrefl
>>>>>>> <chrisi.schrefl@gmail.com> wrote:
>>>>>>>>
>>>>>>>> Hi Alice
>>>>>>>>
>>>>>>>> On 21.01.25 4:40 PM, Alice Ryhl wrote:
>>>>>>>>> On Sun, Jan 19, 2025 at 11:11 PM Christian Schrefl
>>>>>>>>> <chrisi.schrefl@gmail.com> wrote:
>>>>>>>>>>
>>>>>>>>>> Share the mutex stored in RustMiscDevice between all instances using an Arc
>>>>>>>>>> and the RegistrationData of MiscDeviceRegistration.
>>>>>>>>>>
>>>>>>>>>> This is mostly to Demonstrate the capability to share data in this way.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
>>>>>>>>>
>>>>>>>>> This change causes all open files to share the same value, instead of
>>>>>>>>> it being per-fd.
>>>>>>>>
>>>>>>>> I know, if that is unwanted I'm fine with dropping this patch,
>>>>>>>> it is mostly here to show how patch 2 can be used.
>>>>>>>
>>>>>>> Perhaps instead of changing the per-fd value, we could add a new
>>>>>>> shared value? E.g., it could have a counter for the number of open
>>>>>>> files.
>>>>>>
>>>>>> Counters don't work, sorry (think about dup() for file handles), please,
>>>>>> either make it per-file handle, or a "global" thing for the specific
>>>>>> object, don't attempt to count open/release calls, the vfs does this for
>>>>>> us already.
>>>>>
>>>>> I mean, it's just for an example, shrug. It could also be another
>>>>> ioctl that updates the shared value.
>>>>
>>>> Sure, but the number of times I've seen sample code copied into "real"
>>>> code is way too high.  Also, getting people to stop thinking they even
>>>> can count the number of open file handles is a good idea as that's an
>>>> extremely common "anti-pattern" in way too many drivers even today (i.e.
>>>> if you try to count open calls, or even restrict the number of open
>>>> calls to attempt some sort of control, you're doing it totally wrong.)
>>>
>>> Fair point. Do you have good ideas for some data we could put in the
>>> data shared by all instances of the file?
>>
>> "shared_cookie"?  Read/write and let readers and writers access it.  But
>> I thought that was what the misc example did already, but I might be
>> getting confused here, it's been a while since I looked at the code,
>> sorry.
> 
> Makes sense to me.
> 
> The existing cookie is per `struct file`, but this series is about
> making it possible to have data shared by all instances of a
> miscdevice. But having two cookies, one that is per `struct file` and
> one that is global makes sense to me.

I've Implemented one shared (Every instance) and one unique(One for every FD)
data.

Christian
