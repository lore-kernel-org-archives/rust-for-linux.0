Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E8F2DE6E9
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 21:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760649196; cv=none; b=XUWv1qSayhPQegSLUm/aFtHdn7PhkwSBP5pV1bxtqhbctuhQsnlxvgQIv0z1RpMqKuvHyRNjL5avSD8QEbxKi9vcx2+7qGpSKSLkPuKIn8gpbJVXhvOiwCnrjF/RrvhMkFZRsk/qjyUfYiHYRPQBgXT1CPH8Bw/QfMhrTq80LXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760649196; c=relaxed/simple;
	bh=qNBlNBSdH2eGWHunmbbGqoCYPRw4QiXEAX4o8mPtPpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChUFWjSRuPerJcvJDQSvLlI3bdni3pegxj0gAe9hQDnL7SuCKovdmfnwcz2oo75b9UI5W2iOoo9zIYOJzCPXazDwDOZW+TopHnCPRysLpwHJVvZvnBtQeoDdBuKJ1Mev36Ju8LPhHsMJ8jYoFWxbP86yLxIe5wshUB3T9FYRqr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxI0vA5g; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxI0vA5g"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso1431008f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 14:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760649193; x=1761253993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7dC9s7DUHDfq+JM4myzAQqHd029NncsnmY1lMtLvU4=;
        b=OxI0vA5gV1yiZiNhlPDh5o1GbFsyDLcwhK0yR9l9hjB73LoeVLBf5SZggK2vOmDAYh
         kym2hDXC6roA2s/jFXGu/ZSAmCr3oac4VMPEY3M1L5jIj9uslSbRNJs6317Wx499zykk
         GEnk9kHdcJWcKlFU6ulN6rQQuMQVKsMggBOueLGJrcrBFRz8lEg8onV6EAKuIGv0PKbY
         s2G4RdgJbM+MHdZLYuevUrFXlLb0NLfB7UfZhq5XGauYqS53vdgflBiTWhF+4XPngREm
         FWI6q+DDx40Wguu+nHNoV9L/j2EcLYCfT5kNbUjZYMNjOfX0VHHVM2D2V7Wc7ZOTI/nt
         tIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760649193; x=1761253993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7dC9s7DUHDfq+JM4myzAQqHd029NncsnmY1lMtLvU4=;
        b=buvmqB1ID8fQQOGaNOOxkkJQiIaoS6jZzqAEUBTHEkrpW2RM/ubRRasDqQrEYEPjAf
         sJgPYJ5VNp7NhuovH/7c+4+Zp3G0UZfsdlxoeC7PC33p43B4IKI9CizozgplKz25bTOz
         jF5auqhWeDYkgdyK8KoCU1ArqJ54Q7kq//jruGqdVOGgeZ71pixZIL2FrjP77huNjenq
         vbvHjLltpnS4yShDlB0wGaUQC+ZGARZtsjZHLrUTTrssiidYFvL0rh58aZYy43mTDNdQ
         Bl7e65iSHGfDXOu3MPu65mZ4/zj3KsprKLyqAYqbPP/6u8Gi9n4kwtWNOnBoC+SwDGWl
         zRTw==
X-Forwarded-Encrypted: i=1; AJvYcCVjicevw5dD5M8VODdjzEaUJExd1Z/Kpy/K2TYJWMszBBJcmvTpDbtjWXHGr0p1DIFjeelZmLs0L+QpH3oK+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfKuBoFE4Zlui6X6Mp6FN8HnZSe1p6HriYbjAaMOBh49aV+Mp1
	UsIImai2P0LKStMzcchyydJgGB9PPnSCxU20eD+MeuqiyObHUHsxArkk
X-Gm-Gg: ASbGncvPBAXdBJKdI1Yd0pTSpZk3ZAqG/D3S9iejuSg8+JbUDcqDQMFsWOGAaS1k14d
	2DHeh7hniiVCQ8IrFkPWTLtc4TgsUJj3RRfPRe9bfwvqHNrjmkru79LpPcJlPmVeYllxyZInJk1
	FRapJFovwHmOebQ6UXIUlf/yXsyADfUb7iSPRPC/N1wHjbfYDCvydh3yqB1HewuL8ZEB+7HIgBh
	xbefA/p78mAVVkzbEy0Ausw/PxWXhC9nO8FCt/KAiNfrAqcOYo5Xw7Zf+y+HpL63V/EtrxI3JvB
	SGU+0vKjebKKsXkon7wNo3kM3uze6eugbOB0g1PVRAjMRMYOGS4sicO/1I2ugiSKHi0ylXc2CXp
	3Sm6qRCNiRKTHIgkrKgVZnLZ9ecZS28gox54X9PgrbhEaLe6zQDIQ3+XOTFFdUV/PWJrkvZg3R2
	6inrN5W9e042LlU3x4/Gl9LBt5uiTJ7jKJfaaEt5iMq4NPDq0D8KZ3QF6Mvqf66RtnoUAD27l/W
	1dnig==
X-Google-Smtp-Source: AGHT+IHKPJSTI0DmvT06VL4xwoZPAZid6jDY8psvVG06n9vCvu/0Q/oxZW5QmJcTU6PqNg2HD3zBYg==
X-Received: by 2002:a05:6000:41f7:b0:427:548:6e3b with SMTP id ffacd0b85a97d-42705486e44mr815017f8f.13.1760649192715;
        Thu, 16 Oct 2025 14:13:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08? ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf6b4sm37077374f8f.25.2025.10.16.14.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 14:13:12 -0700 (PDT)
Message-ID: <21944b18-ac36-4acd-9d36-cc05579acc0d@gmail.com>
Date: Thu, 16 Oct 2025 23:13:11 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Solve mentions of `CoherentAllocation`
 improvements [COHA]
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
 <409f2f03-2bc2-4cb8-9ca7-4e30f82077ff@kernel.org>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <409f2f03-2bc2-4cb8-9ca7-4e30f82077ff@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Danilo,

On 10/15/25 22:04, Danilo Krummrich wrote:
> Hi Daniel,
> 
> On 10/15/25 9:49 PM, Daniel del Castillo wrote:
>> This patch solves the existing mentions of COHA, a task
>> in the Nova task list about improving the `CoherentAllocation` API.
>> I confirmed by talking to Alexandre Courbot, that the reading/writing
>> methods in `CoherentAllocation` can never be safe, so
>> this patch doesn't actually change `CoherentAllocation`, but rather
>> tries to solve the existing references to [COHA].
> 
> This patch seems to address two different TODOs. Please split up the patch
> accordingly.

Sorry, I thought it was okay as they were part of the same task. Will do.

Thanks for the other comments as well, I'll apply them and send a new
version soon.

Cheers,
Daniel

