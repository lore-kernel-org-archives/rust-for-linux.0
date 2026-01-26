Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A353EBF33;
	Mon, 26 Jan 2026 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769431698; cv=none; b=i6i7XQn/p8I8Q8c/icFzmrweLzirsQeZNZMKkPVeg2Tf+mpiWnLKztjkMWhHegKkj7Vz+cS+xwThGbmp7jE0Xm/gJxdCj7Z+LaUyD04QDef1NPFo4jNI1JpDVrjPAkeKD8xkdzef4vwz2wRo5IL0t0Wx7THUk63BnSV+PgatKD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769431698; c=relaxed/simple;
	bh=SfmO0AWwheX5MfkMVz80nlh7QyJ+2vxcfmaHqOpg2o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKIx3BQiRZmClarNbL7YRZSWZ9k0uUq//9m+ZGkMXDJ0PWlcAhk6OuyehiwsCU54/lWTayVcLRMQ65v0Ah1k/WY0ZuHyZYAGdfaCsi2P6fMnf12BYKLyCNBOxCSAbtiCnxBgEn6UNSd/+jwLOuBHZ4e/uA5kz8suewsH7PNSpb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mxwQJHDJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mxwQJHDJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5BCC116C6;
	Mon, 26 Jan 2026 12:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769431697;
	bh=SfmO0AWwheX5MfkMVz80nlh7QyJ+2vxcfmaHqOpg2o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxwQJHDJXlGvmg/l4srWMgkoXrIMKqWSngYHnz9v5/LpR+KuHDdimH2oWWxznMYLd
	 uyZiFB1gv+juSdMe+RjzdsxtpBScMwYaDhml2T99z7WM1YDXArkQsdjtpHIKaZVWi4
	 w/MQbf17FzpA+EdqKTgoURhFZv0J2ZttJzp5KKEY=
Date: Mon, 26 Jan 2026 13:48:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: engineer.jjhama@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] rust: tty: introduce TTY subsystem abstractions
 and rttyprintk
Message-ID: <2026012652-case-subsector-f671@gregkh>
References: <20260126-rust-tty-printk-driver-v1-0-28604e7e100e@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-rust-tty-printk-driver-v1-0-28604e7e100e@gmail.com>

On Mon, Jan 26, 2026 at 12:22:07PM +0000, SeungJong Ha via B4 Relay wrote:
> Hello,
> 
> This RFC patch series introduces Rust abstractions for the
> TTY subsystem and implements a sample driver, rttyprintk.
> 
> Currently, TTY abstractions are missing in the
> Rust for Linux implementation. This series aims to fill that gap.
> 
> It consists of two main parts:
> - Rust TTY abstractions

What type of new tty driver are you writing that you need these
bindings?  The need for new tty drivers is quite low based on the lack
of new ones being added to the tree anymore.  Are you sure you just
don't want a serial port driver instead?

> - The rttyprintk driver
> rttyprintk serves as the first example of a Rust TTY driver.
> I chose to port ttyprintk because its simplicity makes it and 
> ideal candidate for validating the new abstractions and demonstrating
> their usage.

I would want to see a real need for this before going any further.  It's
great that you created these bindings, but without a need, I don't see
why this should even be reviewed.

thanks,

greg k-h
