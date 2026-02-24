Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF2C2B9BA
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 00:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771891289; cv=pass; b=kwRVxhjJDSXDd3K+LW+rkGoPBYoYoEP2RUmFgrssQjdXrUf9oQgejDqHsAPh67n6MaJY2TLVnFPvhLMNzyDJIn0aJGURAT37GqyTv7l++qi9gStIFSaHnTTuZXvXCIaD0neBihr14oTF5lg0+z/ElRPWnJDAw9OjfhTy82fU3uI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771891289; c=relaxed/simple;
	bh=I83YrgGo7U+FxamDZZ/FbkDP3r96Ohubuk2YXHmbENE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxfwg2Ti0SSy7rFzIg5MWrug/49BfHS2wsr067nBukPrdX1GAKqbo/BDAitJSQTkmARGMqa+RwM7/rAfMxaNhQKxFUodH9eEosKxJlS3X6ueheICstaiLio59A7enBog2YscTjrQ1HegO2LfwoSFtS08kKnnUMmcHD7RjN5w5wY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=h1uU0yAz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="h1uU0yAz"
ARC-Seal: i=1; a=rsa-sha256; t=1771891280; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MXnnDmygS/SyyPK2FhSI5pg394hYfn2Oi8bTFHFJL/c/TqCkZOCafI9Vg9C3CLiDNDlZs6tFGqRZSJuRU+CYWyekBX7kEmx529O7LUR6A6FkqUP/41aBGN/JVfpR+h2OqZ4ukF+lyJINBXMlskxaiNnTsUxIYnQnriJYIBZEJMI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771891280; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1GPnaeyQQ+YgeIhvlTV26Nxf1dbQRvncvT2ZavlelMQ=; 
	b=WjZVC8aDSpZebP4UNM7nrNGrZ36AY9eJ70Z5LcKQzkGHQN8PZ2FsR5Sm6GJl/w8OzVD+mK19uG5KQOK7FwdJuIuUw268W8JpgfzXKJa4Gwk1SWUp4seoKHougJ3gn4m7cpi8SD3bOL+9TQj9SoppQYR9Z9iEzD7GmpTAz7iw9W0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771891280;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=1GPnaeyQQ+YgeIhvlTV26Nxf1dbQRvncvT2ZavlelMQ=;
	b=h1uU0yAzHLTU5tOyxG/3DNEutnkqI0yy9qqKwAByLa9df5he8qaw3QRqjyLrZZZM
	a2srOd07+2HqCAnhbu9Z/L9IujFWr9oq1hX5Kxz8bzYhd6jMIGxERp/GhlfK6WTZdBG
	BklyIRM39S2vojusLLlC/k1/XLNaFJRATwXInUTM=
Received: by mx.zohomail.com with SMTPS id 1771891279476376.3950125576306;
	Mon, 23 Feb 2026 16:01:19 -0800 (PST)
Date: Mon, 23 Feb 2026 16:01:18 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	boris.brezillon@collabora.com,
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/tyr: Clarify driver/device type names
Message-ID: <aZzqTv0IHGUfiLVN@um790>
References: <20260223204648.208886-1-deborah.brouwer@collabora.com>
 <DGMO1YUKS8WK.H2FG6YL1ROC3@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGMO1YUKS8WK.H2FG6YL1ROC3@kernel.org>

On Mon, Feb 23, 2026 at 10:41:04PM +0100, Danilo Krummrich wrote:
> On Mon Feb 23, 2026 at 9:46 PM CET, Deborah Brouwer wrote:
> > Currently the `TyrDriver` struct implements both `platform::Driver` and
> > `drm::Driver`. For clarity, split up these two roles:
> >  - Introduce `TyrPlatformDeviceData` to implement `platform::Driver`, and
> 
> I think this should be TyrPlatformDriverData instead, i.e. it is the driver's
> private data that happens to be stored in (and owned by) the platform device.
> 
> The corresponding C setter is also called platform_set_drvdata() and not
> platform_set_devdata().

Yeah, I think you’re right, since we use this struct for
platform::Driver. I’ll rename it and send a v3.

> 
> >  - Introduce `TyrDrmDriver` to implement `drm::Driver`.
> >
> > Also rename other variables to reflect their roles in the DRM context:
> > - Rename `TyrDevice` to `TyrDrmDevice`
> > - Rename `TyrData` to `TyrDrmDeviceData`
> 
> Although it might sound contradictory at first, I think for a drm::Device it is
> OK to name it TyrDrmDeviceData as opposed to TyrDrmDriverData (although that
> would make sense as well and I'd probably prefer that).
> 
> The reason is that a platform::Device being a bus device may store different
> *driver specific* data types thoughout its whole lifetime, i.e. a platform
> device may be bound to multiple different drivers throughout its lifetime.
> 
> But a drm::Device being a class device is always *statically* typed over it's
> private data type, i.e. drm::Device<TyrDrmDeviceData>.

I'd definitely like to keep TyrDrmDeviceData for this struct because of
its relationship to the drm::Device.

Thanks for your review.

> 
> > - Rename `File` to `TyrDrmFileData`
> > - Rename `DrmFile` to `TyrDrmFile`
> >
> > No functional changes are intended.
> >
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> 
> Otherwise LGTM.
