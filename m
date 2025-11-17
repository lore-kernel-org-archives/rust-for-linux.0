Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16FD30FC20;
	Mon, 17 Nov 2025 11:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763377499; cv=none; b=nF3R0QKT4k3WufLNd6j4TC8o9ErLYbhpgGnlx9alG9PAzR9KBBK4+ymGW6ZoxwYG1Mm6laXj+T0qKTDgB9fzf6fXF8FTLMPkSA0Zy0IkfjjWd7SjasWB8VBBiTNlkhV806iKxJ0OfNcKtkAtvvw9Cn9/BgIvQEWWO+xpAeAd0Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763377499; c=relaxed/simple;
	bh=QewPk4zco+6xv+zW7ousvKXwZ8/tVkAJu1PKD6W3ibk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xj1b6YhEmOAO53KJKgosINhZ43eQRsVkk5ch2+4x+5iC2XYksQYI9qK+llqgEnJzwImn6Sq1ntUwxXLaiTVcpFeVWWSuACe6YiH0gImtZqlupIgm2bkPmvrMkS+KPXfCni1LH5mhK35FPFotHbegDLmgqZet+mzIeMJmUd9f+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LU5wIfZx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LU5wIfZx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A87C4CEF1;
	Mon, 17 Nov 2025 11:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763377499;
	bh=QewPk4zco+6xv+zW7ousvKXwZ8/tVkAJu1PKD6W3ibk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LU5wIfZxDeF8aMVN3PLI8PDvrux5/5oZoK/Ae+s6/yEGUdBx0E1CZu0Pp8PivhgYF
	 srst9LJ8SQIjW4JOH+e4rtZjewXLEDthG28BPMvKgy6+IyTSFbVY4W31MKXj0XBN6P
	 aZ9s5lePasR7ASNPVWhU/TQiHWz8TfZib9rN1FsY1LMWlLXqgBhZBED8+xNJtK8FfL
	 amFedI1epT9BJhMLOqxhsRyiJqC3nIJdU0VPOi98FoTbrkMoSnz2EiO+ImQn6QHzK2
	 bi71mKimxMBlUA79hZKK3ssiUMK7M36q/En90Gl7Z54gpw7Q5Blitk1nYe0v74qKib
	 2SGaKuGzxcefA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vKx2X-0000000Gn6G-0NKr;
	Mon, 17 Nov 2025 12:04:57 +0100
Date: Mon, 17 Nov 2025 12:04:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: makefile: move rustdoc check to the build
 wrapper
Message-ID: <kjpquyekvw7fwrndoomtge7fnxtfefihqlikj6xcqtazrr6l77@424ufup7v45o>
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
 <a9b172c926a4b30360530c34adc44f3789ec2b27.1763370163.git.mchehab+huawei@kernel.org>
 <CANiq72=bYzj6iU7PCm+VMBTeBbgUcL8nwrvUut9p4ph+3+itaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=bYzj6iU7PCm+VMBTeBbgUcL8nwrvUut9p4ph+3+itaQ@mail.gmail.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Mon, Nov 17, 2025 at 10:20:46AM +0100, Miguel Ojeda wrote:
> On Mon, Nov 17, 2025 at 10:13 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > The makefile logic to detect if rust is enabled is not working
> > the way it was expected. Move it to be inside the wrapper
> > script.
> 
> Hmm... Could the commit explain a bit why this didn't work and why now it does?

I don't know exactly why this was not working.

I guess one of the issues is that the "rustdoc" target becomes
undefined if RUST is not enabled, e.g. rust/Makefile is lacking something
like:

    ifdef CONFIG_RUST
    ...
    else
    rustdoc rustdoc-core rustdoc-macros rustdoc-compiler_builtins:
            $(warning Rust is not enabled. Can't build $<)    
    endif

But this is not enough to explain the issues I'm getting.

Maybe the other issues are cache related.

In any case, here, with Fedora 43, on some cases, when I run:

    make htmldocs  # or make SPHINXDIRS=xxx htmldocs

it sometimes, after building the docs, it tries to run:

    make LLVM=1 rustdoc

as this is not a defined target when CONFIG_RUST is not
present, this causes it to build the entire code.

-- 
Thanks,
Mauro
