Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B771C5D57;
	Thu, 23 Jan 2025 20:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737664080; cv=none; b=dkTA76bfOnu1w7EGBpQl0PLsQzblMqFgb9vpxXaRxmo8SoN7stQ1lNNEyYcxxhIZ1L6/imgYZJbN28fmlsCZQLmX1+HTGNLcBmVz0MrwqxYM2BobieqcnmZNegum/nIR6mmMqgyEbr6NMYZHE6TH02Mw7pcQ6s3Xkf1psmwdNjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737664080; c=relaxed/simple;
	bh=DihAZEjohLrhaGiq4+utEP7rsl80CG4XmhURk3L58/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1B9ahFQ1K2nxI12v18HHduS2WRexQEOyfgkTJIWz1YMlboTA9bBeE57RZwdiSJy8nA+KbZjPaArYZgY0cOeN/BQKlpvBRY5UhxbyKi7G2/czvrfclrYHUFT4vw4DaaoOA0KOoiTQGdNgRoH9V9wwN6QT21qAvDFhjUGxp9A9Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/bTYgY9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/bTYgY9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso1195041f8f.1;
        Thu, 23 Jan 2025 12:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737664076; x=1738268876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6xfVVnKjKLR9t0W+CbxewUGhKS+I/5pYGGDhNB5pPM=;
        b=R/bTYgY9SzyOEdL0GqLkieFHNqDuHlFncaYnhKe6LTiApFztJrYZ68/tj2AXPtEA4f
         pclplJAQ+mPVjxO8vyd7wKOw6v/Ii9BTf8aodz/hb1tTzccX8nOPxJTSijDwpzusyytg
         paSVuMF4Gsb28gnJTFXOVldt0cxk0iPeXfdPKl+t4nUA0V+W5dp5CSdENAloWenprCG6
         dqMYfvbXP03znnjLI/HrRE0rSVOXr0xgAirhQ+M5glBXrPtpmrcC0WS7kIYlh0HdTDyR
         uBDkdSyEfd9zqT7xepud980Vt3iZ+W26d82IJqGDz8bDGEmEaogW7M3vfcYf7IURaBLP
         erjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737664076; x=1738268876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j6xfVVnKjKLR9t0W+CbxewUGhKS+I/5pYGGDhNB5pPM=;
        b=EpMPeBLGfUk2PkwyQBwivyVs1DDcGPh4mVHnUKFdw+pBMcJ/BmZpGjUrq7iDVTLB9R
         0JngFpbxPr4zdt0FfitK31EfdLgZyU7fl3UfYzmVWCWkXlto2rmhvOFWH/m5rmZtVrs2
         9leSSVrqOGJBwkIzK+91KLc+Y+8oaOEwv0/5SGTFqiJ50Qb44nV/PueIp5VtS9w7VecS
         T3TRsZiOazfawCBi1b9RRBFmxd+fnLUmxb/nCkLq3E5FsWR4YyrnuQ7k+O1I7De7WSWK
         sXt+xCU1fbx06ltVDxbVt3hmpdNGqUsGq5OpNbQUC9ZE2n/vm8Cpr60BdwIZh4Si/QcI
         sptQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMmtXoZLaON84v/Y8klTMWVjko/5dFWHyfRwZNJG7tDQ1ENEeD/BZxNltfu05b4WyMVdXHFchtJmR5VEESaH4=@vger.kernel.org, AJvYcCUqyC5/yNhE1LKm2WqgDHzUkmsP3igilSeB2Wr3VRq9tc5hYz2G953SJTOm2wGyaE8rVTyYJPdg2Bfc2qA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2qd+T3xmNne5LXjupZXb4qQ5RVBpjBgoD+0FYVeE1pkpt3h5E
	mnY1YfqvJ48QfiHTA9i8mn2GUR21mmjOXr7hYM5epJH6Kw9ktIie
X-Gm-Gg: ASbGncsN9wu7umFVU8thDHwZOptTYh6SGUhnsARWCmR/43suDnkC1728aUud/uT80oQ
	BwXST+HdW7tgogP5wftAtY9UYRVmW/iy301I4nrlC6oBlSoFHbJIwoLvcbOxUInuu2tOVyOH06N
	anv8E1WqXlhg868o+PGo4leX524lVoYc6JnzqfiILpr1g9ilYI4DOFBRRxQSKyB6Xa+vipoZ1no
	RnkmZBwqLej3X2djOEc2z6GvxuPIkWfu+F7JghntIHMbn4/iinrNpswg6xiyffkv5ydc1FgXcz6
	txbEy9QKH7lIqd421Q==
