Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1579378803;
	Thu, 22 Jan 2026 23:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769124420; cv=none; b=TF9xf+gPDz8k1w59Yy2kpytFKOdbsOYa6eTrXsGYHwpqeinW1jbAZeKNblHPYFtQPVMWJBkM64/LmQN9WYzKSCH6s+fMwACx4cFmPUjF0ITkzbVS8ZW7Mmi6LxNSW5yBuSfmAPMqOMgLgJFTzXK+Mh3np3fQ9MoRy6+EBxzBHbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769124420; c=relaxed/simple;
	bh=7Ui/H8yEErQjGxKh4Q7sO3feQTm1oK+wDaM8GnYgvxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKq6x0BgZRYfbmOZ/LTXVksONXUTOz2gypmR7ELiTOGZr3zZ6ErIRygzA4HT7TvDS/DGefb6mAIO8Ln0ugnhfg3wZHTxcWlDHG4baLwyCFI8FAdV4WMktGkAweb3IfOvN9wBH8C8rmFO6PEUN8OgpxRc6XlDpVrI1ApqfZgWgF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=eo89Wcra; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eo89Wcra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4968C116C6;
	Thu, 22 Jan 2026 23:26:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eo89Wcra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1769124416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pk2kb0eZlnDYlcPABz1DNyjnUUowA/NZ1PJNgTOvCMY=;
	b=eo89WcraiMpJXs6XkAzVNVIjzFE+aHuutGdS8wQbN27W/+xKtylkPBgykulMIPFRHMOdvx
	G8S7WMAtmrxiWHbGYlvu6a6LVdj0p19jFOOQnGTNHC0f5Po4QlHDRu6O0RphQIk3SJC+z9
	D2Th11R3f7WgCdK+iyIHXEoTM9fJrTI=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a339ca82 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 22 Jan 2026 23:26:56 +0000 (UTC)
Date: Fri, 23 Jan 2026 00:26:48 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v5] rust: Add support for feeding entropy to randomness
 pool
Message-ID: <aXKyOGeU_z4v8Ep4@zx2c4.com>
References: <20260102-add-entropy-v5-1-6b38a7a4a9ee@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260102-add-entropy-v5-1-6b38a7a4a9ee@google.com>

On Fri, Jan 02, 2026 at 06:50:16PM +0000, Matthew Maurer wrote:
> Adds just enough support to allow device drivers to feed entropy to the
> central pool.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
> This adds bindings for `add_device_randomness` to enable the conversion
> of `qcom-socinfo` to Rust [1].
> 
> I'm trying to land it separately because it's much simpler and likely
> usable by others. The conversation around this code is also likely to be
> very different than the conversation about the socinfo driver.

Okay, I can take this. But I just wanted to confirm: is that RFC patch
definitely happening? Should I wait until there's a v1 or something?

Jason
