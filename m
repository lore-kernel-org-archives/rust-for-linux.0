Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C1B16EB42
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767173720; cv=none; b=DgOTCYr6byhOf5clx4MYknojWX/3R8ZRjQ5zAxiCH8ecTQFkpKbA3DtEr2dynlhqvWqiHovm2YxNgOVSyrari8u4vVnOE65/56l5aeXFkyEyahq09lWzcjDL2VWhcyJs+nO2HbNxJZ5QfEKfuaONrN98mkxHo6AJU8koNT9Y8vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767173720; c=relaxed/simple;
	bh=v7M4+oP3x4PccnYAHukHfIUlmA0eGf/RwagYiPosdzs=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SUIgei2XZhVZcSyEMlmX4c9EtQXlrbsWG5ZoUtmTib8+y2pLrT6R2S211zz9Wfe0HhuF1+YnGgVtheFraFXCSed9kUU1+g3kVyeYk0ONrpuY+26ThvRctQZZ9RHMHpTmYOwOj970I+QVdU/LEaFwRM1hhN+kWG6ThxRG7FZFbBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWnKDg09; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWnKDg09"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b9387df58cso17131345b3a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 01:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767173718; x=1767778518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3756fXLfOvSwp790vATy1NBa9QgiKD+McaFw1+rwvM=;
        b=fWnKDg09xf6FPPRaQOnDBgIczNujvMBI++Pc/4+Hm2yN7g4Svp6RoEjfbu/JwbN8z2
         RTN9NCa/qY04M3zVcnMaMQS4n+NjqeBsD5cVOBQu9diG5xb9pd2gRYfl2GBHAbJzCrmf
         RyMPm6ENHSizwm4OILnHLABWYlw2xwE9TQ7SHQJnQ1vDXJYZHlXiDUVcePd/w5sUJ+Tc
         oEhqCH5j4XNYp9ZaeXvUcHRSFZ3V0bsx+uBdtqqroueq5u1yJYigxZg0PSj5ygwiKmQt
         dptP0TS3ZbsnX6ZDKbp6AxftkywqK+UYkWEOvQ/IFV1DHwSCZ1kIwBSQ+UGCwp9y53HN
         23qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767173718; x=1767778518;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3756fXLfOvSwp790vATy1NBa9QgiKD+McaFw1+rwvM=;
        b=K/3TIr1xfFRILHo0H/Y53Zy54rTv3xPczsXvtu+hIlphclizduwYwlI1EGsNvppRx0
         w8CwULzwNt8U6SGaN7sCJTmQ+ifJoLAPqVK+FLVk1cIM+yrrbXmjyVj0EpsknUiNZHGd
         n9jBiiH1bJBNnEjoRAWTTlpLsA8yf8wIGaeB6aHGZBFFONhivm4lDmJr30EPAIw6jupn
         R1zC+sz+VJP0m8d7Goc7mH8/v4mQ6OGGIdZuo9CnrwyfiEKcxRpt9Nuiml7YCCMV6Hjy
         5T0Hn3L+kLQaegs3DKyKH0PbehR5Gi1Kjxuk1VlKAWk0Y/xBDNfPySs0XZy6mq/CMoVg
         PZww==
X-Forwarded-Encrypted: i=1; AJvYcCX8fo19/sqrEVK3kqfHkGKZsLJV8toWCIcqYfgbl97eJ+elvxi5DAzOK52MEEcxEwRqvH0EKW9sYGdRQ4Dgng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLRPj29e6G5ityIia9DhugAlq1Hxe31kgfWP7F6p+g+35byjtt
	/xtfUB0px6PSD882Tx1YLPHYw5EzZ0lyya/kh09tFnF8Ox6Z+2y9X0VP
