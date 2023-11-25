Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A736811189
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Nov 2023 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HICul6Y3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCDEC433C8;
	Sat, 25 Nov 2023 14:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700922394;
	bh=WJqDOKsJ9Glk7K1YdRCLvcxH6F02SwD8nx0As1NGWuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HICul6Y3wp0+NFZgm9sAIPvoYVL4zS5BjH8s/DtReiEWIEkWqsDbkLVK+t6Lw9LCO
	 p/OXrAFzJH5lvqf7IhERRyjnvBqcjiTrgalErU4zhcW/dZQ1EUHT0vuG+tOsUxXftA
	 H5Q/5jTTWOjD5ZZzqFdnphVCIAdDWA6YDgABH7X4=
Date: Sat, 25 Nov 2023 14:26:30 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rust: macros: allow generic parameter default values
 in `#[pin_data]`
Message-ID: <2023112525-impatient-untwist-ee3d@gregkh>
References: <20231125125024.1235933-1-benno.lossin@proton.me>
 <20231125125024.1235933-2-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125125024.1235933-2-benno.lossin@proton.me>

On Sat, Nov 25, 2023 at 12:51:09PM +0000, Benno Lossin wrote:
> This patch adds compatibilty for generic parameters defaults by using
> the newly introduced `decl_generics` instead of the `impl_generics`.

This says _what_ is happening here, but not _why_ this is needed at all.

Try taking a look a the kernel documentation for how to write a good
changelog text to make this much better.  It's often times the most
difficult portion of making a kernel patch, the code is easy, writing a
summary of why everyone else should agree that this code is acceptable
is hard.

good luck!

greg k-h
