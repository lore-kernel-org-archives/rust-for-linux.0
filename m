Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96982296BA8
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 15:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763996698; cv=none; b=trJ3+9BUgb23eCqiKpagY8KFLg3W2FifP+KPnPPkXuq+mDumO4ESntFLA7NA9fF5qVDzN8tug6lCgd0CvZ470FgrXCeW5w6K0jXCKkHeAmc00IegaDOZkBdEDvFmJtBInop1WglY8L83ucaWWiRUzJKcX4geZt3ph0SwdpJ+Mko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763996698; c=relaxed/simple;
	bh=bl8O5g3ALeboQPaSMLXPxJfO5WA5b0CdNxZur/No9/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BymUNdYoqKJ1/R6PiUXxSv+iyW0HxEWrx6gwufrFkmeQdiQpbAAU+Tk+MS30JxE543AUuar365p1J08Pvo8JLO76M4bXI3Q6kels83zJwRTrc64WDeopsfIPkyItIfP1XLOMprAQYMBEqYrNYgMII57JQ1efDMjJcnw+9a84c5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Seo4Hn51; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Seo4Hn51"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8824ce9812cso50191336d6.0
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 07:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763996695; x=1764601495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hJkIX+/oYqHEvlPsJeDpB/URfWFBCeX3FkBVuLqXA3g=;
        b=Seo4Hn51zNHsYulUvqaiu4rhJr7DWdzIuj+88Li+9dl/xNe9BIy072RP0vYvnJEp1D
         PxydQ8Z92OMsqMXoJv6pP4YtHTLVRNM4BaLphkBc5i4b2azg5nTXt2Cjzs9V7Agf+Dsj
         x5yFDsqcmLLT14Jr15kOVnQaCz+ODcD1fDDi8SVXrpxlNkSfnwHgraIAgoHnfJA9dMBe
         JEnwUaE7l7/BjfSgEft70OwdljHBMv/C2iV69fRa9S1cL4jVxh/tjWAbuL45CfcWrK7x
         F0btbk1fnk91rzKcMCjdc0ZgiDuUgks3wzUgjhx45KIiT/YVT11RI8NsJCIHI80A4ggb
         1TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996695; x=1764601495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJkIX+/oYqHEvlPsJeDpB/URfWFBCeX3FkBVuLqXA3g=;
        b=XIfwMjsffstAwTPRgqhmz+6jwo5KHvdrQsDWyGg3pWT56Rc3ZIG3otDzwIBlOZNFE7
         SCvZEm95LdQUsNtTTjn+ToA1WaGpfukV0YSNdiQh6cVJRtI3eon6pX36xOLhfIhFTsUg
         QaIh5ED04qELPKIYjsVSdF49GiTuZxcXzAtydA4tpXYN0k6LZj4VTEyHromlVVD0zJFm
         fBhuL7363HOaM33LYGOz1XSwWcPJCQmP0WdzRCe1c2m8We3cuTfQ/zZWEhjsjBwl1V0F
         K0LMBYji1po5t+FuGS0CxUSZuRs3xl/qTFM0UL9mkDvTg47CTJDwHUI1hHIq98Cl8C3X
         VlYA==
X-Forwarded-Encrypted: i=1; AJvYcCWOKCPc43Ut8uIN2ydbQM16nrgQyTaZ8oibk/70tltG90Oz9/AwPrZ+bFx4siquJw9M2XLD/P9ic8Bj0GdpEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg4+iMAztoQWh3ijOqK47/yI/7cT5t509+iLFNyX2YiGMAB1Ik
	ol8zh013smCx690oAYR5JaE84g3/7W70qWo4o56Re//dX/AoyrRtUves18Fp6Qb5NlQ=
