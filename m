Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBD61922EF
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Nov 2024 08:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730882844; cv=none; b=fplMHLIxaSfdpQ3Lr4gSCRcAcXiDHDcbZDwP4YbxXtmCZGTlICGCpo0MpXjGrqMXINsZv0CwG4ICiB0D0zeFouQx6bVLBjDK1eDfD1Pnjly2FyYDv+vPOHzGMPZ6r6//Gj1qT0gs6xcN+7ub+uKzoDs8CdpAelCeCouOMrPKz+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730882844; c=relaxed/simple;
	bh=5xc0y+kUR5KvO/xI0Zif5iJgAo+LqVTMvrmHan6v5w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hewPNDC4YNp28L1H7pL+JkOSJEmdvLJroTm41afXvWhZ6knkaCXN8YWoZtsQ1wPAm+361WgSQBod3L3yjHIM07+WGfvghR7uYz2doRBLb/7lWAgFbZE7ZIEjk2Zu4BMkv5YB//qzyI1KcXcjECrhYtQ6ZOFZFlHceCh4JDXTqMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqRA6jkw; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqRA6jkw"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e3f35268so7817583e87.3
        for <rust-for-linux@vger.kernel.org>; Wed, 06 Nov 2024 00:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730882841; x=1731487641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hBJykx3Fy0qdIylEkYiY3WsJd3gcrEAupVmHzEf84fA=;
        b=FqRA6jkwn8bVBFOaOgO6tCdGWmGvPIK/QKKXE85iksn8T5CKFzldnad5XNa6YMQ2qv
         KFh/SZVrzgmT1R7vdgVUyV474TqiFVbg4SsAJKDCSZ286y4qDXwVbuYkJ0UqIDNFPMV7
         PZJuhQShrQJ2yC+XWQmwMva/sg69nIR8SS+sGYN4HPEcFsVC9ahgRImtJEbhycXcgFjM
         6KVd+rohDTv16ef1qWBzG/mNZoqoTTOiobmklDBm90yeeiEnh6ehqoFRDoIg+Q1vNm6/
         M1fQCzeooytnC6QsLYxM1/uEtbVNOWtD+h2meXpoizx20zqkIsPlNUAS134XZbfhGeoj
         SUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730882841; x=1731487641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBJykx3Fy0qdIylEkYiY3WsJd3gcrEAupVmHzEf84fA=;
        b=xKVCMpcdBgU4pzxLTn95FMzVhvaLN0f2sbLUcb2b0EESNP/AdVcch9vQ8TbZEJaTSj
         gI1/cEv3kdvFG/lnP8YN8EiNXkm3aAiPS0CIJRdHTGWazDx66L6K58HL3GHEI+2vMvCB
         ukOzP3te1RsB30hOYdmEHh+jVFON5PWn1g7/1ntdpsO+6SEdWOcmMZBCy0k3UlXh8+ua
         Pzy1AoEIabCtXeBvHjIVb0WY5aQKFJ0noKzX0DbonociDN44cb9N240/2NKiSAPqbIGv
         M2lzXqVB8tQ7S2CvJOXywAw51Lq07GhbVMsNMwR6xeP2JLtSh72XwyG7tJOFdonQplmH
         8KIw==
X-Gm-Message-State: AOJu0YyBct43z+QNzZQNzaMCdsJgpCHUD9qZVifG8a3k60rgfw80rDgg
	rRtk1BzTGvbxoiZHLLdeEI1vgwgMLSv+gR97zHNoHm8Sd/zzbNyA
X-Google-Smtp-Source: AGHT+IE0bEjSCPh/ooA9+l4dfTk0zYNrJLsOq7kS04LyCrgMzQAi8AEFoOEhe+UC2eTMOY/u2wK/Cw==
X-Received: by 2002:a05:6512:1091:b0:533:d3e:16f5 with SMTP id 2adb3069b0e04-53d65e1aa88mr8170592e87.38.1730882840385;
        Wed, 06 Nov 2024 00:47:20 -0800 (PST)
Received: from [192.168.1.146] (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde3287sm2402785e87.273.2024.11.06.00.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 00:47:18 -0800 (PST)
Message-ID: <2cf513bd-456e-4000-a295-8e8147798db5@gmail.com>
Date: Wed, 6 Nov 2024 10:47:17 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add dma coherent allocator abstraction
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, aliceryhl@google.com,
 daniel.almeida@collabora.com, a.hindborg@kernel.org, dakr@redhat.com,
 airlied@redhat.com, wedsonaf@gmail.com, a.hindborg@samsung.com
References: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
 <CANiq72kPvMQJwCxm_cAcNqtCL1rMYKR_0JR3O+O3+1zUiOdrZQ@mail.gmail.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <CANiq72kPvMQJwCxm_cAcNqtCL1rMYKR_0JR3O+O3+1zUiOdrZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/11/2024 13:23, Miguel Ojeda wrote:
> On Tue, Nov 5, 2024 at 11:47 AM Abdiel Janulgue
> <abdiel.janulgue@gmail.com> wrote:
>>
>> This series adds support for the dma coherent allocator.
> 
> Shouldn't this Cc the DMA mapping helpers subsystem/maintainers? (also
> please Cc the rest of the Rust subsystem maintainers/reviewers too).
> 

Thanks for the reminder with this guideline. Will do so in next update.

/Abdiel

> Thanks!
> 
> Cheers,
> Miguel
> 

