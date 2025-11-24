Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6E2305958
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763992649; cv=none; b=bD7R9ngGDmjQRenuVNBqnw1nRf4sjzllCIz/5tQvDyFGCvrSOnoeJDgLFu9HmcBfD3rv/ij1+7NLXD1sbbhtbkSGQAtT+MhtzFf/EqxVYZ1prQPthAGvl9zY/oirhJ3B6zvxeIcsf2GZLQxh/EOA6pQ9CaUM5h4vTZqLZq+xRyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763992649; c=relaxed/simple;
	bh=/LmKaHff4nntcfS7Wy3MKDDclaL6d71CVaMNMyFBJbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDLATiY/Ys0w5L9u1d8fWWZDgnQqynvLNw7Obp0yDXA1MBLSvss1rqQycjMXhYMGazbwnm8BqtV6dtNxwzt80mgSlF5/+sflUGJEov3KrE5aRL/FtXveR7dKXuq3EKUDAswmQ5GG9YoR+8HZ8BsdnSzwQO3+e5NOBb/bdKv7oWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=EaMDmlC9; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="EaMDmlC9"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b2a4b6876fso622011885a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 05:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763992647; x=1764597447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FzGPtEalSLjcMtqSWV6EEbKRU29iQ739nTvOMeKCmHo=;
        b=EaMDmlC9UOBcx1QWZTOUOiS/T4wkfYrAXLfBL1hSpscZb5Pxcx6SSduoqB2zMn1qKm
         qUFZbdYBulW2En/JqAVG1QR9OA0LjnnQFtCLSWikpC79vPUkiYQup+nABQ0dkazPZLBJ
         tb1duaPx3pG2nEJupXyuiI5/yekYcFhTRiF2d6SmtovLJtLeiKU5MvqMDQcJCpgh2F2A
         4FYetL0FHE4et25z0xfuZxft1c6dAkTxS5JB37xB9aMJPd+cXgu2v5BDNNUchsmQ/pAq
         9vNnhNlpncgnUhpi4LjbsAmCu1pjhhSvEHf+sBeNXgFMHIJXAXklc6RkdEPIxauizUp5
         yXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763992647; x=1764597447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzGPtEalSLjcMtqSWV6EEbKRU29iQ739nTvOMeKCmHo=;
        b=o+Fw9pKYDCnmAqLF3fHxQUBXFitCCHQIImiz3XvYJ/V5/NDL3SHk4Z1WZXH0kzBZIJ
         Q1W+zC+9REoqGaS8QqxtT3808QK5lxQl/UjyRyPyY/f8NCgTaXGL42tzTtc+46HIA5OQ
         c5OLSUa0YjJ4DYs4CgZ79aGaTB7emfFOIsw0mlemkNaeRO8qvPeM7ay95pUjvi6z9YB8
         5kmKZrzmhxwtmssOvtdcY18oetYa8uueqH3aeXix81VyYoJO8nY3XqStXqqx+K/ayXA5
         idS3xH5km86RpLG0WlHWDhSCuCm/xCIAt1WBXE0maTCjaM5/+WwtkvacLvvgr8/AWKhf
         gxTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6ZIjGgSKqaAXf3M4B6442WdJqUhk3WKvtp8UOVCJ6JT9oJbOp5QSeCCkINOBar79era9InBgNPYYfCgfpUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrCBMx2oHs0PDqj/jk2NFw9XLLA+na9KAEPAE6v9KyYHci10RU
	Mo/za5YiKIxYXCF8/qGqp2oV+TTe+9Lnse6ZGFDm2XRfQQdGAcLYcER53uT7vlvTuKQ=
X-Gm-Gg: ASbGncshtuYcfqHj0Dm7mmpdWs8A3tDADenHWZFKlaYNntdoUTOATeL7P01iw9INrip
	A2NJADDaW6IHV3pT/Y0mIvsJ9r5f8HWc/Bfu/YqYqWbs1rDBeseDy6NgZlRUDioRcdqoiwTYY+M
	5tCqzCvZ6mqY8fhe4GNPYKxNjf8nqCDe9xoNbs+rRGvlCH4Nlz8Cr2qmlRfBfy3joALVBmSbJ8z
	4OmFDILiWokKpucKmkPtafue3aYRm4VTlYV1HsBDLEq+Mr5aO7ddxjdGuhkPVjNfhq8Ig556jzV
	T+h/zUiQO0rlLW02Isu3DWW7FmOKM57Ws9CpZPi6i06m9yhslhpWTrOj1nFVZtSljY8oOerFkcY
	ecVB+SRkciqwgvcdS6S1gZbzGHeLO+n4DLovsYnK4PDn8UqAtbBTgmn6xyuPboqf52IZM1b4ax/
	RqtSB9Xvy4IPLh5MVe2taXuqtcmEdBH6UMG2Z5Km0R/q+jvXQJ87lHSmq5
