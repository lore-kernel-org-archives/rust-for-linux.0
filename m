Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B123441041;
	Mon, 17 Aug 2026 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979899; cv=none; b=E3Z0PEPGHnEx5e1nOjm9sSlKwsXy8ioODDYgstJhqh7TnUs9JatBC4+MpbXaYDWhWQ/PhSq/YmQVhcY4h4yt25gQscFi+ASlZnJlww7Q+Z0bhAefKF9K+vL+Lyx7wNn2qbOXbsqGMVWhD+9cxRLqMOh4oXTws4DHaHL/mgWR7C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979899; c=relaxed/simple;
	bh=k8uyASQlHNa79v+VL5tW/1TnW9ZTnAMKpHwaaVzbE2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oU1sh9feYVRY0N+ffPbPvThHC7gWdUf/2GelJlJ3AWKtaLjnMOUfnP0LzJlo+OuT5hTwISLt2P7iwI9H4UdAxS5ScUz7+vVapHJmZhRuy+NOhfSbYyOOsy7CrZCcHqAAEwwMK+2kJhZBjItmKYu9RbdnWbjHICpzFofbW0FNFVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apMn5jXX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apMn5jXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF001F00A3A;
	Mon, 17 Aug 2026 15:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786979898;
	bh=GlBDrNemJGOZ2p7bCdTXX5Uz/rOAfEi0mhDIUCyeYy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=apMn5jXX5/5bVQmMmSf8J2E2IyvNObdJ8YR4tYPhgJGp4TA+QX/JFblQLu94OKs3p
	 xOsq+Y5ozUgeEuq/3jMdc7oaNu1id3OssgoU7k+dHGdKLtMpzt+x5v3fPCZ+LkpXgi
	 WdoOnA5HV+c93h40qvIlAeKXEAnDR3v3lAe+DOrD/LbzxNqy9byGIz9tzievzTAX8n
	 7AAy81jwMu5zWiF2ylTA0kUsvTpq7ivAOuMkpYXpvplgeHBbtoj0ChTwobB6r/6A6a
	 o2Svz3CvLT4bb/AlDEhmHp9PUXvjeFf1m1sTmjkpB70QYMLjWHwYADsVILc8VzZ3bn
	 KjP/as4ReuMfA==
Date: Mon, 17 Aug 2026 10:18:15 -0500
From: Rob Herring <robh@kernel.org>
To: Albert Esteve <aesteve@redhat.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mripard@kernel.org
Subject: Re: [PATCH 1/5] rust: of: add Node type
Message-ID: <20260817151815.GA757484-robh@kernel.org>
References: <20260817-drm_panel_bindings-v1-0-1f974508a31c@redhat.com>
 <20260817-drm_panel_bindings-v1-1-1f974508a31c@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-drm_panel_bindings-v1-1-1f974508a31c@redhat.com>

On Mon, Aug 17, 2026 at 01:40:46PM +0200, Albert Esteve wrote:
> Add a Rust abstraction for `struct device_node`, the device
> tree node type.
> 
> `Node` wraps `device_node` type pointer and implements
> `AlwaysRefCounted`, allowing owned references to device
> tree nodes to be held. To do so, add C helpers to make
> them always accesible from Rust bindings, independently
> from the configuration.

struct device_node being refcounted is a kconfig option 
(CONFIG_OF_DYNAMIC). What happens when that is disabled?

> This abstraction is needed for subsequent patches, in particular
> for creating drm_panel instances from a `const struct device_node`
> pointer argument.

My intent is to make struct device_node opaque. We may never get there 
with C code, but please make sure Rust is that way from the start.

Rob
