Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718431EEA54
	for <rust-for-linux@vger.kernel.org>; Sun,  2 Nov 2025 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762095382; cv=none; b=lpODhssNWrnHW4H4LHpI6hzeJmSv6qZClovFejc8jACLpIqyzc6ieA8F1HRtvl8AYz92NjGw+W2Jd2pSxY/RwDm0cGF2R5Yc5qjf5a+bJ1zQkJw0O6MX7nWLA3rTLGHhGWEJIQs15iAV94isGE03sUwQ+viBWBiN+mmUQrfte0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762095382; c=relaxed/simple;
	bh=yFgefIJLP8zckZ1UG6YRxBztp31yy6enfYo3+NAi/9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfbIsbPSPigWiCokStQPWg4ZmrDd/m9fTuWhYXyxzz+ZxA8RhdHLdF1Edp3Y/nMIw8Gv6py1WsE8rOT0Vv1qVeipgxU7XoMjsiytxgV6lYObbmBE2yxHEjuKYhTe9Q/GlGD01R0VrqMRit+z/jAZr8VMFHbyCfjIjYdJe5HBXqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ri67TBb1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ri67TBb1"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42557c5cedcso2123685f8f.0
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Nov 2025 06:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762095379; x=1762700179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNRp8GBQqKKuNk9ZiQRhReDm9E3VEBrBLSW1DlgX55M=;
        b=Ri67TBb1iAqkttnpPLqRg+mSp++4WApFAxvTMRB87j8EpN/J11MPf9c15w3sv3DwTv
         3mH4XEGL8BSxb3QI4ukGZpdn6DojxMf608xZ8vRtF8lswPlkG0Sv6NTnjrh18+vaHTBi
         /XLtC3ClrOEhzcsA9Y35ndt4sQpJMsO1RcSR3o/mMdA9CozjwRDMaqDMjjctU4MJjauW
         Iz6S6gLmSSQxDoIvLq+mR8jOBRHBN65isMysKgW/Hj6ulgkAU8h7t9e++Eda7uC1+HOc
         KXmfeCMw+1E6cdtn79oMB55NVmNVei6PG1+eBNSUlE1KXkFQgnIZDKpnN3JI0Oyx9I96
         8cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762095379; x=1762700179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNRp8GBQqKKuNk9ZiQRhReDm9E3VEBrBLSW1DlgX55M=;
        b=cAxlx0gsx/flQOwW24AkRmu0YP3WgUrYqpO4uaGZjXJ3SjdoDofqsANn45n6YJHW1y
         eJ9WMIKDK548m/+Iz52CL6vgyRZhdB/yPk1h1Q+YAGtuqKdqjqnUkhzA82S7DHrP5Apz
         jCL9dhdZ8FZFz8OsHBb0s31axFn/Ejkvj3iHNZPSHIawLKrYY1xsnmtfUniDrsbTMqKE
         8MK8abjstnrUDpxnItE9c9YQmmyjLHbzJvK8xB3SqyuUoxM/+5Q2+OanrzVPy9RePyC3
         y/h3EXhWqTCDxBDvVo1IV44e8312s5ZPQPuBPXgq3KCS3eFNUPRXaw9igm0JaykanEjr
         P1YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5Ft0FHE3Y6AxCkb40GWahl3r/+XiRS1RWav1AXk6th78n8W91ltVvkg1sDhiPIokkT8cKevswEHLM0k/GMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN1wTX6fNiTRI+ZVAPDeLrJX+gfBZZC7Dy9aWWEn3i3qhOfGTU
	8ShTQv47cfqK96X4syYj1HNO/t/HlcuBTV6EMGFzUBdDRdyauoTjuCW4
