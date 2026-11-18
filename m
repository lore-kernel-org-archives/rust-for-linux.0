Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018153;
	b=0BvEZh1LrOChwHYaAuAXmoBnrRcwp6LWh4eI13llUQGbqHiLt47j+0tTQRq/soXXXTdH
	 6Hw/gTrpGkGM9laxrCzZ1jO0sLSBpJnzrwTPEgbsZA1nXudl9osdboPZoF/THpPIoz1O7
	 UgQJ/LnxNyqZ9GVTwSSoAvdPKkTC3El/A0NAR4jUtVexN/knnoY+A5gFiWw+f2aVGW9SJ
	 2UMRoGoVgYfwN/GWI3Ncag2e5dQ3C2G9e1ovLlIBPTw680hJl0hGZWfS0zHe6A4joJXVC
	 JxbZ/uOTgKF1Hoo2lzTH39vqzd3y9jauu1M2fSMOros//+Gh904GbWCuZmE1+i9C9lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=gSW8M0rgpdj9ZidqbA7F4jvYRgDNFzs19pLdYBcG6XI=;
	b=URnGV+yvz9Y7RQJOWVYg0+RkSycsDEjGCYBjR9V/yxlbvshmc1ThcAJSIMpQG0dhtjsw
	 6KwqnppGvi1nEdQLSr39PemBikWF3+apLorzVf+KvEzIjiqQ2naN5XVXyv9Df66HQY2Th
	 H+GkjgeqDGsYAHUCbIpvWZ6Cg5nI7ocdqV7fYmxGiLW6UHsC43ekVrFl0eAEp/mRIv4Yv
	 cKE/I67zg1RXjO/0nmvKHurnQp3YTeI1LbfaC9VRC1UTMeC9G5ka62fLTfuJHrmpjqpiB
	 5OJK1QdnmmFdXCZpDSPWsVJipMpJzuEN2zjmoeRK7Z4FCzvYnok7uEKECFgPhPW+tfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=chZD7l82;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E283A606A31C
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 16:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E283A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=chZD7l82
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91f30ff609eso9908486d6.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 08:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795018151; x=1795622951; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSW8M0rgpdj9ZidqbA7F4jvYRgDNFzs19pLdYBcG6XI=;
        b=chZD7l82ESwZV0NrL9Y3bjrt/lt6hUE8yJTY/GSTbZ3++TECbeHRPwOO3x8C2TYTsD
         pmFEFkAyphy1XFGrJWKgkh6/hObuL9DIaipmeRwD4jL6d4kmiK5Sd7eG9VmJDN7PKLMw
         fDenmmvO0nH0DBmkNcCaABqbmFWR4GEVn5KeGcscgVDOi+i60/glaMT/eCUCWvlaqE7i
         WmyUu34aXTAUr4XZDJ+nmq2QLLhZd/AcZlB5GmPcoTAQinMKxhsJYH5ijovm9geUwPS2
         MM7RaikEDEby9RU26FYr1MOZuribQk6lhpYE6aHKmpx5SQ5Mxre8WvsTNxPyTzbpNOhd
         T1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018151; x=1795622951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gSW8M0rgpdj9ZidqbA7F4jvYRgDNFzs19pLdYBcG6XI=;
        b=oNbu2tVFRc4HKPYtRQLM7s4cJDJ7SK/BzENKT9C7yRHGo8SnyVLYGCIqa4SFkERO+Y
         HDyCF4SPWIxfypt5z1HCZ64NubxDDkRLD/TJ7GkUFvA7cod4e9VKlPyPZWfAuZmeInoT
         zjtE1be7u2HKOojO4Wkpva2mGygtIBotIpCaT3n2kOrva9IJmJW9AhBKvkoo2Akm4D3n
         7ndAATnSiMwH0u2LpFzoyVMcCW6qnAsuW4fWYUsMvTs7U2JQ3NnmtkC/hDinA9YVMmYY
         ppsF5Yoys1fWM+lz60NNBZuE8FEQJAdV1Iv7LxXNEla5m/ekTR4QiArOlhQkDJ8JWWEi
         RCpw==
X-Forwarded-Encrypted: i=1; AL+hErG+zB9N+qbYjRSuEnYXz72MTj5t7rH3k28ZIzRD67B6K41bYh8yH9puXdKrA5JOFihmYe4k3ReP+GKjKeEPgQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ql6pPjFl/9KODwqkyIOoBEq3RRYLJO1+0+PtwCp0WVwjN+5Bt
	8axEVUynh7VmaebeNgtFcFyhxGzAtT3nDHYAvMdRCctFDfscW4Ee75jiEB3wJA80BW4=
