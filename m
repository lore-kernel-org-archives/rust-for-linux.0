Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C8E36CE0D
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 17:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770745360; cv=none; b=iLxV5aIkQ/lkszPTAj7xqkwDp3oGLwcCVilogJaxdaJNaZeh+uLHZGSMvW0pcfEZemRCBLdcTM1kniLaOvWB/j4HauN4mPyJgasQYj0EpjNzTXUHbrlDSa9B+TqU7cgc9gsTMU/YDvM1D7Zpgzrti6np07WTqNPS7VOvzbs/oH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770745360; c=relaxed/simple;
	bh=0Xhp2QGcmkmNyV+Fe0H7w4lIBDRyGvMa5Lcgo3QuUQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgnGPaa6v/TVD6O6imTovgneaqAm/hF+YA0tsGuDZZvKaKJp9g8aoiMiOwwtxyP50B2Yba96tek/ZaKgQAQOpaW7e4pHwBT9VttrQw0HK5nUGuo5VPr6SkSHreIbHFlSrySmOUc5A9BZrbsXD7vQuwF+JbOKfF+R7z1Btfc6I7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjdGLvQL; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjdGLvQL"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-34be2be4b7cso778871a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 09:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770745358; x=1771350158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CO3zP9uq/ElKqAXO1nS8oSm6kxoOJrH5l2Qa2UH57+c=;
        b=VjdGLvQL6zcHQWGX5lJRxUwQ2SocXdHuzDH3j0cUdHAgjiu3wu+VZeBevidOMBnona
         jrfRb9o7NaaAS0K+UKWIG6FCvm88Y6rsA6NTSksiAwfGC+pHOb5odvKOo0Q5GtwB4S/d
         aEzO8VIzYZpMb02TcGfmh0CpEymAa+iAR8tSNfofSLtlZHHEHMTJizif0I740SX7N+C+
         Km/XFFUnObiZOoCl8NC9Ga6n3qzdl9/vtzJieFAkblKHccZdYGjLlC4Zp8nKAI6IjDiI
         2httZ7o1o2Qtv0UUnLRcGjmBTMpu+KyGIot8r5G7KODhIAJ65rCj7ZjZf3726v1rtvB0
         VHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770745358; x=1771350158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CO3zP9uq/ElKqAXO1nS8oSm6kxoOJrH5l2Qa2UH57+c=;
        b=oK/OWBfimB6WRML6qDNR1pWwkPkUGBtofncgqw3RGCiNTIUimLH6Dfe/4BOnauq7Eg
         V++xoKR6aeOO/dd2uklz/MqRYVsRMBSFcU+uFqGL4ArmxIcSlTh+sZR83JATuZ3kSe2G
         cBVFfJl/w8Rx3KY0D10+F3TXOowJ5BVY91ltsTa1iaAoL+UakEqtuRJvSeEq0SHsA01g
         kkp0oZ+MfHC2T5jBdXcFQxp+INi5pX1aU7IWaIUf956se5Yk8LVjeJ2ht4iJK8xsSzCn
         XF/iVE2IROMcnr2Z5bePHGobFMhcbbhEA43xEyRw32IZmMSWo2kbRCrrGm1zBdytqveB
         /eFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAvvmFiDjQmKSxs694QTX4XTE8hYqezsjaWkse9mdhhRbRGng1SvSnWRp2+wfPxZ16Y7fcSU9mCU8PJ/+0XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8k08VPCSJVHgUljfDLbaUFKl8uT43LFVg5BN8O5SDcZkHK3XI
	5SKsssn6Q3M0j2QcLfz7Vgx9DRgAfHegHM+zd3O8yM58rNydJAHmrEEO
X-Gm-Gg: AZuq6aJjlFBPX0z19BXyolSnKltGTflhjv9AEQwH3rqdwtIBFSU98VKbEcsfQXTeOLa
	ZeOf8TiGZmZrHYtj7udPT4WaIjhNgyfYDece7U53P3tTLTyUoYMOkfg3qqYYCjnHKuvjrtkMXg+
	6by2XLims2pEWIbYB2WA0RIM4djmrb5pmmeUfqP6If21Oy3ykQWrBOfR/rQqO77NDiMecBHlQNs
	EVHNBxbXWVTfCwyOec7C4Pi6nXbkfebcIo/EkRfqdgfNV8FtGabXqGALJoN+u3O1U1y6fxQiFZ2
	qb0kw8SAw22uLGznjyC8TUsguYkMFD7gCE1RaCJ5Aib/nd/COZWWZg3QEsWzjh7zGAbDDRTjL02
	3IwjraNMhwhhbgAKqSDWyKGwVYg19fizPz1XvS5+nb8vfFsw6TBOB+1oNFjf/txzTKMDuH8sAMW
	vdted0O5nqSbI+2AGNSSp1LGarmEEAnuOPFKk+gN5BCN+FsGYZk/PNwA==
X-Received: by 2002:a17:90b:4b49:b0:341:124f:474f with SMTP id 98e67ed59e1d1-354b3e648acmr12936955a91.32.1770745358156;
        Tue, 10 Feb 2026 09:42:38 -0800 (PST)
Received: from [192.168.116.129] ([49.205.43.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662ebfde0sm3407207a91.15.2026.02.10.09.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 09:42:37 -0800 (PST)
Message-ID: <d5c34a1f-8538-47ab-80e4-6d54b96d5b2e@gmail.com>
Date: Tue, 10 Feb 2026 23:12:30 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] rust: alloc: add Vec shrinking methods
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
 <0d336a3f-f317-4a70-942a-d87a3faa3a89@gmail.com>
 <aYs5L1aG5S34teKT@google.com> <DGBDHMI9Z4JK.3QHCOS1O8WGLB@kernel.org>
Content-Language: en-US
From: Shivam Kalra <shivamkalra98@gmail.com>
In-Reply-To: <DGBDHMI9Z4JK.3QHCOS1O8WGLB@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/26 20:35, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 2:57 PM CET, Alice Ryhl wrote:
>> On Tue, Feb 10, 2026 at 07:08:09PM +0530, Shivam Kalra wrote:
>>> This is a follow-up to my v3 series:
>>> https://lore.kernel.org/rust-for-linux/20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li/
>>>
>>> Hi all,
>>>
>>> Thanks for the feedback on v3. Before I respin, I want to confirm
>>> the direction for v4 to avoid unnecessary iterations.
>>>
>>> Proposed changes for v4:
>>>
>>> 1. Drop the Shrinkable trait entirely. Make shrink_to() a normal
>>>    method on Vec<T, A> that calls A::realloc(). (Danilo)
>>>
>>> 2. Add a temporary ShrinkQuirk trait to handle the vmalloc workaround
>>>    (page-boundary check + manual alloc+copy+free) until vrealloc
>>>    gains in-place shrinking support. (Danilo)
>>
>> I don't think you want any new traits at all. What types would even
>> implement the trait? The special code can go in the realloc() method of
>> Vmalloc struct in rust/kernel/alloc/allocator.rs.
> 
> I did not propose to move this into the realloc() functions of the corresponding
> allocators intentionally, as there is a difference between calling realloc() and
> shrink_to().
> 
> I don't want that some user of e.g. Vmalloc::realloc() experiences page wise
> shrinking by copy. This is acceptable for Vec::shrink_to(), but not for
> realloc() in general.
I think this aligns with the reasoning behind the Shrinkable trait
in v3- keeping the shrink workaround separate from realloc() so
that other users of realloc() (like IntoIter) don't unexpectedly
get alloc+copy+free behavior.
Happy to implement whichever approach you both agree on.

