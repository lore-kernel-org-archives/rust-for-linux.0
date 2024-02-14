Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C119760DF1
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Feb 2024 17:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707931237; cv=none; b=GMBeAAcoV7lRCgP53rNjBKvneN7qTx4p/oN4r1TWB3dZL1qQLPCopEoB75yQaTGxWh8kg6y71fOic7IPNWQTqKwD64X6TDyYQzvlTUJUg+kylWoPSb0WenJ2twkRJnIgFwiXDXLPm2ypQF9wkCzYsN2vKNRVRCK5FDT9QZrRUuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707931237; c=relaxed/simple;
	bh=rZQpvm2949OmV6YOny6ngBjCzUMUCrxTtcAoU6BH6Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUdV6XOqmRGBDHV/2N6slTgfHUit+jtNkJfeNw2LM1onGif7d4sTbyede7akv2f9E7s3KuDT+Xsl8G5z4Wr64IemBU+kwMO79lm6SQPsX5XrWwxPoBVXZre0MNlSCqXFuPb2rmv/vlzDGUrhosUbMcm9M9gzDhRRHkYuzrCPib8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S2jWWk9q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S2jWWk9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707931234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ovk2oX2orbIAKyGqMXy7ixB6AoBlYOpjfpWbhXahpTQ=;
	b=S2jWWk9qryvzfyELBVleHUqvRP/C6sPAm9ljBNN5TaI63w97oiymTT0PKjHx/kHcGxCzy2
	uQ2y4b0N0KFlKqxy0yX0pQ1DqceIkCL1egGatlJety/jlptAXsLQvToORxDYY4e3HQyTUS
	McTLu602S94kBrjpp1MdQadgcGuoIb8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-FobudaTROTugio8l85bA1g-1; Wed, 14 Feb 2024 12:20:33 -0500
X-MC-Unique: FobudaTROTugio8l85bA1g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a2f71c9f5d2so413416066b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Feb 2024 09:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707931232; x=1708536032;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ovk2oX2orbIAKyGqMXy7ixB6AoBlYOpjfpWbhXahpTQ=;
        b=UFyTDm/KGuiOV63APS2vIsaTVfhMq9/vfDXZ2UcyA6xR/MrMvQL3glBqzdCAgK/PNW
         ecG2WPg/bb6jywON3xPeRT0IKRNcxJKFMqLKDaw7BvLzp/g9UcylDb0MMPNcgv2BgCMZ
         E0KS7LxTvrLI0KHEaGgTBkoh53eeXCA+AkfXlUiLkk5Y7dU9VDOhehr1HNcc6PF6nGry
         xLQm0aYJ7NUvnk2k00eXWAbEPw8ES53zEBVg/FlWoyBfWTVoSf2TqpPaVJaAacnPejZP
         Q3By1vKaYfOUOGBZ5NKnB2+p3UiIT7v88ofIhrVisJ8yiXvAIH9ML6UoDDeqy5WV6/G1
         VBEA==
X-Forwarded-Encrypted: i=1; AJvYcCVaYTP7ql6SrCvoz3ZJyrAnYe14lT591j9UiPjucoqIHHplUVI1SRWUeXtXjr9Q14OvFCKzgXqsuDq9GbQpDb1xlSVhVH7E0pPzNhv5gAc=
X-Gm-Message-State: AOJu0YxiTTFTqQE4+eM997PcXb+K07spkB7o90vFWxwC6pDr8PkMySJt
	Q2Y4q8h2ZsRdGe1lQCCSRGNvhbJnx60JLVB0v4xS0cLzTtksjoj57DWaPrR3ahZftUcxzvQHZkl
	NfU8tcNbr1tSNzBxp+anl10OZGHdHacVFLX4y680Yr/3WaUgqLuXQxmMK6rQ8+4Ld
X-Received: by 2002:a17:906:459:b0:a3d:26db:b05b with SMTP id e25-20020a170906045900b00a3d26dbb05bmr2576298eja.14.1707931232236;
        Wed, 14 Feb 2024 09:20:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNWEcylqQIB7DYfeUi0TPm6NJ7N5bNqDGnpBM2Ojzlxvf0336clxkKnR79u0IJ8isMXnTF8Q==
X-Received: by 2002:a17:906:459:b0:a3d:26db:b05b with SMTP id e25-20020a170906045900b00a3d26dbb05bmr2576280eja.14.1707931231965;
        Wed, 14 Feb 2024 09:20:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWM4KZtzQ9AqpaFNV6aoe/BJvP08r0+Z0bHteT8pJrhy1AWxBLB5EiJ6/ZZ5HwEkfeCSnujDILPqKmsiy9EKhpIplM6baudpNgdBN5OUfhv26vZm1ao8yY4iTc0CuN26u+3t9utOGc8WhiV1pvLE9oT7MaHQL+w1h5q9ga9ugFiH7tFJElYHk2qGrxv6jpxrVujaHFyhSfwEBQkWdabiHgKqCFemSnfq/L0BqfmRSZovUr3aVjVUKfWKYlNvF9N96jSM/fdB2MRGhVQQ2gI0H/CeNNs+VcjgktXumYTgu4rNVfAmpo4mEeRtK83iDUIMp1pezVvUHgh3YTnMY1KovPztLJskGDkiAzP
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id st1-20020a170907c08100b00a3d581658bbsm576484ejc.86.2024.02.14.09.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 09:20:31 -0800 (PST)
Message-ID: <ce189a14-78da-4897-b505-792330620de5@redhat.com>
Date: Wed, 14 Feb 2024 18:20:30 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: str: add {make,to}_{upper,lower}case() to
 CString
To: Alice Ryhl <aliceryhl@google.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240130023843.11512-1-dakr@redhat.com>
 <CAH5fLgj-0Li7E4KGKV0e1-dF9x6TQXS6E_KyagY2ndQV8MSVnQ@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <CAH5fLgj-0Li7E4KGKV0e1-dF9x6TQXS6E_KyagY2ndQV8MSVnQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/13/24 15:19, Alice Ryhl wrote:
> On Tue, Jan 30, 2024 at 3:38 AM Danilo Krummrich <dakr@redhat.com> wrote:
>>
>> Add functions to convert a CString to upper- / lowercase, either
>> in-place or by creating a copy of the original CString.
>>
>> Naming followes the one from the Rust stdlib, where functions starting
>> with 'to' create a copy and functions starting with 'make' perform an
>> in-place conversion.
>>
>> This is required by the Nova project (GSP only Rust successor of
>> Nouveau) to convert stringified enum values (representing different GPU
>> chipsets) to strings in order to generate the corresponding firmware
>> paths. See also [1].
>>
>> [1] https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topic/String.20manipulation.20in.20kernel.20Rust
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> Not a deal-breaker, but this comment of mine still applies:
> 
> https://lore.kernel.org/rust-for-linux/CAH5fLgiwRDcyaxbcUNY8M1c_w11vkCWyRfqVVrN9Sgc7XYT0xw@mail.gmail.com/

I missed your mail, gonna send a v3.

- Danilo

> 
> Alice
> 

