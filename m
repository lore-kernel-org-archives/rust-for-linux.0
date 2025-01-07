Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3B118CC15;
	Tue,  7 Jan 2025 10:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736245409; cv=none; b=N7c6L4rcL8LkVpi50v80pzIlC0GIqW9bgSgqKyDwZY9X8TtZyAKElxAMTg3qjkdO8HhUeeZ3PUTDe76DVmsnRJwvAM9HEB0ZHYeFx/9elVV3U36R8WmFk4wa9LVLSL8maLrcf1737h7GgTvLzATeboxU4kNevdgmoOwhytyzD9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736245409; c=relaxed/simple;
	bh=QoLoBPZg7EP/gWwcOvYHBHz5JjzTPOlZWsQoQ8XBxFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnZFZwwbIPomI4bg9LR2XOdq8pkYwcjMYodB9medUiNbM1B47zEZUylEayyoM8+2NQ4CqjvI2LsKAmNZaqB3l5SAy+Cf7YIBwy4AIeOjA9mYFRwHUzO/DAW2DSCEACCHrxzYYIkGRCYWP3tCkSGV430B8rzkOuEEGLZGnrTFNXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOuqm9GP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOuqm9GP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3F0C4CED6;
	Tue,  7 Jan 2025 10:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736245408;
	bh=QoLoBPZg7EP/gWwcOvYHBHz5JjzTPOlZWsQoQ8XBxFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UOuqm9GPgIXCkJHWmCJcY1bJWgj12p5BT8ZhdJrX+z89YvhQavDgQFFAi65AnThPW
	 P5Pi798weSzgvY3BhATdMWQqR57SZ1T06YdHAPwyPHdWfZ3vLMmEimoqYroaOSw34f
	 311GJ96/GUx5mqEmNlhdnPuL1oj2VvwYSH4zjkEkBj5iI66evoM4YMcwajD8W/ihde
	 uhbZtvZ7uzEKr6xkZ0QjpLzHpTe3O6xLOVCSU9j7LWM+u21b9pbH5ZeylaN5Lefodk
	 DB+I9hl5Sc8/5y+dVYFMwV3amccK/oLuacYSjgBr6dYFgs4Wu7kg/8kS2uBzwaaqho
	 9AnoIL1pRvZJQ==
Date: Tue, 7 Jan 2025 11:23:23 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, tmgross@umich.edu,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] devres: add devm_remove_action_nowarn()
Message-ID: <Z30AmzdLNaKVAIqV@pollux>
References: <20250103164436.96449-1-dakr@kernel.org>
 <Z3vC6MzIG7zN8zBT@phenom.ffwll.local>
 <Z3z8Ra2PUQjL91kn@pollux>
 <CAH5fLgjvP1=aaw9hC8M6L=0uWO+-z+RkC8aW+pn6Z7SkSn03+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgjvP1=aaw9hC8M6L=0uWO+-z+RkC8aW+pn6Z7SkSn03+Q@mail.gmail.com>

On Tue, Jan 07, 2025 at 11:11:20AM +0100, Alice Ryhl wrote:
> On Tue, Jan 7, 2025 at 11:05 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Mon, Jan 06, 2025 at 12:47:52PM +0100, Simona Vetter wrote:
> > > On Fri, Jan 03, 2025 at 05:44:30PM +0100, Danilo Krummrich wrote:
> > > > devm_remove_action() warns if the action to remove does not exist
> > > > (anymore).
> > > >
> > > > The Rust devres abstraction, however, has a use-case to call
> > > > devm_remove_action() at a point where it can't be guaranteed that the
> > > > corresponding action hasn't been released yet.
> > > >
> > > > In particular, an instance of `Devres<T>` may be dropped after the
> > > > action has been released. So far, `Devres<T>` worked around this by
> > > > keeping the inner type alive.
> > > >
> > > > Hence, add devm_remove_action_nowarn(), which returns an error code if
> > > > the action has been removed already.
> > > >
> > > > A subsequent patch uses devm_remove_action_nowarn() to remove the action
> > > > when `Devres<T>` is dropped.
> > > >
> > > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > > > ---
> > > >  drivers/base/devres.c  | 17 ++++++++++++-----
> > > >  include/linux/device.h | 18 +++++++++++++++++-
> > > >  2 files changed, 29 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> > > > index 2152eec0c135..d59b8078fc33 100644
> > > > --- a/drivers/base/devres.c
> > > > +++ b/drivers/base/devres.c
> > > > @@ -750,25 +750,32 @@ int __devm_add_action(struct device *dev, void (*action)(void *), void *data, co
> > > >  EXPORT_SYMBOL_GPL(__devm_add_action);
> > > >
> > > >  /**
> > > > - * devm_remove_action() - removes previously added custom action
> > > > + * devm_remove_action_nowarn() - removes previously added custom action
> > > >   * @dev: Device that owns the action
> > > >   * @action: Function implementing the action
> > > >   * @data: Pointer to data passed to @action implementation
> > > >   *
> > > >   * Removes instance of @action previously added by devm_add_action().
> > > >   * Both action and data should match one of the existing entries.
> > > > + *
> > > > + * In contrast to devm_remove_action(), this function does not WARN() if no
> > > > + * entry could have been found.
> > >
> > > I'd put a caution here that most likely, using this is a bad idea. Maybe
> > > something like:
> > >
> > > "This should only be used if the action is contained in an object with
> > > independent lifetime management, like the Devres rust abstraction.
> > > Anywhere is the warning most likely indicates a driver bug."
> >
> > Yes, I thought of something similar too, but wasn't quite sure if it's needed.
> > At least for me, if something has the postfix "nowarn", it already makes me
> > wonder if I should really use it.
> >
> > I'll add a paragraph.
> >
> > >
> > > At least I really can't come up with a reasonable design in a C driver
> > > that would ever need this.
> >
> > I tried, but couldn't either. The only thing I could think of was a revocable
> > thing in C.
> 
> Potentially if there are two cleanup paths that could run in parallel,
> they could use this to avoid needing to synchronize which one removes
> it?

Yeah, I also though if I can make up such a case. But I think the real issue is
that even if we can find one, it's probably an abuse of devres.

Devres is there to indicate that the driver was unbound from the device, which
causes remove() for the driver to cleanup. So, rather than removing the action
from some async path, we can just wait for remove() to clean up. The only
exception can hence be probe().

> 
> Alice
