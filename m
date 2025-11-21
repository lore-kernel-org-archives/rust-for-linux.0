Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC8E2727ED
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 18:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763749684; cv=none; b=gg5zbK89jF0i2nRxLv043aLHl0F2O55MW8GfdVL6aGgw2YPw4WgFHa1MLbPw9C4h05jDsUg3wzlyhje1lzIN4nhO8ix7vuhoDiCyfO5Z9DffYepmaVwB9IiC3OcHyjCit5ZMpcqDXEOMuVHrWziANLTSkUoOZ2k1XW1Yq8fKcaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763749684; c=relaxed/simple;
	bh=eiNvpKMX+RHgtZkQ1+h3XWmFyZEgmHdrngHRg+aKUCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SnPBAm+npn621pLG2yr0ZUnKtAqLtlH7F1gLcwKFkjGxTIpem8GrN9NSLP/11crrmQKhZB6V9xhuEQS2ZOKWT3ICfndjRbTk4X25+KtNjWqCj9BKrb5G6vjC/31v4UP0mhFCNl7Dw8YQ1JVo+yYp4UyUUV3Cagk66oMuZSas7N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WPc4+UbP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WPc4+UbP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763749681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9F1gVEfkmOU4VbBNqbz6au89HcS75XiMRWvgttvUABM=;
	b=WPc4+UbPP73I2EwUEh1FZ/j/Cg606m8OVShbJ15eHQrmUtzH3PEYSxEAJWEAboFBzk8eoj
	GCj5KPIzem70+f/IUqTqroD149NqX6CWhrUP+W1sFI7pmM8uPL1AGQ/4KZUhAVMEk/KrKE
	O5m02Q4CrXCUw0CXH5Q9Ig3m9rEPjeg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-BJyGqY-pOx-skJZ-2OKh9A-1; Fri, 21 Nov 2025 13:27:58 -0500
X-MC-Unique: BJyGqY-pOx-skJZ-2OKh9A-1
X-Mimecast-MFC-AGG-ID: BJyGqY-pOx-skJZ-2OKh9A_1763749678
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaf9e48ecso64532861cf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 10:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763749678; x=1764354478;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9F1gVEfkmOU4VbBNqbz6au89HcS75XiMRWvgttvUABM=;
        b=PzQhKUrEB3Nkc7ooBQglT7r009/uvjcnN3awz5yQtV6ZWUDHoA3e8+SdqKCPmlmxcK
         vwNp3cj6lcc83kDCorIPfNzOxlo0axEtKxPso6HOxgFE2AEi6HVbcEhNCKhs0b1oFoVk
         VHhhH80zdTVTUzM9Q5XaaWHBDIZmisuPmxmMB8vldvILhvwc5YbDsoXNDnZnozuF0uF8
         XhQQxYk+/qSDR96vat6MMBekxYNsWJTGISW28BnoMhzy/rBod9SFjZdCXwJCJEqJHc9F
         sz//wsB7WhRkhGakjkoUwO64oyREYjf9hVSSI3Y2Tm/vIdcF4UnU+Llv+ibpI1yBOFGL
         JBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXTwQ3KdgaY2t5Lug7Gp74ybfJU9VvX9gEkB8mhNKqNqeLqb6MygZdOfXFRnBfATsIeoQCS6LHzeJiDqaTnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS0N6FnvkCKHElLydezy02alq1cxa4H33bo6JTpzAm4Ja4Ios4
	rZ3hqOtxAD02zbEB5wRGUKcafGWme6ujOWxPr4+mPVTVbOnMBmPwMXfudEPN6QBM1/grcM4XO6z
	5EzYwg8MaEUBnpEsogKqoKKVn2pdZzqT5bT5PL/dlkeeXpVaVm8hPYRe5moTwLWPbTSHI
X-Gm-Gg: ASbGncuRixmY42lrNk61P+/XvP9+Kf2GwRoDQgI7BZzA0TYJtMAHlvXeeYKhV3nPjkA
	C8GNfJS7uWm/yDOdPjZLUPrYm/o1khtTEB8niD/oicWOnBQUWMFBXPDmAAVZA6QIhoo2TvkAQkp
	8A8BBS9WNGHv7oTFWrL7zwMc3d775Peey5QVINIduCw6vjw78mvLGWKGfOrW12Hlai3d7c3X6Ff
	BdKtI12/ocg+xDgMt6XVGOiUXgF/FzqgsEYZGbN16+KWsCsaUFhqFLJIT5xLhAsgJnaccAPfDg3
	Y75kwKp49R8ErT+tEzL9xBs4MfBNUmQ+QGAGT7Ey6z5pCw21LJs5ELTl90cYrymxle5F1Sgm0fm
	PK8CbDRnkZw==
X-Received: by 2002:a05:622a:155:b0:4ed:da56:7a96 with SMTP id d75a77b69052e-4ee58af100cmr45387451cf.60.1763749677485;
        Fri, 21 Nov 2025 10:27:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkOzQWoZuQdAiXMy2SX7/W3kkLRTcNrhy9ckhF61k6Ze2u2Lmzw86pdU9Kf7yewixDrfgpEg==
X-Received: by 2002:a05:622a:155:b0:4ed:da56:7a96 with SMTP id d75a77b69052e-4ee58af100cmr45387001cf.60.1763749676867;
        Fri, 21 Nov 2025 10:27:56 -0800 (PST)
Received: from localhost ([2607:f2c0:b141:ac00:2fb1:d1df:b122:3b2c])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4ee48d571d0sm41831021cf.12.2025.11.21.10.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 10:27:56 -0800 (PST)
Date: Fri, 21 Nov 2025 13:27:55 -0500
From: Peter Colberg <pcolberg@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/8] rust: pci: add is_virtfn(), to check for VFs
Message-ID: <aSCvKy64s-LBrM85@earendel>
Mail-Followup-To: kernel test robot <lkp@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
References: <20251119-rust-pci-sriov-v1-1-883a94599a97@redhat.com>
 <202511211008.jgLuTcrQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <202511211008.jgLuTcrQ-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l3jjQqijaWRs9RATS3_yeqAkIToiRJaIbHVFdQQsasY_1763749678
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 21, 2025 at 11:00:32AM +0800, kernel test robot wrote:
> Hi Peter,
> 
> kernel test robot noticed the following build errors:

This appears to be a generic issue with UML, unrelated to this series.

https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/CONFIG_UML.20maybe.20broken.3F/with/558611169

Thanks,
Peter

> 
> [auto build test ERROR on e4addc7cc2dfcc19f1c8c8e47f3834b22cb21559]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Colberg/rust-pci-add-is_virtfn-to-check-for-VFs/20251120-062302
> base:   e4addc7cc2dfcc19f1c8c8e47f3834b22cb21559
> patch link:    https://lore.kernel.org/r/20251119-rust-pci-sriov-v1-1-883a94599a97%40redhat.com
> patch subject: [PATCH 1/8] rust: pci: add is_virtfn(), to check for VFs
> config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211008.jgLuTcrQ-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211008.jgLuTcrQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511211008.jgLuTcrQ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error[E0599]: no method named `is_virtfn` found for struct `bindings::pci_dev` in the current scope
>    --> rust/kernel/pci.rs:415:35
>    |
>    415 |         unsafe { (*self.as_raw()).is_virtfn() != 0 }
>    |                                   ^^^^^^^^^ method not found in `pci_dev`
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