X-Google-Smtp-Source: AGHT+IEPe/syhuKX3O6wJfzn2tFHtIYyLXPv4mSXMhK4WSxfHaFJjzLBvTrU3KR8SZjQD2Av3g8vkw==
X-Received: by 2002:a05:620a:29d0:b0:8b2:dec7:d756 with SMTP id af79cd13be357-8b33d4cafd0mr1624311585a.66.1763992646911;
        Mon, 24 Nov 2025 05:57:26 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295de540sm943003085a.42.2025.11.24.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 05:57:26 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vNX4H-00000001uYc-21zH;
	Mon, 24 Nov 2025 09:57:25 -0400
Date: Mon, 24 Nov 2025 09:57:25 -0400
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
Message-ID: <20251124135725.GO233636@ziepe.ca>
References: <20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com>
 <20251119-rust-pci-sriov-v1-7-883a94599a97@redhat.com>
 <20251121232642.GG233636@ziepe.ca>
 <DEF5EC79OOT4.2MT1ET4IKXS5Y@kernel.org>
 <20251122161615.GN233636@ziepe.ca>
 <20251122185701.GZ18335@unreal>
 <DEFKSDBXEQS0.3C79SP3HEG1OY@kernel.org>
 <20251123063456.GA18335@unreal>
 <DEFZP148A2NK.29G6N1V1SXT8T@kernel.org>
 <20251123111823.GD16619@unreal>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251123111823.GD16619@unreal>

On Sun, Nov 23, 2025 at 01:18:23PM +0200, Leon Romanovsky wrote:
> > >> That sounds a bit odd to me, what exactly do you mean with "reuse the PF for
> > >> VFIO"? What do you do with the PF after driver unload instead? Load another
> > >> driver? If so, why separate ones?
> > >
> > > One of the main use cases for SR-IOV is to provide to VM users/customers
> > > devices with performance and security promises as physical ones. In this
> > > case, the VMs are created through PF and not bound to any driver. Once
> > > customer/user requests VM, that VF is bound to vfio-pci driver and
> > > attached to that VM.
> > >
> > > In many cases, PF is unbound too from its original driver and attached
> > > to some other VM. It allows for these VM providers to maximize
> > > utilization of their SR-IOV devices.
> > >
> > > At least in PCI spec 6.0.1, it stays clearly that PF can be attached to SI (VM in spec language).
> > > "Physical Function (PF) - A PF is a PCIe Function that supports the SR-IOV Extended Capability
> > > and is accessible to an SR-PCIM, a VI, or an SI."
> > 
> > Hm, that's possible, but do we have cases of this in practice where we bind and
> > unbind the same PF multiple times, pass it to different VMs, etc.?
> 
> It is very common case, when the goal is to maximize hardware utilization.

It is a sort of common configuration, but VFIO should be driving the
PF directly using its native SRIOV support. There is no need to rebind
a driver while SRIOV is still enabled.

> > You're mixing two things here. The driver model lifecycle requires that if
> > driver A calls into driver B - where B accesses its device private data - that B
> > is bound for the full duration of the call.
> 
> I'm aware of this, and we are not talking about driver model. Whole
> discussion is "if PF can be unbound, while VFs exist". The answer is yes, it can,
> both from PCI spec perspective and from operational one.

This whole discussion highlights my original feeling.. While I think
it makes alot of sense to tie the VF lifecycle to the PF driver
binding universally there are enough contrary opinions.

> > At least conditionally (as proposed above), it's an improvement for cases where
> > there is PF <-> VF interactions, i.e. why let drivers take care if the bus can
> > already do it for them.

Drivers like mlx5 have a sequencing requirement during shutdown, it
wants to see SRIOV turned off before it moves on to other steps. This
is probably somewhat common..

So while it is nice for the bus to guarentee it, it probably also
signals there is a bug somewhere if that code gets used..

Jason
