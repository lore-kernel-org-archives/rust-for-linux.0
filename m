Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0587A4D957C;
	Thu,  1 Oct 2026 13:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862852; cv=none; b=ei2dkMbaYUp7eFTvnVpwHVaiUTzoAsInbhb14jhCGKoeceLHSbuexFaIOsEerDspERYHVXspncgesemklvvKFAlt5Uz2z/j6u2WzFVV4tWN3jYcsbTjo2AdNWxijRMesDRItVyonRoItSZJqg77ikMRSGdjfCmOSBNxqLuaaSDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862852; c=relaxed/simple;
	bh=kn2kfJxBkaPoOoPabBVX9xXVYYeqk0vySS+fAxtBW1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQnbT3h+Q2+ic8JmhxaZi9d+X+1lUjx7QgEcWzTrCdSTabAN+GFTUW9NjW/9z5iZVM1bYYNoIsQIioB4P84HdObRWKETbTqovDNXgZdknPeYmYtSvyX2qv4PHMzoyXnQpYmld5HiFwhRnMNR3ilsmyqK/hj1LQhSmF/b6QoR9XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iWnkgrVM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iWnkgrVM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C6C1F000FF;
	Thu,  1 Oct 2026 13:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790862847;
	bh=kskZ3/N5JJqk76yzl+JeZUGSFe+C1abpcJtyovYQOvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iWnkgrVMXJJoNRs34OP6AI0a7pBRmg5nkX8smclxX7rudhmxx1rhT03CXPekVVPZx
	 xPkMiEObeSVUt+CnwNDoeJYMy/4IEYU4tDeNtglsh5Kn7WzVV+ep3IUn6KTjG/1fSH
	 ODN3kYilvJ4oyo2E0eEm1/5db34oxpfgS0e4uuGU=
Date: Thu, 1 Oct 2026 15:54:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: nenkov2004@gmail.com, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: binder: Use lower bound for node debug lookup
Message-ID: <2026100149-sampling-playtime-f5e6@gregkh>
References: <20260831052635.42417-1-nenkov2004@gmail.com>
 <20260831054920.42550-1-nenkov2004@gmail.com>
 <2026100156-strongly-plural-e7f1@gregkh>
 <CAH5fLgh5MRMRJfym-Cv=P_bqCzZ+jXh=ieTD=hPX4KrktKtBiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgh5MRMRJfym-Cv=P_bqCzZ+jXh=ieTD=hPX4KrktKtBiA@mail.gmail.com>

On Thu, Oct 01, 2026 at 03:43:25PM +0200, Alice Ryhl wrote:
> On Thu, Oct 1, 2026 at 2:38 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Aug 31, 2026 at 07:49:20AM +0200, nenkov2004@gmail.com wrote:
> > > From: Hristos Nenkov <nenkov2004@gmail.com>
> > >
> > > The Binder node debug lookup currently walks the process node RBTree
> > > from the beginning until it finds the first node pointer greater than
> > > the requested pointer.
> > >
> > > Use RBTree::cursor_lower_bound() to start the lookup at the relevant
> > > tree position instead. When the lower-bound key is equal to the
> > > requested pointer, inspect the next node to preserve the existing
> > > strictly-greater-than semantics.
> > >
> > > This changes the tree lookup from a linear scan to an O(log n) search
> > > without changing the returned node semantics.
> > >
> > > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > > Link: https://github.com/Rust-for-Linux/linux/issues/1249
> > > Signed-off-by: Hristos Nenkov <nenkov2004@gmail.com>
> > > ---
> > >  drivers/android/binder/process.rs | 8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > This does not apply to the char-misc-testing branch :(
> 
> Please check this instead:
> https://lore.kernel.org/all/20260814215145.2050599-1-rafael@rcpassos.me/
> 
> This one is a duplicate, and I prefer the other one.

Ah good, I already took that one :)

thanks,

greg k-h