X-Gm-Gg: ASbGncu1O884k5utCGPX34gfnNyvJj/rq16WwZRaOzQDssWRwgxXbJw2c59LJlT8xDy
	iqSdLiH6vxZdgvwJKNBjRUGf4MFRvmITLBj2rsmDaM7HZl4qkacF8JrFbFMvEVhd1oSRwhnP2gp
	TXzhJTCwWnD+rPVEAIzyRTGapzZY/ZLS/1kPv9gp794Yh7VaiD3yWs/0XCfaaxTYSvq61dc4ifN
	WrX4HrC0jTM3FoxzMe0RwvELCZhmil8x3dUuyKyfI1lvseIKDWtsaS2a5/sE+SHgp9LVd5ucXC0
	Q/x4MUOvoSw5YU6qIfamop3+XU/jh8uWGNH5CMjRMdhqHktFi2c+Aj/+Pmx43ik+DEw4BZKSrl5
	E316f2rzXrtRq47JBUHQ7bEV4hpaJmbXhd9u0NJApYo5rwqe12EZ7EWz1960ToD0T6WIKQr/l35
	7Y7EFZswT93qi6eXLfyNnZBRr6I+85tjemxKskb02AhY9s1yfwlxphavWzj7f0Ph5Ex+s=
X-Google-Smtp-Source: AGHT+IEAwtgyxniTz4Ai5mtawKx2HjkKK2OW7gZ2ITGD+2oJ/4ffgGzrS5E/3uRYJ89wkLzNjfq3hg==
X-Received: by 2002:a05:6000:1a85:b0:429:d2a9:5dea with SMTP id ffacd0b85a97d-429d2a95f05mr675088f8f.15.1762095378417;
        Sun, 02 Nov 2025 06:56:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08? ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13f2b5asm14807337f8f.40.2025.11.02.06.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 06:56:18 -0800 (PST)
Message-ID: <51200cc6-042a-4e83-81b0-720385c67bb5@gmail.com>
Date: Sun, 2 Nov 2025 15:56:16 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] nova-core: Simplify `DmaObject::from_data` in
 nova-core/dma.rs
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
 <20251023205146.196042-2-delcastillodelarosadaniel@gmail.com>
 <DDXC0YKKJJT4.18JQ1MJQ7I31Y@nvidia.com>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <DDXC0YKKJJT4.18JQ1MJQ7I31Y@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alexandre,

On 11/1/25 12:46, Alexandre Courbot wrote:
> On Fri Oct 24, 2025 at 5:51 AM JST, Daniel del Castillo wrote:
>> This patch solves one of the existing mentions of COHA, a task
>> in the Nova task list about improving the `CoherentAllocation` API.
>> It uses the `write` method from `CoherentAllocation`.
>>
>> Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
>>
>> ---
>>
>> V1 -> V2: Split previous patch into two. One per reference to COHA.
>>           Added more details in Safety comment. Let me know your thoughts
>>           Kept the original map to avoid a temporary variable
>> ---
>>  drivers/gpu/nova-core/dma.rs | 15 +++------------
>>  1 file changed, 3 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
>> index 94f44bcfd748..620d31078858 100644
>> --- a/drivers/gpu/nova-core/dma.rs
>> +++ b/drivers/gpu/nova-core/dma.rs
>> @@ -26,18 +26,9 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
>>  
>>      pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
>>          Self::new(dev, data.len()).map(|mut dma_obj| {
>> -            // TODO[COHA]: replace with `CoherentAllocation::write()` once available.
>> -            // SAFETY:
>> -            // - `dma_obj`'s size is at least `data.len()`.
>> -            // - We have just created this object and there is no other user at this stage.
>> -            unsafe {
>> -                core::ptr::copy_nonoverlapping(
>> -                    data.as_ptr(),
>> -                    dma_obj.dma.start_ptr_mut(),
>> -                    data.len(),
>> -                );
>> -            }
>> -
>> +            // SAFETY: We have just allocated the DMA memory, we are the only users and
>> +            // we haven't made the device aware of the handle yet.
>> +            unsafe { dma_obj.write(data, 0)? }
> 
> This doesn't build for me:
> 
>     error[E0277]: the `?` operator can only be used in a closure that returns `Result` or `Option` (or another type that implements `core::ops::FromResidual`)
>       --> ../drivers/gpu/nova-core/dma.rs:31:44
>       |
>     28 |         Self::new(dev, data.len()).map(|mut dma_obj| {
>       |                                        ------------- this function should return `Result` or `Option` to accept `?`
>     ...
>     31 |             unsafe { dma_obj.write(data, 0)? }
>       |                                            ^ cannot use the `?` operator in a closure that returns `dma::DmaObject`
> 
> Could you double-check? I guess you will need to change the `map` into
> `and_then`.

You are totally right. I'm not sure what happened. I'll fix it. Thanks!
