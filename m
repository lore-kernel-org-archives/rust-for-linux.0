Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0135C470421;
	Wed,  5 Aug 2026 13:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935634; cv=none; b=UyhFuh7//re5vgzVZjJFn7cM9rLXrpusgjOHkqkfJd1EnJQVcJblD0HCACvMW9N1w7Bb+vvtZXOFe9XNN1yTTwfWiJ8kA/9XN5YqAjcg97hO4Wa9wQ06aQzC8ER9KbwzwMs/DO0T2Vbku3KIygDDL/jJW3tZmWqkCJ9cE9WbdDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935634; c=relaxed/simple;
	bh=JZo2Fe28l9Cb54aJQ8mA5kv3g+6ndtyA1PBwjFZXef4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boSWIS260hcsbGeKSKZKnd1zr6uMKss/6Haa90qEZd50pa62PON/Ozdy1xfFgkT0boe2cgugfS1KWo+Kg5dnPy27RLF2mdG1AvAf9o49/6Zn+HYM3VXcm+hOVXkwC9mW3Xq4pLnV23yNvlza73s6Hm78IyPW/PmyvSq0R7Zz4Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uylWJi2f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uylWJi2f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA62B1F00A3A;
	Wed,  5 Aug 2026 13:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785935632;
	bh=uRZvLzvY+BexwU0DY6pvu+r0r0+jPZx2Ig4ipkkVKYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=uylWJi2fAd7Z8O7hl1nic03QRmTHc3c5gwuaDaIj3dqxMpO1rgyqGxy1xMnHcJhS/
	 MMbhDHRad4ho7KEyrLl2r42hk9z4wL9aaKwmoA1qF3j/h850GT/inadUPmhFkGuTOB
	 meV+sraidG7ZFHXyA698etu64ApOEkld0vWXF92U=
Date: Wed, 5 Aug 2026 15:13:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: d4n11l@proton.me
Cc: Todd Kjos <tkjos@android.com>, Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] rust_binder: enforce delivered death process ownership
Message-ID: <2026080523-mothball-giant-c5a5@gregkh>
References: <20260805-fix-rust-binder-death-ownership-v1-1-a89594c3b5db@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-fix-rust-binder-death-ownership-v1-1-a89594c3b5db@proton.me>

On Wed, Aug 05, 2026 at 05:50:56PM +0500, Daniil Detkov via B4 Relay wrote:
> From: Daniil Detkov <d4n11l@proton.me>
> 
> The delivered_links field of NodeDeath may only be linked into the
> delivered_deaths list owned by NodeDeath::process. The existing safe
> ProcessInner::death_delivered method does not enforce that relationship,
> so safe Rust can violate the invariant relied on by a later unsafe list
> removal.
> 
> Move the insertion boundary to Process and validate both the supplied
> guard and the NodeDeath owner before mutating the list. Keep the existing
> lock order and duplicate-insertion behavior unchanged.
> 
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Closes: https://github.com/Rust-for-Linux/linux/issues/1238
> Assisted-by: Codex:5.6-Sol
> Signed-off-by: Daniil Detkov <d4n11l@proton.me>
> ---
>  drivers/android/binder/node.rs    |  6 +++++-
>  drivers/android/binder/process.rs | 23 +++++++++++++++--------
>  2 files changed, 20 insertions(+), 9 deletions(-)

Cool, how was this tested?

thanks,

greg k-h
