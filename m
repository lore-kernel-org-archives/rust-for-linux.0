Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C51199FC5;
	Wed, 18 Dec 2024 12:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525811; cv=none; b=cqKrs14KD5ATQKJlm5WfFEnJHmenlIc437CLnFk6sLfnCDYUHr5D+PifdRxiHseUOZ8LMyA9yaP+MiixEN7xUkhcDtZxhvOgdDQR+sU72zmjVaxpaIPguJk3us1zUuW3iQBslJQFGvi1gZkfZRggrJ/wEUSaMTXnIgooIfvsm5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525811; c=relaxed/simple;
	bh=V0LCVTYzN+FudjJVuJDKPEga0zsP2H3u9YX5b0THAZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTmZAkl/U3+K/Ic+UYNO1fCR2WKALWOZGswcXTOrhib2S8InBMvUiHGC8SQjdJqn2SXdPZyS3eiW7yExNFlPwb5/AQsScCDXA5rY2/n97k1ChIqoN5Fy8T4svzH6uaCzxoegy8H9Y9ZuSXqHC+WnxZ37rDGjLVEq5Hx7l7bmC+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8mhtFUs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8mhtFUs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5A4C4CECE;
	Wed, 18 Dec 2024 12:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734525810;
	bh=V0LCVTYzN+FudjJVuJDKPEga0zsP2H3u9YX5b0THAZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G8mhtFUskUEh5QVJ41MVQ3X33KrqxAmnxD+r9ACy0vnJks7EuhgXoxBDHExT615wO
	 ZQv6S7tJEeT7Ap8ssl+j9Hh94lX5fObDHOenLUlOlWHUg3qbbfmmkfPbll37xG4jG6
	 OBuHDPrnuD6fjFc43QvydT2O1R1QOeMrM/mFysvIsNggx9DaoqA7AkDTKYNCYnd7Nc
	 zO2SKqrJGTsW9WVJ7FXEgjMsXYTdDNqbY8hPd+IVtmIwPKh5RvHCln7l8CwVnoxJo0
	 K3gObkoLaVuaQhZKX0aokgZFeofuTPzDoqTqXiMdAVHxooD25suRgrmeol8qQ9HWSv
	 /CZW34Qs/XnUg==
Date: Wed, 18 Dec 2024 13:43:23 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jimmy Ostler <jtostler1@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	Filipe Xavier <felipe_life@live.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Daniel Sedlak <daniel@sedlak.dev>,
	Alex Mantel <alexmantel93@mailbox.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: error: Change `LayoutError` to internal
Message-ID: <Z2LDa6cHRYdp__53@pollux>
References: <cover.1734477232.git.jtostler1@gmail.com>
 <966cc6950c3e8705462f330d2bd002d305ebbc93.1734477232.git.jtostler1@gmail.com>
 <CANiq72=2tbRJ6Chq02iGwpNToe4zHR-RtXq+Qv_bFzyvdyXHsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=2tbRJ6Chq02iGwpNToe4zHR-RtXq+Qv_bFzyvdyXHsA@mail.gmail.com>

On Wed, Dec 18, 2024 at 01:57:29AM +0100, Miguel Ojeda wrote:
> On Wed, Dec 18, 2024 at 1:24 AM Jimmy Ostler <jtostler1@gmail.com> wrote:
> >
> > Add an implementation of `From<LayoutError> for Error` for the
> > `kernel::alloc::layout::LayoutError`.
> > Remove the implementation on `core::alloc::LayoutError`, because we
> > don't use it anywhere.
> 
> No need to send a new version for this, but it may make sense to
> reword to clarify that this switches the import, and therefore the
> `impl` switches from one to the other. The way it is written, it
> sounds like an actual `impl` item was textually added and another one
> removed.

Agree with Miguel, the commit message is slightly misleading.

With that fixed,

Acked-by: Danilo Krummrich <dakr@kernel.org>

> 
> Cheers,
> Miguel
