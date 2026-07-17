Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238D63FBED9;
	Fri, 17 Jul 2026 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294432; cv=none; b=fXsfyPMrqIVUD3baIgIorYwa/SyaYeikhqKVPxbA1EpyePGCHqwD+YL2sO+GIW6LpSwNg5fLJi5aDiX+2ERrOFHq+s0QVUtb9+nbedbB82IFLqE7blE2vzdRkvH9BRwz2gr2BMyjpoqbxBnA0b7qa9buUzY9WcVWlgaKsP2ldGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294432; c=relaxed/simple;
	bh=6XpT8WW7zTv+Pgl6x7nrgdl9L/MwShSrbB6zSrIbUuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gT8JprdHIh1GDMU6Qd4mNzZKGdDzYMDmVnQ5pjdNvHYK651Abf9FFMKdOUWKTuEAXW5lS85fD5WQm6Zzmu6JKz/kdIXp4/U3OIcKyuIN0KU+I8/CTxGdyBmjkdLM8+dDZgRj0xDBnmlKLXgv2UStREHGiqbMhzA+O2Ua60XoX18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JVEVLA62; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JVEVLA62"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E0F1F000E9;
	Fri, 17 Jul 2026 13:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784294430;
	bh=tYGi16U3sUU5wVgBZX9uLo7GkqEBrW04/amu0L4HXWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JVEVLA62B2xEu/sQXibJ2UmMMRGadNZCnC1PFUgPMB+teKI96tBgs1bBkwFpqfLaJ
	 m/6VzzgTilqmM02pnf8WIkWfopbBKMznilv+SG9r7Vled9NqAYfc2MNGZNnZdWNKNm
	 bCJeLu/A53qDTnqzbwHWglYD4zbzw600insp2+60=
Date: Fri, 17 Jul 2026 15:20:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] rust_binder: avoid allocating under node_refs for
 freeze listeners
Message-ID: <2026071755-covenant-shining-6910@gregkh>
References: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
 <20260707-binder-noderefs-spin-v4-1-7c3c8bc16339@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-binder-noderefs-spin-v4-1-7c3c8bc16339@google.com>

On Tue, Jul 07, 2026 at 10:28:51AM +0000, Alice Ryhl wrote:
> The node_refs mutex needs to be changed to a spinlock, so in preparation
> for that, update freeze.rs to avoid allocating under the node_refs lock.
> This is done by adding a retry loop so that if add_freeze_listener()
> requires reallocating the KVVec<_> of freeze listeners, the caller will
> allocate a larger vector and retry.
> 
> Analogously, the remove_freeze_listener() function is updated to return
> the empty KVVec<_> when it is no longer needed, to avoid calling
> kvfree() under the node_refs lock.
> 
> Reviewed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/freeze.rs | 65 +++++++++++++++++++++++++++-------------
>  drivers/android/binder/node.rs   | 41 +++++++++++++------------
>  2 files changed, 64 insertions(+), 42 deletions(-)
> 

This doesn't apply against my tree now, given all of the binder patches
now added?  Can you rebase against char-misc-testing and resend?

thanks,

greg k-h
