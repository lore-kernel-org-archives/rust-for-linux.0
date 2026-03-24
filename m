Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A183F1647
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354027; cv=none; b=ceG7OJA1Vs1rWWGwcF7tk3p8jfhvvIRTIWaIlyYPUSivj3PT9CK/xHNPHBAIDJ8IBa5gtqtJwSssXiSfMAZCoYI/LqFKfEw22q7JSNTWRjKdCsvc8YFwpZ6GUNxXda18C+0QqKu+cQmDhNPTRSkMIUTVDUOttpIcRsKMrtESA28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354027; c=relaxed/simple;
	bh=ubfQ5sFYc+8HUyk1HQxZuMAJG4jL8zp3kLREeiVyfiw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pYllhfgBG7kjgQwhSRoB6UY1Ev5wMRfzR3t6TtpwdkJEZbyEnfU1ppMmVEktfZx7plbXYBiYMktRv7tE85p9ajNf/vEb+hmqKMglkozjFe9+91a6cnF48AaKRNDlZ/b+9HOQLeLURVOmr8Me2e9Ecryhr2RE86xZ6kbHNvnfjSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=g0EC9O++; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="g0EC9O++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774354020;
	bh=ubfQ5sFYc+8HUyk1HQxZuMAJG4jL8zp3kLREeiVyfiw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g0EC9O++iVRkZQILS0+vCwZpSu9DE22Pm49wjNuVfoq9lS/1X20106mg0G3e9br+6
	 VCHHrI5oWgb1BjPjThaEh95z2x5zX0+aq4gLJaEESf+BA7yqSqUqnBEPr4lwDPpIFq
	 7JgrXM/phdJijkXnW7RSwNCHjGeKKSON0mABSJYq6eqodwltr3YLOBYZhcHEwf9ptV
	 ButJ7WseC8l0dnoS7htRrTZHlpYrNvmacMuLbwjNokJTw6kTzu8eWbq0wM6RGfjcHO
	 ayXF8sIoLWaWZKNfVxGR03OMZWuoc5yY/YG6vXaIFU90Ygh+OzDsZcjWKxEcFFFvGj
	 Q2Wt8tA8iRjTg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C71717E5AA1;
	Tue, 24 Mar 2026 13:06:59 +0100 (CET)
Date: Tue, 24 Mar 2026 13:06:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Deborah Brouwer" <deborah.brouwer@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy
 Baron <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor Gross"
 <tmgross@umich.edu>, "Steven Price" <steven.price@arm.com>, "Dirk Behme"
 <dirk.behme@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>
Subject: Re: [PATCH v3 01/12] drm/tyr: Use register! macro for GPU_CONTROL
Message-ID: <20260324130653.74f9c2ab@fedora>
In-Reply-To: <DHAZ380DRB8A.19SI1OUABRWTP@kernel.org>
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
	<20260323-b4-tyr-use-register-macro-v3-v3-1-a87daf9e4701@collabora.com>
	<DHAZ380DRB8A.19SI1OUABRWTP@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Mar 2026 12:23:54 +0100
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Tue Mar 24, 2026 at 1:18 AM CET, Deborah Brouwer wrote:
> > +    register! {
> > +        /// GPU identification register.
> > +        pub(crate) GPU_ID(u32) @ 0x0 {
> > +            /// Status of the GPU release.
> > +            3:0     ver_status;
> > +            /// Minor release version number.
> > +            11:4    ver_minor;
> > +            /// Major release version number.
> > +            15:12   ver_major;
> > +            /// Product identifier.
> > +            19:16   prod_major;
> > +            /// Architecture patch revision.
> > +            23:20   arch_rev;
> > +            /// Architecture minor revision.
> > +            27:24   arch_minor;
> > +            /// Architecture major revision.
> > +            31:28   arch_major;
> > +        }  
> 
> Are you sure that this is the field order you want to choose for Tyr? nova-core
> had this order in the past (we're changing this currently), as it came from
> OpenRM headers, but it is pretty unusual for datasheets and TRMs, which is also
> why the register!() macro examples use the typical and recommended order, i.e.
> 
> 	pub(crate) GPU_ID(u32) @ 0x0 {
> 	    /// Architecture major revision.
> 	    31:28   arch_major;
> 	    /// Architecture minor revision.
> 	    27:24   arch_minor;
> 	    /// Architecture patch revision.
> 	    23:20   arch_rev;
> 	    /// Product identifier.
> 	    19:16   prod_major;
> 	    /// Major release version number.
> 	    15:12   ver_major;
> 	    /// Minor release version number.
> 	    11:4    ver_minor;
> 	    /// Status of the GPU release.
> 	    3:0     ver_status;
> 	}

It's defined in ascending bit order in the datasheets we have, so if
we're ever going to auto-generate those from the xml, we'd likely have
the same definitions Deborah came up with, unless the script re-orders
things in descending bit order.
