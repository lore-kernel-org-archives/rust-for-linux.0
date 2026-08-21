Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9989E3F58FF
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 05:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290289; cv=none; b=cDe3bh/X8KkopwmbHGp+iWQDNv00ka6ddyHGBIURlCbA1fjhIahTm9XEthB3nZiZYKgKfuUqRPWlhDqriSHJaH4syKKNlskL8XCZviq7nRerMbJTgs7WLD/vagKql7KjTHv0yeFEJKqMkRHDPDoEX0rkKQocWA7ZMpNWLe7jbmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290289; c=relaxed/simple;
	bh=inNrn8G8WFZnnfrNZ9E3BMtQ1vPeRWfBhWs8dXkjO1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Al3t7KCxEKeysgXzb2piSQNhUcKFVTo39LUvNEdaVHEOlP7nI9C+pETYLzGLeTyU7EDfVD5V7Y0g1fg1OcxPX5ZYfaFymarbfugwEF0YVAnotpyt/3tCzsSdcnqvx23eeF93x6uBp5z0eoG0/5VJr51joGpF0skHywmO5tnf++U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b=VrLMlt3s; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20251104.gappssmtp.com header.i=@beagleboard-org.20251104.gappssmtp.com header.b="VrLMlt3s"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84f77cc7302so188751b3a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 22:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20251104.gappssmtp.com; s=20251104; t=1787290287; x=1787895087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8SxG8MAv8S17KEvq/pF9OP7cYmFId3mpEeGKt4QpjY=;
        b=VrLMlt3sLhd0V8t78MIHvLsBzc1+t3pDuJTlemBOc+7E7K8NWj10Gf+oE/BlEV+GWx
         R9NDq2vAXbRLmrqctvdqcbS0ncmlYFjMIZHeIkf1P7LmB1oitsGXWDudbJD5u7aEYf3O
         IVKhWqSbXWf7w42RG53ALrE4yse7kxEF55ekmd+3nSTDnU97qHfHnq7AgQ5Mzu0ZM+nz
         7xABt1JxwkcDx51SfMWFY+vQhkkJ5CYvXoLDLpX2EgMHDTDUqT4NnlwPkOnLLRH4gHaj
         E/4Qp39H0p3DDW45FaxqkT/4Bdi3z6EUfP6nJ6OVDO1FB1ae1C/I+vdwd9QAxZ0VJ3P4
         Y/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787290287; x=1787895087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8SxG8MAv8S17KEvq/pF9OP7cYmFId3mpEeGKt4QpjY=;
        b=hZW6t2FbB9tbFciBRKgt3GrK9fKGhllOAhGZCx9repUq6FpoqP/AWkgnMoTEzrB9Hy
         j8+SLcevTYIzgWfLCLeXYaXjH7N4OlNo4murrH8hb4Fp4mtJSnRLDkJ666j9ani5M22t
         UBWfvqB5oggYuNJzjSbIh4e8uFuNQn3tTGdkDqNfjbLPMwCpygvNKp2qDSmNT4MbrG1h
         1HcIBDk/SUvsVzas83JUgmzhuPEMwlrfseQGrrTgqD1juMWMflo/lham01JMwOeJZvoQ
         34GlO/S6UR6pOW71WVhGiyXZRdI0NLT/5ZNEUCmA7r0tKeYeKdlF7o/TsmQQYuqiweEB
         LNYw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0Dq+hIkO8GTpLsOgVrvRxHrgwabhTaq64Cl6D69hHZJbmI+plcqPoaQ49cUggpP+fPexqwA1Z3ZZWNFoXxA==@vger.kernel.org
X-Gm-Message-State: AFuF++mgO0aLAliDmgnwOUaULuQz2sqiWt211oJUkrXMahGZ3WxOSOOX
	trRdosUNsT6lLZBNVQtiEaJdV+JU4oLK7Rg5EBdENAv5fThiPcEu7yLPD4qh2Z9HcQ==
