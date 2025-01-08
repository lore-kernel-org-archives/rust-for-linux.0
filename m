Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8761F7580;
	Wed,  8 Jan 2025 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736349547; cv=none; b=DreiYbcfmHQQ0ijbs/RUopRifCVOQGTFzsa54CQI6vxmH5gEh4L/ktJzft6feG0tR35KzvkY6A3/wrx1oDZJPCje16e/ptE+KKHldRyrZn9+g5zQipHoPm7V+nX+tjMNVkkOpSG0Z1Lla10NiblvGgvrSklwT0x+khgA/XTC0f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736349547; c=relaxed/simple;
	bh=derMkGzrtFRQjpElzfo6CFaVBd+CAw++QRVM/MMzolk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5cQ8s7XrqasUEJ+XLpVZjX1RvUtwncqCDOt/jZqNcSh9tCqnk2td1eWy9H8E8pdO7K/iFwiD+Rl/NuWaKAfdDYN1xe0DuM7FWR8mLNcAEzXrdK2DoKpimxt0wE2FNeX6IFooD1dm5NVJreOMTMw2rbRKibe/1VSzYb+/wPp1mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1729C68D05; Wed,  8 Jan 2025 16:18:59 +0100 (CET)
Date: Wed, 8 Jan 2025 16:18:58 +0100
From: Christoph Hellwig <hch@lst.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
Message-ID: <20250108151858.GB24499@lst.de>
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com> <20250108122825.136021-3-abdiel.janulgue@gmail.com> <20250108135951.GA18074@lst.de> <CANiq72=R2N+QiCiHZQu-6YJ9aYpn_bik3BW3U=nAW3jL7unzLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=R2N+QiCiHZQu-6YJ9aYpn_bik3BW3U=nAW3jL7unzLw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 08, 2025 at 04:16:18PM +0100, Miguel Ojeda wrote:
> On Wed, Jan 8, 2025 at 3:00 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > No rust code in kernel/dma, please.
> 
> What do you suggest?

Keep the wrappers in your code instead of making life painful for
others.

