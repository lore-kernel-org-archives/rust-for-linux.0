Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAE912C534;
	Thu, 24 Sep 2026 00:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790209661; cv=pass; b=ZWcPbFV1B6g4GBBeP+e7ybRiq1vQVg9H1JbEyXhB6Ktin1wUVoEFJ0ZWF+X0p67wcBh5fyes0A6r6J0mV661PCVmqnKkkSTho4qFMPAvdiG7svF6Q3mwROmsO3duyzwihSun5eW4acHJN3nsDC+wkqvYVIokitrPIuEdBaOIgeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790209661; c=relaxed/simple;
	bh=dpyFaruw9rZr9eYlQ011nMMcLX7Ktozwns08LAoKWrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9fiFlITcfMmHouXdA0zSWhRsyU8N5pdSenjVuEETg0Xu6mdZvxKLf5/JdQEbXumDzzwQw0rOCYBPKv9doOML3Mp5aYvy3RHYLDOTjARHpnmKfCN2k0/XWifL6lnBSNQH+GFugMQ0Ey1U7e74J1YCugr9yh/7vpxNpS8zAlqwQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=KtJL5hFT; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="KtJL5hFT"
ARC-Seal: i=1; a=rsa-sha256; t=1790209645; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qh8RBUisTJ2f70pwr0zv2E8sJV+XMG7rXB1L/uJdIHMGJ0voxGJ7RJicJuSkG2LxD0dIUVdD8RMjYBxlE73mYqmLRPp5ELfYCMQvBg6yj5WSIj7nFD8jLGV9HYYp9V0ZDEzBT5sgqJQRhY+EeKnO2hkaEjWpTjrykxriE0asi7w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790209645; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MZoS9uR5/iFVw/607H7VIbBeiwuzMtUCS2JH6mlxdmA=; 
	b=EIMeVXqjEyHcSFduqFvcCtEieWfa7CotMEpiP8GILxaj2oDQ4wOkZYTOMBTPnN2jMhEyVqhq7vwV6re4+z2p25Gc9WmghRGGevdRL+lDvaUYJCaVX73Kn0PU8XEu0EE3FLXwvG/rBND7mOs1ZlSvXnjwlKAzny9wWdfSTu/LAyc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790209645;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=MZoS9uR5/iFVw/607H7VIbBeiwuzMtUCS2JH6mlxdmA=;
	b=KtJL5hFTwblmYsMPNMBXDxVaF6z4ogQQj9QyVCm7IcODDPIIz8A5yZ184uiPE/3z
	78BvVYGVB2WxHP1efzttvgN9fp4qugOB59N/8+jD1hzK12+mYPRzLAmoTiLnwAwJJYw
	gsvF9hXo8pnONBF/7spEBifEeAInAs3eDPCAlquw=
Received: by smtp.zohomail.com with SMTPS id 1790209644135113.09521440444541;
	Wed, 23 Sep 2026 17:27:24 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:27:23 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, karunika.choo@arm.com,
	boris.brezillon@collabora.com, laura.nao@collabora.com,
	steven.price@arm.com, liviu.dudau@arm.com
Subject: Re: [PATCH] drm/tyr: gpu_info: zero out new/unused fields
Message-ID: <arRua6cN7FXIDOvF@um790>
References: <20260922-b4-gpu_info_zero-v1-1-7259840069c6@collabora.com>
 <CAH5fLghN0w908Z-MYDfmaeC7gvAB78MMT7zg599=1kU0HexkOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLghN0w908Z-MYDfmaeC7gvAB78MMT7zg599=1kU0HexkOw@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/290.206.86

On Wed, Sep 23, 2026 at 09:42:23AM +0200, Alice Ryhl wrote:
> On Wed, Sep 23, 2026 at 1:16 AM Deborah Brouwer
> <deborah.brouwer@collabora.com> wrote:
> >
> > If a new field is added to the struct drm_panthor_gpu_info in the panthor
> > uapi, Tyr must initialize this field or it will cause a compile error.
> >
> > To pre-emptively avoid compile errors, use ..pin_init::zeroed() to zero
> > out all new fields added to this struct. Tyr can subsequently change the
> > initialization as necessary. Also use it instead of manually zeroing out
> > existing fields at the end of the struct.
> >
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> 
> Merged into drm-rust-next, thanks!
> 
> With regards to sashiko bot, we should look into whether the
> MaybeZeroable that bindgen adds to structs applies on this struct. If
> so, we can remove our unsafe impl block. But it's not an issue in this
> patch.

I couldn't use MaybeZeroable directly but if I add IntoBytes and
Immutable then we can stop implementing unsafe trait AsBytes. Could you
please review:

https://lore.kernel.org/rust-for-linux/20260923-b4-gpu_info_intobytes-v1-1-bb2173f91e11@collabora.com/


> 
> Alice
