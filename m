Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD8361FFE;
	Wed, 22 Apr 2026 05:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776836231; cv=none; b=J2TUjAO7o566ew9TP4jQq2FyOq39yuHhGjNHJDyvILinNChKpbYKOPhLbaN2ITOPrn2/HQ1Den7dXLxWSg4l5fR4n8Tlw4O+/Q4zvOE8PMDhsbm6XUAVfezpGXmCbpJ6+VoUE6v1/5I6vSAs5PKSZklXajwrGV4CBi/Zn+sv7go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776836231; c=relaxed/simple;
	bh=nf6DX8P7jWOaYX7FIOLVcSD8N8Gq1gE6fF0EH19IWWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQdgdUhX9MY0SIG6hEbkCoSVclc6ukPVSh3olX89RBs/jqK9aXFPAYsJm8LBRkvkQE4x3D8FGgcyGleZ8VHPEn6PNysBykL/NN0ozWBq+ppNd72YH8wUPyAtwnEgLSq85J1/pF7IYWGD+WnX3FtUEf2pvhvoL6zAf+ZMKzQmNqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zE5DtZKS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zE5DtZKS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1549AC2BCB3;
	Wed, 22 Apr 2026 05:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776836231;
	bh=nf6DX8P7jWOaYX7FIOLVcSD8N8Gq1gE6fF0EH19IWWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zE5DtZKSxlTnv6Co74o0Z16gPFlL3kun6Ul0tkHRyqhC1IxL7AL/SggOiwZdsm2gd
	 irA49B56sGTkdA+N7bu+ie2eu6eZIWXZdfN8+VbA2s9BejqCefWUcisrv+g0g16+bN
	 ZtWPzwHXGvDHx4hIy62qHHTlL0JECWd8d8UPRsfg=
Date: Wed, 22 Apr 2026 07:37:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashutosh Desai <ashutoshdesai993@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add task_work abstraction
Message-ID: <2026042244-repent-uncorrupt-4e2b@gregkh>
References: <20260421063836.742965-1-ashutoshdesai993@gmail.com>
 <2026042140-trickily-apprehend-0076@gregkh>
 <20260422003117.929304-1-ashutoshdesai993@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422003117.929304-1-ashutoshdesai993@gmail.com>

On Wed, Apr 22, 2026 at 12:31:17AM +0000, Ashutosh Desai wrote:
> On Tue, Apr 21, 2026 at 08:44:01AM +0200, Greg KH wrote:
> > Do you have a user for this binding so that we can see how it is being
> > used to determine if it is correct?
> 
> The motivating user is drivers/android/binder/deferred_close.rs, which
> calls bindings::init_task_work() and bindings::task_work_add() directly.
> 
> Converting it is non-trivial - the current code schedules the task work
> before closing the fd on purpose, so it can bail out if scheduling fails
> without having already removed the fd. Our API requires the data to be
> ready before calling add(), which would reverse that order and change the
> error semantics of close_fd().
> 
> Happy to send a v2 with a conversion patch if that is the preferred
> approach, or to discuss the design first if needed.

Having a user of it is key to see if the new api actually does work well
or not.  On it's own, it can be hard to determine.

thanks,

greg k-h
