Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A4E268C40
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 23:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762818928; cv=none; b=kSjI0CuzeeJ8k9xW4j+uWx3jZOdpFlR/zswMF3g8JXx2GK3zYsBl2sMWQcnD0qaI9TYoVw0vOY7zXFficsxIO9Kqexg0TLp/SXz5LUGaS1WGsfh4KaT0xeENNRneWZJGaHdNHPpbJmUBpIcOFc2inSsA5eGHYH5r7xy/GyoZICo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762818928; c=relaxed/simple;
	bh=v+WZL9tiEXCk5u06QhgfXuh7Jz16d4rv81XpreJJ9aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYcAhwCELmkOVbOSLsE3c7RlYrdmjwjWX5M0k40aJLckRbe9UE51v3soahjc10vge6rbdP4iPq9Kv68BRdtHMRMBiEJioNGInMKjYrzVicwHlVjss3RtLt/DW3BOAq4J4/EORKC8CDgt1EGog6C+8fCT8YpJSiGjSnS7D6swdEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eksVE42c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eksVE42c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F20C4CEFB;
	Mon, 10 Nov 2025 23:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1762818928;
	bh=v+WZL9tiEXCk5u06QhgfXuh7Jz16d4rv81XpreJJ9aM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eksVE42crnHdQ4L36OvY0OF2AJG/lCe39ho25SM+SPPH+RfNI47+oimBL3JvgMqEI
	 ACYn577t/QZA/lPhbksv184x/JUXYYs0IOwaC/8eUlDRWW7jS8MmFhnGDth7bD+5vU
	 tNaKAXqkq0JZm8cVS15Ijc4mD1NURl5dDc2orNqM=
Date: Tue, 11 Nov 2025 08:55:25 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: "Lauri Jakku, CEO Of Paxsudos IT" <lauri.jakku@paxsudos.fi>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [RFC] Secure TCP (STCP): Rust-based encrypted transport protocol
 for kernel integration
Message-ID: <2025111145-football-nastiness-1822@gregkh>
References: <73757a9a-5f03-401f-b529-65c2ab6bcc13@paxsudos.fi>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73757a9a-5f03-401f-b529-65c2ab6bcc13@paxsudos.fi>

On Mon, Nov 10, 2025 at 05:24:12PM +0200, Lauri Jakku, CEO Of Paxsudos IT wrote:
> Hello all,
> 
> I have been developing a new Secure TCP (STCP) implementation written
> primarily in Rust, designed for kernel-space integration. It provides an
> authenticated and encrypted transport layer that can operate alongside or
> replace traditional TCP, and is implemented as a loadable kernel module with
> Rust userspace hooks.
> 
> The project includes:
>   - Kernel-side Rust module (out-of-tree)
>   - Fully static userspace Rust library
>   - Secure handshake and AES-GCM transport
>   - C ABI bridge for compatibility
> 
> Repository: https://github.com/MiesSuomesta/STCP/tree/main/kernel-module
> 
> I would appreciate feedback from the Rust-for-Linux and netdev communities
> on integration strategy and long-term direction.

Why not just submit patches like any other normal kernel feature/submission?

thanks,

greg k-h
