Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAAB1CD30
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 18:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711477082; cv=none; b=SXMezkAnWPJ2KHeeEZJvw7aRxtwitY95JM3nr2fMxvnEYEQyb8ap9He80rhDZSaJ/lhJ3lff04VUmbdZqi0I8VXK3vFe7Ehxbmv7tYhDAnnXaf+LsafK4iijT5Xy9unyKkJ1u46o8Qf0R4S6fO4lgYksJKYUP2Ujwuf+1wYPiQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711477082; c=relaxed/simple;
	bh=wl/IL2dzaTq0EKkByHN0MPjD7sPc/COGX0qFcMtevCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ry3KyU42el+wEL7AfLAng5qL7aFTHqbIKh5/R5vB1lrGRi7fCENd8llVwfqUJ6iP6Sa2lPJr6OiAJZQBRHAWFbaOzzRds9G6SQrmjTL5y/0S7yFUSGKkc191H2wt0PAxL2g1N7uRD4p0WDC5vfe+zrG/C+9u9jhzvdFSHsZTwkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ohW9rfy5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ohW9rfy5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E80C433C7;
	Tue, 26 Mar 2024 18:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711477081;
	bh=wl/IL2dzaTq0EKkByHN0MPjD7sPc/COGX0qFcMtevCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ohW9rfy5kF77Skx6N7gksxx/p3UiuE5U+P7b1xWYH9H6qE83pMMemVZGhOWphrcwy
	 EAJbzq7lA8tURgC4mMj/17lXy9RvzS00G58M761mbX53icsKxW7WCHNOihzK413Y5m
	 HqyQ5ZKqapX8V/3tbswpj2/rTw8MIL7YoIPBhMEw=
Date: Tue, 26 Mar 2024 19:17:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 6/8] rust: add revocable mutex
Message-ID: <2024032621-enlisted-humbly-7bb4@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-7-dakr@redhat.com>
 <2024032553-facing-thaw-7048@gregkh>
 <ZgMQOS01jMa651QO@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgMQOS01jMa651QO@pollux>

On Tue, Mar 26, 2024 at 07:13:13PM +0100, Danilo Krummrich wrote:
> On Mon, Mar 25, 2024 at 07:22:15PM +0100, Greg KH wrote:
> > On Mon, Mar 25, 2024 at 06:49:10PM +0100, Danilo Krummrich wrote:
> > > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > 
> > > This is a mutex where access to its contents can be revoked at runtime.
> > > 
> > > This is different from `Revocable` in a few ways:
> > >   1. The caller may sleep while holding a guard.
> > >   2. Accessors are all serialised.
> > >   3. Accessing is not as cheap (because it involves acquiring the mutex).
> > >   4. The size of the object is larger (because it involves a mutex +
> > >      flag).
> > > 
> > > An example of where this a good fit to be used in device state that
> > > holds registrations to other subsystems.
> > 
> > Why don't we need this in .c files if it is so needed in drivers today?
> 
> You mean revoking access to a resource in general? 

I mean "having a mutex that can be revokable" as you describe here.  Why
is a driver written in rust unique in needing this?

thanks,

greg k-h