X-Gm-Gg: AY/fxX4fEeYb/FeDaWhgbebjkmsHarbyjSg8dNGi3cYxd0Pv7vCK2jnBEU1aq/dKAIK
	flRX6OHkZ7iAia8ifiF5VFQprfNKVu36LA1xTc7BlOTggxrtjUxCHCMdo0JmOgEe/HYyByAPVPx
	9ZFOh01cXLLuG0lALfq+IwYroVxjqBDL9LGKgpje3cm8Q7C26J/z/zgiUEx39c2MShxci9RyHsI
	F2t+B98icxRSfQCrd6vWroN2pm/T5+PUq/3W2wAgAO7eV6RQNnCvTRNTihLTaPsFlNJWbpe7meJ
	p3vRqW9+ASNcIFu2qd6wXoVMNcjSJMhJZnbumcjCOSwAYvHiL5h9HcQmst3MD938ZjfKx0R7bVa
	cRXRJZofJl6dvjLWab3trTNcZWsvxjCShMMXWEALPIehwq4kA4SE5D/N/Two07WZ4X0pb1lh8k4
	fzmRdHY6dGsqGNsujqYpp3SfG0h+wl6/Y6H9bk6U7L/iUgWKMNEdPRdcqrTJ8uApwPQBM=
X-Google-Smtp-Source: AGHT+IEtYAjIzomo/SOnJFA02AhIxCuR8wpRU5pqcmk7+F/4p/NaYCPdbX8LZROx/5lAxEkv91qHIA==
X-Received: by 2002:a05:6a00:3004:b0:7a2:8853:28f6 with SMTP id d2e1a72fcca58-7ff64dcd50amr31707754b3a.22.1767173717835;
        Wed, 31 Dec 2025 01:35:17 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a84368dsm35236313b3a.2.2025.12.31.01.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 01:35:17 -0800 (PST)
Date: Wed, 31 Dec 2025 18:35:02 +0900 (JST)
Message-Id: <20251231.183502.304307662571984456.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, aliceryhl@google.com, arve@android.com,
 brauner@kernel.org, cmllamas@google.com, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tkjos@android.com, a.hindborg@kernel.org,
 bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
 lossin@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1 1/3] rust: revocable: Switch to kernel::sync atomic
 primitives
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aVRgTQWhqjKB6xpK@tardis-2.local>
References: <20251230093718.1852322-1-fujita.tomonori@gmail.com>
	<20251230093718.1852322-2-fujita.tomonori@gmail.com>
	<aVRgTQWhqjKB6xpK@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 31 Dec 2025 07:29:17 +0800
Boqun Feng <boqun.feng@gmail.com> wrote:

>>  /// An object that can become inaccessible at runtime.
>> @@ -65,7 +73,7 @@
>>  /// ```
>>  #[pin_data(PinnedDrop)]
>>  pub struct Revocable<T> {
>> -    is_available: AtomicBool,
>> +    is_available: Atomic<bool>,
>>      #[pin]
>>      data: Opaque<T>,
> 
> I actually think we should use Atomic<i32> instead of Atomic<bool> here,
> because in most of the cases `T` is a aligned to at least 4-bytes (e.g.
> Devres uses a Revocable<IoMem>) And in that case, using Atomic<bool>
> doesn't save extra memory but makes the xchg() operation slower on
> architectures that don't support byte-wise RmW instructions (e.g.
> riscv).

I agree. Recent RISC-V support byte-wise swap instructions so this may
not appliy to them. Among the architectures currently supporting Rust,
perhaps only loongarch could have this issue.


> My rule of thumb for using Atomic<bool> is: when you really care about
> the memory usage, and you can guarantee using Atomic<bool> is saving
> memory. For a general "flag" usage, Atomic<bool> is not strictly better
> than Atomic<i32> in most cases imo.

I agree again.

Maybe we should provide an enum type with i32 representation to
express boolean values like Atomic<Flag>? That way, users could avoid
writing unsafe code:

unsafe impl AtomicType for Flag {
    type Repr = i32;
}

