Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFC1331215
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 21:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770326836; cv=none; b=cOa7ey1TDMBhkgv9b+mZxINbtbetxf5F1gSdM50mh61rHkCL5jsmscXY2P7rnE7Hq3zK3Yv5MQZEcHcX8LqJB/QxTTOQ5W+ZGg8SuAIecsLPEo0N0hUlw18oJCMw4LrokYmNkIZerHPmV7ClgBcUG4EE3HfaDB1k/HWFoiByqJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770326836; c=relaxed/simple;
	bh=onUcEIsNRNpDK4k+ZwYKjhl/82j2tz+8TXLBfpER88U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ibUYr7ciqIBbocnlo3b0fzWhJcYcNV7MM+8JpyKDCUAn3EddtushEZiU+ihGrDIR6yQoIoGroYvPlVP9xVfDrEZnw78eLpTItKvsTjkBqRN4GdTNEtioX83wS3xqfncQnCM8QveMbJm01OUqoQC2KPupUcCVYeSOx802fVuFwaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IkiV7WEJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IkiV7WEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770326834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rGchRpNtHpsURPrx/vVHrgmCPFSkjjSjv6Ar1R+yRYU=;
	b=IkiV7WEJpTiUrUhfoG8JMj94girazSGWjdLGAtGZEOv7sed9e42/rXhlHFO8DCuriBG8Qj
	2aEkFF04gs/+SnxlVIazVjrJe5qSwrQeFG3dn8Rm3mbcKdqs9ljGO0MHYsNTsuaJ0FPoNO
	fm36TnwoajBXyO71WZarSqwjfXP5EOE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-L0IxgfU7NRSyqdYxSJ8PWg-1; Thu, 05 Feb 2026 16:27:13 -0500
X-MC-Unique: L0IxgfU7NRSyqdYxSJ8PWg-1
X-Mimecast-MFC-AGG-ID: L0IxgfU7NRSyqdYxSJ8PWg_1770326833
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-503342386a8so1779711cf.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 13:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770326833; x=1770931633;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGchRpNtHpsURPrx/vVHrgmCPFSkjjSjv6Ar1R+yRYU=;
        b=Qf8rCJmY52ilULOkT3zgQIO6NzdZJlww9a8kfI+mbKV046G5rk/yBM9EKG9nwJGJVH
         rf+6t5kUsqoVKelxzcQpIZUHBhk7rIQ1BUo0bLMsp4mFzHDw9kSiQyKvddyo55kRpXyf
         VnEE8YniD/+/S/h4x1WgR5CEhpO1l8ndUMcnJTKyfV0aT+IvqoZ2GeFK7GpBXHDrGHuB
         QV/+F89pFFMnQLNnKZu+z1ACcyOA5uT2FWk90TlbISmQQIdl72kHVJ1pKFwIhriJk9JX
         cfZ3+W8aakmCFwWeOw8/uhuklogt/dHsCNEmYu4jfBFWrxsBnEwPy4LZVERpj75xS0yY
         /9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnDEcLdONzHHih821uj5Q6hx0bL8wVxAvzX3bWK5oW+/AbDbmtYb9fMN8h5AI9DEFCtM7n3zIl2OSPwJ4W5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYWhX/Uq9W00dWRRKU7YrC1aO7GWw8NnyI9oedsBaPtv9KUTg
	dbio0rmJii54j9WNN7ccuhocAkJNebN4HtCyMaCHeYssImTorp4eWeZftPtf9WoIIxVMxdtXyMd
	xeDTiqpzE79csBRxs2Sj4v35l1bTCwrvnwZbFRPROaCOgEEVg9+Za8xzuKtGcnYuzrChm
X-Gm-Gg: AZuq6aIhWl6SKqWpCBbJ2hELMlVOIplxbD3w7IOF3E1d4zAxP9/s90VTGCrzrcAuhhl
	AncRJA+c8fls0nNcxiwAVY1PJr/E8/prNBL2C3TEBZUOQlOI3kexvv6iGtC3YWg8ycxtDv4plI9
	BAbUmsxlbMHSinkuBj5pCpRZPNX1oqLZKYOk6tVJz0g91pWGRfHM/eP2SjnRF3r0DOBrwqnk9dg
	mLs0EfmVyOIyzrXnAWSo9iKW1P0RPnm3evgZ48gOBKTTyz4eEjqqrX6ct8H+XHSUWcNpWjokIri
	i2zNnrxz65BZDzoEEeOafUu9rDLu7cT/gnTbbukM80paWV4OZtaTX0uevdQez0Qs5XKPru+IBGf
	ta7budW1pOw==
X-Received: by 2002:ac8:598f:0:b0:4ee:1b0e:861a with SMTP id d75a77b69052e-506398477b3mr7896351cf.13.1770326832996;
        Thu, 05 Feb 2026 13:27:12 -0800 (PST)
X-Received: by 2002:ac8:598f:0:b0:4ee:1b0e:861a with SMTP id d75a77b69052e-506398477b3mr7895841cf.13.1770326832454;
        Thu, 05 Feb 2026 13:27:12 -0800 (PST)
Received: from localhost ([2607:f2c0:b010:9000:f569:ac10:227c:5156])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-506392902eesm3841121cf.21.2026.02.05.13.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:27:11 -0800 (PST)
Date: Thu, 5 Feb 2026 16:27:10 -0500
From: Peter Colberg <pcolberg@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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
Message-ID: <aYULLucqol7jRoDC@earendel>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
	Danilo Krummrich <dakr@kernel.org>,
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
References: <20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com>
 <20251119-rust-pci-sriov-v1-3-883a94599a97@redhat.com>
 <20251121232833.GH233636@ziepe.ca>
 <aUrquI3X68Ilmebh@earendel>
 <20260106012236.GR125261@ziepe.ca>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260106012236.GR125261@ziepe.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: br0ZkLjqT2FS97PsB0cR9TkVIeywIsZqjHDp_eqtjmE_1770326833
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

On Mon, Jan 05, 2026 at 09:22:36PM -0400, Jason Gunthorpe wrote:
> On Tue, Dec 23, 2025 at 02:17:12PM -0500, Peter Colberg wrote:
> > Further, enable_sriov() is prevented during remove() using a new
> > flag inhibit_enable in the pci_sriov structure that is set before
> > and cleared after the PF driver is unbound from the device.
> 
> Doesn't this need something concurrent safe like a revocable?

Thank you for the follow-up and apologies for the delay. I have now
posted a v2 series that takes a different approach from what was
described earlier, after discussing this further with Danilo.

In the v2 patch [1], when the new PCI driver flag managed_sriov is
set, which is always the case for Rust, SR-IOV is disabled twice if
needed: once before the unbind() callback for a well-behaved driver,
and a second time after unbind() for a broken (but nevertheless using
safe APIs only) driver that re-enables SR-IOV during unbind().

Together with commit a995fe1a3aa7 ("rust: driver: drop device private
data post unbind") which ensures that the device private data for the
PF device is still alive until after the function pci_iov_remove() is
called and forcibly re-disables SR_IOV if needed, this upholds the
safety guarantee which pci::Device::physfn() depends on.

As an alternative for preventing SR-IOV management during unbind(), I
briefly considered adding a new context, e.g., CoreInternal => Core =>
CoreUnbind => Bound => Normal, where {enable,disable}_sriov() are
implemented by Core but not CoreUnbind, but discarded that solution
since it seems too specific to this case to warrant the complexity.

Thanks,
Peter

[1] https://lore.kernel.org/rust-for-linux/20260205-rust-pci-sriov-v2-1-ef9400c7767b@redhat.com/

> 
> Jason
> 

