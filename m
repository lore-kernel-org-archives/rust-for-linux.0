Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6500386C37
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 13:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367872; cv=none; b=FOKbOWPwSWA6cVcVAPLI3sPbSvVfhWHqFMUH1k/+rIjDX8S6S6tmZxnS2SoS+DnRln4K4yYb4ZpjR0avJhFnybr8oeYdfB/ihVLHvRvYWGK0370CSpUK2ErskapeTuxfHegsTWN10ACailz7K6syfW9619izzDR4GfCw0+Mx7v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367872; c=relaxed/simple;
	bh=r2g8Q8fHGjWAvOsR4epm9nXgf/1Z2mnqxLleiMmZMPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWumWPfW2vmqJVAAE0i8UG/xT5OKAT1FWMytgTHKuxBhNXHH6AcgIowVWNpabYxBQKcMnBNSzk95FSYFcCDe74aECKCuEKsLL6EYqwGn/mwiEf2pG6ArS/fIuN+pFWkGyKqSIfOhO20L1mKvv9EE1niUAqbHtHrk6RxkTs5ayrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf50c6f235so19875345ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 06:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367869; x=1786972669;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Qh0sMDp6zZwObYMTkfo4guQm4QHHZuFWx+JOGUz4+M=;
        b=BMWAqtRFVaifngoCqG2itmz1JdM0K+HtyLf3BPm/F1SToUU6NEkLwfWpAFK/CQZL4G
         +NsW9kNn7GIKQxCZyhMC1oVBAYlxxMmO0TXn66U6MZ3zlVSEZA3MiQLLK7gw3xK+rVKt
         pDnI5LadpBEnpRB8bs/0oAPFU8vlW5awLd3RbxUSMw/ptK2N4e3w/9TsK3Ocjxp2RyeK
         sgNfVG4kIAVDUSeg8OcyTeAzfAFOMCqJSRrtGAhiVps3TcvzJsNAVHqe5+Y9pghYe36z
         VH6+so3hEWi2rzj5eqeEISgwWyvuBTIj9xt/lhvGe81DdpxZBSeUvqwKVzyqftMvmdnA
         EAwA==
X-Gm-Message-State: AOJu0YyQkgaZ2SER+izi63KExdvQAqo7ZDtLudEKSVDE2qgvpxe7SLkQ
	Hinf7boRROtiBUJah2ciERXDSoubLKKZg1Xs/o69MIdWSmD7BijkcgYT
X-Gm-Gg: AR+sD10SEoAIbe8Xx490bjtCpjTMZy/3sASlkK3Gc7ezV9qPMQUjuVEfj/3VO2osIm5
	Um8aqk8NEPXuMIl1qTpBUjlmGfQKkI4FeYsHzqxFXULDVCEFV/UiOMWcsezdNFcDGf/wHVWBoIt
	qJO2NzBacoTX2ffFI88oYYoDg6jTk8L8lHGOl969YwQ3ENGZI68V76HCaiGie5QSdKoBy9qxYJw
	EMRyqgHJavz3c1nl/xMIzbgNOWIMQbBw664cQAGPRAIvZHxwfNKNZiY5ddb9jsrZwDfA5k9AF27
	3JwWDColyHeQQq0hjwvKV4zKLRpC2Z4nEZ/06+19k2fZ6Ra9OfEJsK68paGFCdl6DV+JTpUSd4w
	pKw1SYFmIozUfKSNQHnlRb0+QfjMlvcl/Q6Q+INppJU2mbUOQ9aAiOeHnpyxTufUfNhdOtTTF7j
	9aHjrmcW8kxIri9EoEhYNEH7hdAlY97FtkL2w=
X-Received: by 2002:a17:902:fdad:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2d0ca7fd072mr560288375ad.15.1786367868833;
        Mon, 10 Aug 2026 06:17:48 -0700 (PDT)
Received: from [192.168.200.2] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccdb26bsm36170515ad.22.2026.08.10.06.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:17:48 -0700 (PDT)
Message-ID: <92ff6156-2936-4fbb-80ce-cb1184304b68@kylinos.cn>
Date: Mon, 10 Aug 2026 21:17:28 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/2] rust: fmt: fix {:p} printing stack addresses
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
References: <20260810-hashedptr-v15-0-eafd27d36476@kylinos.cn>
 <20260810-hashedptr-v15-1-eafd27d36476@kylinos.cn>
 <DKL7DIYECV4Y.2K72F6I0KHKNT@garyguo.net>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <DKL7DIYECV4Y.2K72F6I0KHKNT@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/10/26 18:48, Gary Guo wrote:
> On Mon Aug 10, 2026 at 7:35 AM BST, Ke Sun wrote:
>> The `impl_fmt_adapter_forward!` macro forwards `Pointer` for
>> `Adapter<T>` by destructuring `self` into a local `t`, causing `{:p}`
>> to print the address of that temporary stack variable rather than the
>> actual pointer.
>>
>> Remove `Pointer` from the macro and provide a manual impl for
>> `Adapter<&T>` that passes `self.0` directly.
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> I don't think this has changed since last version. Usually you should pick up
> all tags provided for the previous series, so people know that it has been
> reviewed already and don't need to spend more time correlating it with the
> previous series.

Thanks for pointing that out — I dropped the tags. I'll use `b4 trailer` 
to check before
sending the next version.

Best regards,
Alvin

>
> (No need to resend just with tags picked up though)
>
> Best,
> Gary
>
>> ---
>>   rust/kernel/fmt.rs | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
>> index 73afbc51ba33a..cd7d9664ff5b9 100644
>> --- a/rust/kernel/fmt.rs
>> +++ b/rust/kernel/fmt.rs
>> @@ -43,7 +43,14 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>       UpperExp,
>>       UpperHex, //
>>   };
>> -impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
>> +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
>> +
>> +impl<T: ?Sized + Pointer> Pointer for Adapter<&T> {
>> +    #[inline]
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        Pointer::fmt(self.0, f)
>> +    }
>> +}
>>   
>>   /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
>>   ///
>
>
