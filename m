Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC95C3BFAF7;
	Wed, 26 Aug 2026 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751408; cv=none; b=hh/xXgmUF2q+6S2V0Fhy8hSsQWgnc9op2ajh2rLJBCFko7D4AoUUsy171Rv3koxeKfcshN8Ql3H+DT/6G30NeS3tlIEccgi93OttWWnY5P1CJl/7PKC+pm1ucM8HTcRrcZD2dZdpEUUHe2JW7x89GS9zJB6DoTTUW91iLnGcswg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751408; c=relaxed/simple;
	bh=LGdQE3w3Su+6AhS4rSsO6oxAfJaCNxLcbs1v56edTSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T72CqJ/vkSrQfRA43S0bfwbrjh9juOdJcX3UHlu6ssAIXHpzaoQCRHN91LE2uvSyF9LXCL0fnUK6ndsNOoWQgRB2B254l8tok5jLzRTQME/x7sdSd4Ys8e+A3czqKilSiGdOz3qjKih0ziRj+uCGvetUNuOCNEShvO9j5v3Wg3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ji6pQOIq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ji6pQOIq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925071F00A3A;
	Wed, 26 Aug 2026 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787751407;
	bh=GoivgHWl0nAbJ8Rd3khgmMTPfBfs8SBJuAsY8mZ9MN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ji6pQOIqfxmCeXxJTETds3U/3MCqho89sJGdk6guNc7ZGv31EB/EJKhW2rzwHEBlE
	 gbXYMZt2UCX89mD5WLS3AHuLwzjV4DYNAZxlHT7j0d9AgVWmX98+XXRQay/RfKLwiH
	 csFli6OMEM0vR/36dZF1Q8USeoDVhhAWSOpT5IQDHHf4aB6TJMHj+seTppHNdmA0vf
	 E/UKZOoCsmXaPFt9MGIyX9zIDT4/XA5modAyUK+MWB3LJYXkJ1sq/91gByGKAARlSp
	 S5NIx3ro5G+l2GmepXHeCH69UXs1eyF9/K3ezO5IpqrP4cHy78/jfyCU7dtjf+4q5v
	 Nca8eyziR+7Yg==
Date: Wed, 26 Aug 2026 14:36:41 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, vbabka@kernel.org, liam@infradead.org, 
	urezki@gmail.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add Alice Ryhl as co-maintainer for Rust
 [ALLOC]
Message-ID: <ao7rwdeDRaFTC0cv@gremlin>
References: <20260826132729.3281308-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826132729.3281308-1-dakr@kernel.org>

On Wed, Aug 26, 2026 at 03:27:18PM +0200, Danilo Krummrich wrote:
> Add Alice as co-maintainer for the Rust alloc module to share
> maintenance responsibility. This is also a natural fit, as some of the
> alloc code overlaps with the mm subsystem.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Alice is very smart and has always been great to work with, so I'm sure
she'll do a fantastic job :)

Obviously:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 24ca91ce5d86..7daacfd70197 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23945,6 +23945,7 @@ K:	\b(?i:rust)\b
>
>  RUST [ALLOC]
>  M:	Danilo Krummrich <dakr@kernel.org>
> +M:	Alice Ryhl <aliceryhl@google.com>
>  R:	Lorenzo Stoakes <ljs@kernel.org>
>  R:	Vlastimil Babka <vbabka@kernel.org>
>  R:	Liam R. Howlett <liam@infradead.org>
>
> base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
> --
> 2.55.0
>

--
Cheers, Lorenzo
