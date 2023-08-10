Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77247EBD
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Aug 2023 05:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626F3C433C7;
	Thu, 10 Aug 2023 05:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691644135;
	bh=ltls7Xy4ElJg5NFV7SuJ3Wpgo3N85rLluLSWpMQltU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ehZ1bnIWQJcTIoq8oGlqWmFYToNHrYUYZmhryU4gBToY57nJtzGyGoA2fNFIaGcD5
	 oeyibd47GuNXCHy+wYpppc8bX0OWjxFAbebx1+wTblgAruc+JusNzpo2BvvbeKjbpJ
	 /QrD9EM4lg+vQMZh/ETZUk+g0M7+Z09uReh93BTw=
Date: Thu, 10 Aug 2023 07:08:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: macros: add `paste!` proc macro
Message-ID: <2023081043-cake-catwalk-1ba8@gregkh>
References: <20230628171108.1150742-1-gary@garyguo.net>
 <CANiq72miVic=P+qSobuUqXoCuKW30_tT_buD8MyEsyVb_uoj6w@mail.gmail.com>
 <20230809230249.01ffc009.gary@garyguo.net>
 <CANiq72nWArGsvWVVknPdAVYUbWqJKfwOAVCRUmLnuAHAHP+rSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nWArGsvWVVknPdAVYUbWqJKfwOAVCRUmLnuAHAHP+rSQ@mail.gmail.com>

On Thu, Aug 10, 2023 at 12:29:06AM +0200, Miguel Ojeda wrote:
> > All my kernel contributions are permissively licensed if possible, so I
> > am fine with this being either MIT or GPL-2.0 (I think GPL-2.0 is
> > deprecated in as a SPDX license identifier and it should be
> > GPL-2.0-only going forward, though).
> 
> Yeah, the 3.0 version of the SPDX license list deprecated `GPL-2.0`,
> but the kernel still allows `GPL-2.0` and lists it first. I recall
> thinking about this before the initial merge, and I think I went with
> the original form because the main `COPYING` file still uses that.
> After that I am just keeping it consistent, though I am not sure when
> the kernel will migrate.

The kernel will migrate when we have converted all files in the tree to
SPDX and can worry about things like the SPDX version level.  We have a
ways to go still...

> > Given this is non-kernel specific generic code, I think it might worth
> > following the convention of the paste and pin-init code and make it
> > `Apache-2.0 OR MIT`? This would also make it the same license as the
> > `paste` crate (although we don't have to keep the same license as this
> > is a different implementation).
> >
> > I'll leave the final decision to you.
> 
> Since you prefer it and it makes sense that someone may want to use it
> (`concat` and `expand`) elsewhere, let's go with that. I will add:
> 
>     // SPDX-License-Identifier: Apache-2.0 OR MIT

Be VERY careful with dual licenses please, and especially non-GPL ones
in the kernel tree.  It gets tricky very very quickly and you need to
know what you are doing.  So much so that I really want to see a lawyer
sign off on such a thing so that everyone involved understands the
issues that this requires.

Otherwise please, just default to GPL-2.0 for kernel code, unless you
have real reasons why it can't be that way, as remember, the overall
license of the codebase is that.

thanks,

greg k-h
