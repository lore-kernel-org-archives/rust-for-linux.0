Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB216E613
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711390939; cv=none; b=Lzac0lD4SN9tRIcqOh0rz61s8p1IxaPOHXj3RF2IDtg10GUuVlkyTLyyuVDSQXsPpGadfZetcF+NJF+KAW2WSZp2/SERsdINvs3RQFF47HA7BhjV/PSToukJuVo6398LVGHcqxjrsDKDUG71cWLg+dST+L5xQh/lWvNcdCRdbRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711390939; c=relaxed/simple;
	bh=eWx8xv2fUTmp115FP2mmw3U76BCz9ryhWIO4pwCDjSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZK8m88DCOtMG6sQH0WpA7e4oTLeMiKiyZ4FdcvBNvShfbWiZHLjt2upBAQTdn9RNRj1a6doBERr934cBxavFjASAcQCc3V9vLI87xwnallTUvfJ8VnYpCTFbguoMnV/3CXHbBRn8sCfm+TXp/ox7VUynsF6K1wutRth1Tii9Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Sqg+cO85; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Sqg+cO85"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3A6C433C7;
	Mon, 25 Mar 2024 18:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711390938;
	bh=eWx8xv2fUTmp115FP2mmw3U76BCz9ryhWIO4pwCDjSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sqg+cO85CoeKPA1AxqMz8064fto/KNkAn7NfBKSKAAk90btDgkHZFBjBP2cx3Rnfl
	 qJQEM+k7DIjrFSRymYw1rjSk6xm1OHN1DhSKzoH8ofYtTtP2p6Rxzs1x20vSPaeD+e
	 h9De+JKcPYc4syz6ka3H8xlqwwTCFgs6+BFW/MrE=
Date: Mon, 25 Mar 2024 19:22:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 6/8] rust: add revocable mutex
Message-ID: <2024032553-facing-thaw-7048@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-7-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325174924.95899-7-dakr@redhat.com>

On Mon, Mar 25, 2024 at 06:49:10PM +0100, Danilo Krummrich wrote:
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
> 
> This is a mutex where access to its contents can be revoked at runtime.
> 
> This is different from `Revocable` in a few ways:
>   1. The caller may sleep while holding a guard.
>   2. Accessors are all serialised.
>   3. Accessing is not as cheap (because it involves acquiring the mutex).
>   4. The size of the object is larger (because it involves a mutex +
>      flag).
> 
> An example of where this a good fit to be used in device state that
> holds registrations to other subsystems.

Why don't we need this in .c files if it is so needed in drivers today?

thanks,

greg k-h
