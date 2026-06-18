Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CD23385B2;
	Thu, 18 Jun 2026 11:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781782192; cv=none; b=CU6udQ9p+0KzT+nymCdZYD/N9tdJnDYOfkB+2Yc1nW44KQp3m71EFWjXVXbwKB0ndF5cYAYKanY572cdZgj0itJTWTNOJErO7SWge0uMsZ+EsmDL43OOBGosOtzIkkIjeoqfWPhNqPxOliOSTmYTUit/B5RIYMnpTcSWFgjoPpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781782192; c=relaxed/simple;
	bh=/2b1rsuQLSB/OhV3gMOCWFphGVo823JFcWST11NZS4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saH+8WLge3ui7gJOa3eIGcXQg3obRD9CR4H8UvrWjezKLf/gHejRpAx92YZlPi+ay35fjJotpxHhkAvU6CmGcDnkJmGTI+YJADazGH3j0lWZiJg4Qb4TXBHRlxlALXmMQawMhapz/qDBW8VwONsTEMer/tFLDOtS4hsM9Re77kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=c+2Sl29a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="c+2Sl29a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD211F000E9;
	Thu, 18 Jun 2026 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781782190;
	bh=lrhsD9SdGkxfQQd7qdON8b4VPGYnREvEyfcjoDkoYV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c+2Sl29afTMWk3XqqIVGr7ud556x688cm8MOzHx7wzuuSThGAiykYYOIvmLec1llL
	 G4Zu7Rm81MwFidK8rAPcUDHIcnSuuTcmiD0Q7gDI1yykGsDu4bbBiDk+LpWdsvWx+T
	 zLSQsOFXHIZEEGf/JKU6eNQWSotU7/FykRJ6eAmo=
Date: Thu, 18 Jun 2026 13:28:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Keshav Verma <iganschel@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust_binder: check context manager before creating node
Message-ID: <2026061858-frugally-upload-17ab@gregkh>
References: <20260617222030.15189-1-iganschel@gmail.com>
 <2026061856-rare-envoy-d585@gregkh>
 <CAPE_3zLCOwqa8Yb21oAb8i9AHW-UPqW=+9848fUtuTKK6wAZDA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPE_3zLCOwqa8Yb21oAb8i9AHW-UPqW=+9848fUtuTKK6wAZDA@mail.gmail.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Thu, Jun 18, 2026 at 04:49:31PM +0530, Keshav Verma wrote:
> Thanks, I will fix the line wrapping and add the appropriate Fixes tag in
> v2.

Also, you sent html email which the lists reject :(

> This can be triggered after the normal context manager has already been
> registered. A second process can open /dev/binder and call
> BINDER_SET_CONTEXT_MGR_EXT with a local BINDER_TYPE_BINDER object. The
> ioctl returns -EBUSY because the context manager already exists.
> 
> Repeating this with unique ptr/cookie values triggers the warning each time.
> 
> Since this is easy to trigger from userspace, should I drop the pr_warn!() from
> the check in v2 and just return -EBUSY there?

If userspace can trigger this, then please remove it so that it doesn't
cause a denial-of-service on the kernel log.

thanks,

greg k-h
