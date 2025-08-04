Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D8620459A
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754319520; cv=none; b=i3IrhVFqxmgrii59xZG200UUALA/I8HCB/nIzGVQrxkmXpL30CBh1XUG5ay4OOKu4R3ADz8e2aHn2hgUJLWtGvDhwTyNZ/mvvtFxw8Bkp/ui6T0hFFE1yAOilrMvNglAYe3F5qL6qvQdCf79Ki6L/F2bo/H1kmglso/wwsu7yQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754319520; c=relaxed/simple;
	bh=S6c+VJgHbVZDjEoX0vuGF6U1y3iJuatCvMbTDjg8RKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aa9DFIQ36e2xxVhKHm3BzS+KesuN1dsdlGltz1hUOyn2TLuiDYrVDhhcZBDRn0zY76gn4TtcsRnZ8GrQ1rEl9s8QkrfS3rkgPSNBBMLakrSSqoWPsLS1fzzNIK3xWE3jtGe5OLz0IjMQh35u9knZPBjDUOIlHANkjogZBLNiYIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itERluJp; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itERluJp"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b794a013bcso3986309f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Aug 2025 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754319517; x=1754924317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KRdfQKDLMjNqXql/cChwMtHennZRJSPChJz6iA4JE4w=;
        b=itERluJpIcGVm596b1A+0S9mzcN/ndWz7nkn5jqcIshvfOa/CVK+WJuR6WjFf2CXFz
         QN9sCTGc+kY5yIjTOqwSQGTDJ4vBUNgXzUZ0wVybR2nO3PDC+uf+Fhjw7WxCWX2UhcQf
         DLHPVGQeOoqT2LQx4eUm1vKRMdtt3v5IntS2AfTz1yRJSVmSlP5Cf8pwKx/HGO+UsLDo
         PM+fX7PIMcz+tFqcr5dc3ld13SxPcqTgNQ5VLWW1iKInnVD7iJQOfPRmR/t9S1A4/pBc
         2IOArZRUGqgaG7+D1HTh/X1qKbFhRZsv7DkEZmdmX3QsSNCBfJ0n0T4Rn03cANaKP/dD
         IDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754319517; x=1754924317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KRdfQKDLMjNqXql/cChwMtHennZRJSPChJz6iA4JE4w=;
        b=uycxE95SX9/MQv8dUjiyulwSIvPDa5h6WpMDYs7dYlnzZr0JIcl/e0F2ZhFp0+/Qhs
         Vndqd1ebqcFVSWUzrH3t1jv/vF/v39GbKcwfk3FtZITmpTlHunywPYyYSbLzaO6MgVf4
         p/J+sPOL8HbMDE2ufR4j7pxl7KHScjNpoQK5m1UBntJ9dNruws2WEofcN/58vyVWIY8Q
         YfgugtQCVC6AMdmZ881XltjHxmk6v0k+JsrzkBJzWS1Q7B/RO1MqWEC27nv0qAvGy6FT
         mTqTrFSLbgv9LxopPrik/vUahC2gFJF021fuGAVFQRjUcKgSg/ub2gJgFAmIKSymC/1Z
         HEAg==
X-Forwarded-Encrypted: i=1; AJvYcCWBaSVW+31NKu63hblxrHn5XYZPf8OcRpAwnTwvuS81QAZgp1XV5GuO+bpoVWEjUvTnF8aEVz61jvxDbxQ5sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLmpz5zCCM5dYwRePYSE8hSob22yyTmougcFeyivcQvFni7/Op
	/xjzTT99o3EaWHGxV8ycheiqZG1JPA5zxa8Ta56Ia+8MVY+spjqmXjLu
X-Gm-Gg: ASbGncv9BthKYd38DImYVHTW+taBaJO0X28FfIMmVvVXk/Q7LDRWw96J86o6efcSdcP
	DPG14pN7BFJ3Af76tyL+OPwms1PtXR0gUib2SBKjXtC7s7ehp2EHL3ikEKDZVL9Kj3PPM77YC5X
	IHYjmW9F3jeZITTEIPMER+wQ9lGZGRdbpwrcVDYj+lu+h7HoPi1go6TuecNZnw0e4ssEKKPSWbW
	+4EefWiRdTPnSWFgkV6K8QabQqbPBAw9GkSbIHNAAYNb1CZFOmAeW6rB/yuqM+/iJA7sEExEkjF
	vBT163HIC06CjLylDI4iXiiu2NPSEPOMNvcgsGWtFlVb/xnqzMT6CU6vecjmfPIJrjW+vrvBzxV
	OZ938SGx71AnaDZTEDwtJIaUcQOgI
X-Google-Smtp-Source: AGHT+IHnTZUMqw6fsGMTMJZQzj2RL7ptl1ds3W00DItqckZXHpCgEiW7NmhfDTBcu9ztml2X6eCF4Q==
X-Received: by 2002:a5d:64cc:0:b0:3b7:8338:d219 with SMTP id ffacd0b85a97d-3b8d94645b2mr7573420f8f.3.1754319517054;
        Mon, 04 Aug 2025 07:58:37 -0700 (PDT)
Received: from [10.38.1.85] ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953f886dsm222621665e9.30.2025.08.04.07.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 07:58:36 -0700 (PDT)
Message-ID: <08e89f95-6c95-4998-988c-e25f3cbfb389@gmail.com>
Date: Mon, 4 Aug 2025 15:58:36 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Danilo

On 8/2/25 01:00, Danilo Krummrich wrote:
> (Cc: Wolfram)
> 
> On Fri Aug 1, 2025 at 5:40 PM CEST, Igor Korotin wrote:
>> Implement the core abstractions needed for I2C drivers, including:
>>
>> * `i2c::Driver` — the trait drivers must implement, including `probe`
>>
>> * `i2c::Device` — a safe wrapper around `struct i2c_client`
>>
>> * `i2c::Adapter` — implements `driver::RegistrationOps` to hook into the
>>   generic `driver::Registration` machinery
>>
>> * `i2c::DeviceId` — a `RawDeviceIdIndex` implementation for I2C device IDs
>>
>> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
>> ---
>>  MAINTAINERS                     |   7 +
>>  rust/bindings/bindings_helper.h |   1 +
>>  rust/kernel/i2c.rs              | 391 ++++++++++++++++++++++++++++++++
>>  rust/kernel/lib.rs              |   2 +
>>  4 files changed, 401 insertions(+)
>>  create mode 100644 rust/kernel/i2c.rs
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4f03e230f3c5..767beaa0f7c2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11514,6 +11514,13 @@ F:	include/linux/i2c.h
>>  F:	include/uapi/linux/i2c-*.h
>>  F:	include/uapi/linux/i2c.h
>>  
>> +I2C SUBSYSTEM [RUST]
> 
> Has this been agreed with Wolfram off-list? (I'm asking since I haven't seen a
> reply from him in v2.)
> 
> In case you just did not receive an answer yet, it's fine to proceed with a
> proposal as you do here. However, please make sure to keep Wolfram in the loop.
> :)
> 
> In either case, which tree should patches flow through?
> 
>> +M:	Igor Korotin <igor.korotin.linux@gmail.com>
>> +R:	Danilo Krummrich <dakr@kernel.org>
> 
> If you'd like me to keep an eye on this as well, this is fine with me.
> 

Yeah. I really need your help if you don't mind. Thanks.

Could you also briefly tell me finally which tree for patches should I
use, how do I do it and if I need to represent it in the MAINTAINERS
file somehow?

Thanks a lot for your help and review.

Best Regards
Igor

