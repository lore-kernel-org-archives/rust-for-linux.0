Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E7146A71;
	Thu, 23 Jan 2025 20:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737663521; cv=none; b=HCXwlRhdUFSXFbXLPGtp2yQtfTkuG9Z9Q7IRdT2lgbi6lrveIkq+Bb32YNfNCg2vc9F0pGUY6hHKHhBCwazD0b8nQ977eeqJKBUvdjASGTZWubHU+Ge6qyVmf35F8A2XpINpid1D8AS7U5YzftCcLvoODVLOc5uoxsV2jDWvJqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737663521; c=relaxed/simple;
	bh=MsqD6KX1vHketekppgJYiC9GyDgguNhS8umyG+xcByg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+kY7i/FQmlO4ji4ttuBxnmdfYWiezIZfk3HKdOq0VZ4PbSlVUykOW9FTKWaqAMTa85N1EPJkb1tT3QGUhuLPQCIsKOoTKGdtB2U3KLb0gMT0+7jE2fMzSDSFaYszjjKgnS6aq4VfhReEUsZexOexPzEQu4ThmCoT8sdTANFvrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfKcbTyX; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfKcbTyX"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38be3bfb045so1731133f8f.0;
        Thu, 23 Jan 2025 12:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737663517; x=1738268317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bgw7J9cKLbEkFY7C3q/NhHK1xMXR0tOigi4pylfWQf4=;
        b=FfKcbTyXHrhJIJDel1a5Dc1Mid/gayU8ip2gHi+Gz4IoP4PLmO17FW3cmmHA8ZSiLZ
         SvS6yi0i7SvGxm1EBeFMEDO31UmTk8fWNOIWeLmuZE2OpM9qubVY3liceFXVG/UyQr8D
         2br9npR6535g94lu8FRGOn00OeGDSCk0ySYA0694OrQN1gYlXfZBSr9XeDDqP8nONO0N
         bDpoajfiX8LKyKQuJ/nJiHcTyN0iBqL45cbSYMAUuoJ3h7sDHI03feUuDsZCayreWyBz
         zujcmAQoZMyIN275KcohdPbs3N5xpoDMOquw1AWfPyNiVxneJqrx0RIQOke/zEq6w2h2
         mEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737663517; x=1738268317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bgw7J9cKLbEkFY7C3q/NhHK1xMXR0tOigi4pylfWQf4=;
        b=N6D0v7JcLOJODiAW7jT758PYPv3KAX6VmnF+ZDyluXd1MOi+RO3C1A79W1P3MbSt2j
         /o8ICVJZPdiRBKt/f+/jANt8i88PGIPbgupDGh3u+SXmywdh5CFPYEN/sFRNL26Kdj6X
         D+OC2vHJAHlwheNTUHkQJ4qIhAFCt+ikATO9oL/lPbeVmbl2rC5lgPAqSTCvhwZG0SQC
         C2J1leWxuWONgDQuGG0N497B42wMwZm0mioUcEkrcfyx3Ijxlu3mapajqVVvTjbNbfzj
         3CG9KNVFmdVRggam/xEKuCEuGQqlK39eyWEpRA0bZPok8+eE5p29Fo/YSG1W9zye9qu9
         BCWw==
X-Forwarded-Encrypted: i=1; AJvYcCU1JV/Kp2Ov0/F6OaymJrqbEIS0Sr97u5+80EjLZ1hml7xrJSfAkdtbXiAIL9jYvsqRQq2kgz2ixfZ+26c=@vger.kernel.org, AJvYcCV/tOxjqYY3cee1AdjSlXPi5IehRDmogyfigEll5OPQNpnGawfnd2Ce3OXvAZdTObNth33tCRqUMiVYnQzSJzM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8SjZOs6oU1pxWeVqDUA5qkRoJZX/Trgnyuta7feD2MHbwyY5G
	PWiojJoWgEu8/bqrUBiDiBQYODilvJpnUjhu2Jg8Ri5FBCNztnKh
X-Gm-Gg: ASbGnctInFjcHMNbZhUzirA57FtwgZmubnDrDaqDAAyU8DlML8UwrL/Nbnr2NdYyRP6
	kGABBoJOi9x8ayrPMDQoEfR1sdBdG7YBIyVF/uAqjQmxKJBwmufO+s7liHPfFuYYKz8CbkO46IW
	dH8Anv9TLVWcn2cSRApSigxyWG7D3W5oX4V+VpsQfL6RAA646QCBOHCMtPjd40LSg4IJvXbIONs
	AXEPw1Y0dAWrjhw6M/h6x2pwhp0cUBGu/+/u90oHzXo/4IS9d4SPVBqBh//0XrMNsxNUKpFxSCm
	D7Zom83/jZuEWQf5eg==
X-Google-Smtp-Source: AGHT+IGbrCMgUQAtp+5E+MdV6EcRIyO2ersG2Oc9tnMuDNCQgi0FYQiX1CceUGFl9z7nCB4FLTi9PQ==
X-Received: by 2002:a5d:6512:0:b0:38b:ee01:a5b with SMTP id ffacd0b85a97d-38c222750b5mr4456731f8f.15.1737663517398;
        Thu, 23 Jan 2025 12:18:37 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4e49sm606530f8f.98.2025.01.23.12.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 12:18:37 -0800 (PST)
Message-ID: <1fe7b736-48a3-4ff5-a084-43dcf602ec4e@gmail.com>
Date: Thu, 23 Jan 2025 21:18:33 +0100
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
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <Z5KJrTG8PN-nRrLZ@tardis.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.01.25 7:25 PM, Boqun Feng wrote:
> On Thu, Jan 23, 2025 at 07:04:40PM +0100, Christian Schrefl wrote:
>> Hi Boqun
>>
>> On 23.01.25 6:56 PM, Boqun Feng wrote:
>>> On Thu, Jan 23, 2025 at 11:21:23AM +0100, Christian Schrefl wrote:
>>> [...]
>>>>> [1]: https://lore.kernel.org/rust-for-linux/Z407egxOy7oNLpq8@boqun-archlinux/
>>>>> [2]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#naming
>>>>
>>>> I don't particularly care about the name, I mostly used aliased, because that's
>>>> the name that Alice originally used.
>>>>
>>>> `(Always)Shared` seems confusing to me.
>>>>
>>>> I guess we can use `UnsafePinned`, but most people won't know what that means,
>>>
>>> Hmm.. but doesn't `Aliased` have the same effect, i.e. most people won't
>>> know what that means? Moreover, people who already knows `UnsafePinned`
>>> will still take some time to realize "`Aliased` is actually
>>> `UnsafePinned`
>>
>> I guess I'll name it `UnsafePinned` then.
>>
>>>
>>>> also I'm not sure if it's a good Idea to use the same name as a (future) 
>>>> language type.
>>>
>>> The benefit is that we won't re-invent the wheel since `UnsafePinned`
>>> already does what `Aliased` does here. If we don't have a good name, we
>>> should use the one that most people are already using. Honestly, at this
>>> point, I think we should just use the unstable feature unsafe_pinned.
>>
>> I think that's not implemented in rustc yet.
>> At least no implementation is linked in the tracking issue:
>> https://github.com/rust-lang/rust/issues/125735
>>
>> Once that's implemented we can use a `cfg` to disable this 
>> implementation on new versions that provide it.
>> (Assuming we use the same API)
>>
> 
> Sounds good to me, thanks!

From reading the RFC It seems that `UnsafePinned<T>` should contain a `T`
directly instead of `UnsafeCell<T>` so I should probably also change my 
version it to match.

Cheers
Christian

