Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5EC846F
	for <rust-for-linux@vger.kernel.org>; Sun,  2 Nov 2025 22:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762123794; cv=none; b=QlxZD/ReNJDc2MH9o2Q3qCR32w5y1ZmmCat1Ar8iKOPp55ayylXD2umXZBskQpHut55Ut4xhFmHWHGFsXXVrCCGIcEi7Eh62d912H1aPek+LGdIt2xGqfvAEJiTI9/aeU36c0OsRGQS6GK5FgCRGeVbr6mdZEewl0Z6yE1nbPmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762123794; c=relaxed/simple;
	bh=6i0tXaGpPRHI3y0fdNRPiXjwzY/va2gCum+8pnK6wqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8bCb06EMhWbr8f/2MQcFDMsT6YAuqkUhOWI5hyM9+Jm/2zobebLRHwF+hnH36DsyLZjHTwG+Fs8n1CCYQ4KrnK3tX8r+KK6QBWsCRK/GRFEx1edBPsxN61OUAwFvu1PzAcWu5eC9alaFOx6oPsR/DrKTWvp4gJtIH7GtCDEFuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gh7wwobb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gh7wwobb"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47721743fd0so20070875e9.2
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Nov 2025 14:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762123791; x=1762728591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxZfP1EgwtZ2tiYeqX+Jv36xFp2c8XGw5hNT53dpp4c=;
        b=gh7wwobbOnIbz661cXg6YCBqfSN6SWN1yGX76d6mtAV4Xx+8kmOV14XjHWvOMvOrsR
         csUcI+TtTuH9gYk7NHBHP3Fk/qo5Fm/Gvi7NUkfsx+BvGCFcpkF1smR7Z+hzfH+GlTn+
         ujrzjK/uqofSr90vc7qHitb+PJCQGrCoaD+Kx4wx6pGr/bGgYkGDhcG058iUQWXDf6xN
         BsKjnWxChIuLgshWuwmX/CuWseBkMTekZqNmkwzuPj1QudK3uSAMAI0oUu7M5OUMekaF
         2OuNI+dC4WnWYnly51WcZMfv8FPva70W6ThxZfEOYegraCfXSzd2jWE9J7FeD6/A80My
         SGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762123791; x=1762728591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxZfP1EgwtZ2tiYeqX+Jv36xFp2c8XGw5hNT53dpp4c=;
        b=VCeX+PxNrjo+1I3BUoiUT7sbBTCa7AqU40pW6pOLj6wpzJbakuwKp+Kq2UkZTlQRKX
         EZFUb0RVs/9d+8NDLsd6Aia90Dyzeym+RPgL7eLd7un3v252SmT8IEUdtjzrOEmeaMgf
         kYZ2LZTMbqXRYElGd2JmLPQA1hXCRAZ9vczgvnFMRuz4IaPj+bc6FsatJvhx8GquO3u1
         khWgmNOs4nx3nYVjB9TVIEG8ycC74a0HwJhy/imi6+VA4oR2uOIXUOGldwDWtj18aWG5
         fsmCTDtLgN4Lt+Bt3dY45wML8tGOirzYNbGoYZr5MJXKrM3TfgAPl35VdgwrCNHaZFSe
         N81A==
X-Forwarded-Encrypted: i=1; AJvYcCVQxaWhPKLBqwftg33YOq8xFAhKN0aYzjyXfsAC5x30tParbF+giEPXWyHk3wzeRb7oaDsheeb9BrxYNKTVMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaSTClUQNSLznAVQbQDPBo8CJXO1vwndJK4BwhwVKo32UvhZ9k
	Gv/Z6r5huZTL4pju2/yufcXqmuwMztLPEB29xvICnnxxIcnEYJlWF1Le
X-Gm-Gg: ASbGncuMA/Sg3duK9T46fAYLodvh/+u8+b7pd4fF2PhWlDEpR8jB2UyHK1kzvU4dbzY
	WMGhJO+mBelzDpJ6V+n+oSgDAVPbzzWdmAhhbSkjFKP8R2X8G2otkxKG1XWDErlcaFnWOyz6ky6
	aBrKKSdSbGNWRrVzCneQuEYjZcwDsTlFdwdu35mho1p7PRgtuhJOhV5aNt7K5m+pwkKVy2B5sdY
	JihPe7qJgWE/eOifr82fkxO0cw3ddjBC5AtlA0FCVclSQkwO72rQtx88wO4mb0rzzfnnBx1yqu/
	Cvnm6XqE8iH/x/Qmv5E3WcRPxTCZZWJ/E8hSHDs3wGlE8FoKRGGDm4UPj0yE8Uqo83e77s0bP/o
	tkmMMAtdomh92Lb+oAqg5cIyBfv2uT+efgBddVfP54rtcr9ZGv2w6xO/lqAgE7ZoQa/dN12SCQE
	nZFy3bvmgXLsJQOLrhMEdnqv4sKBzuW4DGds51Mu5FR39mBrtDuvlF9NzBPIQADLLrEG0=
X-Google-Smtp-Source: AGHT+IHLr7QHAYyCpR7esydH0iZxndus/Yszg7n3Mbh2EIBSjYHhxzLG4Xv/sUpvArKaCvluQvwAug==
X-Received: by 2002:a05:600c:848d:b0:471:12c2:201f with SMTP id 5b1f17b1804b1-477308b5986mr103587185e9.32.1762123791099;
        Sun, 02 Nov 2025 14:49:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08? ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772ff83182sm72828245e9.4.2025.11.02.14.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 14:49:50 -0800 (PST)
Message-ID: <4b910f6f-9144-46a8-95c6-8e53bc83cd8c@gmail.com>
Date: Sun, 2 Nov 2025 23:49:49 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] nova-core: Simplify `transmute` and
 `transmute_mut` in fwsec.rs
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
 <DDXC17HXPXFZ.3TIX7FHUJHAI7@nvidia.com>
 <70210168-ee28-4996-89f0-83f8590cb716@gmail.com>
 <eb51b5d5-7f38-41f3-882c-eb87eb2b9f44@kernel.org>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <eb51b5d5-7f38-41f3-882c-eb87eb2b9f44@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/25 17:08, Danilo Krummrich wrote:
> On 11/2/25 4:09 PM, Daniel del Castillo wrote:
>> About this, I was basing myself on nova-next [1]. I will rebase on top
>> of drm-rust-next for the next version.
>>
>>
>> Link: https://gitlab.freedesktop.org/drm/nova [1]
>> Link: https://gitlab.freedesktop.org/drm/rust/kernel/-/tree/drm-rust-next [2]
> 
> Yes, the nova tree is the one I started the project with. Meanwhile we have
> moved to use a common tree for DRM Rust infrastructure and drivers [3].
> 
> For the time being, the "original" nova tree is not in use anymore.
> 
> - Danilo
> 
> [3] https://lore.kernel.org/r/20250901202850.208116-1-dakr@kernel.org

I see, thanks for the explanation!
