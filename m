Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB7177623
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Apr 2024 12:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712062392; cv=none; b=NxuafPmoI1YYy2QnDYQR2nK1NpT5jX/fhqZJdrfB72tfx3HK5dl8oavFrTF+Gn8+7xI9W4mP0chetuCOxtIghZKWkMTcQLiFhtLYUY/nIaaOWCFCy7FH3h55sg1lJGgDlEG3Bq9IoAPgfOjuPdmSPmMILbZ/6V2IXenb6q0m2uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712062392; c=relaxed/simple;
	bh=LPp1LoXc/iUZYcuArnYpygWNYI02olIHB5JtN31wm9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GQQfPjpDs4ffDtzqxRGNN33hew/Zbd/K/+i/ppbbUPqdvUS2RJhRR1nuJbkWeOVc5hkSlthTigsw4b9Iw8xWGR87CeHG0WQ3wOVMj/9alhJnRRv4UXgzmxvta+7N9cPUp2zBMOKjV3NlQ02PqZICLGyKiMbJB4xwZuCmX1EB2NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=o4c2yRDJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="o4c2yRDJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4156e5c1c7eso6427835e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Apr 2024 05:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1712062389; x=1712667189; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hvhw9LsqhxNzOOOcCfIt2sSk317Q3WM4yG9zmNorI5c=;
        b=o4c2yRDJgM3FdYuyKdOtPkrfHXHH1na/mQ97sp3uQABI3rP/3C4O/Rj15z0p87Weh/
         LWUS8CEbpCpQbI/BFouhOaeWciwdti4frjfPtQvfXRlgmhN60XeiyjOakE8vBLqglaLs
         TcObTXber3pmshpfrz46coJ4htxtYTihGX27qcSDP5kFw/dMm6kYWJ6XP1tsX5ILF1U0
         QmKAVskJuYGrA+BQYvzDRg9qCD/ZyqbsCjFXcREXrhz1d0lBQ6SKKQx8QtlVbcxfRhW5
         8O1bYnBxj+9hLWNyyDDtnTTf+ZbBOIaZJJBTQqqEFZWDMns5tYEsxiaHVPDSqP01i3I5
         xxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712062389; x=1712667189;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvhw9LsqhxNzOOOcCfIt2sSk317Q3WM4yG9zmNorI5c=;
        b=hjYmwJSoF2n8L/59oth4yTUHgpvL2JXjoz2bIhTwNwanXeD/TPcD2+2jJkq9R9zXlJ
         p1IehZi2Gj2h5KJY6tMmuMBb1CktK6Cix1d7QNowZUduLWktzKFqkjMjU2MjB24uZCow
         nSdbUMSNHbVE1AFYEgRtjWU3LZvMOWquAGhAddTmSF2pyNEWXhlR5dCZH218BbV8RMEx
         GLxmWBhZ7o3JdqJjRj7Dnucj6TjdFx3QGzkL8HrOhAWWTcw1syKC+1JdLOnm6nBU0cco
         ihUovCHYewRz2ehUrue9H1d+/ZLCezecRigJswk4L9xD+9h7nchiP1gyfyn1gJa/ra2v
         0BFw==
X-Forwarded-Encrypted: i=1; AJvYcCVwGz7Tp/TaGbBGbqUsEDklgZcEyODDZXl9cy8Gqs1oynXumZTHQE2wWUNuiEEESbRKA3oEuR6i1fTU+SdtayWJyy43lA30h9kSJp2NlJE=
X-Gm-Message-State: AOJu0YwffiCv7fcmP8Sle4dccfYsGJM2DCSpk0AG3YXXilFv90WXxhp+
	NNE0TFIFklLtKQq7S6NnqLvrO97OYlVWSY88UF2aNcSz/U9sWiTDDbzYG+hqjA4=
X-Google-Smtp-Source: AGHT+IEFz3AepeyAQxN36Z0IfK+JwdPVjtp4Sb8ReYgZAqLDYPFoVzfevNH+l3YXMt9M9NS/Rc5Www==
X-Received: by 2002:a05:600c:310f:b0:415:6bd7:96a0 with SMTP id g15-20020a05600c310f00b004156bd796a0mr3331124wmo.20.1712062388718;
        Tue, 02 Apr 2024 05:53:08 -0700 (PDT)
Received: from localhost ([147.161.155.112])
        by smtp.gmail.com with ESMTPSA id l20-20020a05600c1d1400b004146a304863sm21200277wms.34.2024.04.02.05.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 05:53:08 -0700 (PDT)