X-Gm-Gg: ASbGncuhQCAkWWQS3bxATD7m+hjjdJugioeXNzRBuEezSbr8+2OuNANkuzvYgV2XHbh
	WmgtNd/6QJWLKXpqKMI/csEmEkNwNU+nBqvVnN54In53gFxMmzUg/Zmcs7YKN1Vemxj3Vs6P0sp
	PVsX3elFXgCGETXhbWa4tav0p4D1bGKHukuJclkK0GaY5ULVbnZimQ1bOMG5qwMHk/hGFKUKBq8
	w/WDwpw4cB+51SdUtDQWawWcXfv5e9lnaUYAKugc7mfyUCuKzGRC5rfGSdd/oQVRVxINX9upt2G
	KOT15+yj6JdzukyPxTVSicG3feNSrsQt3HFeM11n8v3TXW34sGBntJp143ZiTaaobLABTHcaRMV
	CNV9r2KAMyd0ccEvsl5ot63LVpqdmd3t7quR9dbMSScX9LW9jbXERZflMhxouZLzL/qL0VoEYA2
	G63B5DAfgE4+H881XIk+vqbCfR30Qw1pmC3BWnWY1OgBQjH9otxaWaPeKA
X-Google-Smtp-Source: AGHT+IG20MOuWEIxJFP5dPJrmOS1XZhPinNJnSppXMT9JqNqrVNc22rYssnBqVNHIcufpECT7fuYwg==
X-Received: by 2002:ad4:5942:0:b0:880:5193:1102 with SMTP id 6a1803df08f44-8847c53f239mr191314586d6.56.1763996692032;
        Mon, 24 Nov 2025 07:04:52 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e445b28sm100926216d6.1.2025.11.24.07.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 07:04:51 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vNY7W-00000001vQL-3WSH;
	Mon, 24 Nov 2025 11:04:50 -0400
Date: Mon, 24 Nov 2025 11:04:50 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Peter Colberg <pcolberg@redhat.com>,
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
	Ira Weiny <ira.weiny@intel.com>, linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: Re: [PATCH 7/8] rust: pci: add physfn(), to return PF device for VF
 device
Message-ID: <20251124150450.GS233636@ziepe.ca>
References: <20251121232642.GG233636@ziepe.ca>
 <DEF5EC79OOT4.2MT1ET4IKXS5Y@kernel.org>
 <20251122161615.GN233636@ziepe.ca>
 <20251122185701.GZ18335@unreal>
 <DEFKSDBXEQS0.3C79SP3HEG1OY@kernel.org>
 <20251123063456.GA18335@unreal>
 <DEFZP148A2NK.29G6N1V1SXT8T@kernel.org>
 <20251123111823.GD16619@unreal>
 <20251124135725.GO233636@ziepe.ca>
 <20251124145332.GB12483@unreal>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124145332.GB12483@unreal>

On Mon, Nov 24, 2025 at 04:53:32PM +0200, Leon Romanovsky wrote:
> On Mon, Nov 24, 2025 at 09:57:25AM -0400, Jason Gunthorpe wrote:
> > On Sun, Nov 23, 2025 at 01:18:23PM +0200, Leon Romanovsky wrote:
> > > > >> That sounds a bit odd to me, what exactly do you mean with "reuse the PF for
> > > > >> VFIO"? What do you do with the PF after driver unload instead? Load another
> > > > >> driver? If so, why separate ones?
> > > > >
> > > > > One of the main use cases for SR-IOV is to provide to VM users/customers
> > > > > devices with performance and security promises as physical ones. In this
> > > > > case, the VMs are created through PF and not bound to any driver. Once
> > > > > customer/user requests VM, that VF is bound to vfio-pci driver and
> > > > > attached to that VM.
> > > > >
> > > > > In many cases, PF is unbound too from its original driver and attached
> > > > > to some other VM. It allows for these VM providers to maximize
> > > > > utilization of their SR-IOV devices.
> > > > >
> > > > > At least in PCI spec 6.0.1, it stays clearly that PF can be attached to SI (VM in spec language).
> > > > > "Physical Function (PF) - A PF is a PCIe Function that supports the SR-IOV Extended Capability
> > > > > and is accessible to an SR-PCIM, a VI, or an SI."
> > > > 
> > > > Hm, that's possible, but do we have cases of this in practice where we bind and
> > > > unbind the same PF multiple times, pass it to different VMs, etc.?
> > > 
> > > It is very common case, when the goal is to maximize hardware utilization.
> > 
> > It is a sort of common configuration, but VFIO should be driving the
> > PF directly using its native SRIOV support. There is no need to rebind
> > a driver while SRIOV is still enabled.
> 
> It depends on how you created these VFs. If you created them through
> native driver, you will need to unbind and bind it to VFIO.

That should not be done or encouraged.

Jason