X-Google-Smtp-Source: AGHT+IFVmqrkK92UhmPklry8sLGyrnya/8fTSRM2MOtbGlE76hoRpm7+l0UWieqrAGUNBE8VmyI/bw==
X-Received: by 2002:a05:6000:188d:b0:38a:418e:f3f with SMTP id ffacd0b85a97d-38bf56567f9mr25126121f8f.3.1737664076272;
        Thu, 23 Jan 2025 12:27:56 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c402esm623914f8f.97.2025.01.23.12.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 12:27:55 -0800 (PST)
Message-ID: <17b7c8cf-ec45-44c1-9723-0433a00c90f0@gmail.com>
Date: Thu, 23 Jan 2025 21:27:54 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] rust: add Aliased type
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-1-edbf18dde5fc@gmail.com>
 <Z46Gzg_5kv-MwZNL@boqun-archlinux>
 <b7492912-3e58-43c4-aa0c-e6bcd4925e24@gmail.com>
 <Z5KCuct3QmgGUkIU@tardis.local>
 <760f99ab-e5ba-417a-a918-4d191c7f3ec3@gmail.com>
 <Z5KJrTG8PN-nRrLZ@tardis.local>
 <1fe7b736-48a3-4ff5-a084-43dcf602ec4e@gmail.com>
 <Z5Klf_poby1lbGTl@tardis.local>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <Z5Klf_poby1lbGTl@tardis.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23.01.25 9:24 PM, Boqun Feng wrote:
> On Thu, Jan 23, 2025 at 09:18:33PM +0100, Christian Schrefl wrote:
>> On 23.01.25 7:25 PM, Boqun Feng wrote:
>>> On Thu, Jan 23, 2025 at 07:04:40PM +0100, Christian Schrefl wrote:
>>>> Hi Boqun
>>>>
>>>> On 23.01.25 6:56 PM, Boqun Feng wrote:
>>>>> On Thu, Jan 23, 2025 at 11:21:23AM +0100, Christian Schrefl wrote:
>>>>> [...]
>>>>>>> [1]: https://lore.kernel.org/rust-for-linux/Z407egxOy7oNLpq8@boqun-archlinux/
>>>>>>> [2]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#naming
>>>>>>
>>>>>> I don't particularly care about the name, I mostly used aliased, because that's
>>>>>> the name that Alice originally used.
>>>>>>
>>>>>> `(Always)Shared` seems confusing to me.
>>>>>>
>>>>>> I guess we can use `UnsafePinned`, but most people won't know what that means,
>>>>>
>>>>> Hmm.. but doesn't `Aliased` have the same effect, i.e. most people won't
>>>>> know what that means? Moreover, people who already knows `UnsafePinned`
>>>>> will still take some time to realize "`Aliased` is actually
>>>>> `UnsafePinned`
>>>>
>>>> I guess I'll name it `UnsafePinned` then.
>>>>
>>>>>
>>>>>> also I'm not sure if it's a good Idea to use the same name as a (future) 
>>>>>> language type.
>>>>>
>>>>> The benefit is that we won't re-invent the wheel since `UnsafePinned`
>>>>> already does what `Aliased` does here. If we don't have a good name, we
>>>>> should use the one that most people are already using. Honestly, at this
>>>>> point, I think we should just use the unstable feature unsafe_pinned.
>>>>
>>>> I think that's not implemented in rustc yet.
>>>> At least no implementation is linked in the tracking issue:
>>>> https://github.com/rust-lang/rust/issues/125735
>>>>
>>>> Once that's implemented we can use a `cfg` to disable this 
>>>> implementation on new versions that provide it.
>>>> (Assuming we use the same API)
>>>>
>>>
>>> Sounds good to me, thanks!
>>
>> From reading the RFC It seems that `UnsafePinned<T>` should contain a `T`
>> directly instead of `UnsafeCell<T>` so I should probably also change my 
>> version it to match.
>>
> 
> Per
> 
> 	https://github.com/rust-lang/rust/issues/125735#issuecomment-2299183374
> 
> , I think you still want to use `UnsafeCell<T>`.

Ah thanks for the quick response, I'll keep the `UnsafeCell<T>` then.

> 
> Regards,
> Boqun
> 
>> Cheers
>> Christian
>>

