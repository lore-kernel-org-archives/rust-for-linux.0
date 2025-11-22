Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08546165F1A
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 16:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763828179; cv=none; b=cf+9HuWbPwNYHeN5poVYI2aWdDiuvgeiVMiczQFs0ea5h9Uiy3lVyp5icYuIGBzWonjDcZMeqKncI4vZ4K74hExLizRPrVMUJ8pjDgOXCjrEBOXMr3b/YSqtEDuIBnR6qf37n0AIoPJ7R/FTYi7h77y4TmFaXZrMHObTUF0Z/8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763828179; c=relaxed/simple;
	bh=pX1YA89IFaBfU73d2M7GD+pvLG2iw0jG0aNV0L0Rb1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlnMXYjYZFiv05Xg/IhD1hcgigFmso59GVStKbEsvjErLExffk3D4xwyBvySe0pCpgpwUvT+Dv7fQOyZG2km47yoqpQlXVjUXMu/i7TXnvqoEsp8oT1Ay+/2oZwLEMcAsFwLwaeHJo2xoDX9sMBWZQQevYgvd0McW3ABq6t+JNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VAO9RDsc; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VAO9RDsc"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b25ed53fcbso432370085a.0
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 08:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763828177; x=1764432977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sliu87rcQ4v9m7OKQVz8oJsdxUbx8a1OkxUrYzQlGV8=;
        b=VAO9RDsc8+WmkHc8uVX7Jv/DckBEBB6EAN+lJDwkitwFRCe4zShHFcHgYQve88qLoG
         2jO3ZvYqXRAj+NwtiPfpi9lPFagb/Io13NiRofn2G/Hn7AYz8Sxs/Q/K3jRsb/L/HqUa
         UkaiS71usW/WwFCkQaywnv4EluNYK9g/xwtVYfw4aa1kswWj72vISRhWjOi6ieUUqAUi
         B7tSIVQqeeN50W0YhniCf7R1eM8dRJ0XB84rCTCCvyjFfwBTgZ7jiYyO/t6kccYpw0kb
         FScZpVRGo1FwyqOVcbDCEkGMLb0BeW14AXZoQ34UEp2KNojcPuUqGUaQS6IosnOtZ019
         aIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763828177; x=1764432977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sliu87rcQ4v9m7OKQVz8oJsdxUbx8a1OkxUrYzQlGV8=;
        b=fJou5m3+zEI/V+gly5tLmE716fIEOB+Z4SQutZ6UmQR2BHMjn+6JhvrVGqwi6DZT7m
         z1cy1BoJ+NykfPebYv8xuqhtSpu1UcPt/3qPqlu/c+20h1/SXsoKSLBMjsfhPT1Cc3tC
         DvK3KJWtaRhejqbOETcoEUt9sO5+CqihcGQDykgIU7+jh1wbR4edInHDjqWvB5yBDSIe
         vcowL5o+zahL5jxSdGns4bg48anu1HFt6df57Q+lpOugEVIi+vTT3lQQu3yDvKVd8nTZ
         kHVy7ZLBFjqV+xdklMIsl18wIbQ6XfSzK8HaZbPaUiOXa+QZb/HJB5DTrX6pxHEfgcSa
         vDcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5rZsv0ZcFVydul8ieIulPEN+k8ffVS1YBdDLQLzYPkTD4epD41Sqajl5QdhQJYBHyyz25Ka2RUoyawlGsEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaKX38jbWfyYqryRvDB4NRojgqrnkQQ5eXexTd8M85gOqABcps
	fMwdH4p7eHueEYU1ApvvSpYJx+FOy6o26ZDT5nBxDp+SFjJEOIf+3QdQWWhQQYzNE7Y=
