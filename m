Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82455103F
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741178785; cv=none; b=JH9pxtvMfK4KKldQwO8ftUlIxj9XlwHho1hHIsSrNg4EEGMwac+7Ku+CFfibUchb/X2QeXApDByWUreGKIPx/rHsHatpMxa6jHv9aqMVemKoH7Jo92JDCOkz4INwI/Za7roiPJCduTVTnIkyqRRyJFqggALiq6hCjG9KbXOyQl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741178785; c=relaxed/simple;
	bh=wK6AMB2VUEjE6n/TOf2XV8pl43DWE5q4ePIKNGhx12g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQpHSXiNqlRl0TPFt5oNPEhBc56PyH1wiMBqQ1hj9eKT3UW+YexQ2OLgdVmUA4BcrtU1xSurgKJFR1c5yvAxwiE96/IlBzwZTwNFuEnWzQN64TDk7jYJ6YlqV5yyhUCQXsgsHb/uGlzppUEckkrg97rla5PiMvQzDlvYYc6XufM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqxRS3B1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqxRS3B1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22403cbb47fso2543635ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Mar 2025 04:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741178783; x=1741783583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I7r+BncRktwfdmA2y25QZkeGeEVipDHryPMw6zT/5To=;
        b=PqxRS3B1mbyWSgq11Jo1K2mz1/xHoaiNmhu6O+qe6KgJD2I8YFkf6IccS1VZUfMi5l
         GrIm2oyqPiAFRnHq39AICO1XLchSwJWLxDd4y7OMQahNNy/H1z19wSuH4x6x8R3sjr2M
         fvOb2Fo9xU8MLfegA0sO3oM2UOSxPPEUL1BR6ZEkR57YlOgsMsFYenHNzJdhAlLE1KAv
         alAHpkrezx2ao7eiDhUz2MB3KwL8fitp7/1fdscdMFKZ2JIzEc1hV0DqC2hGcKppI/RZ
         +uZCSLToCfCtSzoxehpy+box+U9N0S3HxD5wxN8/lVUJ1QYbeNAFOg+s5Tl32QPUOIto
         whQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741178783; x=1741783583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I7r+BncRktwfdmA2y25QZkeGeEVipDHryPMw6zT/5To=;
        b=bpjkOR79XyyV2xPpHpEeO/7TDGwfWh8KqbhK+jLlGne+oDKCcWRsid2RjpRXwwkaXl
         GDmRvP5qwGNFD2d0ObeQAcGnZ5ynt/nHpmvneFrfd41UxR3hJwOBiPAwbUDPVAsZqs3J
         ymRrv9GE4TcErS2pBwAQhWW1O+P2OUeBaH8okUY6jz9pmiKQ3a2yCiYJuIVQOfKDVrim
         Mjl1HgrQwK/TUMWzP2xKS9Af6GJXQ2OjRaNzKm1BgxEGICSn2tMTFlxF5LP6LdLQrITm
         MPorZb60jJGfkRmAQ3ve7FwCoFaM5o8eDmRkWNX/TWsdlbTyQ8KIHrwm11HjdNZ7WiqM
         E2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVsquVVHkmOtDbG5liqv47WO3st2oADV2NH3V3WyDBmeK7UXmtyxj8a+exwHELlt6x/28RYXFhLvI3WK2nH6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUpyE5ewgrIxCCUGwqgdUStaa67yZyFjK5HkBJmx2AXXYdgxvt
	dkVF5IskaDJPVZzMPt4IpSk8PBCkhF2x3nzXkUKL3alFmLL1MPvp
X-Gm-Gg: ASbGnct5USh8YrJ7eLSw9kiBJ4RhPLqJ7S+jpW4EvAWPrYnrqZjTH5M9nR4QXEzUiFE
	13nNJo40FV/vmeJf2XcSvBxL5w1VbwJ/4pSP6Rsh4A+wTNNtrcbqyWXdee4HdsIZ0CmCqK6w9CA
	438xihWH28M1jYTY3laPw+mWU08Gg82DKaoJknvTgyUuAURNfiZ4dPFDTaf2lykIgcRkGhelybN
	S3P4K+jS21P4dlyaxCbyGaozIv7PIHzO931NK/a+gjmH9oMNcny0wK+3Ba8wZApJF0tPDmcy3Fb
	XyBwuQkuKhHg/VlpIykzPPJTsEzHKEM0cU2dCpwEr049OnbsxvG34QYBI94hsI8+/fM12Gv9nY/
	99kIjNNZZV8royHQgeyoV
X-Google-Smtp-Source: AGHT+IH50wUhLXxS9li7E7BldIEKWa4xoSEpppixmFcEg9VAFjYwazTCIwSeG96rzFL8aW98kT+7OQ==
X-Received: by 2002:a17:902:fc4b:b0:224:3c6:7865 with SMTP id d9443c01a7336-22403c67a23mr4974885ad.3.1741178782818;
        Wed, 05 Mar 2025 04:46:22 -0800 (PST)
Received: from ?IPV6:2804:d57:4e50:a700:f33d:65d1:e22e:109b? ([2804:d57:4e50:a700:f33d:65d1:e22e:109b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350524b69sm111651585ad.228.2025.03.05.04.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 04:46:22 -0800 (PST)
Message-ID: <51800499-e91e-48f5-b7ee-08a4d488add3@gmail.com>
Date: Wed, 5 Mar 2025 09:46:16 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: add new macro for common bitwise operations
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org,
 felipe_life@live.com
References: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
 <2025030439-sharpener-overkill-ada2@gregkh>
Content-Language: en-US
From: Filipe Xavier <felipeaggger@gmail.com>
In-Reply-To: <2025030439-sharpener-overkill-ada2@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/25 11:09 AM, Greg KH wrote:

> On Tue, Mar 04, 2025 at 09:55:11AM -0300, Filipe Xavier wrote:
>> We have seen a proliferation of mod_whatever::foo::Flags
>> being defined with essentially the same implementation
>> for bitAnd, bitOr, contains and etc.
>>
>> This macro aims to bring a solution for this,
>> allowing to generate these methods for user-defined structs.
>> With some use cases in KMS and VideoCodecs.
>>
>> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
>> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
>> ---
>>   rust/kernel/bitmask.rs | 171 +++++++++++++++++++++++++++++++++++++++++++++++++
>>   rust/kernel/lib.rs     |   2 +
>>   rust/kernel/prelude.rs |   1 +
>>   3 files changed, 174 insertions(+)
>>
>> diff --git a/rust/kernel/bitmask.rs b/rust/kernel/bitmask.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8d26a541c693a2cb60096059ecb708d895bb3ad1
>> --- /dev/null
>> +++ b/rust/kernel/bitmask.rs
>> @@ -0,0 +1,171 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Bitmask utilities for working with flags in Rust.
>> +
>> +/// Declares a bitmask type with its corresponding flag type.
>> +///
>> +/// This macro generates:
>> +/// - Implementations of common bitwise operations (`BitOr`, `BitAnd`, etc.).
>> +/// - Utility methods such as `.contains()` to check flags.
>> +///
>> +/// # Examples
>> +///
>> +/// Defining and using a bitmask:
>> +/// ```
>> +/// bitmask!(Permissions, Permission, u32);
> Nice, but why not use the same api/names that are already in the kernel
> for this type of functionality in the C .h files?  That way we have
> consistent names everywhere?
>
> thanks,
>
> greg k-h

Makes sense, my mistake, I didn't know...
Could you send me the reference of what already exists in the kernel so 
I can change it?

Cheers,
Filipe

