Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68D836A015
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769047913; cv=pass; b=uM3UrWay62iJpXoANfhm9Wmg/GdX8A3NcXKl2BOtFLFH98BEA+d46trTqEt81kgMJVuPgMr6LtctAK/IiBTLfDioesXFzMSNjVzwthkS/b3Ucq3Ct8CK95amLGXeJ7NdixI344k0QIb+Y8trT3paIo21Wa/2rde6ouiitj/E2Yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769047913; c=relaxed/simple;
	bh=tekcsTgj1Y/v4zpFiv6l3NOTaQQSDya61nN2h0aykKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCEOsSuEODZWtEwf4Z3zbqY+yNag3f2DR9UWRBf3d5MtGalG9R8nSpG6+d5mZ80vEPMtUcWSAnjvB7GYWDdR6gVCo+3epWc75Jv2Z4twmOPaD0ukciCDVEEOCNVAh9aGaxs8lNg58Iw1zp45vo48wjk95apJfo4EM5p/6Rmec1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=amcZoNO4; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="amcZoNO4"
ARC-Seal: i=1; a=rsa-sha256; t=1769047903; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ncOmHeNwR9WO2RKzfXvT4+ZDddd2LEVJ5qh7R85vtLoP90jYmZ9i0D5PXuSAvQdfmoB/cKSUtUOSro6YAD39XJbIBE3r1JwdD+39z/YTVYvF/y0wZumkoLgRHVkbmgLMLhq6GR8eBpLv7eFw+vYBwLFv/3whsWZiBVqr3oLqpsY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769047903; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IZoDNO1tUhowBC/Wb25mkcmJiP2cen+Vd6UQb65epvU=; 
	b=ZiaXm31ar1ZH5jiGwTlSF7hFj1W2iWH9U5aGit9IagxPE5v3tbSYk6La5JigZhUGvkDVYBcacFeX4PGO+QyXKNADIXwQHEhcsYTM+vREpGnQuYsGEdFnX8wzgsrpqYTrZVJqe8nwI0mQeotmIMLabLizVke5J9M/ubmw+3vWVOo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769047903;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=IZoDNO1tUhowBC/Wb25mkcmJiP2cen+Vd6UQb65epvU=;
	b=amcZoNO4Hrtx0l/ld3w8zFM68PPjnTOprmE0QLxoQeTHSiPuiNVBWqnQ5DcZcYCS
	ghEREg18NsvNyakh2T+NFQpnzEm2D2pcedZ8dUblkNsIuWtzZ5bSwrSOQqM/p9Ubv62
	mEYbOpWlVXFUhyC7VN3xizdfqfhIJKsFnevzcDos=
Received: by mx.zohomail.com with SMTPS id 1769047901905718.0624885472727;
	Wed, 21 Jan 2026 18:11:41 -0800 (PST)
Date: Wed, 21 Jan 2026 18:11:40 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	boris.brezillon@collabora.com, broonie@kernel.org, dakr@kernel.org
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
Message-ID: <aXGHXEylGKcNsqic@um790>
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>

On Thu, Jan 22, 2026 at 01:58:40AM +0100, Miguel Ojeda wrote:
> On Thu, Jan 22, 2026 at 1:38 AM Deborah Brouwer
> <deborah.brouwer@collabora.com> wrote:
> >
> > Currently these warnings, as errors, are preventing Tyr driver
> > from building:
> 
> From what I understand, this is only reproducible with Rust 1.80.0
> (unsupported upstream), and was fixed in Rust 1.80.1. Did you
> reproduce it elsewhere? I asked Mark where his toolchain comes to see
> what could be done there (e.g. in his distribution).

Yes, I have the error with 1.91.0
rustc --version --verbose
rustc 1.91.0 (f8297e351 2025-10-28)
binary: rustc
commit-hash: f8297e351a40c1439a467bbbb6879088047f50b3
commit-date: 2025-10-28
host: x86_64-unknown-linux-gnu
release: 1.91.0
LLVM version: 21.1.2

bindgen --version
bindgen 0.72.1

> 
> If it is just in Rust 1.80.0, and if a distribution still uses that
> one, and for some reason they don't want to use/backport the fix in
> 1.80.1, then we could consider something more global, i.e. ignoring
> that lint altogether for that version, since it also fails for another
> trait in `bounded.rs` (that is why I knew about this).
> 
> (By the way, in any case, we would need a proper explanation of this
> full context in the commit message.)
> 
> Thanks!
> 
> Cheers,
> Miguel