From: Andreas Hindborg <nmi@metaspace.dk>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Jens Axboe <axboe@kernel.dk>,  Christoph Hellwig <hch@lst.de>,  Keith
 Busch <kbusch@kernel.org>,  Damien Le Moal <Damien.LeMoal@wdc.com>,  Bart
 Van Assche <bvanassche@acm.org>,  Hannes Reinecke <hare@suse.de>,
  "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,  Andreas
 Hindborg <a.hindborg@samsung.com>,  Niklas Cassel <Niklas.Cassel@wdc.com>,
  Greg KH <gregkh@linuxfoundation.org>,  Matthew Wilcox
 <willy@infradead.org>,  Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor
 <alex.gaynor@gmail.com>,  Wedson Almeida Filho <wedsonaf@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Alice Ryhl <aliceryhl@google.com>,
  Chaitanya Kulkarni <chaitanyak@nvidia.com>,  Luis Chamberlain
 <mcgrof@kernel.org>,  Yexuan Yang <1182282462@bupt.edu.cn>,  Sergio
 =?utf-8?Q?Gonz=C3=A1lez?= Collado <sergio.collado@gmail.com>,  Joel
 Granados
 <j.granados@samsung.com>,  "Pankaj Raghav (Samsung)"
 <kernel@pankajraghav.com>,  Daniel Gomez <da.gomez@samsung.com>,  open
 list <linux-kernel@vger.kernel.org>,  "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>,  "lsf-pc@lists.linux-foundation.org"
 <lsf-pc@lists.linux-foundation.org>,  "gost.dev@samsung.com"
 <gost.dev@samsung.com>
Subject: Re: [RFC PATCH 3/5] rust: block: allow `hrtimer::Timer` in
 `RequestData`
In-Reply-To: <sHRsbsEAgQZOgBjItL1A-a1BOEGTeH4CWqZsrdny4vCI06o56pmKluCTbY_EwRDO1hCjEp9Cuq9_8S8Co2I9c8wquHWZH_KGjOpmbF1YiJc=@proton.me>
	(Benno Lossin's message of "Sat, 23 Mar 2024 10:51:57 +0000")
References: <20240313110515.70088-1-nmi@metaspace.dk>
	<20240313110515.70088-4-nmi@metaspace.dk>
	<sHRsbsEAgQZOgBjItL1A-a1BOEGTeH4CWqZsrdny4vCI06o56pmKluCTbY_EwRDO1hCjEp9Cuq9_8S8Co2I9c8wquHWZH_KGjOpmbF1YiJc=@proton.me>
User-Agent: mu4e 1.12.0; emacs 29.2
Date: Tue, 02 Apr 2024 14:43:51 +0200
Message-ID: <87sf043pfc.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Benno Lossin <benno.lossin@proton.me> writes:

> On 3/13/24 12:05, Andreas Hindborg wrote:> From: Andreas Hindborg <a.hindborg@samsung.com>
>> 
>> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
>> ---
>>   rust/kernel/block/mq/request.rs | 67 ++++++++++++++++++++++++++++++++-
>>   1 file changed, 66 insertions(+), 1 deletion(-)
>> 
>> diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
>> index cccffde45981..8b7f08f894be 100644
>> --- a/rust/kernel/block/mq/request.rs
>> +++ b/rust/kernel/block/mq/request.rs
>> @@ -4,13 +4,16 @@
>>   //!
>>   //! C header: [`include/linux/blk-mq.h`](srctree/include/linux/blk-mq.h)
>> 
>> +use kernel::hrtimer::RawTimer;
>> +
>>   use crate::{
>>       bindings,
>>       block::mq::Operations,
>>       error::{Error, Result},
>> +    hrtimer::{HasTimer, TimerCallback},
>>       types::{ARef, AlwaysRefCounted, Opaque},
>>   };
>> -use core::{ffi::c_void, marker::PhantomData, ops::Deref};
>> +use core::{ffi::c_void, marker::PhantomData, ops::Deref, ptr::NonNull};
>> 
>>   use crate::block::bio::Bio;
>>   use crate::block::bio::BioIterator;
>> @@ -175,6 +178,68 @@ fn deref(&self) -> &Self::Target {
>>       }
>>   }
>> 
>> +impl<T> RawTimer for RequestDataRef<T>
>> +where
>> +    T: Operations,
>> +    T::RequestData: HasTimer<T::RequestData>,
>> +    T::RequestData: Sync,
>> +{
>> +    fn schedule(self, expires: u64) {
>> +        let self_ptr = self.deref() as *const T::RequestData;
>> +        core::mem::forget(self);
>> +
>> +        // SAFETY: `self_ptr` is a valid pointer to a `T::RequestData`
>> +        let timer_ptr = unsafe { T::RequestData::raw_get_timer(self_ptr) };
>> +
>> +        // `Timer` is `repr(transparent)`
>> +        let c_timer_ptr = timer_ptr.cast::<bindings::hrtimer>();
>> +
>> +        // Schedule the timer - if it is already scheduled it is removed and
>> +        // inserted
>> +
>> +        // SAFETY: c_timer_ptr points to a valid hrtimer instance that was
>> +        // initialized by `hrtimer_init`
>> +        unsafe {
>> +            bindings::hrtimer_start_range_ns(
>> +                c_timer_ptr as *mut _,
>> +                expires as i64,
>> +                0,
>> +                bindings::hrtimer_mode_HRTIMER_MODE_REL,
>> +            );
>> +        }
>> +    }
>> +}
>> +
>> +impl<T> kernel::hrtimer::RawTimerCallback for RequestDataRef<T>
>> +where
>> +    T: Operations,
>> +    T: Sync,
>
> Why is this needed? Shouldn't this be `T::RequestData: Sync`?
>
> Is the `run` function below executed on a different thread compared to
> the `schedule` function above?
> If yes, then `T::RequestData` probably also needs to be `Send`.
> You also would need to adjust the bounds in the impl above.

It's a typo, thanks for spotting. It should be `T::RequestData: Sync`.

BR Andreas
