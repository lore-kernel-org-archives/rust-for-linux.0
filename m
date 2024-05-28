Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9466216ABC3
	for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716891494; cv=none; b=Ad8iZ9k2FD+4MK1c3JnjBkGDptIIinKeT3aKQ0FS751uaKWd0r5/Q/2RSQVnxGYbM9SQrYGx4NwkV5oSh1aZVQW3gddxy6NQfE+fYmNm0p986bWOXl9QPrSu/gdZNjza4PTZEPlV0BkpzDaVEWKy60PwyLySeKOd7Nfh0XcU0xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716891494; c=relaxed/simple;
	bh=tgxPAlaC75HNyT5nnPKf2QyuWkEMfCU5KBj0D+R5yQg=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KkSoqjmbYl2Pf4LZzbpDs5diq1dMQTWYe6Xpwj0TDd/UI/bqW1IswM5+8yvFYg1HcBBdq3HFpeyWiX22aaOVwLwtJIFE7mzd97oQswcI+NkOg2c/lnKZnRHi6hfW8KvWWupDIZD3bgo/vpzJyuNHcaYFsv9QJP8uk67mwqR1Ihw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcQyQZsb; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcQyQZsb"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-65b2ad1dd3fso28266a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 03:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716891492; x=1717496292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oKjidjiVG3iD+sGVPZRpxklkmgxpuRK74mDLt2GwZ0=;
        b=gcQyQZsbqYeNYHE1fOOpzLMI2hv7Ae07IXezf9E9Oqr7bKENYliX7gUg97tDbA5rrm
         MwfZwcibfikobpukUtJ7ar8A/HIkCH1oYEjhVRNfj9Ih3dbauHZCesqf3kE6MHNPLEih
         3B4HWq3wfkhYn/A4n7RoAaa7yoZNY1f3KhNQllODG1uf8qg4m+bvDm0vwfplLOjkEK8x
         NZDIZ3lK8t36XGvchv6XYn6ULRoVqaI68rat0PrOK6tNXDKJqoeevspZO++KdSGscZKt
         vduO2Kq2TV8y6AyGREI8M5tNPyPuodQgpMvpvdonGDQ+IlcOuucH/MrDWMexi7k05yP0
         DQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716891492; x=1717496292;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4oKjidjiVG3iD+sGVPZRpxklkmgxpuRK74mDLt2GwZ0=;
        b=rp79SU/uV6mpNDOp8kC4sQlZlYhx+AT55rugZFP0SPXu5g09CsOik9942F/som7L55
         5iS3mIf8IBYHqqFIOyxV8mt6UxLzK1GnP5yvvfUbZgWSnZlCtx7rx2tA/TAYnOQkjyTl
         8bDhyVb4Jygp5TFIPWDx+oXlEYh15lmWnffhIbvp4FlVJGv7aBw+99UIUokKtckjJpub
         NZe9TTa/xRu5hkRsgOeuueXagVaIJBJ6OnVueA+gLHsNsa4omuAz/kR0b6u76qOIru7C
         mw1tA+iYp6J+1acr2pfwLc6Pw2LWUaTYVKgGaIKnGJVNxMvW3MaiKwlJUeOWTM434LZp
         JVng==
X-Forwarded-Encrypted: i=1; AJvYcCVvlAqiJJiJN3NRCrDTx4NSWkqFf/hcCyrIuWSiKvrsfIl7zNCzXSqHc/LFokyvX4VQeXtPbvioD8Ow02h8WLefe0jDaRyTFXX+8SARRjE=
X-Gm-Message-State: AOJu0Yw0elYF9G4SmP4Ylqr0vdTu2BmVhgPErLSGZLNDe/d4cdnQDOJ+
	KMzfR0FEONRDiPJLzd7DDh5n48kbTw1utvJNecKsu62b481fVjzD
X-Google-Smtp-Source: AGHT+IEELOe5mgelYMSGmtxG+kL4UbvP8a3LHl0DXgrfdRShMJFiYY7EESOCugBH7JHSw6S2HnBW3Q==
X-Received: by 2002:a05:6a20:9759:b0:1af:ce9c:6421 with SMTP id adf61e73a8af0-1b212b6f694mr10944170637.0.1716891491764;
        Tue, 28 May 2024 03:18:11 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fcfe64ebsm6140939b3a.156.2024.05.28.03.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 03:18:11 -0700 (PDT)
Date: Tue, 28 May 2024 19:17:54 +0900 (JST)
Message-Id: <20240528.191754.1306229738730927340.fujita.tomonori@gmail.com>
To: zhiw@nvidia.com
Cc: dakr@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com,
 lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <fd5dbd42-24b7-422b-bc0b-393347b3fdca@nvidia.com>
References: <20240521083231.000074c2.zhiw@nvidia.com>
	<ZlTcnYNff2EDQJdj@pollux.localdomain>
	<fd5dbd42-24b7-422b-bc0b-393347b3fdca@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 28 May 2024 08:40:20 +0000
Zhi Wang <zhiw@nvidia.com> wrote:

> On 27/05/2024 22.18, Danilo Krummrich wrote:
>> External email: Use caution opening links or attachments
>> 
>> 
>> On Tue, May 21, 2024 at 08:32:31AM +0300, Zhi Wang wrote:
>>> On Mon, 20 May 2024 19:24:19 +0200
>>> Danilo Krummrich <dakr@redhat.com> wrote:
>>>
>>>> Add an abstraction around the kernels firmware API to request firmware
>>>> images. The abstraction provides functions to access the firmware
>>>> buffer and / or copy it to a new buffer allocated with a given
>>>> allocator backend.
>>>>
>>>
>>> Was playing with firmware extractions based on this patch.
>>> Unfortunately I ended up with a lot of pointer operations, unsafe
>>> statements.
>>>
>>> As we know many vendors have a C headers for the definitions of the
>>> firwmare content, the driver extract the data by applying a struct
>>> pointer on it.
>>>
>>> But in rust, I feel it would nice that we can also have a common
>>> firmware extractor for drivers, that can wrap the pointer operations,
>>> take a list of the firmware struct members that converted from C headers
>>> as the input, offer the driver some common ABI methods to query them.
>>> Maybe that would ease the pain a lot.
>> 
>> So, you mean some abstraction that takes a list of types, offsets in the
>> firmware and a reference to the firmware itself and provides references to the
>> corresponding objects?
>> 
>> I agree it might be helpful to have some common infrastructure for this, but the
>> operations on it would still be unsafe, since ultimately it involves
>> dereferencing pointers.
>> 
> 
> I think the goal is to 1) concentrate the "unsafe" operations in a 
> abstraction so the driver doesn't have to write explanation of unsafe 
> operations here and there, improve the readability of the driver that 
> interacts with vendor-firmware buffer. 2) ease the driver maintenance 
> burden.
> 
> Some solutions I saw in different projects written in rust for 
> de-referencing a per-defined struct:

Aren't there other abstractions that require that functionality, not
just the firmware abstractions?
