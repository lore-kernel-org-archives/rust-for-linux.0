Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE2B247280
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767433139; cv=none; b=V0JPcAOadgHnXrR0wthOSsrnF/a1n2nKIpOYlCbDyuFxl3bdi4NeSnLOBxJ9chxI5iXt6AQyfdx1uIidgVLisWMydcxYyrbD80i/JgQRNCZwDoaiK4lh7QAI7Eecf1VbpCGya4ZqP2ZifvestsXXlRj/FruY9IRh35igurWZLQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767433139; c=relaxed/simple;
	bh=Dtt4aJ26HXwBmhMnWkq0hwyR+YEk0yHCIxEHQdowN+E=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Yqd7L6aO81nqyZUk9pKkAhzhc7jRpuT3h4vSXk5eM/oLf3crd2DUZVraM81M974EZsV08k/1FTgvrUhYrk6xobDW0saVpB7xnr7AzXOfOZpPaELXB6arem1Pd9OTNaVsZag4otiCC5KmLGrOS5iXosaIYqpAc2NFvYN8z8/i7Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nF76AE3h; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nF76AE3h"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0bb2f093aso127417795ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 01:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767433137; x=1768037937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnEzSME5ZEreqaDKGDnfwcRFUr116aaSg6xWn/3qmRk=;
        b=nF76AE3h/AIs2eKzrLwoog0WVqcwbUFPJd+V0CcvuEHxGxW3VNOPwMrMMPy6U1SYN/
         QiZ2ztHwr1CGBtikIG1Hc9oyZQRVpUmwc8ZF9WVW95pVkVlnebNvP3ayeFmcHT2mHqHR
         0nw1fPrrYbxCmBkDR5xjcyDn8GNSRuhGcK1M8Z6P6x4+olMwnd2z76WUYYK9YhwwwbLm
         LNUvv+jF6TswZRG9DgaFQ+bbuT3eWf1KsqlWU3L97qHmWj2lg5QA9WguykHSWELSVmv5
         ES8GZ6k7XVcUn/lFxHsYLQv6QExBd0Kg2r6eol0ZZ7vtfQtOOgB/Fd6EKISWQzGkPpIr
         SFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767433137; x=1768037937;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnEzSME5ZEreqaDKGDnfwcRFUr116aaSg6xWn/3qmRk=;
        b=KQ87xUZ5WraUNV6iPHhBsu6+wf/YAAi9xbMIdUvObDr/tlnDbZPd4CeYmJrSRc1s8j
         w6sMSOHtWe9vbsCJHr72NMnb7n5WpGjyzWQpYMoHMKPZSRVt68OIm9lAT52stQINLZIQ
         MiycP1EB78axrej4WepKreoHMMkAF72gA22IfJnUv7xsisgQHplIVlZsbpCBY7WWz0mF
         yQ4dSwIupOunadyM+Qq0zxYh75I/PRbLSCe8ZVc2C8HNZwe5GtTtoBkJDAMRFETRQfQE
         5WKJhPB37nTXJ7y0huSQxe+Z0nfale4kfz+Y1S2UiJng3+axHJtsZS5Sg5cyAj1hP8CZ
         VhtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU51iHiqu8sRTJdrVX2uJc9CuSRDzQ9DLsxNT9bgC2auCFV3f+kqCvOOMnm276MxlG3O4jW9n32MKwROdXHxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwihGQztqfSfqu2zdm9M7GqJuG4z1xNBQBN35YpOp9rt/XWPbQm
	UFumscG3BS2VLs8R09u1w+ays97gIpnlX0MavVKitwqMgdoqstkdo71X
X-Gm-Gg: AY/fxX5bo7BLPF7T0+Ujp212gNzU4ryybt1Bv2pOOvw3iYPCu4/0lbT574t54nAyOwu
	g1RErnzWhWQTDGEfS3kzf+8weh5o7RfxhSaPw78wvdllrAsB0OOuIbpNezyKwV7YSeA9AGP2TeF
	NIXWgBFEGCl3ov9eBSH6qL2q2YOIZ8azcaaV3iN1wWuWheuSWEhXju2sEq108EzCXk318XxDA5U
	FCPo8kPHz83hgdy+Yv2IHRDNskxG0L9Uy09Nq4e9gD1D8Ew9cx6wHPJqfROe0EJJJpUG59Q3/pe
	dOj3b7o/k8k3yQ0vk5PkE3hSQGDGjzazn0BJQVMg9C1vZo7t1TvRIBDP5d9WSJOqAyU1pEkh4Ps
	SuiGgBmXqQEQPKN8rsAvNifZRHIJQOnc/V1hsR5caesKvrySmT8Pd2WmQ91Wg40XBud5JeIyWqI
	YwAkoc1x/14r3aUwqR6oKOZzyFYwVhlYas7+Kfmz/6DXD9J4wzHInhq2VBeo9fkMmio9ouFBl1z
	Uu5Og==
X-Google-Smtp-Source: AGHT+IFVoj1zaInphfyG61S0FoZSYJbN6U+tvCBtglTz7umstEc8FC7EApMR/z45+p+m8QqhppOdog==
X-Received: by 2002:a17:902:ef4c:b0:2a0:92a6:955 with SMTP id d9443c01a7336-2a2f2231751mr428866085ad.23.1767433137002;
        Sat, 03 Jan 2026 01:38:57 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82858sm395844055ad.29.2026.01.03.01.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 01:38:55 -0800 (PST)
Date: Sat, 03 Jan 2026 18:38:50 +0900 (JST)
Message-Id: <20260103.183850.1619235309184362207.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, tmgross@umich.edu,
 acourbot@nvidia.com, rust-for-linux@vger.kernel.org,
 linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add atomic bool support via
 i8 representation
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aVjKhRKg-05rjnTX@tardis-2.local>
References: <20260101034922.2020334-1-fujita.tomonori@gmail.com>
	<20260101034922.2020334-2-fujita.tomonori@gmail.com>
	<aVjKhRKg-05rjnTX@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sat, 3 Jan 2026 15:51:33 +0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Thu, Jan 01, 2026 at 12:49:21PM +0900, FUJITA Tomonori wrote:
>> Add `bool` support, `Atomic<bool>` by using `i8` as its underlying
>> representation.
>> 
>> Rust specifies that `bool` has size 1 and alignment 1 [1], so it
>> matches `i8` on layout; keep `static_assert!()` checks to enforce this
>> assumption at build time.
>> 
>> Link: https://doc.rust-lang.org/reference/types/boolean.html [1]
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/sync/atomic/internal.rs  |  1 +
>>  rust/kernel/sync/atomic/predefine.rs | 11 +++++++++++
>>  2 files changed, 12 insertions(+)
>> 
>> diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
>> index 0dac58bca2b3..31ac4c83b1a5 100644
>> --- a/rust/kernel/sync/atomic/internal.rs
>> +++ b/rust/kernel/sync/atomic/internal.rs
>> @@ -16,6 +16,7 @@ pub trait Sealed {}
>>  // The C side supports atomic primitives only for `i32` and `i64` (`atomic_t` and `atomic64_t`),
>>  // while the Rust side also layers provides atomic support for `i8` and `i16`
>>  // on top of lower-level C primitives.
>> +impl private::Sealed for bool {}
> 
> This line is not needed since bool doesn't need to an AtomicImpl.

Oops, you are right.

Thanks!
