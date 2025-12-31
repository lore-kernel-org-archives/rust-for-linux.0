Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7345430BF5D
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 10:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767177248; cv=none; b=cEm4vrdgraeMUZY8hahVUV3wcCvr2rxo6feslRx2FgV5tAM5rSOWOpkhfLKQAqrmReMlqXggmm6axF13YVwPIkQY5kfzCFwCU0kylSJHBpis56cX/U6dRQWAaWXEFQJJyLuLG2mPKUT7zflk9tX+YFEgkeSaThCaOlieOkNcU+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767177248; c=relaxed/simple;
	bh=p69uzqmVEd3uNCgj5/wVn23szrECYvR7RuDbWcSuvCI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ucIhb73svwZeLMN+iI/M4/BgOw0sGjNJujR6qIf0+i9UpCoGeGbylUTtkH1DFWH1T7+2d/RpytOdZhhateKu/KEGQgwCYRcN2GlJSq5Ctc5MSPpyzcF2pPZbGMelFWbz16/R/ZmUdRgUS9w2mEgAg1PijMArno7vPQvDMmeNxls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xm1OhWWc; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xm1OhWWc"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a09757004cso137223315ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 02:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767177246; x=1767782046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lgktZ5+IAVGrTI7e1MhCEPMbI2Q8oMgyGReWK5JGMQ=;
        b=Xm1OhWWcOSukJCvklhnZdPMGhg0L3jNWAPiDgLhVZmxkIf+oQiUf83eNWUkaM4KXai
         vAG3KrP/LJr+8J5oDtCP9EN92rotdyRG+HXU46VvDEv0CbFrEzcFbcwFaOyo5nR6NSmo
         ESe1s9zchif6NCcFHBkFxJ+e2c6zr+fmsKoB9WoBm2g1549SiY32ZZS5SNrVrzFyZJaV
         CpoOVL9pzACvNBTwQcVrzoFWHCcpubNLRDaoWODZXeKkOp7Xj94trZXprlTKvy/co0kt
         l9A7FW68zW+VdfnJ4HrcILxu8jBz8lnmrlg2MpDsEur6FJ41oJFku7W104YA67pz72nj
         aWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767177246; x=1767782046;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lgktZ5+IAVGrTI7e1MhCEPMbI2Q8oMgyGReWK5JGMQ=;
        b=Mg/NI/4hJKn0VaHTh2hOOMemm9Sx9c3Kxh/kyXXyxeFqA58W2i669y/NMnYpWm9vLI
         oeRzbf6jXn1Mv9n3q5b8T6FTRIxO5HhZwARBsxfufzHWNTau1/EDzlEnulabt6LJM+cN
         DRvRvgL5W0qiI/UYKeK7PKvasUKXSRx/uHTLnA6mjLnVSqGYI2jIyw4993n1YSNRVrjs
         /xv8355BUtH7IJ3KJc8qWqqzSN63G4y/N4z7awbPnuxIeY/JlApQOwV7azZmckj5H5yF
         E4kZPJBE06eAbW5UUeappNRx65u2LNN3oJ4m5r/UurCk3n47Kw0fCdEpml1pdKNeYKFY
         CX6g==
X-Forwarded-Encrypted: i=1; AJvYcCUKi1Gbh9BJYhf8HPz/8vhePi14mhdcPofv09PGUrQ5lAWi20cYYW7ZUAf4M48PRI91nP+kyJkPYbD3zkV+ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfBPd+9lo2Bat19CioC6Ulc9vO/CnJuNJ5cHnF4wtrC1/IUQoY
	qejnGuTSY/uOGO/gQrzDDzM+C8xZSRu0qG5pAD3+Nf42ibWcDV4v5gFq
X-Gm-Gg: AY/fxX6VwCBZS8ugJERv//5cBUMVX84dEBTrP5DJrDXlorbVWmfZfi+kXzApnK+C5+t
	50LlkmOvVfN0B9YmTHgDK2Yiv8o30ePzCYfSczRnjzMnMQFgXXLdRQdsxjvfgRKg4asGvbtxV+i
	aGflrLmi2DvHuLzubG/+fztGIUJP5P9BO0MVvotXiySpI/Coj8D3XdcqKakVLmV7racjrB6u+cz
	ti7YtUdG5F1dUtMkdWnl5/4klTZoJfmzNDfma2fwPXygr/qR6mBr+mmD70lI5w1HlGmEUYhiXHK
	bbCl1oQxVNtU2n5pbvV3cwiG6jxP0mg617b/P7ygaP5ek7bhgptjnt+HFbBF6OYBFohjE1Ka4tw
	6zbu8msGJjc8zFxDq78AQs70lnhdSSiNqEvdI+EiaVsR2kk7kx4j5+pBAMxAicfFN2MPp0uazE+
	wXf+7ltBgL1Sk18qo+d+xOfGdHmfysMC8A88OaooeTgMrZxKMffBEFCGQmHBWzliRFS1I=
