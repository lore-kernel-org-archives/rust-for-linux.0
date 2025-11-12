Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84492FD672
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937157; cv=none; b=rpVUxOL5WXjgPCf0lPU38qA2vHhQZgufZNaRE92ps6nJ21B8FMYXxTX7OoY0vA3l0qpApTb/YIOC5hYxO1GEvPXlKCbar4AwMfo2+qiQ7Uij5KRuEHRTSGJ9TsPHhyuC1zYedIjngLpnOca/OWIXS3rYZWBzqYRu+M/yC1RVbAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937157; c=relaxed/simple;
	bh=XmdKTnnyHUqNeiEg8lR8cDQAudHSJCs3xM8SfYCQvGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pR3Zm161znQ9OGutR2IwFdV9PvWW9phJIIu/FOvcaeO+P483JiJNtfCyfRKxtYE6zlgfvQZ8vlQ+PCTFRDr7b37su8tateweSGHIFB87OWcnStVSjRZwKVaxLgzssHLzOvtPVT1cJIpL9C+Vmc/qH/V7tLLD80MYlPNs2w77dq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info; spf=pass smtp.mailfrom=markoturk.info; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=markoturk.info
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3e9d633b78so91693966b.1
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 00:45:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937153; x=1763541953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1x6mI9uM3ReqDgxtDW/pYEZ50tke1MXkEHtEWx3A+g=;
        b=T48RoLzAc5EsyVfCZ05bMg+eJQ9RQsmUbnGKSYMnpxrHaxXm2BSbsv1ASBeg2Cq0Pe
         NQ0gCK/DOxCv1IAjGefaKGz6Rp3peD8UueO4mA/rq1KILcyiglCHgFl8F/jnSk+3guXO
         l4gS9D1ScaS+KFNpEp+EqRNeiDyABD7JYf/xsuOb5FBqATrdq1LaVWrpu71b7UGD1EO3
         KF3eeZ4yYv8a3RFHoUNqmRP3UwG8JgeUXFROfcwzOF5WpcJfm/DK1cXguGY/EFdvUALB
         YaquBrXI55D0EnugA/ZeiwBTipyk2O6v63T4NlV2qIPxdeN4Cn1FFRkUJEAVMRp6qbb/
         wfWA==
X-Gm-Message-State: AOJu0YyEiHRz3iCytpKZ2UTUEgXEoE2Aqbg1thrBpP47Px6yfe6AJsnW
	3JGrHHJxX6S5cX6u3NUVxC3iTw1RZlMP+MLkUhbyhcpxkL7I9P2v1Tj511KzyQ1gQYc=
X-Gm-Gg: ASbGncvluGzlGmAwiTt/+RmyFIsb5txXS9WCBRBatD3Hjg1g6pd6ogSgsLxCaABiR9H
	sJzrRM4JJIXE5yCuVTmVOu2lM4GmCdFhwYprLaOZcPAg2eLA6MW3Vg92tCaB57LxS1S9dmrHhC8
	SjT5J12Loy4KIfhFufwgoYrfcCIktcoJUCQcBQLBpn11vtzN8iL9oTcFHMGS+TypRRtRLZ3zcij
	moy2yD+dByR1hW3CJZKaBTBe4vXwa4KIji6JEnHHYRsWy3WilGnJLA7bQR+MC5WiIK8psOlCuh3
	OUxej2TbhWrCTe24ShdnKeSBQRz+/b/4voj2aidMzlXeZp6qg6nHvvyeO6uMo80i22h0erbzH/B
	Vanv0ftNpgITWSkRxM+biqV26GOPbDowRzi4WsT2mFb5nIAaPHikgZgC61j3Nvu8xTFmkyYOrXj
	dT
X-Google-Smtp-Source: AGHT+IFD8PZ00Y2eGZhZEudwtgTVJiohD/6vz79m6IyJ9+oDUE+6/ViIhC08fEaP0ZqmwfcQGt4tJQ==
X-Received: by 2002:a17:906:eb4a:b0:b73:28da:9ddf with SMTP id a640c23a62f3a-b7328da9ea3mr335461666b.25.1762937152743;
        Wed, 12 Nov 2025 00:45:52 -0800 (PST)
Received: from vps.markoturk.info ([109.60.6.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf4fbf3csm1544409066b.26.2025.11.12.00.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:45:51 -0800 (PST)
Date: Wed, 12 Nov 2025 09:45:49 +0100
From: Marko Turk <mt@markoturk.info>
To: dakr@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] samples: rust: fix endianness issue in rust_driver_pci
Message-ID: <aRRJPZVkCv2i7kt2@vps.markoturk.info>
References: <20251101214629.10718-1-mt@markoturk.info>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251101214629.10718-1-mt@markoturk.info>

On Sat, Nov 01, 2025 at 10:46:54PM +0100, Marko Turk wrote:
> QEMU PCI test device specifies all registers as little endian. OFFSET
> register is converted properly, but the COUNT register is not.
> 
> Apply the same conversion to the COUNT register also.
> 
> Signed-off-by: Marko Turk <mt@markoturk.info>
> Fixes: 685376d18e9a ("samples: rust: add Rust PCI sample driver")

Hi,

Can someone take a look?

Thanks.

Marko
