Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B3A28F3
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Mar 2025 05:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741411421; cv=none; b=eOydFX3JX8wskiCqNhjaIjeN0f0llufzrzUMNT5tmWqLUSgiK7Xa5ax494+xFjvFFnrKKq1NuUHiVHOHJFbYvPzed4jW+zEC8yLdRpzecYygHfFp9vNtSg9PTqLpkGjhAdXUfoS71R3wWY7y/3ifbAKG76A7nfGyyBJNYelJNQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741411421; c=relaxed/simple;
	bh=KJ43daA3IkxlagxR2gQICfagD0DiNZN3vKRi1vcrvag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajm49jJsX9NAzM3MZVAeY7l2xTFEWTWTPoC6jvdyRj8B9mVDAV8biEzhyijArVvouF/OLu8I6Nksfsf20qDvE0MvBCW8sY5V8jZKz2FNSch+fs31EdRSFQc+iivt+sWyCL2+tehUXHSckz+8NJzKoIkdLzMO4r9twSto8KPbfBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMskrF2X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMskrF2X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE736C4CEE0;
	Sat,  8 Mar 2025 05:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741411420;
	bh=KJ43daA3IkxlagxR2gQICfagD0DiNZN3vKRi1vcrvag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MMskrF2XXit2ugBme+mI84YdTz4SvZPjOqEJHHPChh36hmaYr4z7R4HuzQcQbHewy
	 VDgPv12A5mL/lAqaKHOb7fUGMGKKAOugi3zXHvaHv78fyswOZ1Tcnlh2bxDdseJGFh
	 gCxFFsjSnC+S+LAMeo3WAk3AkAF9wNHLArGCVj0WzniO1ezYVuuvuAvCFpLW/TBwVd
	 ZzJzj7nztc2mhU0WUFmXjkaGSvp5Zsks7YIc7MMP5IVu1BL1DMSLjcoTupRCKD/TDs
	 BiuCENmjUJqpZnKwbMKM/ftRhYf91RW/GlCOyCPclK66RDVusTYwK+0YTSHLKBQXeE
	 LFCbIG8r34NVg==
Date: Sat, 8 Mar 2025 07:23:35 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, rust-for-linux@vger.kernel.org,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu
Subject: Re: [PATCH v1] rust: module: place cleanup_module() in .exit.text
 section
Message-ID: <Z8vUV8fe9v19tqmI@kernel.org>
References: <20250308044506.14458-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308044506.14458-1-fujita.tomonori@gmail.com>

On Sat, Mar 08, 2025 at 01:45:06PM +0900, FUJITA Tomonori wrote:
> Place cleanup_module() in .exit.text section. Currently,
> cleanup_module() is likely placed in the .text section. It's
> inconsistent with the layout of C modules, where cleanup_module() is
> placed in .exit.text.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/macros/module.rs | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index cdf94f4982df..36daa149a691 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -275,6 +275,7 @@ mod __module_init {{
>                      #[cfg(MODULE)]
>                      #[doc(hidden)]
>                      #[no_mangle]
> +                    #[link_section = \".exit.text\"]
>                      pub extern \"C\" fn cleanup_module() {{
>                          // SAFETY:
>                          // - This function is inaccessible to the outside due to the double
> 
> base-commit: 6ad64bf91728502fe8a4d1419c0a3e4fd323f503
> -- 
> 2.43.0
> 
> 

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
