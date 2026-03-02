Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0380A282F1F;
	Mon,  2 Mar 2026 22:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772490439; cv=none; b=NVsHAW9LH0e/snSvWXCmPMzemxA2iy/FihxhAHn/80meA/wixbHpoKqXVzfzYh0KfPH3QSfZof99JUoawfMn8KOdn6T53t1REFvNcov7i7zyHSqN+Tm7e1/2vwoZ03GZfzOXerJ3Wki1w/sXhu1pkrnogdD2c1c1kVGLkpo6J54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772490439; c=relaxed/simple;
	bh=xn1PL4Sy94ngQ7zDPU3gQ01zFvZNBLmg6iVmgCVctIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKalOW71paEUVahCI1UxJOI97EH1fYGHlK653S8LdDLKJXCoYGWhD5drBs4K1Otz6/Eny8e6IUkfJ6l6yHW23lU6clnIWf+/P8kNEcVb9UW2xjqgCD4bqciOPJkKN52iaomoXGckyWKruzfNSO7KzAdbibiT2Q2gKZjZ2SgUsrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cQjemPIT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cQjemPIT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EE8C19423;
	Mon,  2 Mar 2026 22:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772490438;
	bh=xn1PL4Sy94ngQ7zDPU3gQ01zFvZNBLmg6iVmgCVctIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQjemPITBOy8GgI9/YM0oNHHc79YfRSvyCJmKUDOPBhQ9Eg6GEZoABp2XiPzqs2v7
	 Wn4iPOy+cKT8xxDOyLq0hQzi0TbchMDYVxCfswhlXSmMTI8RiUWTqafKhSC5bXe5zh
	 4EOzZA3Qxuq0NQrNiODdFVWUczv7ePyrMH3NN6Aw=
Date: Mon, 2 Mar 2026 17:27:06 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: christopher.erleigh@gmail.com
Cc: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust_binder: replace is_aligned helper with
 is_multiple_of
Message-ID: <2026030255-foothill-excusable-21ae@gregkh>
References: <20260302-rust-binder-is-multiple-of-v1-1-121149fbad30@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-rust-binder-is-multiple-of-v1-1-121149fbad30@gmail.com>

On Mon, Mar 02, 2026 at 09:35:52PM +0200, KaiserGranatapfel via B4 Relay wrote:
> From: KaiserGranatapfel <christopher.erleigh@gmail.com>

Does not match the signed-off-by line :(