X-Gm-Gg: AZFdTZe3uJRrEwK0yKFnRQfLbNFfIBoXptXTrMsGwZrOQw1xYuec7P64Oz5PQnX2NMf
	P/fa2Cyu1+FriKhSB+5/rl0VEObT/DS0bMEXPB1AEVbNkQnL6xqItEYL5+AJrPX+xpPq+ZHapy1
	cjzCFTOlxurn9Lm8NAU0x8IYXH6WHpTvCP4etEiBk3eKrzgY+TMSymRuTwwgOQCEUoQewtjJAhh
	rhFfXBG8OOwZjbCAnEvYvLJQ3WjhPzOGUFEDxXUNP4u/hjF4xGfPYtCwCQG6J2O3cocEGg1yS6a
	nPmrwRQh3mdKgfy+irLR3/HG5JRGQ1Cbozf/wFcqHa9cYuvbY1+Sn2EIyhDdbmlD843LMAYnuaJ
	+a4c0LeVzi7hYGOh/v3JVPj+39uw5WEzfTbDLCK4nibbpI3zyK76U3cpKyuxRN/2iOM9aMAQI/1
	wLEBiG/hSY1xaWqexGzYW2tIQrg92UOZmvNxfVeKVgX652Wb/1Z8XulWNtEYSs6HccB0eDSnb+L
	GSsAU4C/tlrKERmdKnIyEstOD6C/eR2bXlXqMeIlPX5oKzjJpnOT3AfSqowAWiO0mbv3bqT1CG9
	zW9Ff+f1mnX5t/hjIq9iJvtV9rI=
X-Received: by 2002:a05:6214:5787:b0:920:fd27:87df with SMTP id 6a1803df08f44-92114f78ab5mr44895066d6.48.1795018151035;
        Wed, 18 Nov 2026 08:09:11 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114db5db5sm24976746d6.43.2026.11.18.08.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:09:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTiDd-0000000Fn0o-1uSd;
	Wed, 18 Nov 2026 12:09:09 -0400
Date: Wed, 18 Nov 2026 12:09:09 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, iommu@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261118160909.GC3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>

On Wed, Nov 18, 2026 at 10:25:58AM -0500, Nicolas Dufresne wrote:
> Hi,
> 
> Le mardi 17 novembre 2026 à 16:20 -0400, Jason Gunthorpe a écrit :
> > On Tue, Nov 17, 2026 at 05:09:11PM -0300, Daniel Almeida wrote:
> > > Hi Jason,
> > > 
> > > > On 16 Nov 2026, at 16:38, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > > 
> > > > On Thu, Nov 12, 2026 at 02:00:07PM -0300, Daniel Almeida wrote:
> > > > > This series adds a Rust abstraction for IOMMU paging domains. A driver
> > > > > can allocate a domain, attach it to its device, map pages into it, and
> > > > > install a handler for its faults.
> > > > > 
> > > > > This will be used by the upcoming rkvenc driver that my colleagues
> > > > > Detlev Casanova, Nicolas Dufresne and I are working on. More details on
> > > > > this driver can be found by watching Nicolas Dufresne's talk at LPC 2026
> > > > > [0].
> > > > > 
> > > > > As part of the security model, each client will have its own IOMMU
> > > > > domain. This is needed as the submission model will let userspace set
> > > > > most of the encoder's registers directly, so the kernel cannot check
> > > > > every memory access that a job makes the encoder do. With a single
> > > > > domain, one client could make the encoder read or write the memory of
> > > > > another client.
> > > > 
> > > > How do you plan to get the paging domain in the first place?
> > > 
> > > We plan to alloc a paging domain when a video encoder session is created. Then
> > > we call iommu_attach_device() before a job runs, and detach back to the default
> > > domain after it finishes so the next job can attach its own session's domain.
> > > This is so each session is isolated from each other.
> > 
> > If you do that you can't use the DMA API at all in your driver as you
> > have to set 'driver_managed = true'. Is it OK? If it is why not just
> > use VFIO?
> > 
> > Or are you planning DT horrors to get yourself a DT created "DMA
> > struct" ?
> 
> This seem to digress. All we want to do is use the iommu subsystem as intended
> for the case the iommu driver is not inside the DRM driver (which seems to have
> never been the case so far in DRM).

"As intended" means you use the DMA API and you do not touch
the paging domain.

"As intended" means you use iommufd if you want a domain full of user
controlled mappings.

> The existing infra for that (in C) is pretty abstract an simple in
> my opinion, and built into the DMA API if you manage which domain to
> attach to your device at the right time.

What does this even mean? The DMA API owns the domain, not the
driver.

All the cases using these APIs in DRM and media are troubled in one
way or another.

For example the recent revelation they have always been using DMABUF entirely wrong:

https://lore.kernel.org/all/20261009125338.GB13920@nvidia.com/

Tegra desires to undo their abuses.

It was never intended for things to work like this, there is missing
infrastructure.

> To me, it fits CODEC HW driver which are also simple. The DT horrors
> you refer to seems totally unfounded, you just describe the iommu
> and the iommu subsystem will manage it for your device.

"unfounded? You are not following along, I've written about this now
many times to many different people. Follow the links and discussion
from here:

https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/

If you use DT correctly there is no place to attach an iommu_domain to
and you can't even use these APIs. You get DMA API only and that's it.

You have to do something "wrong" in DT to create fake HW devices to
even give you a struct device to even attach something to.

Or you have to entirely give up DMA API and attach to your only struct
device.

Jason
