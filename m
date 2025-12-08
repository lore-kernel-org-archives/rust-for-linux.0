Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579E71B983F
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Dec 2025 21:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231006; cv=none; b=Z5ZGmByk//fYT4SmRJKDzWAMzFiGQ2SueGQfU+2tmvhj5XM4GB0NIbU0E3S36kCseiPM/3vkrPJM7KED7JzXssZwcOfzGAIZsU/x/ynWpYElRznjY0QoXiDyAgEeS23FIJzSsN3vlqdcYUMOEjHHHOR/k+zHTB2UooKlevlTNdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231006; c=relaxed/simple;
	bh=zcEmJge43qc6diYing4j/CPMIn8o3s5fu/cHGKIw5D8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bdo5ZRmMik5K/tYNaY4qjFTkvr1v7AuLegbC/yxnmrMDvkPpFsjvV7fH/6E+vNXid5NTKKRPNIF/I5ZQTVn8ulbrD4AD48G7xau/of05NcRsF03VriFOXbws3Fjx4ZG8J2/T8DAwtNEQE8PKslY1i5fA+GBNiE/d/Xm1x0LkhJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1inZxV6; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1inZxV6"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7ba49f92362so2722544b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Dec 2025 13:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765231004; x=1765835804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdfW6RgR1PcfYG4CkIDQLcy+617j9bQJpQVrv2aFxu0=;
        b=J1inZxV6TztA5AwlU7OU1Xhu3RCxhgtpRaujVXweSID1FzSOWfi8yl+IIMoGT3ngez
         5AnRjXlrzPB0wMAPgjsXDcIqKOG8+0E+G7Kiusd7/Yh3FgjtnfAf3bod3aYIB+qONSe2
         4lhh+LFSl8UvAaNl+l1UTlTUaChyvdTxzNBwcQ5qPqeJNiiLmBkNq5njpDerVtZxtmE+
         3SV1PfhYo9GGzHJ2bGqO5ey4UGbMYsUM4upQD4Z+tg9F/86CvM+DAv9rYizmtyJ64BKQ
         wOqh//4ZrWmXx2qnnHAJFdgk1lxadNO4g/oTlnWyVqkmYbLrDZIYggdqPpEmrBfZQ93/
         2SUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765231004; x=1765835804;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdfW6RgR1PcfYG4CkIDQLcy+617j9bQJpQVrv2aFxu0=;
        b=upV8+CpzVOs7TL4oYBXHMMH4hDu1rfUr4kX3LTaAv+R/0mguJMjCazSGrM7O6iQIhw
         YdTuu6eGGLRF1vmAAxKovkneDBRTQC7w/JeH9ilR7VWwRnGI6arivWb7x3edetD4ManE
         EnFp1xwn/bMvm39/tK4fXV8Z4GVHoYKoO7a1z80xi6OFVD4sQS/lbYucJaDXpmSBgZyb
         aIf/x9eNhbJ/I1lq6wTdUBs485pZICUnc2Lcaz2jv/mTf+xjyF2E/bzn+cNt+B/JwyvY
         05zf0LjJ9H+NXuveP6Prs0Q9scG3fDzcMQOllCED2lsidd35w2LvKeu/mOInCb+AnXYj
         g/vA==
X-Forwarded-Encrypted: i=1; AJvYcCUvBI7680Rc5pts5rOUeIRe7cG9CakPPXAQEgosJRToVkZCtCFt3q7+cCT/sg4INWrl/mGPF2ZmF698EZ5vmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGy+n1CAq4Jh+Wlz1Z/gn9zicMkQ2WiHNe9PwnQ6AlQ0ii4gxK
	QQaN8cqLVIK0fIkpzXMwUaHCob14NFG7R2FSAEJHeNTJnzrbQ+KYwMDj
