Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F399913C81B
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731322142; cv=none; b=p+kdDvFcIJjfVy/O2rlDVzhaxWx0siPb5GLU4zpL7aeuH86SD29n2VwSLd39CvfSg9NYOv0aMIBSV4qmKulfJFZ8KGqSNjrC27+72skP9WwDSX7JzcdSobDehRaarT5RuyfCrhDSVGMUdOqfDCQyDbYkKbm/epnjVg2aRh305Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731322142; c=relaxed/simple;
	bh=sOqyKN/qEy1QWBmtxX1ReBle7jq4Eg/wLsy4HAsjhlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EstHQ7yezWu+sYSM18erPqH4nq575v9QvlR79mOsa9a44FKvTFuC7tKk6SNEMGpwvpRusvXs3jV7fU8tFtKAIyu9QoJAlnNvL73gWSsYGl+SVBHapZ4yj8xbCF/u4xyoj+Sac0cdyDIZsDbEJVkeJqjW/TWGTjR/9RvMOrSb1j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGwNQGfq; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGwNQGfq"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so35160471fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 02:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731322139; x=1731926939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jprrbDINYaFwGf6ijshswBIrrn6HkzEo4MU8QQL6pY=;
        b=VGwNQGfqUbkpRkKIfmaewehAiZ7+ZMF1m5CRP6DrWCB1JDYhpwX4qEN7ltC4uwjrRQ
         K2gtUjKbEUZWrLGV1iTijjqhYqY7KzuxZoLyluKmeGHRaVVVnY9SnrsYJ2ft+2GnamY7
         SBW5K4ya8LRQy8100SrDJT2l2OLOocPd/DxlxyDoutuPK4IGnj79PXH8+sewEDD87XNx
         NKqP7Ck1tp7pHyaiIVn0ihz2DrN/Q1Gf+zBPwkj50zRGnT9FGCcCKWmPbto9cfUXvFf7
         eFA+4cpcZBL24UaDXPjuBUM7/4C3wp8BOYp3D/ZcgtF+ZGbAgVXKbnXP1jtXFibziwSV
         KXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731322139; x=1731926939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jprrbDINYaFwGf6ijshswBIrrn6HkzEo4MU8QQL6pY=;
        b=prNfTN4R8RgxqO1QLHAzPdPVv7Yvw/E1h+gdElcGmzGswe40Kbu+KC/hc7yalks0WV
         4iahiRESqcAH24BFuVicKAqnAcrNNvYMWNU1HoM3SD1cOsfbLCNCo0V+UMuyCloVuk3u
         MyOs2Ztn7lkSp9hKsGzISE9gSHnQD7zGJDH2e+5GTnIbMvMGG9bgGQlTJ58DXEsw71wm
         0qaqSZnf3OeZWvEojCBb4ydCXIwQ0RlsXp/8cQr89WshfWdUw996IvtCFDd2QvaiJpir
         Qryj40P4EqwCKMidzGAWK9s6LM7iEJU0gd4FDDtKJwgeXHWoP8zNF2720SMhFSOyoGB2
         nAsA==
X-Gm-Message-State: AOJu0YzVDIAGQCdIAaIBDF8IPWo8qcZbgnGUEz0hAUavQOeb0zB06Z7g
	d9IkthUKRMMdW7eOTrWZavJEIgUYBIOn4KvFzoc6wMkc1VnKkPsr
X-Google-Smtp-Source: AGHT+IF5A3Gp6MnXpi5WDRJibabD/7pGUV39mx2Lq9SxwV3kUj3HGFiDYWi0CpKAfxMqyb67b/KV/w==
X-Received: by 2002:a2e:a99e:0:b0:2fb:8777:7359 with SMTP id 38308e7fff4ca-2ff2030c203mr62930571fa.39.1731322138774;
        Mon, 11 Nov 2024 02:48:58 -0800 (PST)
Received: from [192.168.1.146] (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff17901111sm16340511fa.54.2024.11.11.02.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 02:48:57 -0800 (PST)
Message-ID: <bf8a1bb0-59ab-41cb-9116-2258d9ce686e@gmail.com>
Date: Mon, 11 Nov 2024 12:48:55 +0200
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
 <2afe6041-20c6-4121-acb0-ffb295575619@gmail.com>
 <A970979F-F4E6-4474-81F2-8FF471C82C35@collabora.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <A970979F-F4E6-4474-81F2-8FF471C82C35@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/11/2024 01:42, Daniel Almeida wrote:
>> You mean the read/write helpers could be removed and we expose the cpu_buf() helper instead that takes a valid range, returns a checked slice and let the user have the flexibility in implementing read/writes themselves. Is this what you had in mind?
> 
> Yes, that’s what I have in mind.
> 
> 
> Alice pointed out to me later that the FromBytes/AsBytes traits can be implemented
> by driver-defined types. I had missed that.
> 
> Given this, the FromBytes/AsBytes bound seems fine. Drivers would just need to
> implement the (unsafe) traits for their types and it would be up to them to make
> sure that the safety requirements hold.
> 
> Given the above, I am fine with FromBytes/AsBytes, you don’t need to change
> that IMHO.
> 
> With read() and write() gone, so is the bound on Copy, which also satisfies
> my other comment.
> 

Thanks! Will incorporate this feedback on the next re-spin.

/abdiel
