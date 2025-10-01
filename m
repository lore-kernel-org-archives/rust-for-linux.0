Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD6F22DF95
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Oct 2025 18:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759342600; cv=none; b=lqEqdikY6f4uFxJOM1ozHTefHQiOEuGXshmqdOP2azMunl/qgtOS59/mfhnDYddsoTP40aCUCCozcg0D4FtS91yBT1X3Yn+69M7UHSQKwmXWHy8M2CzUs6317MfwWD+1C2eygDtscgieE7K/UVx7W/DFacqw8uQguJXu5ZcFqxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759342600; c=relaxed/simple;
	bh=C3elPI9v7C6y0EwKsTNJ7aKVDWwycBt2YooymvV8Ass=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CMPNMKMpQ+z5SCZ1S/LUhLGxrCAuS2hO5AhoYk2e7wKc6RhcdR7GP36KgcPp8XxwpI8ImwH99IFggobMmgFWeHuI/lxi+8VZg+Pe/tWKZgFwxJBj/EcLO0oLclmj9eDYtAn/W6TnN5SViusmi48wQUsG5kz4aWZCyHnoxrObE1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LhbUZI0F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LhbUZI0F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759342597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hl5yRJD3IkUvsBwDHH8M7CQ5CZxrZ7ikFZVETEwQEng=;
	b=LhbUZI0F0FZsKxTLkFtjRUzvuRePKRKxVcSmlBWPTcplLCnZz6QFdOl9UQ8Aik9L1UNVP2
	YaNhcCn2XM0R51lQrk4BXqwiZA5H0xAjeImpDRL9Crd5JywzWC1h7NNSd8VOiYDEJCN5u7
	syqCywWIHBAmUwl0K5l1pdsJNrIkovs=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-UJqDbQbmOxKkDva4EWq8mA-1; Wed, 01 Oct 2025 14:16:36 -0400
X-MC-Unique: UJqDbQbmOxKkDva4EWq8mA-1
X-Mimecast-MFC-AGG-ID: UJqDbQbmOxKkDva4EWq8mA_1759342595
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-4272d0bebf0so324105ab.0
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Oct 2025 11:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759342595; x=1759947395;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hl5yRJD3IkUvsBwDHH8M7CQ5CZxrZ7ikFZVETEwQEng=;
        b=s3xqhAp/yq6hiQOF1QDc+FZSIVnGy/SuTbnLaKRlCSj2tItEWx7W52t4vqZ90cSiAQ
         0k1tSHJQ4Xf9Z3Hqm7lfY8pnnnpN/I5lPuE8S5wZLUCBmm2Yvratq63vIARHyyxLuZya
         kxodigDEseJZnTXpa8dQnL3urMpdes99cNntCO/vYuNlPW0TW7Cw8WUPOL0Tm2FodbHX
         dqT5hB3gp64uoJFc7F90eG9POllOWp0n+rGpuxJgLV/yTRwNRi2ucEw312/0cZF3Txze
         oBzphgwmaHQQyt7z2kfNnV2+MDWvs0QP485VZjL45lCjSPsZ/oTJ92m/wLEISN2yupZS
         CCAw==
X-Forwarded-Encrypted: i=1; AJvYcCW5wdGeyCpKiv+ImbVoDp1Zi0bKk62/37DOhtdiXKhtwJyiMaq3bSE0w0DxynmUTgQNCFTknAjKGNI7v2Dm+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyZ8+LS3wqAfE3lL8nQVoNAKT7EdOIpcp3ZUsGZDK9hbZFLs+d
	t+oROAiHhHq/s+lHnLNBPG9Uq2L23OdH5nscxigtQD6J0PiwKtlTdpJTUBoOBdNPnrNr6RBXiSq
	C8t1dCy5NYyVp+Jnn//8ftMCeumocsvGuP/WmoskLKf+p5YS4quRaavt1c4In9ZftOCgX
X-Gm-Gg: ASbGncsiSSuLghmJFkmVJZepuy5t1+aPLrjEKrud5Tzp4jjjxBRwgYF9dzVuiE5FylS
	0dLaa4zxsM9HDXOUMoeKhQXKjULX06VSA9L8wZN3VQR5AytIUH7UM04Xmbo/IVFdsbCzFQXqrOm
	VJ+5EA3VDl5r/US7RIN3t/bZwjy5fqgnIb9p/yTcrg5g7Ner90CCo2pDt4JGlvn4iXpPj4QoMT/
	gF/PoForN8YX733gTYsviEVokQbQpGPRu+pnOYsdwUj+BDRZlS932IffbTKjICuuhg7GGV2iK+z
	QrBVTJkhvt02fNExj7A9rlkInMTb8znImMsz4o1t64CkClYz
