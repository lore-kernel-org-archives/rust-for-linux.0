Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0493214805
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Mar 2025 17:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741281632; cv=none; b=NmdXoMw68iQUd63QgZz/5kYgSEKDIicr52wPH163htUzu/aIzfJ9MGp4qQriOkIBCxCZ5j0gM3Zw/KMdfZ6WKMNNtsBgtqJN0ahxCQPBcliAihH6JsjEX6s/3fUJeNs27cK2G5OKdoDuJZ/0TZpu7ejvr/Obpap+WaFvAzkEiCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741281632; c=relaxed/simple;
	bh=AJZVUqFFtvtO5eY/ylEGAU0uOyUsipcmbv0Uj0epn60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEHJbb/xPoOSUZu5Oz/HkD3MBt0f/n/33/7ci1XqJvfZ/H6FqNujf4ZBX5S8AEHGQp8x+3RFnAxHP5QaOhMSPaYdXS1oq+y0kiwY7PLF+TQUK8SEZzcX8oKQlh8brXICadg/EqqgrQMG/jqsDwaPUyXIA6Pj8PyHSo+IVy9YHCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jO2pn6Wi; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jO2pn6Wi"
Date: Thu, 6 Mar 2025 09:19:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741281618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PU2H6sHIlZ8PGxGfpAa4ar0XUmQ2GWPqr4/VhiRAMwo=;
	b=jO2pn6Wis8m5GqMaNrwbBDwl3P/DD2tVEwJr9LPjTDYvW1/idV+R+GztBToz92gcMsaHkK
	CKlF5iCXCryYRZy3lsXuPCBmpyZoMnxMaUNBuzQAmmC2UXdGsS1bWpgrIdEPOk8xi6AkAW
	1zpbnNZXslY5y1b1312Ob7vY8F/A4Q8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Russ Weight <russ.weight@linux.dev>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, mcgrof@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, airlied@gmail.com,
	simona@ffwll.ch, corbet@lwn.net, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, ajanulgu@redhat.com,
	lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com,
	cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com,
	acurrid@nvidia.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 0/5] Initial Nova Core series
Message-ID: <20250306171955.r5ykx7oz45rj2dpz@4VRSMR2-DT.corp.robot.car>
References: <20250304173555.2496-1-dakr@kernel.org>
 <Z8isev0gwQJPs7S9@cassiopeiae>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8isev0gwQJPs7S9@cassiopeiae>
X-Migadu-Flow: FLOW_OUT

On Wed, Mar 05, 2025 at 08:56:42PM +0100, Danilo Krummrich wrote:
> On Tue, Mar 04, 2025 at 06:34:47PM +0100, Danilo Krummrich wrote:
> > Danilo Krummrich (5):
> >   rust: module: add type `LocalModule`
> >   rust: firmware: introduce `firmware::ModInfoBuilder`
> >   rust: firmware: add `module_firmware!` macro
> 
> Greg, Luis, Russ, any objections on me taking the two firmware patches through
> the nova tree?
> 
> >   gpu: nova-core: add initial driver stub
> >   gpu: nova-core: add initial documentation

No objections here.

- Russ
