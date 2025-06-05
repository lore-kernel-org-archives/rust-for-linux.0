Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B491C84D7
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Jun 2025 06:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749103664; cv=none; b=oJYaer17Bxv/rVRgK8dMo+nO6xk60yvAI8aCoSPjs+2I67j7w81XjrJkY8XWYgrGcAb3/BFWTqWWnHjoW/d03G81vs1qmbNLjDWM/831X5FZDUGalA6dhZ30U4CWryR7PlJwvp8IBi25lNTlgNRXB1d+MLHXjcw+cmfuSzE/LQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749103664; c=relaxed/simple;
	bh=of+HD03pM3Thb6V3KxpEM2cX0DPzkYryuxzKk8t/2uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aM4QqQboeExE89fW0lhJF9CG9NwRKo0dXbTMrepVj9hDWjwxaiDIOrIlc+ihIfzpneDasyn1Ajrew3bxJh1k3FOkaoDFGn6DSSIWemsLg5ywqU469GMGdOQVbFqHwuInmkBnBwMNtqq/N8YroeUcu6U4cU87s7lcfW5jMVRZN2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZHXcY+JZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZHXcY+JZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BE4C4CEEB;
	Thu,  5 Jun 2025 06:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749103663;
	bh=of+HD03pM3Thb6V3KxpEM2cX0DPzkYryuxzKk8t/2uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHXcY+JZLfC/wgTXhbq/d58V6/+ZPffyNGY44AhmNQTVBecRvyOsDdNgAh9d2/jiI
	 FPo5JnQdusj2UM+yJegwNH1NWs6wOoPMugJwS8lRNpA8tiPBT7f3ok+vfNSTS0vrAU
	 UpKAa1uTv6JhR/xN9fJVCMU1xW89Gs9fbEv0tzwo=
Date: Thu, 5 Jun 2025 08:07:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
Message-ID: <2025060508-spool-twistable-66af@gregkh>
References: <20250529184547.1447995-1-ttabi@nvidia.com>
 <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
 <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com>
 <7f644a70cc0c91bb42badd1ac747518843bb1ef7.camel@nvidia.com>
 <CANiq72mLEFV6iEX43=+d+5P8g9HT+Wip7eTBgPgqXQ--=dQxWQ@mail.gmail.com>
 <874ffd400b0632cff99b618661adffe472abbf8d.camel@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874ffd400b0632cff99b618661adffe472abbf8d.camel@nvidia.com>

On Wed, Jun 04, 2025 at 08:38:12PM +0000, Timur Tabi wrote:
> On Wed, 2025-06-04 at 12:28 +0200, Miguel Ojeda wrote:
> > 
> > > I could add a sdbg!() if you think it would be useful.
> > 
> > Yeah, that was what I was thinking, though it is sadly one more letter.
> 
> Maybe dbs!(), or just d!() ?

Wait, why are we trying to reimplement the existing pr_dbg() code in a
non-standard-way?

Please just do exactly what that provides, we don't want different
logging functions in rust code from the c code, that way lies madness
and very grumpy maintainers who have to read code on both sides.

Let's just do EXACTLY what the C code does, both in functionality AND in
output to the kernel log please.

thanks,

greg k-h
