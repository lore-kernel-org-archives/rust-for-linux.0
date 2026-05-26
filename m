Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBADB2773CA
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 00:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779756211; cv=none; b=a2IZAbIBodFvjO8sV2kRqvUU4i91Mr7ZR5jAFQraLQ1Xg3TRtI7naa3HAduE57mFZKixe2M7zrjfx/Al80YaxKqFBKeAWz6TyfrQhcK8HBr2vAj8XOgHbLUVnncJolG2YwqXcT/z0HdwitSKWTT08xGz+W0tOvy6QFNE3cAoUlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779756211; c=relaxed/simple;
	bh=OeBdW8w+K/E4rAqV47MIXje5WFc1I6FcWdJRjvTURBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FSR574EKyJY+YTtwVHo9719l4JfhokjFZQPyzDt493Pp3eVRCVQKVWrxK/eQo3fwNNicwfKCi/icwIvtcC6Kl6BVouJ3LgKyMDg2g2BL0FWEe/11s/HMf4uVGVeZzjstyifh66aM9N60mL9AhusPqtT/qDdXAuetBuAtkQB+CFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+MeQm9a; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+MeQm9a"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2b941cd869cso63675355ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 17:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779756208; x=1780361008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZSBKRaBI53J0bLo/1yi0NM1Rx2AWnXxdKiQgfUvj7w=;
        b=j+MeQm9azVO4TPM2KU1U8hZ9OF+E2RSuCdDT7wJR+/h/GBKVaH2cYkqV7Ue8sIKNOQ
         YpLvinZhHYPnjEmV57Ir+20L+0Ej4wdszdZZ3e9g0m4/taoDPEEPcdtiUlKZmdf1gn5E
         sCUrPwX92VVw0xy1Ecbekfz4n9b/oGYRRGKgIXs1nyFK1RzeutofLIZJb3FO5fztbpo/
         8zwymWq3BmcHRhxMg8gzrC33ZLmgA8q5HKTtBRcpFRbognjSytYMXx0+E/YAkQR9dyyd
         ZlIuvt5by5pZ6Ubo4Q7gpUMmexDPFiSeqhvolvq25SuhZ05ArAbyAnSC+8LbpbOeJykH
         1Jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779756208; x=1780361008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IZSBKRaBI53J0bLo/1yi0NM1Rx2AWnXxdKiQgfUvj7w=;
        b=od38wuvrvHUVKsVeJ+GtqsucIZhnmEnqoY9L4apumwGW4hlSqQAQf29jrWIL8EpFJH
         MkzXCDjmr1lhMQ65IUYLIOPs+XUwxnEur/W8kJFViUQwJwcc2QjC28CwoLtEUIPVr/bV
         bj5WcrzD6Sad+MGAfILiOWaO/WSm443xrEEcaFQ0r0KQvmoQCCBhnzAA23XgNHeq6CU2
         oWJ9WAjCSNe+PbDZddq6G5rGbLCo5RlhK9Mk2bYK7HDZRIN79zX4OgVDNA8dr9RAGvdc
         3hNszO2lSONHYXHVc5shmFOMJl5lxQEp4YpS80LIDexOCm7EQdjuJhsdM6y68En2WOAZ
         KT0g==
X-Forwarded-Encrypted: i=1; AFNElJ8Esnww1+bonYz96Jrk6jH10VmLBTa746zthdd6KZP6zDNZK+36MoQVBLpiCZgtIEpI7qqVQr5N9nBP64/zYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx67S6K1AlobodlSxr2FAsUpaeTBbk0E/Zkyhabom3YqYgUsmI7
	phuzzltedPWXVF7hfkvkpK2lTaHs5LdTNbBkyizteeCNOtuuV8THaOpC
