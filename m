Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF293E638D
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 14:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370714; cv=none; b=jUiHr2fm1YnesttWcImdvf0ldwA7QGtlkDjPh8kLVwKtZNPEg04n9BzV2zfoHdCrCgyXSdguvzyY8RR1xxVP9ZlR1dUsMFbrMA8uD/jbaifETO6szIe/+YknbJus6JAiWoAI+oS8mrC+yHApar9MbQfoxP0lquCWyMJuVrB/JnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370714; c=relaxed/simple;
	bh=yhaqOei2y6wRsN/4tii4LmlzV4Yu4KQZXHwrnHWRzPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgbMbUSDuc8u5E/CALGyXSiu+WnT6OXwpZVHBrBiJHHZmx21HEtBhgGIZdIW38fZ/fGaEdc8yEoyAEMrchU9jay+c//RPS4ThN0OrouSyn6Q9uBLsD+FnUi2E6rR6eJFGpFPH8q1UmgDeaoNlHRUl6Z4yoHIOkV/sPXmUtEcF4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Gvk6kLF3; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Gvk6kLF3"
Message-ID: <92edaf37-4d13-4376-a4f2-c7356e807ba1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786370710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRtxa4INTI8fJ7gxMoFbi9IX+LRwnE6HCtUVXftusV8=;
	b=Gvk6kLF3S1tT7G4SrsTIZ0uCmfZAUs6UK8psjuqVK8WKtoIj6fJmfWEDPiTU++SQYApwy8
	IvPWDokzbnp+acsUyLGS2YirgABDEnvjS2zhfOyxFnVKKvi5z0VjjWQtX5A04ciKWQM3cz
	HMr9RfqjWD+3ig+mFRJdzeGdCNAvtIU=
Date: Mon, 10 Aug 2026 22:03:57 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/7] rust: use vertical import style and remove
 redundant imports
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alvin Sun <sk.alvin.x@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andreas Hindborg
 <a.hindborg@kernel.org>, rust-for-linux@vger.kernel.org
References: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev>
 <20260810093438.208557-1-alvin.sun@linux.dev>
 <CANiq72=v76Tp5jvydeHdYcbpAcG+=a305ZV1GCvAhEU-kWxijQ@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <CANiq72=v76Tp5jvydeHdYcbpAcG+=a305ZV1GCvAhEU-kWxijQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 8/10/26 21:58, Miguel Ojeda wrote:
> On Mon, Aug 10, 2026 at 11:34 AM Alvin Sun <sk.alvin.x@gmail.com> wrote:
>>    rust: block: mq: use vertical import style
>>    rust: block: mq: remove redundant imports and format
>>    rust: block: rnull: use vertical import style
>>    rust: doctest: use vertical import style
> For the block ones, Jens may be picking them; but if
> block/Jens/Andreas prefer, I am happy to do so too of course.
>
> For the doctest script one, I will pick it up right away.

Thanks!

Best regards,
Alvin

>
> Cheers,
> Miguel
