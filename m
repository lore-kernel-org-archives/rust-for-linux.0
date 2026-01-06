Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C0535979
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 01:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767662559; cv=none; b=IRbHlspTB9vg+m+3bM7DNFTi/ca1yyOl9Z6D9S1Y34kt1CVbMXZwFAnWSrZ7KyZtGby5c5Mp/k9yNkHLl/pr7iEvM/35FsLK0J4wQaHFfa9VZpSB+5jahLfRqM4hqdGxzf+4/WOFBRzNzMUovhOIiVPrUGR5+Sh4boR7rsxQFVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767662559; c=relaxed/simple;
	bh=mf215Bsa4OZ4GFhTmkkQox24BB3kx7SzucOQ9uwqDKg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7pGU4YF6CkDTOGCqZYoyN9qDLWjn+B08YHvuwM9uV6aWVT1tqD3HvRq5Mawds8UIg54TLGuh3VJYYrbI/mBdPHJm74Yp5G8HDPNC30d3Aa2lK1YaOt0MiL9tWW+44XG1Q/Hu4Z/sXgOR8IU7kRvWSLwbabPdfUv05oI3sibvD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=TqrDTOwj; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="TqrDTOwj"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8888a1c50e8so6006506d6.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 17:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1767662557; x=1768267357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mf215Bsa4OZ4GFhTmkkQox24BB3kx7SzucOQ9uwqDKg=;
        b=TqrDTOwjz6fSGo0ZF+XuLdJSbjBY0eDt55jeHuKkXmR4vuDZDnYVhGY4h69TPzKdBn
         79uYHQeKTp2jdebNIoLyC6JXZLOWBhhLqVCML7Bs1SusmdmL5WhkCSYvUj8RtCF0mBZX
         TXae6VzxuDteAlGeIP+IPok+OffPS09rb3UfUZRwKnanQA4Iwf1AckEo+Ow+3ebL9oLs
         Hg7PSFJFNMDeF2qyLYb08X9jSNnGRmrNeedow1HiTqtrJx2oZjK2XG3r0ZyqbDRua5ci
         tJuehSuFoN18SbREgFVFEZnjg88PS7s/+YTXXy0p13sFNazpAakbWRtEtQlIInu+h5rX
         q87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767662557; x=1768267357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mf215Bsa4OZ4GFhTmkkQox24BB3kx7SzucOQ9uwqDKg=;
        b=DFZoiBunkamEsFqL2CQotRkvpa9g/5AHBTMel8I7K2IvSnUSPes2jwOpH6jS9CHUlh
         2uurbcd6eo95KCAQgAziqV/63ADO4jKDUiO3nyyHjeFTdCnRKWK6Mi5tSB9MUEb49jS6
         NitXt6JQITc5cQUU3vL0kzZaHHynLyqAuy2/T2Wz6y5irCQzFpS0vwOQHtyfT9Hwt5QS
         NDA+86fGvdsl1JSQHE+H8g7fKb/PjdWISIKZ8gtAmsyo0YXM1s72rzuY4Cude2cKtCv4
         DkoCCv/2ggttt+LHXZPSvuWBIPEPYq4SWMD3KtPYmgDVcUr2EiCBkvpupHX9eKSGh4rb
         IbCg==
X-Forwarded-Encrypted: i=1; AJvYcCUnCaH4TPlGHmngfX5Qv5fK8cUZ75rHTJKebvFSNeGmJ6xLCRM38AferVnaQEXog2fDIEnpyupjrVXR6Q5SaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygP9NIQGAvow1AeWrFkF8fQz/AH8uIvi0PkI3tR2Zc4QRYdNqI
	0PShrpSN7Q0oMFxWyTYLjwjVKOA4EiPjO1sijOuxo+7Aapxd2bep0a9xTufG0HLoBjw=
X-Gm-Gg: AY/fxX7cePnTZS+h5MC/Fpb6Gv0ikWsb2IiDDZ+m0K0pnhrmN0qaaKe2i4AUps1eKSx
	D7JuCcDn1zBc5+qIKHMOCuLIkU5xstbC0OyqSYg+dww+bpmQqM9KoTmwYbR2O9SXHDY7fhGjjjl
	MbybopsgOaBB2/0dWCYfZ5RA2O1WoDFG91GPTsBwAoqEccwo4XqaSFGZuSS4YVUeS4ehS3AmhlV
	gogMh+1+vlCEIyo/r4BCKYbhP4p4WqdzTniAXmGQC8xzw9YdzpRp2FLYUKuUoQjpk/IqLcGkhF0
	IUqnVJvOWHwAqPDSdocgVkh26X3BVWtS6jp9r7HXwtJU8b8Ztqy12Cne6QsaWVZPkAXksl1/4J9
	XDktolCYaQHqURPi0Ht0ZnpV5L87EMLR7y+L28LZrT0qvKZT3c6kYfyRNIJWORkSYSiq+AZABjR
	PdiQKDBS1c19lmeXGQ4+1XXSVXct50wusyMBPwo1nFNc4/K9m3UOJes7ivXiSddpIR7JU=
X-Google-Smtp-Source: AGHT+IEM15GR/5Y9ogD77tynVPoOaSnflk3CNBwLM7mh9tKkkP1Pq//+VzH0PJSrypNvdcoLpzXtUw==
X-Received: by 2002:a05:6214:f07:b0:880:54ac:79f8 with SMTP id 6a1803df08f44-89075ecfd7dmr24591926d6.48.1767662557174;
        Mon, 05 Jan 2026 17:22:37 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907724f06asm4814886d6.40.2026.01.05.17.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:22:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vcvmO-00000001EhY-0HWP;
	Mon, 05 Jan 2026 21:22:36 -0400
Date: Mon, 5 Jan 2026 21:22:36 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: Re: [PATCH 3/8] rust: pci: add {enable,disable}_sriov(), to control
 SR-IOV capability
Message-ID: <20260106012236.GR125261@ziepe.ca>
References: <20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com>
 <20251119-rust-pci-sriov-v1-3-883a94599a97@redhat.com>
 <20251121232833.GH233636@ziepe.ca>
 <aUrquI3X68Ilmebh@earendel>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUrquI3X68Ilmebh@earendel>

On Tue, Dec 23, 2025 at 02:17:12PM -0500, Peter Colberg wrote:
> Further, enable_sriov() is prevented during remove() using a new
> flag inhibit_enable in the pci_sriov structure that is set before
> and cleared after the PF driver is unbound from the device.

Doesn't this need something concurrent safe like a revocable?

Jason
