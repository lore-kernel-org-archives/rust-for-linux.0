Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDED332ED29;
	Thu, 25 Jun 2026 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782404330; cv=none; b=o0X+ZEk5ULWsY4vrI4e7qYl5qizQWYKWGBXyy1YRFuIfH+5iiYV0KmhT4h4Tad7kFJCodERTlO3zJuhsOERRQsUHcn8BVRaqwP0w4j3CSqFp7Ia5uP5eOsezWfCAy9JArQ2eX+slaCXoBEvb68umYJwA4/esddADy6/dyQGEUm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782404330; c=relaxed/simple;
	bh=INaVh26dPTCdukaguJSXh7F0H2e24oPc1TQ7X4QpOWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz+x9UgouLZquOYegCedtAF0Fi1qyZaDPf1i4mtHODlTy/2rrEY5giqtCnFUWYeP1FCY7ANm5IXyyaKlgtXCDQW8gnmTR19s7S5JPDjEMgush9+dWs803i6Bfv+d3/pHBei3uG1g0Yy8EY/N4wWWgLf5XsaSGkQXZ+eSdEyYDg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gEVDQcZi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gEVDQcZi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45CF1F000E9;
	Thu, 25 Jun 2026 16:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782404329;
	bh=fr1VqKCf9v+i2jTnvpZbQR22ja3vgOjQr3J0XNhITz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gEVDQcZikh6sKAUMimCTNwQECsBztew8ZBcAmFepYm0+qbm2qWvmqJn1T3kcopoPX
	 A6KTgxopTZ6hayVVOV5RcafQwu5Z5UUMnSpZLoHvqDjD/hf3FItr00BV+eN8NCloVN
	 lXOKtBDVcJPkCFOJvaMqrj2Tl8rSsL12HmorwZNU=
Date: Thu, 25 Jun 2026 17:17:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Gary Guo <gary@garyguo.net>
Cc: linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: USB: add rust.rs to USB subsystem file list
Message-ID: <2026062523-sturdily-gatherer-30fc@gregkh>
References: <2026062533-achiness-outsell-a93a@gregkh>
 <DJI9EMV1BPI8.FXUXL303AKNG@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJI9EMV1BPI8.FXUXL303AKNG@garyguo.net>

On Thu, Jun 25, 2026 at 05:09:36PM +0100, Gary Guo wrote:
> On Thu Jun 25, 2026 at 4:08 PM BST, Greg Kroah-Hartman wrote:
> > As was recently noted on the rust-for-linux list, the usb.rs file is not
> > listed as part of the USB SUBSYSTEM files, which can cause changes to it
> > to be not sent to the proper list and people.  Fix this up by adding it
> > to the USB SUBSYSTEM file list
> >
> > Reported-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> The subject should be "usb.rs" instead of "rust.rs".

Ugh, you are right, I'll fix that up when I commit this, thanks!

greg k-h
