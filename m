Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DFD70810;
	Mon, 26 Jan 2026 12:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769431995; cv=none; b=puA7E6rgdRavfW/FJrNler4yX8gXXfk1uglUxpIk+YcLhZLyOzISyIKIinNAvuEpYJFSYRSNJ8WED/mh5LPNAS/sjFaqkLUb35qP3b1uNTeJL3Qpx6iZpAjzaCWjUMzXgNmGTO2iXuIVOESwVhiN2w46EjpLzfR3OZvzS9EJ6eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769431995; c=relaxed/simple;
	bh=uI4G6+wkyP3HfvPa9RRBlCM8Xe7AEQVzVlSUR/qgt7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiSFyAvfEbIUHgHUePI/LfXe6jTmemd10/KBLeaf9uhYqNNIbF4zmuPM2pfAs3iGXVvslIuGOl4EZVsGP6/gHJr30AoO3IvtdF1qmHfJ1dV8j1aGOb6CZOoPuhen1h+5AKyvLxa9F9WPmri3N6xerb9hXKTilsvlC1eeBynM0Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qwyWwX2B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qwyWwX2B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B5AC116C6;
	Mon, 26 Jan 2026 12:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769431995;
	bh=uI4G6+wkyP3HfvPa9RRBlCM8Xe7AEQVzVlSUR/qgt7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qwyWwX2B5Zck4ZJhPgCcWE3y4DqUHyd6BAVjfWz5LCQW8mid/czqLP3IQ0Ii4CVEd
	 crzlM3jdPTQH1fNeEYuGfyu+al/b5Fng9Mbu4kGKrVg4Zu/bRknUlos9YbqAXLgUcJ
	 1O8ZGNcw+WcPxHiPwPeyUfCFyWLM/xlLynGf8cX0=
Date: Mon, 26 Jan 2026 13:53:12 +0100
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
Subject: Re: [PATCH RFC 3/3] char: rttyprintk: add Rust TTY printk driver
Message-ID: <2026012603-flail-explore-f8e7@gregkh>
References: <20260126-rust-tty-printk-driver-v1-0-28604e7e100e@gmail.com>
 <20260126-rust-tty-printk-driver-v1-3-28604e7e100e@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-rust-tty-printk-driver-v1-3-28604e7e100e@gmail.com>

On Mon, Jan 26, 2026 at 12:22:10PM +0000, SeungJong Ha via B4 Relay wrote:
> +        let opts = tty::Options {
> +            driver_name: c_str!("rttyprintk"),
> +            name: c_str!("rttyprintk"),
> +            major: tty::TTYAUX_MAJOR,
> +            minor_start: 4,

You are not documenting the "take over" of this minor number under this
major number anywhere, which isn't ok for using a static minor number.

And while I understand the need for an example driver, the ttyprintk
driver is a very trivial one overall, we don't need another one in the
system as one is enough :)

thanks,

greg k-h
