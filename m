Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CA830F7FA
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765527007; cv=none; b=NnzjHSJ39dFN585BDMHABYBTpiwWpvSezyosXETj4tWnxVAs2BqbcOSGNZdguW8a/4Il/B1KYg6+PTjpTV2iBqNjRJxdIFU3SGfuJ/3I+Tf700A8sNJnmGZB46HY58modMez0lc6ksr3TDb6eUCghTq5Uczxx/0MlVpFcbQzZU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765527007; c=relaxed/simple;
	bh=262qMIy8XJN9qZOWBSgU77Hp+N4Ybxy66X0+OIv83b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HozVAnWb3beEtKaftT3oqT1f8ak3SlHH8MYMEiTZvS2kZj8CmVSRQwqvruk8qcf63CzBi/0m96orc8JUP4Xd5AJ4tqePP7hZfnXrCH61uUVf5A4TCz0gZakMv1dGrnyqWHYchLTei3YGbqZ4cb9dj8cX0c2FxsVUWc9E2FoZOsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZ+5hVV7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZ+5hVV7"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb3801f7eso216298f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 00:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765527004; x=1766131804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJ/CIq+S550sT8g8cfuPfmVxbEDEzZdlgJAf7FID7wY=;
        b=QZ+5hVV7lXV8OWt/rqUfe/EBbvCU3B+tJrxeuJsFvWD5qcwwenADk/o0prA65VYiMb
         S6EkcgCWrhnt3hBYCMbVjVGKfB6ah0ou9SA6V8weV9ua/oBBrQyF2bzudNHdnXeI53NO
         JByS2hBirW7GV+Dcn8Llyqfm74LLbMhOjI3UIkgyEO2q6rdg7LO3tjHm6yt7azdMIOSu
         AHJVm3EyMVVlBEn1el32AJJGbJMmo1x/FGXPrUFOKr9q5e9Tv0ovUt+trl7LI8nip3XF
         q8+mXkrKlRmvJaHMqiDwFwYyW9PJMXbVkTgsdcGK+oHUvsdgfmkM3YBBP8PVCjAO6Mnr
         e14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765527004; x=1766131804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJ/CIq+S550sT8g8cfuPfmVxbEDEzZdlgJAf7FID7wY=;
        b=v7DebI+To68wntqLf2Ac3/DX41Es+whah5PrdBs/Z/spA8B+AATIG076zzu6uQDSx8
         p64um0U0EZRcgBOBTA+zxHlcYNQVeDqgs0YI9C1j8vYEPfh8wP9An+JQfYA3HaWTx2ed
         QdCWh4nG93JZk5lTu6JH0VvnS49AxGQ8mv1K3w/ZDC30hLGwCL8xLeZd9HNLSwhLVXNz
         dwanBMGrjwxEDc/1elhsfj0a+4RUfNUYwcJRh5LoLeiq3BbFx+O2XsVdYpvFtf4EyCh+
         TC0roW+BJR8+UCAw4Lt1xKbwvNj7mdnHbaT9+H6ZCEreIEpmkO99MlX0G7iVlR+L8l02
         NRww==
X-Forwarded-Encrypted: i=1; AJvYcCXAkjL4vK+r3SiB3galckSEJ/dwqHSF7avZKh0UXOjU6WQJg+UNkqXizSt9M8h/p7HRpRMOmIGQHxFscxa8+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzfnRiZIiyakXHOwpcvwD/sSjDymnkSz3v33rusW6+qYnqSeNH
	NxM7CaEAVp7svip6p4Lv5uotk+zImv4aglItraP3+K8hj/bsv8qpv1Cy
X-Gm-Gg: AY/fxX6m/PNiniK303ErKHFWJR5zcBosluRQ1Hib2w+gusFL882PrJT/5gEcAPyoqrG
	MCw/sHsh5Ldq/FU0ehscvkLMz6mjc8fLik8g82sACxaQFxlEDqWujn5eIJT74ARW2fTN8Zh/Uaz
	9fk5ABh+mvw/6V1UuyQdZn30j8nEEP7g1ny1wO57f+QTK968igm0V9Exzq4VUjG0vQ4UwG8nUO8
	66/pk76gWndgh787IJl0oJwzOMewtkoVPKLCpBrx1/9eZ89S4qP0E9yBLvSk6LP1L5IGdYoFzyx
	DfCUlbFl4Zk8yWjDlgAsBqTGtJ7WPp0HZGccw5mu0bpcyPqnDzmJUyU1YkRpf7prMPWfV15wr2x
	e3j0EOQe3gq8iRogZK3haD5fAkE+t+NroIUBPNAMvfUFGLMA1fkuau5n/iWULlsJwNMhISsHXgm
	GtLwddTZGwNVo5HvfU0c19On1V7UBrYTah8+CwU36W+uiZIfgMxKyFyP3U2yvG8TUU19L//WI0D
	lfwXsCE6qsM5rKRia4E3b2pIN7VhdH6m99XHmajcEdkzA==
X-Google-Smtp-Source: AGHT+IGTJIGEa6611HGPyO7WCyo7XVD/0HX+3HAeJdXdjKMR+z9KB5y2eg2ivEwm/6LLYaeomx6J1Q==
X-Received: by 2002:a05:6000:4012:b0:42b:2f79:755e with SMTP id ffacd0b85a97d-42fb44d46b4mr1032448f8f.3.1765527003664;
        Fri, 12 Dec 2025 00:10:03 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:84fc:a859:31e5:6980? (p200300dfbf2de30084fca85931e56980.dip0.t-ipconnect.de. [2003:df:bf2d:e300:84fc:a859:31e5:6980])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b9b1f1sm10460373f8f.39.2025.12.12.00.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 00:10:03 -0800 (PST)
Message-ID: <25aa90a7-e9f4-471e-9d93-c61b9a7a429c@gmail.com>
Date: Fri, 12 Dec 2025 09:10:01 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
 <20251122-nova-fixes-v1-2-a91eafeed7b5@nvidia.com>
 <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.12.25 08:59, Joel Fernandes wrote:
> Hi Alex,
> 
>> On Nov 22, 2025, at 12:00 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>
>> ﻿The size of messages' payload is miscalculated, leading to extra data
>> passed to the message handler. While this is not a problem with our
>> current set of commands, others with a variable-length payload may
>> misbehave. Fix this.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> drivers/gpu/nova-core/gsp/cmdq.rs | 11 +++++++----
>> drivers/gpu/nova-core/gsp/fw.rs   |  2 +-
>> 2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
>> index 6f946d14868a..dab73377c526 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -588,21 +588,24 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
>>             header.length(),
>>         );
>>
>> +        // The length of the message that follows the header.
>> +        let msg_length = header.length() - size_of::<GspMsgElement>();
> 
> Is this immune to under flow without one of the checked subtraction wrappers? Either way, we should not tolerate the underflow I think. Which means it can panic when the rust overflow checks are enabled. Since the header length comes from firmware, this cannot be guaranteed to not underflow in the event of a malformed message.

Would this be a possible use case for the untrusted data proposal

https://lwn.net/Articles/1034603/

?

Cheers

Dirk