X-Gm-Gg: Acq92OE0sA4o3XZv49EgwSUxj6GkStohENELCK88upWBiIKOl4ezrzqGK7AZ13i2Dj8
	Oritr8orX4zVMWcW2Av565N7/fy21cR/Ly+VuQVZJ29rnAKEPp717tS46mTwrmvKOmxj3b4IkBX
	8/8antgEY6VLLjBpJk6Vkc5aolQZalDqJBdk+zNjYiqh/KbxdubAr5yoYkPaBE7APxYO1Lt8stQ
	CnU+byRZ4GhyhzvyqcZGFP/kWaIu3CWtqRyjcewglvCqAoHt5dkbsCQv4yXewb4KygFG/vjiiYc
	bsWkSASw5mSBfKBkkuNjboKYiVHRGHxuWqCLPPNhejyKAnGlfmtg7ExQJa1IxdNxvJy5knXcBLf
	ODrkZWkhk1BNDWuZLCN8GnEvIXoa7htmkQMR5BGGKD1qo/h1BMhxTlfG9YSXA/6EVRUNcEecpSI
	kVDrA5lrU=
X-Received: by 2002:a17:903:3850:b0:2ba:3e2f:6874 with SMTP id d9443c01a7336-2beb06994aemr181148545ad.26.1779756207944;
        Mon, 25 May 2026 17:43:27 -0700 (PDT)
Received: from [0.0.0.0] ([64.118.136.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b9fabsm133811225ad.23.2026.05.25.17.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 17:43:27 -0700 (PDT)
Message-ID: <8b988694-789b-4a2d-9e7c-0206ac427860@gmail.com>
Date: Tue, 26 May 2026 08:43:20 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] rust: block: fix GenDiskBuilder failure cleanup
To: Andreas Hindborg <a.hindborg@kernel.org>, Ren Wei <n05ec@lzu.edu.cn>,
 linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 axboe@kernel.dk, sunke@kylinos.cn, tamird@kernel.org, yuantan098@gmail.com,
 bird@lzu.edu.cn
References: <cover.1779596478.git.royenheart@gmail.com>
 <vDiE0u5yWwpR73QOOL97_K5xky-jGckDYtTjHAJH_7uGK6V1W8OKtcgrAIK2mC6I0Kfkd6lhbSYgjk2IRbvORw==@protonmail.internalid>
 <b6411cc055080c984a67bfad72fd683aa84b8e13.1779596478.git.royenheart@gmail.com>
 <87qzmz75d9.fsf@t14s.mail-host-address-is-not-set>
From: Haoze Xie <royenheart@gmail.com>
In-Reply-To: <87qzmz75d9.fsf@t14s.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/26/2026 1:42 AM, Andreas Hindborg wrote:
> "Ren Wei" <n05ec@lzu.edu.cn> writes:
> 
>> From: Haoze Xie <royenheart@gmail.com>
>>
>> If GenDiskBuilder::build() fails after __blk_mq_alloc_disk(), the
>> allocated gendisk is left behind until the caller drops the last
>> tagset reference.
>>
>> Handle the failure path by releasing the temporary gendisk first,
>> then converting the foreign queue data back, so probe failures clean
>> up both resources before returning an error.
>>
>> Fixes: 3253aba3408aa ("rust: block: introduce `kernel::block::mq` module")
>> Cc: stable@kernel.org
>> Reported-by: Yuan Tan <yuantan098@gmail.com>
>> Reported-by: Xin Liu <bird@lzu.edu.cn>
>> Signed-off-by: Haoze Xie <royenheart@gmail.com>
>> Signed-off-by: Ren Wei <n05ec@lzu.edu.cn>
> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> 
> Thanks for reporting and fixing!
> 
> I see we also lack a `put_disk` in `GenDisk::drop` after `del_gendisk`.
> Do you want to patch that as well?
> 
> Best regards,
> Andreas Hindborg
> 
> 

Hi Andreas,

Thanks for the review and for pointing this out.

We will run some additional experiments around the `GenDisk::drop()`
teardown path first. If it does turn out to be a real issue, we will
send a follow-up patch.

Best regards,
Haoze
