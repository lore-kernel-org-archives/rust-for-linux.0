Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E28831B10F;
	Thu, 30 Oct 2025 12:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761827940; cv=none; b=IiQFv+7qd5dksSrTDgyB8jnqHL09W2MlogbQBMO2OM8pW0oTAO/lzZH9HwGtVLCaM51K2vUlm4DUG8JOOP3gIjnLwyrV9U9gG9BXSNoWwzo4QVHX3vxIbpZA+bCCMlBpOzbGJzO05yCCSTECXGSzI3iMjglVoszPp5f1m4LommY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761827940; c=relaxed/simple;
	bh=CUJuPCj+7pb+v7WG5ekVDxlnrfbWLbs4G9AZ2YFfZUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reDTG717sGE0rC7V4mtRCJfIvZ077IQyufjOw86J0rSRtyO7skceVGPKRYNxMXqpMOBDgYSv04WSbwLYSnUjh7lJ2RYWWJhpDn5lQUOWhYrOTfj9x8IqywwctIG6EOH4BCFCxO/RN8ReDAOTra6fSYd8ff7j1NK1/0TSKV+dce4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MezHl6fU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MezHl6fU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801B6C4CEF8;
	Thu, 30 Oct 2025 12:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761827940;
	bh=CUJuPCj+7pb+v7WG5ekVDxlnrfbWLbs4G9AZ2YFfZUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MezHl6fURjYZnWBGT3GgHzsPWAMZYD0BvCrUSbaPr99z0cz9HZKZskKaQBRr3pZdn
	 es1wlSGa9AQTDYY8ApNAnpvzY5Lk2sqPYDocO7pvA+RsAf9fLqcjR79LLBaCpg00hd
	 LdXgbpKgcD7MLKL0uzp7r5gsrtpRT59c0hTZdEV8=
Date: Thu, 30 Oct 2025 13:38:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Carlos Llamas <cmllamas@google.com>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust_binder: use compat_ptr_ioctl
Message-ID: <2025103017-driller-implant-849e@gregkh>
References: <20251030-binder-compatptrioctl-v1-1-64875010279e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-binder-compatptrioctl-v1-1-64875010279e@google.com>

On Thu, Oct 30, 2025 at 10:41:04AM +0000, Alice Ryhl wrote:
> This is commit 1832f2d8ff69 ("compat_ioctl: move more drivers to
> compat_ptr_ioctl") but for Rust Binder.

You might want to spell out why this is happening, not just refer to
another commit to try to find that information to make it more clear
here as to how to attempt to review this :)

thanks,

greg k-h
