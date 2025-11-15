Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA82018A6AD
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Nov 2025 13:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763213869; cv=none; b=LtJq8y/MMEOwp6ggxm9WZlrUwEMj2xA8GJZzzRHKYPUuRB0sn9LZCj+/pepoaxUvoJfE4YU9bWvtdtFhrn5tmSZkB0bjlDFYY5SjbQF0xL0MvQdZAB88pdhhsEOtzXUueJv4M+FeUnpIhXU/ak/72t4rsknnIaQZCRkBkbqwXec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763213869; c=relaxed/simple;
	bh=D7LkCx6JCZfm1h21rZGsEgbAjVVg2tz7vuiiK1EJgTU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CT4WiA/VzhHw9OaKP2mHIClIuMyKpb8eWV2RO0j2ByEOCoPeVYaDtyLuPob67J4MEajhIMCTaQXmGnhY9XbhMrnfYRD3KVkl7mfBwg8CLbwV064B7HzH44I1BQ45aJVmnjA8ggFuk6FxciFFSB7iBjuscvZ3DMRprlvkoUtq9xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4tpPWRp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4tpPWRp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297dc3e299bso29162905ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Nov 2025 05:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763213867; x=1763818667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hh5YzbSVtKYkm9Wf89l/r6qvXQf/GdcsMoZRhw/Vyi4=;
        b=l4tpPWRpPvXQ4jONL0zEmWWjkokz+R3pdJqgsD28aqsmlLAQllRDAVw0rsZbFiT8yk
         nQULMNCIH2pah8Ikil4ACnO3P+vliY7K4j3FP8J6RH6PBsrb7w41ohKEH59BWe5XRPmP
         5rh4IMZlSZHAg5BfU26bsqrxdu2uelDQfceqRnmWm/P41IklqT2LSA7nQMlttZupyRkM
         eiJ0aN5/AyndkHsSjzLt6g8aco6NIcWw3ER3cQpoIY/EpJOQaz8QcWSESOBvkhPbyF/H
         DBjQOtY14NIbtHtDwEYTv/JAYiSkpzHix9uB6WUDkB2zcEi5LP+NpGexysDkWsZN509B
         vqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763213867; x=1763818667;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hh5YzbSVtKYkm9Wf89l/r6qvXQf/GdcsMoZRhw/Vyi4=;
        b=HM4uQhmiEdoe/XgTAYK1UAtyMF89r0rmUuLyiLcHPqX9v9ArMY0vHNBoGjXfbhQs3K
         xBO0z2ZhJ6H6OAEpL9mzOCxJNKkZxmPYRyrwbBswLS5pk6wnYxt4pkya/cZBlmlKKe9I
         b1e/ZGDTteUH03cVUhBKtrKwZELn1mpJEYUy1LPac+xwuEXe7KZRpEYqH9geJTVPKzus
         UpUCajyUUURaVFjj+n3jSyMTktKAuUF3tjadP6Co99LA/DVP4dvlwUIUMcy+cJdlXU3T
         kBCKuPMDAQFjX/eyqyruLyzS3NyT6rqhhjtBSdgTur+D7eXeUaArOw5vlZ8Un/cBTEDR
         fG+w==
X-Forwarded-Encrypted: i=1; AJvYcCU+8ICi0jbZNv4gQH5TA2OeiIn9LA9Ez6Ewsp5YKKrbbZ5EgF2t4nuOxjPPrubDwCSKC1k+KwwVhFKxgYRNjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+axEA+EyETHLccN7NuwKRRjlvC4sJRartnTyWHJgyACOk0JZ
	WPxW4ygNl4jFy3XqUVSGXvVasesiryHokPWdOulnFvani9HRX+hvrtJ/
X-Gm-Gg: ASbGncv+EY4j/V0cIQItYY9YgGZJmwy797R1RpHWQcrJVa3tq7z1vcvrYcg13QK7wR4
	KeT+xZ0uzXZ3K0wgmgU8mNeAzUaLE7gV3QIz8B3N9PpjIEGs+DKwmPpozAs5TYzH7eMZ9+gs0Sj
	31layJMuPfLmVwpLv0OB/JmolRGPgZH0OxH99QAMTjkLbKCb/UJspYfl1iF3UTyhVWImtOWC+xg
	BF4yA8BF7s3gvFPp68Noqsr4ftQeegjS5fTE/OGaVdB5steUpc8H9rJoTdD6NDBasAc1L8BE7ME
	7UcUCZ7W0tR2OMQKvkfd2mjaIWn/O0+2a05fk7frs0GYAEbSn57/BxCwzGaCsRVstD+MsYCKuAH
	1s0CmeJdGAay/bMhI0qBpeAvwu7Zrx0edXGNPdpYXO5k7dj6f5psBuSqCZZhmtjUHhYLrKyPtKj
	r1RrvtKVO4TlO7rs5m+//RdOrugtont0zCvUuhOMdANpdPgT1LwzIrQg==
X-Google-Smtp-Source: AGHT+IEe19yqVUjz3VvFxpppFmdEgYmWXp0h+wLGwUX/5ow6/tQ4z2C/dBWqwGrrSHW11sqKJB9J4w==
X-Received: by 2002:a17:902:fc4f:b0:295:7f3f:b943 with SMTP id d9443c01a7336-2986a734435mr82446545ad.28.1763213867209;
        Sat, 15 Nov 2025 05:37:47 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0c35sm87677695ad.52.2025.11.15.05.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 05:37:46 -0800 (PST)
Date: Sat, 15 Nov 2025 22:37:35 +0900 (JST)
Message-Id: <20251115.223735.1838858819537701281.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, boqun.feng@gmail.com, aliceryhl@google.com,
 ojeda@kernel.org, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function
 exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87ecq37hbk.fsf@t14s.mail-host-address-is-not-set>
References: <87h5v16igr.fsf@t14s.mail-host-address-is-not-set>
	<20251112.083810.193018002393490094.fujita.tomonori@gmail.com>
	<87ecq37hbk.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 12 Nov 2025 10:04:15 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>> Another change I'd like to propose is to use an enum, such as State,
>> instead of u32 for the init member, as I did in the OnceLite
>> implementation [1], something like:
>>
>> +#[derive(Clone, Copy, PartialEq, Eq)]
>> +#[repr(i32)]
>> +enum State {
>> +    NotStarted = 0,
>> +    InProgress = 1,
>> +    Completed = 2,
>> +}
>> +
>> +unsafe impl AtomicType for State {
>> +    type Repr = i32;
>> +}
>> +
>>
>> I think that this would make the code's intent clearer. What do you
>> think?
>>
>> If you think that change sounds reasonable, I can send a patch.
> 
> The reason I did not do this was to avoid the unsafe impl. I don't have
> any strong opinion for either way though.

Understood, I don't have a strong preference either, so I'll leave it
as is. I'll send the other patches after 6.18.

