Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315955FDA7;
	Sun,  8 Feb 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770540231; cv=none; b=mKfiofJ4XoPN8YAd93eIfPVcbyAAV+mVeyRMZWDbdbfCOtWcJc6Vxty9lkfROp6aiNgXM6Z731ifr5mg7stEtXbwltA5a3O2cx0iKcg8vQwL8IrIb6SBGZxO45qy5xyki+1e2+0dlroGA9bntSty86J6luZz2U1SXCsDjTqQ4uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770540231; c=relaxed/simple;
	bh=qp4LcygetQ4w7VJzBUP8EVokdZaZZfpkPa5NgD/Lhhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZdMsgpILM5b3qNG7/NIPZSFzFnPusljpP/ixrxBahCdRXXRliYoZc1u9cGDvpb8xWJYLG7aIWyAo6IEKtbjqK3DZDiKO2ocM+ETMGW2yuKbH7Ft4GJYwNdgGXcdHWjVQ6sg7ehpAEd4OSNClffPbLsAfByEqr9nAPYXuZilfqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1b2OSfv7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1b2OSfv7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322C8C4CEF7;
	Sun,  8 Feb 2026 08:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770540230;
	bh=qp4LcygetQ4w7VJzBUP8EVokdZaZZfpkPa5NgD/Lhhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1b2OSfv7tLGFJZFSiQ7W/MESg4nvJoqJhcv0KBwMT4/ytP601VN/uGz+dI0BMYHKp
	 OTil67iLcr0gnx92BgNCjX0XUtX0LaKliYs1VktdRBBVIN7kCwaLvFX0JTnDqjGRx4
	 M4kC/JNjCV1TAt6I4TE+v+hSEjKhEYzdxcYe8e6I=
Date: Sun, 8 Feb 2026 07:43:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jason Hall <jason.kei.hall@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn.roy.baron@gmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH v9 0/2] modularize Rust lints and add RUST_UNWRAP check
Message-ID: <2026020851-unranked-passport-5c34@gregkh>
References: <CANiq72mB0N3GDe+w8qT_VU1ieMQSRBiEPaFdSVa-2GLDiDMEZw@mail.gmail.com>
 <20260207224907.234815-1-jason.kei.hall@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207224907.234815-1-jason.kei.hall@gmail.com>

On Sat, Feb 07, 2026 at 03:49:05PM -0700, Jason Hall wrote:
> This series moves Rust-specific linting logic into a separate file to
> prevent further growth of the main scripts/checkpatch.pl script and
> introduces a new lint to enforce safety standards.
> 
> The first patch creates the infrastructure for scripts/rust_checkpatch.pl
> and adds a conditional loading hook in the main checkpatch script. It
> also updates the MAINTAINERS file to track this new file.
> 
> The second patch introduces the  RUST_UNWRAP lint, which warns against
> the use of .unwrap() and .expect() unless they are accompanied by a 
> '// PANIC:' justification comment.
> 
> Jason Hall (2):
>   scripts: checkpatch: move Rust-specific lints to separate file
>   scripts: checkpatch: add RUST_UNWRAP lint
> 
>  MAINTAINERS                |  6 ++++++
>  scripts/checkpatch.pl      | 14 ++++++++++++++
>  scripts/rust_checkpatch.pl | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 50 insertions(+)
>  create mode 100644 scripts/rust_checkpatch.pl
> 
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
