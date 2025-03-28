Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B14421364
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Mar 2025 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743173466; cv=none; b=CibQByqVKBOVCRGt2aaFmRUUSy/4m0iHnQSSzubdUpArUoi5zvyE9Tcpi8/6FUlh1KbiwAZSMGA/ORawEsfJ3U5vXGso/gh3iDdDny7WbPNP2+KwjgQn+T5Y3h4PnfSm1GOpg9TpxTjdve/0FDN/Cs556jGb4PkrUYa1FlKuBvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743173466; c=relaxed/simple;
	bh=eVYl2FITbsNzWUlMGbhJI76+W0jqC53/laOtHUJbfds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hyo7nZQlOsgyx84H3Y/mHZyGgz+QJj5FtUeyZxRlW4sc1reK2hF2W5JE3ZN6I4lnKLjdyANWQ13BLF+epSHHSzSPon5E4bqwt6QvpD7Z7HbP+RZuwq/GsTonMAr1e0XHTwhw8lynoTndgiQySoXQlHKnIQCN7Mx6tjUpmCOQC7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pcjcLGtH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pcjcLGtH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9B1C4CEE4;
	Fri, 28 Mar 2025 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743173465;
	bh=eVYl2FITbsNzWUlMGbhJI76+W0jqC53/laOtHUJbfds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pcjcLGtHVKe9pNmO19S8NvTaStYlWe6XRRWEjxFmZuKjAIPENF6hvUecJ58M/3f4o
	 AkURM3qkvTa/VUakon/sIAnQVtwk95b7Xkmnp5uFiZ5/3E6ssloZh6rEsr9Rdn6G1N
	 hQmL8iihckC0Kkyujgs8Ngu3g4ePzIdB/fFFrb7AXo6D0hktaUPZTDMxztJLUY0LNE
	 e9oFPenGH/zIcalBR8bI9hWSO8ZUK54DsmwHws6F3VFD2HtqhLhI1xZMdrV9ERsjxb
	 RM3R5tRYs1RwP5RwJln/dH1SgUw8suQ9sBsTXrW2kohPR8cyguD/9JIsANDIDf2IHB
	 9suRJX3LbvLTA==
Date: Fri, 28 Mar 2025 15:50:58 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de, lyude@redhat.com, acurrid@nvidia.com,
	lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 8/8] MAINTAINERS: add DRM Rust source files to DRM DRIVERS
Message-ID: <Z-a3Ui6OqI0hGWt0@pollux>
References: <20250325235522.3992-1-dakr@kernel.org>
 <20250325235522.3992-9-dakr@kernel.org>
 <20250328-pink-ferret-of-engineering-bf7818@houat>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328-pink-ferret-of-engineering-bf7818@houat>

On Fri, Mar 28, 2025 at 03:49:20PM +0100, Maxime Ripard wrote:
> On Wed, Mar 26, 2025 at 12:54:35AM +0100, Danilo Krummrich wrote:
> > Add the DRM Rust source files to the DRM DRIVERS maintainers entry.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index de46acc247c3..c704431f02aa 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7672,6 +7672,7 @@ F:	Documentation/devicetree/bindings/display/
> >  F:	Documentation/devicetree/bindings/gpu/
> >  F:	Documentation/gpu/
> >  F:	drivers/gpu/
> > +F:	rust/kernel/drm/
> >  F:	include/drm/
> >  F:	include/linux/vga*
> >  F:	include/uapi/drm/
> 
> Our MAINTAINERS entry is pretty weird and kind of duplicated between drm
> and drm-misc, we should probably put it under drm-misc too?

Yeah, that also came to my mind meanwhile. :)