X-Gm-Gg: AR+sD13Ov4swBdjsxF9CflNuPQhMilH117F89itkuf+0u6CR0d4sBkuepdqnElv0xFD
	jzQ6+7n4Xwk2nGGjgXwg7HpR8RGa13NjP6bPVCoNp18lyeaUz5bIbQ0zGEOh78X5krNxziE3Avd
	nTXTPJze5tkBHLkjbozIZAtuguB+dvOTSIDNtPfTAFL2vkSs8nTBkTA2Fsr4IJoEoIvDirZ4hes
	bRfYTB9xZvMnfiwIPY9WZzxjSkB/ELJ2TRkKecLk4qzlzgm97p7QjOZX7jaOM9XP57TRjNebx8T
	rc1B1izFLQu1fyND13TY9MzHNaidx0/lUMKbR+0aiLQ08ZNV9GjmUyKHNYOP/5pQbo+MKnuQ02i
	pGGCzxHXlMQZPTh4QU7A/h19N8tRQ8JGfsJlVQYmPKoJlR2cxoomk3xxq4hJPYEUowPEjXpbyPl
	eakRLqOoJnioUl8AF6UjYN7hciGMBrVTJcAcaAV734cIxPpE4McCOfa4ZmIIiCl2mea4V8LYPJY
	amTQvpMR7N9shdoLcPTiwd32cRGdEZADyElOJM=
X-Received: by 2002:a05:6a00:9519:b0:847:9267:2104 with SMTP id d2e1a72fcca58-851f9f48a04mr4829658b3a.12.1787290286849;
        Thu, 20 Aug 2026 22:31:26 -0700 (PDT)
Received: from ?IPV6:2405:201:4019:32fc:3c55:6b24:5147:322b? ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d31b01cfsm2388453b3a.0.2026.08.20.22.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 22:31:26 -0700 (PDT)
Message-ID: <f93c5f18-580c-46ce-971f-8e2073485b4b@beagleboard.org>
Date: Fri, 21 Aug 2026 11:01:16 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] dt-bindings: beagle: Add BeagleConnect Freedom
To: Conor Dooley <conor@kernel.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
 <20260820-gb-uart-transport-v1-7-282da14ab7b7@beagleboard.org>
 <20260820-anytime-barrel-9a0547910a2c@spud>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20260820-anytime-barrel-9a0547910a2c@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/21/26 12:03 AM, Conor Dooley wrote:

> On Thu, Aug 20, 2026 at 02:55:49PM +0530, Ayush Singh wrote:
>> Add devicetree bindings for the BeagleBoard.org BeagleConnect Freedom,
>> a wireless-enabled board based on the TI CC1352P7. The board exposes an
>> MCU that can be attached to a host over USB, UART, SPI or I2C, and is
>> described as a child node of the corresponding bus.
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>>   .../beagle/beagle,beagleconnect-freedom.yaml       | 30 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  1 +
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
>> new file mode 100644
>> index 000000000000..5a246f81261e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
>> @@ -0,0 +1,30 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/beagle/beagle,beagleconnect-freedom.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: BeagleBoard.org BeagleConnect Freedom
>> +
>> +description:
>> +  The BeagleBoard.org BeagleConnect Freedom board connected over USB, UART, SPI or I2C.
>> +
>> +maintainers:
>> +  - Ayush Singh <ayush@beagleboard.org>
>> +
>> +properties:
>> +  compatible:
>> +    const: beagle,beagleconnect-freedom
> These compatible only devices always look suspect to me, I feel like
> these things probably at least have an optional regulator if the power
> source for the freedom is provided by the device running linux.

Well, the power source can be provided, yes, so will add that. In my 
testing, I was powering the BeagleConnect Freedom [0] via USB to view logs.


> You're also short the required properties for dealing with anything
> other than uart, so spi or i2c. (I assume USB doesn't need devicetree to
> function).

I have only tested with UART at the moment. Is just having 
`additional_properties: true` sufficient? I think the reg property is 
the only thing SPI and I2C will require setting here.


> pw-bot: changes-requested
>
> Thanks,
> Conor.


Best Regards,

Ayush Singh


[0]: https://www.beagleboard.org/boards/beagleconnect-freedom

