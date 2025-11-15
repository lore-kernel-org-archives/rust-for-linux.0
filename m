Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A22515746E
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Nov 2025 06:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763187756; cv=none; b=GHkKhIB+Isy+F1eUViun4Y8YEBY9lA/cZkdJVQiT2o49NaFbYhsJM24/g82r7dWL4FbNUnBu3Vh26R9eF2Ozn0Kb+H8bW3boO+t0h8u8jQ07hlklYtwojrLl0/Ecv6DmCdjldvAJeSnTRwY32KcAMelfKghWOOHt7IiuOknb50s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763187756; c=relaxed/simple;
	bh=vY9Hzp83OQG8hpjG4yu1TH2iEZVGid6/RcFlqCo8MH0=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eRHbsG0xcC5eFSnV2HiwHTyaf1HjDqbn955oGZpBV+hpZytQPvTcuebqFhPktejc+jpHCHiEpxdEZT8MXXRcET48SadY0X3Vw44WXuYJhNDPmiIp+zJmQmMU/adjd/Oiym/ci3xjDokdLqtbBpmvY/xDpSa+zZNb8LkSDk/3Las=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COS7sM/V; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COS7sM/V"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2981f9ce15cso32310965ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 22:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763187755; x=1763792555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79IWdZvqwxfeXlwCZ8tmMeFxaRey9BXWzlD0gFuz/LI=;
        b=COS7sM/VwQAu166LQXmxdgGHBYnKHNuXHPw8sealZGBcIQDmnZ0cvdIxinLtOkOGua
         UZepLRMk8PTn07heEINdV+6xl+8lepQtdW73o5XgmgUeaHMaSMQ2MjhS+dsXt+aBr44m
         DTPdulL1osD4tuoIp83Yl5RplebIgsXKmcmwLoNhGt3WxJ1mVbD0BISbZWn/PXt2kNMf
         PMuq540RUhP6wI9HmWlIs21dm4Lu4uy5LP/jM9DLjbzAlfT2FyY/oExqnLqFdBFU38wq
         3JVViRfbEiuSgflDeaIl5LYKvicwyEBytA5LmbyD7nMRY6dTWuGg40EzYNOsXBT8fYdB
         AiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763187755; x=1763792555;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79IWdZvqwxfeXlwCZ8tmMeFxaRey9BXWzlD0gFuz/LI=;
        b=pNMpyIXk+9XIr8z8/UpIdxajEuHu5wNCeAX76mVxbw6qO64zGmXg0Py5ZYZ5JaC8gi
         e8xDp9pE3GW6znUfUUigk3mCFdKuEYg8+zBPbRk9QZwqCy7jqll1K1F4+2rwI2n7G7PH
         wmnHYJwN1GTIsBlYYbXCXn1WJqS15Ebi3S5/jHvJNCCRb2pVwsCqAKbmiPncmyhQOBrG
         I+p3TM+2Y6HMZiCXEs3NDVuvWsma2hiseQE5OPjeUVAx734AkRTYLaBeh8S8ydGcXPIy
         bmCC+fcq0jh4kNqTdCKfVTRn6LHn+VDV17jN95cnX3rZgR7Hc23nDWMuHY0QC8R1GVzc
         GpMw==
X-Forwarded-Encrypted: i=1; AJvYcCV2VkmKBIoyeWjaBvZ0IVk+FlUYMkSLLocIiHdxLHU+neTSUb1+j1xYtTUPrksj23DyB9j+rFUSvYmLUNNtRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2WxpMprHHI9vL0TQctEg13z6qVVFd44TesGTVg9+hpKdDYsRF
	3+p4QDPEFkZd3z5dnmODFvXq1/i/zb/Z2OVihIgN0meNg/sH+f6/peOQ
X-Gm-Gg: ASbGnct2VGwwZDfnnl/b1UXry0F/A+PXg2EejNLKENxTWNNHtkkIlX4GW4iid18eN6c
	8NNs6uFyIfekOcM6E60TbzSGCcbdtjxsTml125zBKOEGC+1tDvaAahc+GM6OzP6kr7S0W5JZyj0
	UTHqm+aA2t4NkZgCbhHhd14E2KmGojG9cSgMN98tl8NNgX9/fyLp66Vjs2U5dDgbVoiGy27hWPi
	MPcEpiDeK4WeKz78Yg1vRWReRFlXJfrDejE4R4bs63wMPWh3Y/J8RfvJiIZWnkkKB550qkPILod
	bmTYxK2AT1eMs9ucUtveBsWfo2R4kvDA5AjT5oH0FyqsKTIeaqDWXZmRERJ9FCCwoFKEsV5SOex
	iY3rMBCaCSDoIl8by0djfrIcDlyB8XrwddRGvWT8mAj2/u/kM/fmzWQZbT3rQOwXY/29o7gTGwd
	eBSiknFkj7igDu4E9exTmtdK8Hd59QboiFhW3INJmdd+DMNWGPuEECcaOzBEw34ABb
X-Google-Smtp-Source: AGHT+IHjejJ7czcMOqk42LKPL262x2w4AxQbCKE6m4kyrfcyCq8hH2olygfVQpg16kuzmGXedUcuzg==
X-Received: by 2002:a17:902:ec83:b0:297:fec4:1557 with SMTP id d9443c01a7336-2986a7598abmr61684505ad.60.1763187754600;
        Fri, 14 Nov 2025 22:22:34 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986e54f019sm37975595ad.15.2025.11.14.22.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 22:22:34 -0800 (PST)
Date: Sat, 15 Nov 2025 15:22:20 +0900 (JST)
Message-Id: <20251115.152220.488086212368718494.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1 1/3] rust: sync: Add
 smp_store_release/smp_load_acquire helpers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aRgOFGLqkolf4j4T@tardis.local>
References: <20251115050305.3872412-1-fujita.tomonori@gmail.com>
	<20251115050305.3872412-2-fujita.tomonori@gmail.com>
	<aRgOFGLqkolf4j4T@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 14 Nov 2025 21:22:28 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Sat, Nov 15, 2025 at 02:03:03PM +0900, FUJITA Tomonori wrote:
>> Add smp_store_release/smp_load_acquire helpers to support
>> store_release/load_acquire for i8/i16.
>> 
>> Both are implemented as a C macro and type information is necessary so
>> the size argument is necessary unlike the C version.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/helpers/barrier.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>> 
>> diff --git a/rust/helpers/barrier.c b/rust/helpers/barrier.c
> 
> Could you just define helpers:
> 
> atomic_{i8,i16}_store{,_release}(), atomic_{i8,i16}_load{,_acquire}()
> 
> in a separate helper file? (e.g. rust/helpers/atomic_ext.c).

Of course, I'll.


> Eventually I will the macro declare_and_impl_atomic_methods!() support
> customized list of types, but right now a dedicated macro to generate
> all impls for AtomicBasicOps of i8/i16 is fine.

Is this comment referring to the second patch?

Do you mean that I should remove the VolatileOps trait and implement
AtomicBasicOps for i8/i16 using a dedicated macro like
impl_only_atomic_load_and_store_ops?