X-Gm-Gg: ASbGncuA9XEPwHtqEPImv3Rih3SsqQ9f3M5xjU1N/KKxLmOfbQrOj1WWNf+Z9RycS2m
	C60lGyNVhKFIH4kMtxhU/oskcGqpUmnpZKkOpD6iFd9PF0tMlWIUJnoqWfnGPFLoT6zTsMnG5b5
	uXYUfkg3qIWTsXB1EiteXQ8UL2JnBWfK9dhA138t79MHsLhw2rv+6MistnZWt8fx5QFOYZuWSfX
	BticDfFL3WQxwayHK2gDvuzPTIv5oL5qerIt1/GLAEDr1VCX9cAbfOeX43Lj6kB1Q8rq7N5kqf/
	91xwV9s+dtCdnql3+RJ9j17h8ilrXr7A/6Q6QBsefE9Pr/x/D5H5pdOQgA/n9s4ykrGh1Lw6OnF
	O6XxRdhMO3YK8dhBhLLPcMODXCUNso60gcgMqjX/2QsUeJbBCQkyccKQmIUZvBoyoimGsULx4Z1
	xsl7KMmyjIW2qfKjW8F5EOjjpbDIbuE706Er75/KZIZXcVwayteg3oGZeJ
X-Google-Smtp-Source: AGHT+IF1xQ2aXOZRSJ1Y/AkYKw1MLVQYnPBGBGfU9G3n2kPz5F4Qyqm9lRjPssHmLTF/RCQSZSeLVA==
X-Received: by 2002:a05:620a:1905:b0:89f:66a7:3385 with SMTP id af79cd13be357-8b33d203a9emr723597885a.7.1763828176658;
        Sat, 22 Nov 2025 08:16:16 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db8b1sm586245985a.40.2025.11.22.08.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 08:16:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vMqHX-00000001hDw-0FJm;
	Sat, 22 Nov 2025 12:16:15 -0400
Date: Sat, 22 Nov 2025 12:16:15 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Peter Colberg <pcolberg@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: Re: [PATCH 7/8] rust: pci: add physfn(), to return PF device for VF
 device
Message-ID: <20251122161615.GN233636@ziepe.ca>
References: <20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com>
 <20251119-rust-pci-sriov-v1-7-883a94599a97@redhat.com>
 <20251121232642.GG233636@ziepe.ca>
 <DEF5EC79OOT4.2MT1ET4IKXS5Y@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DEF5EC79OOT4.2MT1ET4IKXS5Y@kernel.org>

On Sat, Nov 22, 2025 at 11:23:16PM +1300, Danilo Krummrich wrote:
> So far I haven't heard a convincing reason for not providing this guarantee. The
> only reason not to guarantee this I have heard is that some PF drivers only
> enable SR-IOV and hence could be unloaded afterwards. However, I think there is
> no strong reason to do so.

I know some people have work flows around this. I think they are
wrong. When we "fixed" mlx5 a while back there was some pushback and
some weird things did stop working.

So while I support this goal, I don't know if enough people will
agree..

> With this, the above code will be correct and a driver can use the generic
> infrastructure to:
> 
>   1) Call pci::Device<Bound>::physfn() returning a Result<pci::Device<Bound>>
>   2) Grab the driver's device private data from the returned Device<Bound>
> 
> Note that 2) (i.e. accessing the driver's device private data with
> Device::drvdata() [1]) ensures that the device is actually bound (drvdata() is
> only implemented for Device<Bound>) and that the returned type actually matches
> the type of the object that has been stored.

This is what the core helper does, with the twist that it "validates"
the PF driver is working right by checking its driver binding..

> I suggest to have a look at [2] for an example with how this turns out with the
> auxiliary bus [2][3], since in the end it's the same problem, i.e. an auxiliary
> driver calling into its parent, except that the auxiliary bus already guarantees
> that the parent is bound when the child is bound.

Aux bus is a little different because it should be used in a way where
there are stronger guarantees about what the parent is. Ie the aux bus
names should be unique and limited to the type of parent.

> So, if we'd provide a Rust accessor for the PF's device driver data, we'd
> implement it like above, because Device::drvdata() is already safe. If we want
> pci::Device::pf_drvdata() to be safe, we'd otherwise need to do all the checks
> Device::drvdata() already does again before we call into
> pci_iov_get_pf_drvdata().

I think to make progress along this line you need to still somehow
validate that the PF driver is working right, either by checking that
the driver is bound to a rust driver somehow or using the same
approach as the core helper.

I'm not sure the idea to force all drivers to do disable sriov is
going to be easy, and I'd rather see rust bindings progress without
opening such a topic..

Jason
