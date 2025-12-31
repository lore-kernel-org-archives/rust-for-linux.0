Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F8113AD1C;
	Wed, 31 Dec 2025 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767185334; cv=none; b=AKjsHCujJLzxEwPC6UGPXTrYutsYVEowxvNUlGN7VAnoq8lwGGT0NlsG0CuGAQvVh/f2OYZ/x1sDuy0gU41Rl2m6qTa7RTfwkS/hFi6HFuMVbyE9ifqBakmSIyVk1TWAIp/MnLaCNPdNR20TsZTfu/zO+Nn3bkevJxS4LhITi4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767185334; c=relaxed/simple;
	bh=kAmceUzTMM35E6AGujw2TTR0JndIkKZiUiVgH+OMHEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUEMidIifKNxTQCBi83c6iYkQesVqLo6MJFFj7PnNMM8TgMMS7KJrYnA/p5NcEE/MOwdipLbsPfjMaGFZRa0W+3k17TpxhexVJsD9MdKA7KfCjdPsshB1p9APdMR7nQutTsq5cq5p81KGdJ98BXqdYPwaPNaWc2PK0SsA5nRVzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=nGCT8zdP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nGCT8zdP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FE3C113D0;
	Wed, 31 Dec 2025 12:48:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nGCT8zdP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1767185330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UUB1a8LquPniJzjOqlQW9XTao0JghrzYe9nMKDmTDRg=;
	b=nGCT8zdPP3U5pheaJYbMMMRmAVtDmYEUrzQhbjGG3XdLSbczt/+i9AhJK3wg9E1ZtBUd/U
	fC6xOKx0hpAXLme+ptY/w9FYxIO6RBiWOAoAKOIZNdWq3y6bt7SPADM4EIgL5+Nm3MqWYC
	v0fLJ3XgTFjy1q9sedkbSdD22M10K1Y=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 105f96f3 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 31 Dec 2025 12:48:49 +0000 (UTC)
Date: Wed, 31 Dec 2025 13:48:42 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>, tytso@mit.edu
Subject: Re: [PATCH v4] rust: Add support for feeding entropy to randomness
 pool
Message-ID: <aVUbqo4wS7_47wmt@zx2c4.com>
References: <20251230-add-entropy-v4-1-fa9485b6d372@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251230-add-entropy-v4-1-fa9485b6d372@google.com>

Hi,

Thanks for CCing me Miguel. I find it strange that it was left out on
apparently 4 revisions of it. Yes, this should be added to the
MAINTAINER's normal rng section. I'm happy to maintain this.

However...

On Tue, Dec 30, 2025 at 05:53:57PM +0000, Matthew Maurer wrote:
> Adds just enough support to allow device drivers to feed entropy to the
> central pool.
> [...]
> +/// This function mixes in data that is likely to differ between devices or boots, but may
> +/// otherwise be predictable. Examples include MAC addresses or RTC values. This slightly improves
> +/// randomness in entropy-constrained environments (especially common for embedded devices).

Small nit: There are two existing comments in the C source (one of which
I know you know about because your text is almost that text). Why not
just use those verbatim? Or improve those and sync that to here? I'm not
a big fan of bifurcation.

> +pub fn add_device_randomness(buf: &[u8]) {
> +    // SAFETY: We just need the pointer to be valid for the length, which a slice provides.
> +    unsafe { bindings::add_device_randomness(buf.as_ptr().cast::<c_void>(), buf.len()) };
> +}

Bigger question, perhaps for Miguel: what's the convention for adding
these bindings? Is it, (A) "this is a useful API surface, so let's add the
functions so driver writers can use them later" or is it (B) "add useful
APIs as they're needed by driver writers"?

If (A), then why only add one single function from include/linux/random.h?
Shouldn't you add them all?

If (B), then shouldn't this patch be in a series alongside code that
actually calls this one function that is added? Usually the kernel
doesn't add code "just for the sake of it". APIs need in-tree users.

I think case (B) is closer to what I'm used to seeing, but Rust is a
brave new world so maybe (A) is desirable for bootstrapping it. However,
this patch accomplishes neither (A) nor (B).

Jason
