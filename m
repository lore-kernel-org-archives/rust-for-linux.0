Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C2D1E9B3D;
	Mon, 26 Jan 2026 16:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443490; cv=none; b=aydTIM8VmgoQbiOegSVAoPhi/lGfUYyI9MLF94B4Yg90P9zcS1H+SUrbBuMU746q7KFqT89Wu1x8CMuFLYQWOBu8Pp/VDNf558JnyBIB0oyC3v62MxhOlvIj8Fa8gWviB+QrkQgWd+bB00l4x5VKabQctzE1vrM6y46+rfqTb4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443490; c=relaxed/simple;
	bh=f30wmVTG8YNnCsC+12/Kl2OMmW0qSew4uzvS80Ni1qE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3qwKdvltd5W5uFYFN5epPIIrfMa473IqDypbldyvcq248GQcvSs0D/6eT9iAZgUPDOJXMoKwJTlr/6nqwHs46xAUbeNKRfe+j+9EndcEWF5ywUcEYEap+WYNfh2HJW0Wd4iif75iBKYuBvveyceCKTmUjqv42b825AL/UdPidU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PKSb4ciz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PKSb4ciz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518C7C116C6;
	Mon, 26 Jan 2026 16:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769443490;
	bh=f30wmVTG8YNnCsC+12/Kl2OMmW0qSew4uzvS80Ni1qE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKSb4cizW6AWUANNXNGz7qUFb21/KIyW5tO2uTP2o4Odu/JKAAFHjHdCThekU+WOy
	 4FpoDbLsDsEoIZU0mzoxLNoO4bNaXpVLL5Uw5bhnd+NqNE0V33R5oTRrVjKUgeJb5P
	 G4mJw+yerzLzQ8c7LxCR6L6o7nbjd8feyOFzbsFo=
Date: Mon, 26 Jan 2026 17:04:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Arnd Bergmann <arnd@arndb.de>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] samples: rust: remove imports available via prelude
Message-ID: <2026012638-immunize-stapling-b249@gregkh>
References: <20260123172007.136873-1-gary@garyguo.net>
 <20260123172007.136873-4-gary@garyguo.net>
 <CANiq72kKDx-A0uLcRzau771WQNJG5MLrz_jBkY9hD=NPNkKbeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kKDx-A0uLcRzau771WQNJG5MLrz_jBkY9hD=NPNkKbeg@mail.gmail.com>

On Mon, Jan 26, 2026 at 04:02:29PM +0100, Miguel Ojeda wrote:
> On Sat, Jan 24, 2026 at 6:08 AM Gary Guo <gary@garyguo.net> wrote:
> >
> >   samples/rust/rust_misc_device.rs      | 2 --
> 
> If Greg/Arnd don't say otherwise, I will eventually pick this patch
> including the file above, given it is trivial.

No objection from me:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
