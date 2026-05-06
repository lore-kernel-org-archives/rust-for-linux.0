Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6C635AC00;
	Wed,  6 May 2026 06:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050181; cv=none; b=F2Eil9nf1slUsJkdhMUx4/iQ/vILRpErg1TPfNljJFYZu7TDig33KffOOZvULrSiQORLqvVZfKBh5uBw/GfwS5CVVrxyi1HsZsaOZgeOUU6pkg2SUMTy+GTgFW4EnCLe+FyOdXA4lt8wJ3ygrkEBHIIONILmXXzUHFUKVWyum20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050181; c=relaxed/simple;
	bh=RZSvlTfv2fK3RygLIl9jvdRyWh2UVxqn2f9Idcb/dzw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J28LnE3Y4s7RH+isOWEFGnR5FbiSlEFCqbbpa0tS49kQ900U36HRDDQwdsI65DAoupwQxQ70achzN3MoKSRrdOtsLs7GWhNzPb4YeYbWySsoHUg9QbasEEypOk//AOHn67siXeywE0y8VFVAr0gw+GRbAN+Fyercgm1c53Vn/1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6u6Ew5C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6u6Ew5C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD36C2BCB8;
	Wed,  6 May 2026 06:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778050181;
	bh=RZSvlTfv2fK3RygLIl9jvdRyWh2UVxqn2f9Idcb/dzw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r6u6Ew5CtH6BGCmKM6dtgRwNYm2MzzD4RaXp6V5wALRyGWgwR+sUyVUH68vqaV8oT
	 7fKi8MXluzmTUegHlj2dMtXGy0rU4eAv3EaDZMBVy6w2lJ93M2CYITxYXdbMQTy1pp
	 KJjXmITfwtKmJGlQF97y++WpFW0pi5PyNeZLyNKFlYX3OMz9z2nCJtRcAudfrNgPnV
	 sPGW5aZ19FsYhfPzBwF7z2fFOkVN4SM1vycgIXgU52qSLYhU5WIHMRL9bwW399u1Ba
	 7LAL/0NhDt0OiDWd0Q8dBjqa9mA47mdUtxzj61U5nQwYi7nBkaFzOLqOB2xxVAf1UC
	 vKXz+7N3CD7qA==
Date: Wed, 6 May 2026 08:49:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Benno Lossin" <lossin@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Linux Doc Mailing List" <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH v2 11/11] MAINTAINERS: use a URL for pin-init
 maintainer's profile entry
Message-ID: <20260506084935.1cd4b794@foz.lan>
In-Reply-To: <DIASHBBEIHQW.3EQSDUML6G3SB@garyguo.net>
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
	<1bceee886b9027d66bbb48d9d6c8d1250ce8dbcb.1777987028.git.mchehab+huawei@kernel.org>
	<DIASHBBEIHQW.3EQSDUML6G3SB@garyguo.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 05 May 2026 14:49:09 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Tue May 5, 2026 at 2:25 PM BST, Mauro Carvalho Chehab wrote:
> > This maintainer's entry is not inside documentation nor is
> > ReST, preventing Sphinx to create a hyperlink to it.
> >
> > Change it to point to the already-formatted URL.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  MAINTAINERS                   |  2 +-
> >  rust/pin-init/CONTRIBUTING.md | 72 -----------------------------------
> >  2 files changed, 1 insertion(+), 73 deletions(-)
> >  delete mode 100644 rust/pin-init/CONTRIBUTING.md
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8700472b3ae3..b16c8f85d099 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23402,7 +23402,7 @@ S:	Maintained
> >  W:	https://rust-for-linux.com/pin-init
> >  B:	https://github.com/Rust-for-Linux/pin-init/issues
> >  C:	zulip://rust-for-linux.zulipchat.com
> > -P:	rust/pin-init/CONTRIBUTING.md
> > +P:	https://github.com/Rust-for-Linux/pin-init/blob/main/CONTRIBUTING.md
> >  T:	git https://github.com/Rust-for-Linux/linux.git pin-init-next
> >  F:	rust/kernel/init.rs
> >  F:	rust/pin-init/
> > diff --git a/rust/pin-init/CONTRIBUTING.md b/rust/pin-init/CONTRIBUTING.md
> > deleted file mode 100644
> > index 16c899a7ae0b..000000000000
> > --- a/rust/pin-init/CONTRIBUTING.md
> > +++ /dev/null  
> 
> This file is part of the bidirectional source sync.
> 
> I think this file is still meaningful in its present location even if not
> rendered, so people touching the code would be able to see it and be aware. The
> presence of file is more visible than a P entry in the MAINTAINERS file.

Maybe it is just me, but placing doc files in the crowd together with code
on a project where documentation has its own directory sounds weird(*).

