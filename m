Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D121C2836A4
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755594403; cv=none; b=SoC4bLU/dhyzW34g6pjX8qfeNIyNRQQ1O8plBB0J7EbAXIX5VmK9G+I+N0+diyPFDXfAJANhUqujuusE8YNDy+xXZajdLV51VebKwzZFzjaswuACOreOR9cZ9kttmsKe5BcmLIzMAHeUK7/NkDIlWxBHvw7bgsL7BU+iKgzgZqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755594403; c=relaxed/simple;
	bh=GzTH2CWb9On4DhbDRVtbvg50ym9AgWV65w7+T69rKmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEV57fewJOUu2T/KAYSMNStf0XGsCRpszPvaKrXY4VuaskU4o2SP7jpEsiNWLN59wLDqmPWf9H/cN+rDx+kbRGm8oRoTFWgMl97MKq2gZsUtz+9qv7bvcVN3Do/gC7C0I3s5WafA7nl2I8tfYezCBjArnXIOVaLm336baphpBfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTqx1gZX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTqx1gZX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E94AC4CEF1;
	Tue, 19 Aug 2025 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755594403;
	bh=GzTH2CWb9On4DhbDRVtbvg50ym9AgWV65w7+T69rKmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTqx1gZXaylHz3EiNSkbLZlEa6mRbni6ZHYS3cE0QhR0qcfYV5lgvTs6UwCu9g7Xy
	 gJMdH6ETy0478//DPHL+8e+Hs4hdFlobYZNSix007I7ZbxXiGxXk9kUBg0/NlTQmay
	 UMDYlhItXG3Om7HIHNmhZckymB06d+cN1PcpV6TWJL/ZPD+wQPpTikP1KAiH0faXUO
	 Ujl8efElB//svHZY6P4VjI30P/uPF7MKqxBfY5mqdWX+kqs6IbS98XPqOL4GxdJrpi
	 dZVSY+7CkRuY8xWoSLEbFi/ytDwD1bsFKl/jvvru5kWsl7YPkZzM+cDUdk6GzVL6mf
	 aqs2P+Vftj6dQ==
Date: Tue, 19 Aug 2025 11:06:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [RFC PATCH 0/3] Initial plumbing for implementing DRM connector
 APIs in Rust
Message-ID: <g5n4vx5hkreacrtjrbzsefnctvki6d7oh7qyjrb6wtqvzp7adl@rzmxiyblpnsz>
References: <20250818050251.102399-2-sergeantsagara@protonmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rqlr5pzjvbwfohde"
Content-Disposition: inline
In-Reply-To: <20250818050251.102399-2-sergeantsagara@protonmail.com>


--rqlr5pzjvbwfohde
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC PATCH 0/3] Initial plumbing for implementing DRM connector
 APIs in Rust
MIME-Version: 1.0

Hi Rahul,

On Mon, Aug 18, 2025 at 05:04:15AM +0000, Rahul Rameshbabu wrote:
> I am working on a drm_connector scoped backlight API in Rust. I have been
> looking through Hans de Goede's previous efforts on this topic to help
> guide my design. My hope is to enable backlight control over external
> displays through DDC or USB Monitor Control Class while also supporting
> internal panels. In parallel, I would like to improve the driver
> probing/selection mechanism when there are different candidates for driving
> a backlight device. This initial RFC is mainly intended to sanity check
> that the plumbing I have chosen for extending the DRM connector
> functionality in Rust seems reasonable.

It's a great goal, and I had that same discussion with Hans recently
too, but I can't find the link between backling/DDC CI, and Rust. Can
you elaborate?

Maxime

--rqlr5pzjvbwfohde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKQ+nwAKCRAnX84Zoj2+
dtm2AYDVQ35Eu8ffKbg1cayeMAq4RljdgTI+K4MjL/eXmTxoU4R3bUX1JJ2XL4wB
lCVy/VsBgLpG1jLb5sYJdf/FlkiKubkQxE4qnr4m8Dqm6qG+b2ljFC89ZT3kX5xD
gl3A6DJ5zA==
=1fQH
-----END PGP SIGNATURE-----

--rqlr5pzjvbwfohde--
