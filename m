Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EAB3DAC14
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 05:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711517157; cv=none; b=eajilPYGs94Fs4bemEm4nBpFd2gw7Km7bqfpqkDDxwf2O9IuCrPF6Qw8egdFa3dVxwvtqfMx7EcVuXk62wdsparK4vk6Bb19TtWF5xDUqZJLxS/0LVhPOScdUJIO/hpAcpUnabKT7Q4xPGVzNVCedSnfIDkiXyXn5ptuSxJsMRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711517157; c=relaxed/simple;
	bh=YuQQnN2F6Cucttl6AAzPbIXgTVtTSpQlVsRYdaISJ+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuHnswUGGl8t01djXOAxaduj+fI3kOoxFR4Mvh2jEFpMwkZewUtaibDvwgmILIg7nH77tiLqCMGuKcbyVuhuR8r9NGUJzDVvA2nyT6Y9t5Wy8ATFJtBTR0K9P9swk//HMAnSiLnuTWU8WCSIcYgGZkDRxAuzAhJ1S3/375h90SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=v/OwHnub; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="v/OwHnub"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10676C433C7;
	Wed, 27 Mar 2024 05:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711517156;
	bh=YuQQnN2F6Cucttl6AAzPbIXgTVtTSpQlVsRYdaISJ+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v/OwHnubKarZNdnq8zgYslj/h8jltCtnfhBGgqiGOI8ldGuAAqQey6zwMuTyO7D5a
	 lsHdZG1OQHVcHnY5R9s80AdimZkTy4Qmm9GuVG0iVZ6pVXb8vyEsRidcgNWeUHi5iU
	 X60UdK/MAaaGD+Ofw8L4Jq0tr3phEQzg9WeKCoA8=
Date: Wed, 27 Mar 2024 06:25:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 2/8] rust: device: Add a minimal RawDevice trait
Message-ID: <2024032747-labrador-remindful-4683@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-3-dakr@redhat.com>
 <2024032501-unplanned-detergent-4357@gregkh>
 <ZgNOda6P-dfUaZSV@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgNOda6P-dfUaZSV@pollux>

On Tue, Mar 26, 2024 at 11:38:45PM +0100, Danilo Krummrich wrote:
> On Mon, Mar 25, 2024 at 07:14:17PM +0100, Greg KH wrote:
> > On Mon, Mar 25, 2024 at 06:49:06PM +0100, Danilo Krummrich wrote:
> > > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > 
> > > Add a RawDevice trait which can be implemented by any type representing
> > > a device class (such as a PlatformDevice). This is the minimum amount of
> > > Device support code required to unblock abstractions that need to take
> > > device pointers.
> > > 
> > > Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> > > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > ---
> > >  rust/bindings/bindings_helper.h |  1 +
> > >  rust/kernel/device.rs           | 23 +++++++++++++++++++++++
> > 
> > As fun as it is to bury .rs files down in rust/ where no one notices
> > them, I'm going to ask for this to live in drivers/base/ please so that
> > we notice it and it shows up as a first-class interface here.  Otherwise
> > it's going to be impossible to keep in sync over time.
> > 
> > Also, who is going to maintain this?  Didn't checkpatch warn you when
> > you ran it against this patch?  You did use checkpatch, right?  :)
> 
> Sure, but I left this open to discuss this intentionally.
> 
> As you might have noticed, I'm not the original author of those patches. I
> gathered them from various places (mostly the original R4L "rust" branch).
> 
> I basically figured out the dependencies, structured things in corresponding
> staging branches, fixed some issues and polished the commits; the details are
> in [1].

And it looks like you ignored the review comments from a year ago when
these were last submitted, as Wedson pointed out :(

Please, when taking code from others, be sure you are not sending stuff
that has already been rejected, that just wastes all of our time...

greg k-h
