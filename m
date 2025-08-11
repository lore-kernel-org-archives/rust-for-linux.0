Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F3E2D879D;
	Mon, 11 Aug 2025 07:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754896409; cv=none; b=t3LEGUB62Hx9UFOsnTbVtT0J0uL3UBZctm5QtGlnsfwSHmSy51boNSFlcSUt4Pyi1/2ghKa4v96LQylNvPev3N5kJgMnjzLm5KXA0lDYKGjZCTFM/BWHXR1W2fhp+3FbFNW8JX3v1njx1KyRYdnw/6AgeGiPWa88C8h/Yz2T/1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754896409; c=relaxed/simple;
	bh=fy6WKKXfLb4l8ZbekJpf2ROr+HJdYo+cKWY2UVwT3Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRUn9EQDF+KUxdW0shLAfu8QHyV7OfKw1G/5HbA/yFkEM7kITQxAVwFCYytSp5r+/CDdzuZnOV+5ng+T1NW2Nqw0LLehnZlkPX4GUvfoVv++uN4+LDQbHAhvhIA2VLN9vZhLL58z0yRDDGQqwhVX5rcjHk1o0p4SFLbq6ONKUyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FsVvcghb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FsVvcghb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB387C4CEED;
	Mon, 11 Aug 2025 07:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754896409;
	bh=fy6WKKXfLb4l8ZbekJpf2ROr+HJdYo+cKWY2UVwT3Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsVvcghbsb6k19xq8a6pV7q08tWDaU+fGYyRfLH3zsYm+ENHMRLRRvQkVzj9bOSbZ
	 K5AxcFvPA6XLTmFn9fHz7j7fnb0wfPwF3jIE0iXAaXqFDnHDm/TRBzP5BkPIxCn+4s
	 VWJf3FxVkF9lgu/nJpyDBCZJgahdjf9BUy65HgLI=
Date: Mon, 11 Aug 2025 09:13:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: ~_xllx_ <elle@weathered-steel.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH linux] of: resolves TODO for copy_from_slice
Message-ID: <2025081151-brunt-grief-fd48@gregkh>
References: <175489428990.9320.6825335165759789458-0@git.sr.ht>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175489428990.9320.6825335165759789458-0@git.sr.ht>

On Sun, Aug 10, 2025 at 11:23:55PM +0000, ~_xllx_ wrote:
> From: elle <elle@weathered-steel.dev>
> 
> Replaces the copy loop with `copy_from_slice` which became `const` in
> stable Rust with version `1.87.0`.
> 
> Authored-by: elle <elle@weathered-steel.dev>

This isn't a normal kernel tag, the "From:" line guarantes this, please
no need to repeat it again.

Also, we need a full name please, as per our documentation.

thanks,

greg k-h