X-Gm-Gg: ASbGncuSksAUvjkY6AZiWTnRIlyM0veIae2l/1tHnYZ2m38AuJ02hG0ABEnRUfLzJpO
	5Ksbw1pLt23UkKOSRGlfwEdG1OjpFnase8V8A5kbmbvXFDaD4YRh1TlH2wOPJce9PaBT0F09aKY
	0qhZY8ixYZiN7hXaw+ixvmgNtUfDxbYJUNvZSR3Z0MiMuupFjDKCHHVIEbQ/YCS0QUdvBPh1J6Y
	iUkd9Jp5VC0sQqlMlBylGU2XX24T0rW2HWJ35dL64UdN824VmVgJIZecIEAChvz9J/Dxyw9+S/N
	WOpDGXZeh3R6AbLbgBCmrzPIh0yCimB1lMDHt8tzxs4cMQqatxSZRYEIFDNpfxg46uEuO6cyFsN
	1wvhrw4SVSQ9vxaTa1gqUOdRPMhmDJTg6LLtf2QTkI1vFc0Am7VyGMtUCS9QXXsCdTbe3+Baien
	saaxWfXGF+PhcDfGC1hz5Y8FOSSd0X4qmaTqZY6yvq8WgEPQ2GTm8s8awT5aH9XeJLAg==
X-Google-Smtp-Source: AGHT+IFP/boNOqYDoXkU3RIkdRKIrnpb51NMsdoJdtT2VzPhVZ9CaG1ghjWJtI8S7+dPdzyX8TNyow==
X-Received: by 2002:a05:6a00:130b:b0:7e8:3fcb:9b06 with SMTP id d2e1a72fcca58-7f03dcac664mr755773b3a.28.1765231004516;
        Mon, 08 Dec 2025 13:56:44 -0800 (PST)
Received: from localhost (p4783053-ipxg23301hodogaya.kanagawa.ocn.ne.jp. [153.209.99.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a081587esm13936902b3a.27.2025.12.08.13.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 13:56:44 -0800 (PST)
Date: Tue, 09 Dec 2025 06:56:27 +0900 (JST)
Message-Id: <20251209.065627.1182423847170566963.fujita.tomonori@gmail.com>
To: acourbot@nvidia.com, boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org,
 peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v2 1/4] rust: sync: Add i8/i16
 atomic_load_acquire/atomic_store_release helpers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <DESI0L685D0M.1NP1X7KGIDJEW@nvidia.com>
References: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
	<20251117001035.4068507-2-fujita.tomonori@gmail.com>
	<DESI0L685D0M.1NP1X7KGIDJEW@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Thanks for the review!

On Mon, 08 Dec 2025 12:01:12 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

> On Mon Nov 17, 2025 at 9:10 AM JST, FUJITA Tomonori wrote:
>> Add helper functions to expose smp_load_acquire() and
>> smp_store_release() for i8 and i16 types.
>>
>> The smp_load_acquire() and smp_store_release() macros require type
>> information (sizeof) to generate appropriate architecture-specific
>> memory ordering instructions. Therefore, separate helper functions are
>> needed for each type size.
>>
>> These helpers will be used by the upcoming Atomic<i8> and Atomic<i16>
>> implementation to provide proper Acquire/Release semantics across all
>> architectures.
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/helpers/atomic_ext.c | 23 +++++++++++++++++++++++
>>  rust/helpers/helpers.c    |  1 +
>>  2 files changed, 24 insertions(+)
>>  create mode 100644 rust/helpers/atomic_ext.c
> 
> Why not add these to `rust/helpers/atomic.c`?

https://lore.kernel.org/rust-for-linux/20251115050305.3872412-1-fujita.tomonori@gmail.com/

I split them into atomic_ext.c because Boqun specifically asked me to
keep the new helpers separate. My understanding is that these helpers
expose different symbol names than their C counterparts, so he
preferred to isolate them from the existing ones.

>> diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
>> new file mode 100644
>> index 000000000000..d05f6f7ba10c
>> --- /dev/null
>> +++ b/rust/helpers/atomic_ext.c
>> @@ -0,0 +1,23 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <asm/barrier.h>
>> +
>> +s8 rust_helper_atomic_i8_load_acquire(s8 *ptr)
> 
> I guess you will want to prefix these with `__rust_helper` in the next
> revision.

Ah, you are right. I will add it in v3.