X-Received: by 2002:a05:6e02:156a:b0:427:8d45:a545 with SMTP id e9e14a558f8ab-42d8167ffcbmr26826865ab.6.1759342594767;
        Wed, 01 Oct 2025 11:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz1/E65PrFu+RbIoFX/NgQBsZUTxT4dfgeMXQ472VKwtzi9DsWrZBCgFVcbSRmX9luhz8ANQ==
X-Received: by 2002:a05:6e02:156a:b0:427:8d45:a545 with SMTP id e9e14a558f8ab-42d8167ffcbmr26826495ab.6.1759342594322;
        Wed, 01 Oct 2025 11:16:34 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5e9ec3afsm62945173.5.2025.10.01.11.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 11:16:33 -0700 (PDT)
Date: Wed, 1 Oct 2025 12:16:31 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Surath Mitra
 <smitra@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof
 =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] rust: pci: expose is_virtfn() and reject VFs in
 nova-core
Message-ID: <20251001121631.7f2e68f5.alex.williamson@redhat.com>
In-Reply-To: <20251001144629.GA3024065@nvidia.com>
References: <20250930220759.288528-1-jhubbard@nvidia.com>
	<DD6K5GQ143FZ.KGWUVMLB3Z26@nvidia.com>
	<fb5c2be5-b104-4314-a1f5-728317d0ca53@nvidia.com>
	<20251001144629.GA3024065@nvidia.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KPp40o8TYadfKbuKQABEEl6SafWBd9JaR5SSx5_yRkE_1759342595
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 1 Oct 2025 11:46:29 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Sep 30, 2025 at 06:26:23PM -0700, John Hubbard wrote:
> > On 9/30/25 5:26 PM, Alexandre Courbot wrote:  
> > > On Wed Oct 1, 2025 at 7:07 AM JST, John Hubbard wrote:  
> > >> Post-Kangrejos, the approach for NovaCore + VFIO has changed a bit: the
> > >> idea now is that VFIO drivers, for NVIDIA GPUs that are supported by
> > >> NovaCore, should bind directly to the GPU's VFs. (An earlier idea was to
> > >> let NovaCore bind to the VFs, and then have NovaCore call into the upper
> > >> (VFIO) module via Aux Bus, but this turns out to be awkward and is no
> > >> longer in favor.) So, in order to support that:
> > >>
> > >> Nova-core must only bind to Physical Functions (PFs) and regular PCI
> > >> devices, not to Virtual Functions (VFs) created through SR-IOV.  
> > > 
> > > Naive question: will guests also see the passed-through VF as a VF? If
> > > so, wouldn't this change also prevents guests from using Nova?  
> > 
> > I'm also new to this area. I would expect that guests *must* see
> > these as PFs, otherwise...nothing makes any sense.

To answer this specific question, a VF essentially appears as a PF to
the VM.  The relationship between a PF and VF is established when
SR-IOV is configured and in part requires understanding the offset and
stride of the VF enumeration, none of which is visible to the VM.  The
gaps in VF devices (ex. device ID register) are also emulated in the
hypervisor stack.

> > Maybe Alex Williamson or Jason Gunthorpe (+CC) can chime in.  
> 
> Driver should never do something like this.
> 
> Novacore should work on a VF pretending to be a PF in a VM, and it
> should work directly on that same VF outside a VM.
> 
> It is not the job of driver to make binding decisions like 'oh VFs of
> this devices are usually VFIO so I will fail probe'.
> 
> VFIO users should use the disable driver autobinding sysfs before
> creating SRIOV instance to prevent this auto binding and then bind
> VFIO manually.
> 
> Or userspace can manually unbind novacore from the VF and rebind VFIO.

But this is also true, unbinding "native" host drivers is a fact of
life for vfio and we do have the sriov_drivers_autoprobe sysfs
attributes if a user wants to set a policy for automatically probing VF
drivers for a PF.

I think the question would be whether a "bare" VF really provides a
useful device for nova-core to bind to or if we're just picking it up
because the ID table matches.  It's my impression that we require a
fair bit of software emulation/virtualization in the host vGPU driver to
turn the VF into something that can work like a PF in the VM and I
don't know that we can require nova-core to make use of a VF without
that emulation/virtualization layer.  For example, aren't VRAM
allocations for a VF done as part of profiling the VF through the vGPU
host driver?  Thanks,

Alex