(*) except for userspace tools and staging drivers where we want
    everything, including documentation, contained on a single place.

What several subsystems do - for instance the media subsystem - is to
place the maintainer's profile at the driver api, like this:

	Documentation/driver-api/media/maintainer-entry-profile.rst

And adding it to Documentation/driver-api/<subsystem>/index.rst.

This way, subsystem developers will see it together with all other
the developer-specific documentation.

As you're already using some scripting to do a bidirectional sync,
you could add there some logic to convert rust pin-init documentation
to rst and place it at Documentation/rust/.

This is just my 2 cents.

-

Btw, on a quick check, only Rust has markdown files:

	$ git ls-files|grep ".md$"|grep -v tools/
	rust/pin-init/CONTRIBUTING.md
	rust/pin-init/README.md
	rust/proc-macro2/README.md
	rust/quote/README.md
	rust/syn/README.md

As one of the people who spent years helping improving the Kernel
documentation and doing lots of conversions from markdown
and other non-structured text formats to RST, I have to say that I'm
concerned with any trends that would add doc files that aren't
properly integrated with the Kernel documentation system like those.

> That said, if Miguel and/or Benno think it's fine to not have this file, I'm
> also okay with it being removed.
> 
> Best,
> Gary
> 
> > @@ -1,72 +0,0 @@
> > -# Contributing to `pin-init`
> > -
> > -Thanks for showing interest in contributing to `pin-init`! This document outlines the guidelines for
> > -contributing to `pin-init`.
> > -
> > -All contributions are double-licensed under Apache 2.0 and MIT. You can find the respective licenses
> > -in the `LICENSE-APACHE` and `LICENSE-MIT` files.
> > -
> > -## Non-Code Contributions
> > -
> > -### Bug Reports
> > -
> > -For any type of bug report, please submit an issue using the bug report issue template.
> > -
> > -If the issue is a soundness issue, please privately report it as a security vulnerability via the
> > -GitHub web interface.
> > -
> > -### Feature Requests
> > -
> > -If you have any feature requests, please submit an issue using the feature request issue template.
> > -compare
> > -### Questions and Getting Help
> > -
> > -You can ask questions in the Discussions page of the GitHub repository. If you're encountering
> > -problems or just have questions related to `pin-init` in the Linux kernel, you can also ask your
> > -questions in the [Rust-for-Linux Zulip](https://rust-for-linux.zulipchat.com/) or see
> > -<https://rust-for-linux.com/contact>.
> > -
> > -## Contributing Code
> > -
> > -### Linux Kernel
> > -
> > -`pin-init` is used by the Linux kernel and all commits are synchronized to it. For this reason, the
> > -same requirements for commits apply to `pin-init`. See [the kernel's documentation] for details. The
> > -rest of this document will also cover some of the rules listed there and additional ones.
> > -
> > -[the kernel's documentation]: https://docs.kernel.org/process/submitting-patches.html
> > -
> > -Contributions to `pin-init` ideally go through the [GitHub repository], because that repository runs
> > -a CI with lots of tests not present in the kernel. However, patches are also accepted (though not
> > -preferred). Do note that there are some files that are only present in the GitHub repository such as
> > -tests, licenses and cargo related files. Making changes to them can only happen via GitHub.
> > -
> > -[GitHub repository]: https://github.com/Rust-for-Linux/pin-init
> > -
> > -### Commit Style
> > -
> > -Everything must compile without errors or warnings and all tests must pass after **every commit**.
> > -This is important for bisection and also required by the kernel.
> > -
> > -Each commit should be a single, logically cohesive change. Of course it's best to keep the changes
> > -small and digestible, but logically linked changes should be made in the same commit. For example,
> > -when fixing typos, create a single commit that fixes all of them instead of one commit per typo.
> > -
> > -Commits must have a meaningful commit title. Commits with changes to files in the `internal`
> > -directory should have a title prefixed with `internal:`. The commit message should explain the
> > -change and its rationale. You also have to add your `Signed-off-by` tag, see [Developer's
> > -Certificate of Origin]. This has to be done for both mailing list submissions as well as GitHub
> > -submissions.
> > -
> > -[Developer's Certificate of Origin]: https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
> > -
> > -Any changes made to public APIs must be documented not only in the commit message, but also in the
> > -`CHANGELOG.md` file. This is especially important for breaking changes, as those warrant a major
> > -version bump.
> > -
> > -If you make changes to the top-level crate documentation, you also need to update the `README.md`
> > -via `cargo rdme`.
> > -
> > -Some of these rules can be ignored if the change is done solely to files that are not present in the
> > -kernel version of this library. Those files are documented in the `sync-kernel.sh` script at the
> > -very bottom in the `--exclude` flag given to the `git am` command.  
> 



Thanks,
Mauro
