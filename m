Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4F126AC3
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 05:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711431473; cv=none; b=WMWVMSZUhDRVlgx6xz4NnwFxQse//YNshMJ+3o1iSiqO49GRwOV0M6XhUG5HSsVJdMuGWnrtjx9owlYiZ3elugzEvQNAQccIl49swoQRxEKFEgvoJNjl0lkeLAPHpLHu7c2nKoptfMIVkLYEy37hUQflKrC8TP+cNJ4aEP46LEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711431473; c=relaxed/simple;
	bh=0OO5zLwNzI80ckcNfyRAcblDARLbHI1k9gWkDdwlPpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZgWdFeCwiAEnTrlJvNEx16uHHb8B40dDcF4R8xOHXffgWEZhREY3bnN8lqCgiD6kFEyTBGsN2gVgnAkq4S3CDI7X7pN4+F70CDueKUoEuoRfLcgUVpFnYEjuAirZb/M2YFxVfZ///dyMq+BUcCbbOPe9pKtBX20L4kEcOUW+Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f74Pg2iS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f74Pg2iS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13240C433F1;
	Tue, 26 Mar 2024 05:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711431472;
	bh=0OO5zLwNzI80ckcNfyRAcblDARLbHI1k9gWkDdwlPpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f74Pg2iS/Bp5bCHMJRG8ZgBtHyghOSJltZoNJVYL3WrIK/y0Goq2WenHKu0zlZsZG
	 mlxKFd5HnWgyQ023xh8ujXb1QpgyWHjg1lttSK7AJWfW5GtQ8tlqth13YN8cQIoZiR
	 pXVoQTXnR1UM8uTpwsquLTPCZaMtMFZ17Z1OzU/Y=
Date: Tue, 26 Mar 2024 06:37:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: David Airlie <airlied@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 4/8] rust: add driver abstraction
Message-ID: <2024032601-deceased-premiere-1c02@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-5-dakr@redhat.com>
 <2024032530-fester-dedicator-a8a9@gregkh>
 <CAMwc25ryKE7tqA4WdOeQXWJJ5Z++s+p8=bMBAXPKQiw_Stov0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMwc25ryKE7tqA4WdOeQXWJJ5Z++s+p8=bMBAXPKQiw_Stov0g@mail.gmail.com>

On Tue, Mar 26, 2024 at 05:36:14AM +1000, David Airlie wrote:
> > I stopped here.  Please build on existing code in the kernel, and also,
> > a real user of these structures is needed to see if/how any of this
> > actually works.  Why not implement something that uses them that we can
> > actually review?
> 
> Seems like you missed where the cover letter explained that this was
> in the context of:
> https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u

Yes I did.

> Can we stop feeding the chicken/egg problem? :-) This posting attempts
> to focus people on *device* abstraction problem, by posting small
> patch series directly affecting things in an effort to get them
> reviewed, or we post the full patch series touching every subsystem
> and then nobody reviews it because it's 50 patches and it isn't
> focused on the one thing they care about.

Would you want to review new api additions without ever seeing how they
are used at all?  I can't agree to that, and neither would you, that's
not how any of this works, sorry.

I can provide general "this looks really odd" comments, but I can never
give a "acked-by:" for something that doesn't have a user, that's just
impossible.

I understand your prediciment, so work at it in tiny steps like everyone
does when adding new apis, this isn't new.

thanks,

greg k-h
