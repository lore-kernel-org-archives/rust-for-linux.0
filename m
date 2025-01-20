Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2494D5AB;
	Mon, 20 Jan 2025 05:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737352028; cv=none; b=ohdQBXBwPUDUyk6wuDfSzM2CBj0zvk/jnieqrTn9Swhdyx063Eru100vM9iid2UoOAFo+K7+nQu9dOn+Prrecfy6edSsHlXifyy0xU65LArqvSEsANd8HIxmV0iPx/5JjYpDoFQN5I/DKNiRltRHxv0e6Owsff9Dixlzs8ItYKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737352028; c=relaxed/simple;
	bh=YDqZj1IbgmyF7DD7GeEL/gCMQeXX/NdZ3a0SU9UfXRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4tgJCQhWuqxSNT3AxprhuMalRm7HQyHMF1oQ0jYPVWiecLGuiNOvtJ/ttr6t1bpBrjEOEWLZFIbgUexYXDRAdueX9VU2xhy+Xyzhv7LwuciKtQFJz3DB/zcLNe+w/hhtalPfaFxyb0mW6vaP/eDNsoc2wJ1kxt0UcP3fKm6gb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qvFQ2l5k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qvFQ2l5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5A9C4CEDD;
	Mon, 20 Jan 2025 05:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737352027;
	bh=YDqZj1IbgmyF7DD7GeEL/gCMQeXX/NdZ3a0SU9UfXRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qvFQ2l5kaSmj3o4mxfOUxqz4aW1x5WW9iJE/mVJbj02KcmhGwdEhHIbWguMV+Yxcq
	 eYUClQr1xjWuigFmmgJGsC/likyW3rIXfRTb47Yztvn1PQSZZ1y+1izaU56E1sAtFo
	 w348/xcQ8/iaPyh42VSU2Lk9JZWxUDQ3xU4Vm0Tw=
Date: Mon, 20 Jan 2025 06:46:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
Message-ID: <2025012034-rope-canned-43da@gregkh>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>

On Sun, Jan 19, 2025 at 11:11:12PM +0100, Christian Schrefl wrote:
> This set is based on Greg's driver-core-next tree.
> 
> Currently there is no good way to pass arbitrary data from the driver to
> a miscdevice or to share data between individual handles to a miscdevice in rust.

Why would you want to do this?  A misc device instance should be "self
contained" with the needed stuff to make it work.

Do you have an example of where this is needed as I can't figure out the
goal here, sorry.

thanks,

greg k-h
