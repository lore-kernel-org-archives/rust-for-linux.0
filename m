Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404A72D239A
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 16:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765901727; cv=none; b=c7E3XjuJTfUvrh5C46UvKI43aYW3PoVOV6KTLyEiVOU6M26EAsNZpPVDFjCQLfeVMqIoDM0ZuWWp6HuJMx0kmg1SOzVeY1ekm95/dw2cm7u5vPR69tiCB/lvCD5AFZmOijzeRvnhFhDyXo2l6b2OzdL+Mk7Z9KoZlDPkPAstYcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765901727; c=relaxed/simple;
	bh=a5UBlHHrvRTS3JC+zn/qQntr9gldXEwvmgrGRyb+jcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGggaLda/JiXrIRPS5IFk+bm/vE6dcPTjsv6o2ntHY/V/0oUcOIaJxjPgD63i4JCPEhGf4h9s6iLX2P9dtHegafUVbM5bKZYRK6ruUpNJZqD1K8PM8puM0gw81v/pC6ldKnURqfEppRunyYtgHz9cHJ0szRxRtmR8sBlnn0hW/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRyh5C0J; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRyh5C0J"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47a80d4a065so30024875e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 08:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765901721; x=1766506521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WGSPO6qsmI9NuF2qc7Ml/qVSMOQyrqO1n4RFIIjYNR4=;
        b=BRyh5C0JjamfLcjDm6Fus4ghMqCvP1zroJDca71nCnA5mWTa4yqSUbbosT5ZA/VeDa
         PvCW3AnsgxOoi/3hj5ojfcQOBlQUjxo/RKVSRMmSg04X9VgIxCCFLoypLVcYe9D1V8pT
         SDPqFqBuNxo42eEoMQI07qYfNoyiun/VkxXF6kdql5RrdsQwCR69Mz2/9d7YGCyvJ56O
         zAq0HmCNtb2P88MRo4fK/zbi0eQFAoFu0L0u71Au7DMPHXvXov5kPZQqw1XjhhGOWcET
         VFL0xd1Z1nK8dsZ5tKj50DN0DoT+Vl6Rp6BC5e8h4IKaDCNcBVTIG+aTC3G3r/Vonuy8
         o0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765901721; x=1766506521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGSPO6qsmI9NuF2qc7Ml/qVSMOQyrqO1n4RFIIjYNR4=;
        b=rFzSP4StpJruQpAdQP0y6KJQlc7L8cyB9pFHxZRIk27Xp7adeVpfurug0Mxxrl+9Jh
         UNrJq70ldBmCJbZuH+BRNCD+qZfOZtUvGbUHAGLGR5rz5MUZrQHEqIt5AcqCJZ6TAbBL
         t5EpiHagmVDXSlhPZpTGQMQEBoLSWxyoLS0ZB7c+N/fUIghhY9xRU0kjfW6yRL1yIcvp
         pt3VCs2w5bh42Zc5AIT2DJGsdIV6xWDTbSmOZrsU3pSZCmIOxuS9qOKysiPJpTOJL0QW
         9rDQGYXyM9lAaHHHZ9E395QTx/Ss7TTiYeXNU8kQqTfmcJubALAPXGHyuF4cW7pN0rhK
         J5Qg==
X-Forwarded-Encrypted: i=1; AJvYcCW9Kqp2/E4UoSKbOPn6EkJcMfPAhW6viehLmijQVFJBkbYMOPAjMvrpu4L8dxdd9H3cLR75KNXUXoRjZ2P0xA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0oEzgBuyP9KuyBBhPwLS2N0NdWch87k1xjUYYGTS/BawmEoS7
	Dy5zPlmyyiWujd4H6/AL6KYvYmQIUNplL3nUHQ1UKMUtrvRuX19ENMKRuixoFB6n
X-Gm-Gg: AY/fxX7Y727xtoxC6k58DARQjguB8f5DeREb0CewmdrTztKG1GnH/9ZrXGuSEE2Xaoo
	HRZbUQEqbvrNK6CKHoFSUbv7vs/qjHlU0Mb1L+4HcKehrY4ze0eZ+5GBBuRz6mbOWKmJUqc3pY6
	EiHC0l5AedlWgXuKzTceJclGRu4pnHVtj3rjdi4VYZhhPeHNUEy5/XDPCJ+a5tMtOC713UwgrNJ
	PIDd2znTDOqxZHe3kTIROp33oLT+3k/e9RbGzrT5h98rZD7YcsIy1J+e25G93JkwDKs1nbglzbc
	qpWR+KLuGzoAynb6bf1MGLnbg9ATsg9kRwUBf6ssnPQIpS9prWfaMfDomtMfp2kZnbQzTk4hyb/
	DZ/Uh/WxQoInENvO0W+RG9+iWiKsGrjmm7kqkpE/ocXxn4A56f3rAyAjQ8HMfpwHWAE2eQyGbPf
	QycZaNqP8os9YOe7n6SUVeyu4TiOXgEkGIcGGszcpaAzybCAmgkEMobC3Ohrot7mL2Lgg5dH/I9
	wppa3x8dy7jt9S2z7KHuwBeHgsIJKZsxFwnI71ak6MlmrI3JEkT3fgu
X-Google-Smtp-Source: AGHT+IGr5ud2LIyQ7R5OT/mlluw/76ko5OMRE3Aw6kFibrC+GBg5HKX0chI47WgVgI9wSkSsz4vtzA==
X-Received: by 2002:a05:600c:19c6:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-47a8f90598emr149262615e9.18.1765901720666;
        Tue, 16 Dec 2025 08:15:20 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:ef47:e8b9:f11f:76be? (p200300dfbf2de300ef47e8b9f11f76be.dip0.t-ipconnect.de. [2003:df:bf2d:e300:ef47:e8b9:f11f:76be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f3240fasm256044245e9.0.2025.12.16.08.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 08:15:20 -0800 (PST)
Message-ID: <08d00540-9de9-43a5-9e36-df2d575b4c24@gmail.com>
Date: Tue, 16 Dec 2025 17:15:18 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 12/17] rust: sync: lock/global: Rename B to G in trait
 bounds
To: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Cc: Boqun Feng <boqun.feng@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
References: <20251215175806.102713-1-lyude@redhat.com>
 <20251215175806.102713-13-lyude@redhat.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251215175806.102713-13-lyude@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.25 18:57, Lyude Paul wrote:
> Due to the introduction of Backend::BackendInContext, if we want to be able
> support Lock types with a Context we need to be able to handle the fact
> that the Backend for a returned Guard may not exactly match the Backend for
> the lock. Before we add this though, rename B to G in all of our trait
> bounds to make sure things don't become more difficult to understand once
> we add a Backend bound.
> 
> There should be no functional changes in this patch.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/sync/atomic.rs      |  2 +-
>  rust/kernel/sync/lock/global.rs | 58 ++++++++++++++++-----------------
>  2 files changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index 3afc376be42d9..c07a53f8360b4 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs
> @@ -21,8 +21,8 @@
>  mod predefine;
>  
>  pub use internal::AtomicImpl;
> -pub use ordering::{Acquire, Full, Relaxed, Release};
>  pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
> +pub use ordering::{Acquire, Full, Relaxed, Release};

Just fyi, there is a (trivial) conflict of this with Miguel's recently
merged

commit 309e49039f124a ("rust: sync: atomic: separate import "blocks"")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/rust/kernel/sync/atomic.rs?id=309e49039f124a9dcb99c05651af8eb8fa05bc29

If I haven't missed anything this is just to fix the alphabetical
order? So maybe this should go as an independent patch like Miguel's one?

Dirk
