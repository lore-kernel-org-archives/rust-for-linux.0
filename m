Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6F121218B
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Nov 2024 13:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730984470; cv=none; b=Q2z72XPKz6A3KRMWkUo99iRvybUMt+qbVprj9oAEqx9FIdLCJnJeL3D6lTsgQxMO/HHcNDC9NYj/OuYOoBFJnAqsSJIFBkiFcui5E9uQMocnCCWo9/HJ3VjRfU/X2F2wZNClDm4KllyAM/9EEhxCx/t3bPPSlkXBl2HQd+AA5rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730984470; c=relaxed/simple;
	bh=co5T5RMOHXr3gU3KKNMD29jzCpapCiUf+S9uv1Hlpgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rO7BY9fporkNGGVHdsS0ZZEBsenqcOrmj1PRgmj88wiJfFadpqgOXKHZma+8ACYL3s86TH+tR4Oeow9cOUwkipY/l9qHKeVTJ+bpdYKVxOpX2+DRW8SYs18q4xjsD21FpHmphJIf2iSzWh0dkCl8OhZFwgH/BUZhQyftalaa5Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEF5UUqN; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEF5UUqN"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f7606199so861457e87.0
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Nov 2024 05:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730984467; x=1731589267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JxinRcE5K4xRCdSQncUBdS4LnsRa5+N0CdQ21Rwks/g=;
        b=LEF5UUqNl8KcYzna6gnuwEZO56/O1eGs6XVUDE9XcLFNOh99BXDrni1xZZKOm+Lxqh
         e47mLpGzS4AwCvXDkVFLMSJbxqbaDffd8KKLNwhdbDYno71kDW3samcP4jQVEnShcorq
         Rfjt9b6QS83c6gM2OUYik9WrHwzlUR8c6CAQv6tiUgBiwgyKZVDJF4LeHWjYj20xQpkf
         iEJGMfWDZOSFPse2vUsbRfgqNZYX1IiKQaqJKeEIzmD/XJI5sW2/ONcRCeK/7SCR2pOk
         Am1NOoc3EQcPvzfFDjEKvHNlYwA2n37Dxaw2gxVi+HRtP7+NP9Yu9udDzkXmR7D5P3ZU
         g0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730984467; x=1731589267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JxinRcE5K4xRCdSQncUBdS4LnsRa5+N0CdQ21Rwks/g=;
        b=t+G1cftOYkIvTxcyHvbVGSFW+fvamFp3CSqi+klYFRBRPCuMLHvZWI9Cl5JnDzsFuA
         IvUTVBqvPXrUcRrnUJd+SJZDTBPeTIK4fj1H7RM5pELjRCjjv4ETZbed8ptoqeLTpsmp
         mDhQFhV9D7k58BflDsfROWJQex2JU+BMscLbkYayE8AVsZPtEwc7IH1LfXIasnQpRIcM
         DTHPazl4RM560jdjr/ewcbtvCHZ3OuFZdTH2u2sOkJ0j8WfkmJ603eMi41fC9vyFbwm6
         Kb3FVKIIWoLuD+ZGxzpCdCIj42N5Yr2MNLaXpLMQ0zNoUpcd/TIUdvdLYzGlOl3dUpaM
         kC/g==
X-Gm-Message-State: AOJu0YwZHO/bDacxywqRZyOT/PNo0cDwvaPq1Qz4+n1tTdSBVw2vZlsD
	v2FzMFcUDkLUI6R6AIJ3IK9h+L0PZFFzRAtdTU108+/AsFmA7s0r
X-Google-Smtp-Source: AGHT+IEZM0wSjRowYyOjzGaFTDSpoaAdI8fYmP72Rpavb9MRfCXZMpVQTGgiklt24r5KrskHgpNcFA==
X-Received: by 2002:a05:6512:3caa:b0:536:7362:5923 with SMTP id 2adb3069b0e04-53d8407012amr758993e87.1.1730984466123;
        Thu, 07 Nov 2024 05:01:06 -0800 (PST)
Received: from [192.168.1.146] (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826786acsm208459e87.30.2024.11.07.05.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 05:01:04 -0800 (PST)
Message-ID: <2afe6041-20c6-4121-acb0-ffb295575619@gmail.com>
Date: Thu, 7 Nov 2024 15:01:03 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] rust: add dma coherent allocator abstraction.
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, aliceryhl@google.com,
 a.hindborg@kernel.org, dakr@redhat.com, airlied@redhat.com,
 miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com, a.hindborg@samsung.com
References: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
 <20241105104726.3111058-3-abdiel.janulgue@gmail.com>
 <81E07830-0A54-49C8-AC07-6511F6C816C4@collabora.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <81E07830-0A54-49C8-AC07-6511F6C816C4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

Thanks for the feedback!

On 06/11/2024 18:40, Daniel Almeida wrote:
> Calling `get/get_mut()` for each T seems a bit of too much overhead.
> 
> If T is u32, for example, I expect a driver to want to read or write
> a significant number of them at once. This should be common
> if you want to read or write raw bytes.
> 
> You should probably make the CPU-addressable region available
> to users after validating if the range asked is within bounds.
> 
> Luckily, cpu_buf() will already tie the lifetime of the slice to &self,
> so they cannot touch that memory if the mapping is gone.

You mean the read/write helpers could be removed and we expose the 
cpu_buf() helper instead that takes a valid range, returns a checked 
slice and let the user have the flexibility in implementing read/writes 
themselves. Is this what you had in mind?

> 
> The fact that reads/writes will copy the memory is also a bit problematic
> given that you can offer access to the underlying buffer without copying
> anything. Also, the bound on `FromBytes/AsBytes` is, for now, a de facto
> bound on `Copy`, since it is only implemented for types which themselves
> implement Copy, i.e.:
> 
> ```
> // SAFETY: All bit patterns are acceptable values of the types below.
> unsafe impl FromBytes for u8 {}
> unsafe impl FromBytes for u16 {}
> unsafe impl FromBytes for u32 {}
> unsafe impl FromBytes for u64 {}
> unsafe impl FromBytes for usize {}
> unsafe impl FromBytes for i8 {}
> unsafe impl FromBytes for i16 {}
> unsafe impl FromBytes for i32 {}
> unsafe impl FromBytes for i64 {}
> unsafe impl FromBytes for isize {}
> // SAFETY: If all bit patterns are acceptable for individual values in an array, then all bit
> // patterns are also acceptable for arrays of that type.
> unsafe impl<T: FromBytes> FromBytes for [T] {}
> unsafe impl<T: FromBytes, const N: usize> FromBytes for [T; N] {}
> ```
> 
> Also, I think FromBytes is a bit restrictive here. In a lot of places, drivers
> expect to be able to cast the mapping to a given struct whose definition
> was sourced from some technical document or vendor code somewhere.
> 
> For example, here is some code for the H.264 decoder in the `rkvdec`
> driver:
> 
> ```
> 	struct rkvdec_h264_priv_tbl *priv_tbl;
> 
> <cut>
> 
> 	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
> 				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
> ```

We could just remove the FromBytes/AsBytes bound and let
the constructor handle the ZST restriction there (like in the current 
submission)? If that is the case, there would be no need to wrestle with 
this issue then?

/Abdiel