X-Google-Smtp-Source: AGHT+IEwcS0kCWZu49XdLBnl5PJ+IxQX1qqNA+3wCQ8pJdeSxrew/ZcH5ZFbADLH2TxD52LAqYS4Tg==
X-Received: by 2002:a17:903:4b30:b0:2a0:9411:e8bb with SMTP id d9443c01a7336-2a2f2c5e633mr278948005ad.60.1767177245623;
        Wed, 31 Dec 2025 02:34:05 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c65d66sm319896645ad.20.2025.12.31.02.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:34:05 -0800 (PST)
Date: Wed, 31 Dec 2025 19:33:50 +0900 (JST)
Message-Id: <20251231.193350.1250626273632044119.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: boqun.feng@gmail.com, fujita.tomonori@gmail.com, arve@android.com,
 brauner@kernel.org, cmllamas@google.com, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tkjos@android.com, a.hindborg@kernel.org,
 bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
 lossin@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1 1/3] rust: revocable: Switch to kernel::sync atomic
 primitives
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aVT296MBoaSzYqAd@google.com>
References: <20251230093718.1852322-2-fujita.tomonori@gmail.com>
	<aVRgTQWhqjKB6xpK@tardis-2.local>
	<aVT296MBoaSzYqAd@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 31 Dec 2025 10:12:07 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Wed, Dec 31, 2025 at 07:29:17AM +0800, Boqun Feng wrote:
>> On Tue, Dec 30, 2025 at 06:37:16PM +0900, FUJITA Tomonori wrote:
>> > Convert uses of `AtomicBool` to `Atomic<bool>`.
>> > 
>> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> > ---
>> >  rust/kernel/revocable.rs | 24 ++++++++++++++++--------
>> >  1 file changed, 16 insertions(+), 8 deletions(-)
>> > 
>> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
>> > index 0f4ae673256d..47cd2b45eada 100644
>> > --- a/rust/kernel/revocable.rs
>> > +++ b/rust/kernel/revocable.rs
>> > @@ -7,12 +7,20 @@
>> >  
>> >  use pin_init::Wrapper;
>> >  
>> > -use crate::{bindings, prelude::*, sync::rcu, types::Opaque};
>> > +use crate::{
>> > +    bindings,
>> > +    prelude::*,
>> > +    sync::atomic::{
>> > +        ordering::Relaxed,
>> > +        Atomic, //
>> > +    },
>> > +    sync::rcu,
>> > +    types::Opaque, //
>> > +};
>> >  use core::{
>> >      marker::PhantomData,
>> >      ops::Deref,
>> > -    ptr::drop_in_place,
>> > -    sync::atomic::{AtomicBool, Ordering},
>> > +    ptr::drop_in_place, //
>> >  };
>> >  
>> >  /// An object that can become inaccessible at runtime.
>> > @@ -65,7 +73,7 @@
>> >  /// ```
>> >  #[pin_data(PinnedDrop)]
>> >  pub struct Revocable<T> {
>> > -    is_available: AtomicBool,
>> > +    is_available: Atomic<bool>,
>> >      #[pin]
>> >      data: Opaque<T>,
>> 
>> I actually think we should use Atomic<i32> instead of Atomic<bool> here,
>> because in most of the cases `T` is a aligned to at least 4-bytes (e.g.
>> Devres uses a Revocable<IoMem>) And in that case, using Atomic<bool>
>> doesn't save extra memory but makes the xchg() operation slower on
>> architectures that don't support byte-wise RmW instructions (e.g.
>> riscv).
>> 
>> My rule of thumb for using Atomic<bool> is: when you really care about
>> the memory usage, and you can guarantee using Atomic<bool> is saving
>> memory. For a general "flag" usage, Atomic<bool> is not strictly better
>> than Atomic<i32> in most cases imo.
> 
> In Binder I believe we only use load/store with Atomic<bool>. Does it
> matter in that case?

In the case of Binder, since it only use load and store with
Atomic<bool>, the performance issue with xchg doesn't apply.

The concern is specifically about atomic read-modify-write operations
like xchg and cmpxchg, not simple atomic loads or stores.
