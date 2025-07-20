Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4781533EC
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 16:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753027894; cv=none; b=eBoO6NiNf+yvQZ224vP+aygzdydQbdvYnRyH+9lk838U0TTHXvYh6TftLQ47hwJfgahRpTEOPyooOaMb42zyFy79hT+ZbkazriH586x9OWBfBFLcUFMjv6ecrkBi8MVwsP69g5jzC2uhBrTRFRBls6sq6nnZ0JHQI+5myt7aluc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753027894; c=relaxed/simple;
	bh=1kkgAJedVRmqE+NjlLS/JrjnCCyYksp2IzhgSl3fYFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5T1x+HuK1SxqwbkPt0+H0ADoOOPmxsXGiaT1UqPXUqlcM6Vs3y07M8oiP7nyphxVgFhpVDxhpE67iChCcGxVl78Mww3nzVUYmsSb4rnFJuaUmjsZqYK+7Cut5GgkglKNEFucjThVNEaN6rRdA+RLPQky0nmj1ZKfdY706YbIAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=gljd6VJg; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="gljd6VJg"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-747fba9f962so3207451b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1753027892; x=1753632692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X3sE27/WAqZP41FkkjgAc8UwvwE9+GItC8A+pDEL148=;
        b=gljd6VJgL9tenY51GmrzISWJaspcwktvmmlnYdsPmJNkEmv8IbkkS2Iu8TUlkyroiA
         X1oUNW+UCYOm+K3KXk5cuGKVeE854iqsCvxZAQKsHQf4yo6eY4H128qOYEsEVfQ6DEkC
         mHt+/hum/JToqmEuhN6dagarFy4Zff18BR0pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753027892; x=1753632692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3sE27/WAqZP41FkkjgAc8UwvwE9+GItC8A+pDEL148=;
        b=r66akvreg/gQibzf682VU3a4aJdNAtc4Dxno5I4ty+6XJEMH0hWeN7brHz6GatuyUz
         Rz5Cn2zs7/npnwCMckLOtgatHrDIkgLnxEHPu7k2D3gnYSOoFv4sQlf8oy/XFOQ70bFL
         /R184B8BRLBsv/ZLfYtGzNI8gyuMdRuq83wHRLVe/9XBPHbURWsha4fZbVXWbEZx0UMC
         ucabHc5/1YBvisxxil5bsZvwdUtpAr/2W6/k0BFGNG+PKrGhqO2DWZ5QLD77LjjsyDzt
         yLOTaxvyAq5lXFIJDLRi2vQBhtj0VkFQLPIr0NCN8nZSKNmMu5p8WO1wD8TjNSCkNLxt
         a5iw==
X-Forwarded-Encrypted: i=1; AJvYcCVilLXIACUJEyDQgrGJJ0vafm7J9I8SIS8+HP+G5wjN354S/k4l4llQJWfUcali339Yc4gsg+tivj2Z7dsifw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yywyb2BOapBHKwkvDy5FaWugUdqNIfWP8UN+y3GdNFt5Ix/IGJz
	ncz0D//LTSOAzV0q+ppYrtAsW1uVv/9P7VCJ8vHXOjGZBhVtemJIxAgbKB1539H5XhQ=
X-Gm-Gg: ASbGnctpP0C4WKAGb28IYrmN5MOOjkjFe0gyABzIRw8Om9nmqz2j0NMcagMRWBmS6OR
	UXDpfcDdIXGqcJTO5buwGc6K2iEb7t+JAqKmaDTtBEFB7a6s3qjKIfmYN1pUoRo5FL6Dzf/pO0L
	6tJ10snIq2W6CtD5KLYuDY7jwIZ8By7o6EzK8BKOQlfJ+2tXSPHmf6dPkEMeP0wlVZX8WDuYLdL
	Kk0rXAcwZ/ZggDR9rjopPSGH+b9VZXrXxn/n6M9YnePmFwEefHGIVxQEf3Cs7RYRZa4jKLYSAcL
	rsaT8FAwbnk8e5iMYZDuVJ1DT+azZg1lEodm0hpDUThDA/WX21hFirqHVNev4ngpKfQFRw3rQHw
	Kc8wfUv2H03MZqhi2w5tG/E2EMbSK9VTwGbm2eJWvIzhofrGAlfh7qiRcnw==
X-Google-Smtp-Source: AGHT+IFF1fTWCOr6/BH6HO2z3c4L025UX0QqK8oCHrmmePFPB5CppScDYdz+haI97RiMoMTtOxzo2g==
X-Received: by 2002:a05:6a00:3e15:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-75836faac4emr20252321b3a.3.1753027892574;
        Sun, 20 Jul 2025 09:11:32 -0700 (PDT)
Received: from sidongui-MacBookPro.local ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c8acb61csm4358217b3a.64.2025.07.20.09.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 09:11:32 -0700 (PDT)
Date: Mon, 21 Jul 2025 01:11:26 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [RFC PATCH 0/4] rust: miscdevice: abstraction for uring-cmd
Message-ID: <aH0VLhYptH_Sw0Py@sidongui-MacBookPro.local>
References: <20250719143358.22363-1-sidong.yang@furiosa.ai>
 <a0a868ef-107e-4b1b-8443-f10b7a35aabb@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0a868ef-107e-4b1b-8443-f10b7a35aabb@kernel.org>

On Sat, Jul 19, 2025 at 07:03:24PM +0200, Danilo Krummrich wrote:
> Hi Sidong,
> 
> On 7/19/25 4:33 PM, Sidong Yang wrote:
> > This patch series implemens an abstraction for io-uring sqe and cmd and
> > adds uring_cmd callback for miscdevice. Also there is an example that use
> > uring_cmd in rust-miscdevice sample.
> 
> Please also add Greg, maybe get_maintainer.pl does not list him, since the
> entries for miscdevice were missing for a while I think.
> 
> For new abstractions I also recommend to Cc the RUST reviewers.

Thanks for a advice. I've added Greg, and other RUST reviewers to Cc. 

Thanks,
Sidong

> 
> Thanks,
> Danilo
