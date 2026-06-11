Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFD1388E46
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 22:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216527; cv=none; b=eReZTWoiS0ib9Phx+Q19K3mkPjcg8BDPgm9ZWp6/Z3ZCo0NLeCM5auKpV6RdhaLhS1lYF0UwYR/wggkt7Hn3TbWUR/R318hyv9q1NGFvExsXD68ibkt2vvihi5VkXRydvzZm1e9/N96tY7Pg5ttwIyT5wzFPolKPiSw1cwZhPt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216527; c=relaxed/simple;
	bh=EIO/UweIZg9SBiUkTOpy0WxO6IF4wMArp5XwoN4lSIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekmdLXuPyv7yEdM9FUOwrY8DGFdclutAWBiOcx8ulhM7+j3PYDkC7Zke9SzLdEkRvGl67OalKOR7Jk9Wlj3D8xFzmS72izEA0PsjPccKwvrxvnmxeO/BQ9hwRA/QfhL/1zZhgx4AiwQVPulrsgm2wP0WGOiphc5lBX7tYF6/Aw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fsbrYaBx; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fsbrYaBx"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf2d865383so17635ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 15:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781216522; x=1781821322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=owXfDppnGy7biMe1ABShmYBUhYqH/Ook9Bgab8mLm+E=;
        b=fsbrYaBxeSjkwLJa4y2ynUaRIoEWIk3geiN9uN+0AyNYmB1VUpHgMhdZJKJEU0jsgG
         p/5TWjJJuKuUPWApeKawC0A07mh+fiSazdsHxZP4NiQtAGbO2PX4vXTTlxQwElWbEckL
         +koSMak9yzQ0U26Y2T+GyJV1C8Eg71XeKblftRWU7ejPQMNQfUXO4+iXxLsEInY5JkXO
         aXNiiXsUJuJAtLfZVvPBvgPCsAQwvPLp/4C2wO5atP1q7FO7B+4Nrxz8zKXdXhecF3+G
         rtrOw9tzZhaP9EIjy9WKucwLdpYy2lKZQ7JOZX01vght7JwSR4+nl3eGu+NgF1GSH0tv
         gNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781216522; x=1781821322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owXfDppnGy7biMe1ABShmYBUhYqH/Ook9Bgab8mLm+E=;
        b=Ss+Mz2IGhc3Ptmqwjjcm45Pwu68bvDnpBCdaSh1OYn+WW1PgoRpOTwP/tnIY0V/0A2
         KIFY2NK1XdSx4GofOtY6guPDq7hW0+aXpoJh2TK5+G+jthBZP1ZuCfe0/l/FxIaHsYv8
         pu5XU15rTG8NZMUcuwP4KGKF+w5AE2KakON2uAj3nh2fneTAqUOpJGKEciiULz9Zv/YZ
         fi47DbqFa+amS2gXekS/jjMNNbekR9qmBUa2ohegjmvev5Ex1CjTKHCROIhMRzft6Dcv
         3eW9mCT8ts3Xf5OlZmD4HiN92fPtMSqWmmRDOaavtxDbBatqJyFHVIIgQ0FqhhrT9pT8
         UN8g==
X-Forwarded-Encrypted: i=1; AFNElJ9ffYs8agc4ejlm24VFAErl9ncbWUHV5AsSP1raTFTrCvOtB/Ii2SIhVvD/MRHc+xkL3FPQgVH2Nlqj1YVXtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxLYeMYDE51IkMcWOddvXjJsNjaJ6sjudXUCjQe6JYQWuSsk9u
	bbETFkiW17PzhFkWHbB/yadio2w3xrRU4jSPQt+XwCP/3fW9fW+CLm5n+VfkPIGgkg==
X-Gm-Gg: Acq92OFJyfe3kbk/kLKYizrZsto27Yl7hKL5MKuGh1CS8vC5NHE2zhn0F+TskPUmDeS
	wuUVNAoL3uOtRO7+OAy8eAdc27Rbo1xDbCy/eXP1URGkbu/ZSlDpa52ld27XuRFOVK6yIKwWjxL
	DZ8fjC3bUmbmRPmbapS8xDYiCl4cwRsZ3gI4CpoSwb+R9+1UrK46vMoWkToplQcd8BpOfemIMsV
	b5kLdkP9jN5WjTySLBEQW9Aq8hk1xbqXe4GEbn3EwDPcOo7j+78899DItSxjaC6YJLlTmzV31UO
	J9buijnD+QPTaMmwJRrDvkuANdAlqsaskAZOAGd9DsjPUcWjqZp8ZUcGB0NagVgaPcpFOwjNmOR
	OoWAbppMVBsIxDz++qllCFN+2RRHFuoqvlPCiGuAOMJ5JF2UNLrbrHaDsU98muzdBKV6bMLbpBi
	6OFjGySp2EOLh0kid1E1aaV8oeszNswYul39Bq2me6kF8h8xiM1ZO0mgJ/mKD/7D2aB/Y=
X-Received: by 2002:a17:902:a710:b0:2c1:ee6e:be22 with SMTP id d9443c01a7336-2c3e33a51fdmr563705ad.32.1781216521837;
        Thu, 11 Jun 2026 15:22:01 -0700 (PDT)
Received: from google.com (171.46.125.34.bc.googleusercontent.com. [34.125.46.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9dc87sm128369b3a.4.2026.06.11.15.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 15:22:01 -0700 (PDT)
Date: Thu, 11 Jun 2026 22:21:56 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	laura.nao@collabora.com, boris.brezillon@collabora.com
Subject: Re: [PATCH] rust: drm: gpuvm: update DriverGpuVm for DeviceContext
Message-ID: <20260611222156.GA876555@google.com>
References: <20260610-gpuvm_device_context_v1-v1-1-01a890b17448@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-gpuvm_device_context_v1-v1-1-01a890b17448@collabora.com>

On Wed, Jun 10, 2026 at 05:01:26PM -0700, Deborah Brouwer wrote:
> Since the introduction of DeviceContext, there is no longer a single
> driver object type to equate with the GPUVM object type.
> 
> Instead of threading DeviceContext through GPUVM, remove the strict
> identity between DriverGpuVm::Object and drm::Driver::Object and
> instead tighten the requirement that the DriverGpuVm::Object be an
> allocatable GEM object associated with the same DRM driver.
> 
> Also, make GpuVm::new() generic over DeviceContext so it can accept a
> drm::Device<T::Driver, Ctx>.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
