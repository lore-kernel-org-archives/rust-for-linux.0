Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5291E0DD8
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Jun 2025 08:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666491; cv=none; b=MirIaYm35a66rLZlKYpjjIOTDabZ9ZITApJ4krZfbtupnuW5cZwJiKw+bffETAWoXH8LBztOo6Qosnl4UDrtOu+cVBaO5zEAM82TH5l0RjfWjI2jzhUVstGMonYx8vbUGF79R70K+JhB4tUDzfpGv39V9nQLkICB+yEq7M2EOHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666491; c=relaxed/simple;
	bh=dSg83ldr55VSoghQoZK5pIAcB4bBtdKoYo6Hl5CEkGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1Gs55xZx1AqjmTF6cVstrSXpZW5jvps8uPdt1+AhS5FzfNYWDXNh+9V7VOLU4cKclP4fdybKuqAc9zBmkEojV6RrfUEHhfqO8zASOoxyk3bvC764gSOuQdGfSvSBA5fds7WtDNZXhN4vipkrOrFuBbaykGOaskc+Nlb3aQV5Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DD0B113E;
	Mon, 23 Jun 2025 01:14:23 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9E9A3F63F;
	Mon, 23 Jun 2025 01:14:36 -0700 (PDT)
Date: Mon, 23 Jun 2025 10:14:28 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Benno Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	ojeda@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
	lyude@redhat.com, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
Message-ID: <aFkM5NC-VL8oExwv@arm.com>
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux>
 <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
 <6DB37626-8817-4939-AE8E-6A463186A550@collabora.com>
 <DAQJERHUYQF0.2SVXG825J6Q9N@kernel.org>
 <aFRi8cqkIzOAIbeR@arm.com>
 <49BDC70A-7CBF-4C2F-955F-B680DA0BF30C@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49BDC70A-7CBF-4C2F-955F-B680DA0BF30C@collabora.com>

On Fri, Jun 20, 2025 at 10:42:09AM -0300, Daniel Almeida wrote:
> Hi Beata,
> 
> >  There is no concurrent access nor shared references, unless the
> > handler decides otherwise
> 
> It can’t do so in safe code. There is no way to manufacture a shared
> reference from a mutable one in safe code and if it passes that to C, then
> it’s already using a unsafe block for the ffi call.
> 
> Unless I missed something?
I do not think you have, though my comment wasn't meant to suggest anything
otherwise, merely emphasising that up to this point, the code upholds
Rust's safety guarantees.What the handler does afterward is a topic for
another time (change).

Hope that this makes the intent more clear (?)

---
BR
Beata

> 
> — Daniel
