Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14121A9FA6
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 12:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755002620; cv=none; b=AJkPha9k90bhzGNAm50O+v1yPNYS/VhnZa5QLiy4t5z7oXqjjEQ3AVVSisfSaXYghjuAmaOncL2F4EoLbZW5/EEu0cEUrRQyC2KFnu8Tj3TkcQrgiPfgLWQIk0tx7Lf4s8q8rCKCt+58bsHhhIxbAQ/EnZtG2/CCG8bwshjBiZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755002620; c=relaxed/simple;
	bh=imJG6J07E7DpueeMFIeV7G8plOArs2m6AZ3hzOHR4bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLGzBP3ukmDWpl1DbZfTpKRfmiblJvR5bJHMNA7+Q+00fv8AL2E+Y5NoQCOi4H6eVYikjYF8mqF1uEBnyXb+5/LgH2KECc+Y32rgGwBQMjk5n0feKWdRla/+0yD6wlVw761LVKaPmN+cVq/Sw3l/YgIsGRRot8DnZnrhprSVMOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WtfVnkJT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WtfVnkJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5F1C4CEF0;
	Tue, 12 Aug 2025 12:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755002619;
	bh=imJG6J07E7DpueeMFIeV7G8plOArs2m6AZ3hzOHR4bU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WtfVnkJT3BSyzWMYsufHhU4LnhmHpab9XQqv2Q2p7B3yvy0dRI8fOV5T2RAbTiZFq
	 u5mBTnlNR7GkGPXf3HrbM/P9XZ4Hekbs/jTIQ1Ze2RX1SLOlzTPqXzq9/VUgWcH6YK
	 0Eh3K8klYFmy5S6AdMwv2l3TTz15T7ML4jPsQw7s=
Date: Tue, 12 Aug 2025 14:43:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: trev <trev@trevrosa.dev>
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, rafael@kernel.org,
	dakr@kernel.org, arlied@gmail.com,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	"aliceryhl@google.com" <aliceryhl@google.com>, vireshk@kernel.org,
	nm@ti.com, sboyd@kernel.org,
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
	brauner@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, rust-for-linux@vger.kernel.org,
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, jack@suse.cz
Subject: Re: [PATCH] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
Message-ID: <2025081204-cheesy-scariness-0074@gregkh>
References: <CACvsgUCBk5Dt2yBSy9_NA0z38-wP68vvBX7XDYgJGinTURT1kQ@mail.gmail.com>
 <2025081221-cloning-able-a6ed@gregkh>
 <CACvsgUDP8rX4evCbaNC1MTy56qWH655Cc2bOLuryUxfP-o4_4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACvsgUDP8rX4evCbaNC1MTy56qWH655Cc2bOLuryUxfP-o4_4g@mail.gmail.com>

On Tue, Aug 12, 2025 at 08:24:19PM +0800, trev wrote:
> On Tue, Aug 12, 2025 at 7:56 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Aug 12, 2025 at 07:09:11PM +0800, trev wrote:
> > > `AlwaysRefCounted::inc_ref` is a function that shouldn't be called lightly.
> > >
> > > To prevent accidentally calling it, `inc_ref` is now changed to be an
> > > associated function.
> > >
> > > Modifies all `AlwaysRefCounted` implementors to work with this change.
> > >
> > > Suggested-by: Benno Lossin <lossin@kernel.org>
> > > Closes: https://github.com/Rust-for-Linux/linux/issues/1177
> > > Signed-off-by: Trevor Chan <trev@trevrosa.dev>
> >
> > This doesn't match up with your "From:" line :(
> 
> Sorry, my bad, what should I do to fix it?
> 

Fix your email client or whatever tool you used to send this and send a
version 2 patch in a few days after others have had a bit of time to
also review it.

thanks,

greg k-h
