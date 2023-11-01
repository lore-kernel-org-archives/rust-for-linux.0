Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EE5107B5
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 18:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CuRJpRqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3012C433C8;
	Wed,  1 Nov 2023 18:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698862506;
	bh=ckc4brig/10PIMBqKpo2HHz07zo8C9ezLGNHJDjitxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CuRJpRqiIj8ZhYbFgPlMora2UTDgyJyT702NOd15quN3CsndS77MX+srTRzYbSSQL
	 LYnAAvlHKGTr83Q3pzvOyHLFBE1G+Prykm3vg1idiT0v8SD9WAITXRLl/5vnFZKBWa
	 tuWX2a1kgtGLmLoArr1el3MK/QF0/mevvr3OxTxg=
Date: Wed, 1 Nov 2023 19:15:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Matt Gilbride <mattgilbride@google.com>,
	Jeffrey Vander Stoep <jeffv@google.com>,
	Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH RFC 20/20] binder: delete the C implementation
Message-ID: <2023110131-slobbery-yin-72d6@gregkh>
References: <20231101-rust-binder-v1-0-08ba9197f637@google.com>
 <20231101-rust-binder-v1-20-08ba9197f637@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101-rust-binder-v1-20-08ba9197f637@google.com>

On Wed, Nov 01, 2023 at 06:01:50PM +0000, Alice Ryhl wrote:
> The ultimate goal of this project is to replace the C implementation.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

:)

Seriously, this is all great stuff, thanks for posting it, very
impressive.  Let's see how testing goes!

greg k-h
