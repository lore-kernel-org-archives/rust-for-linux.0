Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C593A1CE8;
	Tue, 18 Nov 2025 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486302; cv=none; b=i1tPvG782gHB+UWeg+nun3NLemRJaqN7/+jVp+5X0NTOaYN6m/tDB/5WIgCrFk75apG2yYntPnNWbED/SXo4j9rnsilMFKe6V8Irs3VnpcLxVfF0EeZbw2QUlhhpta2FMevqckigKU8aTUh3Hm4L6RrrwfklbEeds9KmD+/AjoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486302; c=relaxed/simple;
	bh=c3q4X4lmWXyrvygyDjA4xqwcPmmXFlsxrhY9liop38U=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qaur3iiM8Oj9hnb/QuUA7KDSteeVKn74wMI0VM72ltUKmAmNuHGb53heOQBk1wKv++mYmwGAvA5a8TRFrWsd8R5Hin7DXi2f+DxDXW8/lkpwfWzGNKPbCUUqYGf4QPVW8xqJrenQf+t69fVnPTc6uQQ/HR6dswYoF43YrcN3pAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=haBZHcyt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="haBZHcyt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA80C4AF0D;
	Tue, 18 Nov 2025 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1763486301;
	bh=c3q4X4lmWXyrvygyDjA4xqwcPmmXFlsxrhY9liop38U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=haBZHcytIs4NXmxVnGy6uFkTM7Y++YyAIRj8ZWXcYLbY9GirPyjSYquqvirPU0Om/
	 1W75zFFEReILqzJUYm/eAljg+KsLQ5Tdm6LSVKbtADStZUyvHisl/V0cBcJ298TMte
	 6k42RhdyR7iB1qrVxOUN8UlJpGqMBOlRnUk9kSIA=
Date: Tue, 18 Nov 2025 09:18:18 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich
 <dakr@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Alex Gaynor
 <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, John Hubbard
 <jhubbard@nvidia.com>, =?ISO-8859-1?Q?"Bj=F6rn_Roy_Baron"?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] uaccess: decouple INLINE_COPY_FROM_USER and
 CONFIG_RUST
Message-Id: <20251118091818.152ba4fc0c8a6f3092a36fbc@linux-foundation.org>
In-Reply-To: <aRxM_NHhekMl9joH@google.com>
References: <20251024154754.99768-1-yury.norov@gmail.com>
	<aRxM_NHhekMl9joH@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 18 Nov 2025 10:39:56 +0000 Alice Ryhl <aliceryhl@google.com> wrote:

> On Fri, Oct 24, 2025 at 11:47:53AM -0400, Yury Norov (NVIDIA) wrote:
> > Commit 1f9a8286bc0c ("uaccess: always export _copy_[from|to]_user with
> > CONFIG_RUST") exports _copy_{from,to}_user() unconditionally, if RUST
> > is enabled. This pollutes exported symbols namespace, and spreads RUST
> > ifdefery in core files.
> > 
> > It's better to declare a corresponding helper under the rust/helpers,
> > similarly to how non-underscored copy_{from,to}_user() is handled.
> > 
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Tested-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> 
> It looks like this is not quite correct. The header file still has this
> declaration unconditionally:
> 
> extern __must_check unsigned long
> _copy_from_user(void *, const void __user *, unsigned long);
> 
> extern __must_check unsigned long
> _copy_to_user(void __user *, const void *, unsigned long);
> 
> this causes:
> 
> ERROR: modpost: "_copy_from_user" [samples/rust/rust_misc_device.ko] undefined!
> ERROR: modpost: "_copy_to_user" [samples/rust/rust_misc_device.ko] undefined!

I wonder why this wasn't caught in linux-next testing.

Please check the rust Kconfig defaults, see if there's something we can
do to get more compilation test coverage?

> This is because when Rust sees both a helper and a non-helper of the
> same function, it prefers to call the non-helper version. In this case,
> it saw a declaration of the function in the header file, and so it tried
> to call that instead of the helper.
> 
> To fix this, we need to wrap the above declarations in:
> 
> 	#ifndef INLINE_COPY_FROM_USER

It's in mainline now - do you have time to send along a patch?
