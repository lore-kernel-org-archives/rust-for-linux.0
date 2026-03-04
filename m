Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D834A3A257F
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Mar 2026 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633936; cv=none; b=gIwNtfB2fPbNLbWijI0wefovA+n8ZpInNqQImxU+jldSUhLNSftPqRgmWJHZ64vyz61nUiNXRwDj6LNYe12sbMfHEzyR/0M9fhZvLhrEnZA3fAh525pHE1kIn4bqZUBim/WQPd3/Eow89Vizg9/s7ixe1wu6SZTRd9F4fM2faZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633936; c=relaxed/simple;
	bh=ICcHAv5R0LkVRgx1sRn/PLrNOjP1Y8guvnLI6zDoVjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuKfga5zPiagzJhdfQvCqDQxzGY81y3+Q4RkzqnT34v5wy0lHAsFe5pyUDS1LXGxpr95bP9mKOG+adksR0Ye+Sxs13+YNUmCTNsLJmyMl8TzsL5irnMvrmwMo6afhPI6Hjx8kpiLOGqz0iDQD7ta2Jtbp7QHNepCNcGU3FZaP+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=iwL4lwEp; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="iwL4lwEp"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50334dd44d2so78491601cf.1
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Mar 2026 06:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772633934; x=1773238734; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VJb/uIHrYqSTg+GB6V2BLb5y0MXgSCVKzM/ARVauTlU=;
        b=iwL4lwEpCvPFTLKVYRUJqmDywzHksr4krRU+dweyR/1V3/x4lCcclEwfELn5hpEMsh
         ul3itfgjvGFUK6uiNkdkKr6yrwZAvVqHWdjOqGmZxXBBZ9IDxc/OilKKpdCqOhuZbvy2
         eyOEWGbGmHt00JbZKH7t4jx3JF/HWOxbioYRrn22qamI3Mp54zZi/HnsquREdDyjJzlo
         22xcK2mmHgrlqiA9cNKTxCuflpF3l6iiP/T6YJ9lS2DdSERR+PYP8hrCLrrsxZnUuSr3
         dBNjpEHfPJlBdxyZc91Fwe7oYMyjNlXPiY8NB4qv74ax/ZtCwKTtoqcgwR4HoqFhiQV8
         l2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633934; x=1773238734;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VJb/uIHrYqSTg+GB6V2BLb5y0MXgSCVKzM/ARVauTlU=;
        b=IzYreZyC09K4X7WMLhs7simLKfp2good122ozk3ltbU8TuT9ynQVE9hmaB7OmWARrb
         /Dhe6GO76QP5u9ut4JMsDG2aeZh98pS4a6dHBSZoROmO6oxHOnyhydRno7dFgbJ/0iWT
         pMv5EX5xvvPVsPJL4W9gKxjjLoqCieKB5O2Y2/jPiyy6BTt2co8h0idH7lrRxh84oo4Q
         Asmfkr/eFx2Tj5N/GoGCq7n+GQaDc13m8JiNMBgkp2hztZlO/6vqO33q1sw/RoQlulYX
         tQeR2g0w74YRUejw7NO7pIiYU9Som3ivS/gbvlSbcwBBAoT2ptTh7bPRAl+CRwW190yE
         a4Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXZyFiUpWr9lk3h5yWD3ssIxCUIArLUZZ/grFvHg7fD4duDtVVdFq4PI9wTWLyI6oEQbvskCF8LBS57SV8XaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4hYYQdcAICRorS67aiY6uim8uFw+E33uiqKW43p070YvLhTb4
	FcQttjMczxPNaZU3s6hpFyjb+GS5ZiORunTtOPCZYvqN2rjpuriI/yYMOLiki8w3na8=
X-Gm-Gg: ATEYQzwv/x6zPbsCnLs++S7SJlNMf+rA0zatzyBYr/efv1kZoEJghA39f/jQafyhiH9
	FeWC2/P/IX3W3v172FzwzckAb8S4M+cLKxZHDXGBF+GhM2WODSY2/pUy9q5HnT0SV4faScw666g
	8scrPWV2uhDvNP9S6EfLx1NSIWkG4vQYBrupKaD+nh1YwU7A2vJJYvwX/QQaF7bQdTLxnI16Iqq
	aTIRzL1Yh54MIKFvaFMRhRpSN4wxPnNsMTz05i6D1CZmU9JxjjMSoxWF1nq4J+QBgU+3FMajhIZ
	4kb8NQbiDFPGzM0XDLWnUGUReAUvSBUFfyv4qMIqcujcWKD0q0/epog7RIYsy9AB1YguGphyY5i
	sAhpdij1iHdbiFlIOtZL+QP3YeumROTgph8UDGU46/jCamt7Y4cr07XCdGeNL1u/ioeCbCRwmEI
	M/L5AoWtV7C+NW645fUovvlYE839PnZxLq6GthqhtP5wJa5NFjZqPYYgjDYlCbhhm3Y5/DwoBCO
	SmlVMsRokyUwlQy3/s=
X-Received: by 2002:a05:622a:1899:b0:4f4:e15e:528f with SMTP id d75a77b69052e-508db3773fbmr27695511cf.62.1772633933669;
        Wed, 04 Mar 2026 06:18:53 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ad885bsm152669541cf.28.2026.03.04.06.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:18:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vxn3s-000000056cr-144y;
	Wed, 04 Mar 2026 10:18:52 -0400
Date: Wed, 4 Mar 2026 10:18:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Peter Colberg <pcolberg@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
	Moritz Fischer <mdf@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Boqun Feng <boqun@kernel.org>, linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-fpga@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV
 capability
Message-ID: <20260304141852.GF964116@ziepe.ca>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304084750.GW12611@unreal>

On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
> On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> > capability of a PCI device. Provide a minimal set of wrappers for the
> > SR-IOV C API to enable and disable SR-IOV for a device, and query if
> > a PCI device is a Physical Function (PF) or Virtual Function (VF).
> 
> <...>
> 
> > For PF drivers written in C, disabling SR-IOV on remove() may be opted
> > into by setting the flag managed_sriov in the pci_driver structure. For
> > PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.
> 
> Why? Could you explain the rationale behind this difference between C and
> Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
> for a practical and well‑established reason: maximizing hardware
> utilization.

Personally I think drivers doing this are wrong. That such a driver
bug was allowed to become UAPI is pretty bad. The rust approach is
better.

Jason
