Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0865B241667
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 15:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755186157; cv=none; b=ADD0wLvMysyA8SjqWUzqmrLTfqk0AZMYIugQrqyOo+1jtnIIAUamxvaPp3tQWTgsRZe0QfL0p06z4ImKkaTTr7ynOoGVGWpFtbS3iojAM9p5RV6I1m/Gz9bWqaolJ3q/vmywhDj7S7x5dNxk+Ph+Rm9yftTDmF+p6pLBZc0CAhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755186157; c=relaxed/simple;
	bh=eMCwDboLuWyNB9/My+olZFONfgoNRgzSV7iZNhYF778=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdTUxfEmmsOjedjVsJyfPhxr9+oo4qjWkrjgE5OAiCqWHK4w0O6skog4GOjamoqHAr/EyujdZ6aFfykKRo8VBUvGpo9WHYVoDPcAyXLOLNWp+ZvYzSmLUZ8GuUQnJ4GdNVdTH4j224pPuHOxBogKSTNtMM6mvTluuYiPn1aZLUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fIaF2Jnx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fIaF2Jnx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AA7C4CEED;
	Thu, 14 Aug 2025 15:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755186156;
	bh=eMCwDboLuWyNB9/My+olZFONfgoNRgzSV7iZNhYF778=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIaF2JnxDc+usxhZWwoN1tpZj9tgiQz6Qv3uAE+uZQwhOhAxonOoDmiDahF5aCvda
	 JSvtjXV4n0WXZQw5QJ8VpzUFoQM7oRb4Na4xGos1mUucpnp4l0TqJsXO0RZ/al2PlL
	 H10OPqFqCb8pQcipgwPlbRTBqFc/vQXYaa0w+vmM=
Date: Thu, 14 Aug 2025 17:42:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Untrusted Data API
Message-ID: <2025081448-creation-timid-b972@gregkh>
References: <20250814124424.516191-1-lossin@kernel.org>
 <2025081416-sufferer-economist-3f00@gregkh>
 <DC295B7454Y8.9RVKVMPORAZ9@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DC295B7454Y8.9RVKVMPORAZ9@kernel.org>

On Thu, Aug 14, 2025 at 05:22:57PM +0200, Benno Lossin wrote:
> On Thu Aug 14, 2025 at 4:37 PM CEST, Greg KH wrote:
> > On Thu, Aug 14, 2025 at 02:44:12PM +0200, Benno Lossin wrote:
> >> I didn't have too much time to spend on this API, so this is mostly a
> >> resend of v3. There are some changes in the last commit, updating to the
> >> latest version of Alice's iov_iter patche series [1] & rebasing on top
> >> of v6.17-rc1.
> >> 
> >> I think we should just merge the first two patches this cycle in order
> >> to get the initial, bare-bones API into the kernel and have people
> >> experiment with it. The validation logic in the third patch still needs
> >> some work and I'd need to find some time to work on that (no idea when I
> >> find it though).
> >
> > Nice, thanks for reviving this!
> >
> > And we should at least add an example using it, otherwise it's not going
> > to help out much here.  Add it to the misc device driver api?
> 
> You mean `rust/kernel/miscdevice.rs`? What parts of that API are
> untrusted? 

mmap() is, but you can't do anything about that...

ioctl() is the callback that is taking untrusted data from userspace.
That's one place we have had more kernel buffer overflows then I can
count and ALWAYS needs to be properly verified before anything can be
done with the data there.

And if write() ever gets implemented, that would be as well (but the io
iter stuff should cover that).

thanks,

greg k-h
