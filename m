Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5619F2DE6F8;
	Sat, 17 Jan 2026 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768644014; cv=none; b=gK3TmAVxbXAoMf1q91Rcw5UfE/UEMKJjG4YiUqKieO8CzxwHS2JOycVuhwxFbeAxKrQbojaEMUhkxoV46yMIDV/XABMari1vjtUob7kyDi2f58tIfSPiToN1bE8hEB/trvXfDG1HJqGLdITWZJ+PJx88vyAK/cDS04Kx1B4KGEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768644014; c=relaxed/simple;
	bh=afkKTIutxdgbzMly3j54qauCcIMaW3KGVjrFjwwh3eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQVjHz3q/cktxfmfvHdUkMQYh2y+K3lZ/8INmpDP583GF1d1HSI7eQZpzl42X2mgd7mcVEfkOy6EfCGhIbOqrrXZCRPxTE9GjzByzZsYTuSx79AmJ4RnyQtbsdwOriEFmYpuGvCGv9mySvrCH6CKyaXKvua5B57tgv8xqIsHVr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pD3VnhVJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pD3VnhVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3C5C4CEF7;
	Sat, 17 Jan 2026 10:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768644014;
	bh=afkKTIutxdgbzMly3j54qauCcIMaW3KGVjrFjwwh3eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pD3VnhVJ70009zH0bEthkuwrTPKTOpJBNWW+CqVI0JZO1ejifA+DJluyq9UzwI9CP
	 7Eb01FvmbW2xwaaCS9CCgDB9hRUbT73702aLhS+kIC1XWDtwJT44DDzyaHchkMG65n
	 eqdZDf/UoncuuWgGMaRR09TsRSRYrBVpL18ybKOE=
Date: Sat, 17 Jan 2026 11:00:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, rafael@kernel.org, dakr@kernel.org,
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] rust: simplify `Adapter::id_info`
Message-ID: <2026011725-contour-salary-d3d1@gregkh>
References: <20260117094710.24301-1-work@onurozkan.dev>
 <20260117094710.24301-2-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260117094710.24301-2-work@onurozkan.dev>

On Sat, Jan 17, 2026 at 12:47:10PM +0300, Onur Özkan wrote:
> id_info() checks ACPI first and falls back to OF.
> 
> This replaces the unnecessarily verbose approach with a
> simple or_else() chain and drops temporary variables.
> 
> No functional change intended.
> 
> Signed-off-by: Onur Özkan <work@onurozkan.dev>
> ---
>  rust/kernel/driver.rs | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
> index 649d06468f41..6cef792d54e4 100644
> --- a/rust/kernel/driver.rs
> +++ b/rust/kernel/driver.rs
> @@ -307,16 +307,6 @@ fn of_id_info(dev: &device::Device) -> Option<&'static Self::IdInfo> {
>      /// If this returns `None`, it means that there is no match in any of the ID tables directly
>      /// associated with a [`device::Device`].
>      fn id_info(dev: &device::Device) -> Option<&'static Self::IdInfo> {
> -        let id = Self::acpi_id_info(dev);
> -        if id.is_some() {
> -            return id;
> -        }
> -
> -        let id = Self::of_id_info(dev);
> -        if id.is_some() {
> -            return id;
> -        }
> -
> -        None
> +        Self::acpi_id_info(dev).or_else(|| Self::of_id_info(dev))

Have we already started the game of "rust golf" on the kernel?  The
original code here is much easier to read, and the compiler should
produce the same thing for both, right?

thanks,

greg k-h
