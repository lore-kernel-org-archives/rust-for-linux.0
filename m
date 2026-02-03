Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459A728727B;
	Tue,  3 Feb 2026 11:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770119847; cv=none; b=SWuzUTh+ZEc0Aid2h+f+4HyKOGtbmlLeQrVQJQnKIEZA35e3Bg/9F0ThDgcqEH/ENqpJFwoWf55GESDSoi6UxELYJWwV/S26D5dUMLsOqWyu2gN33+iG4GmL+TD65RqXfQPqPaRUmJ7jTF5fAPxr0jm1YRxjNTxdc5/SZ/0WxmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770119847; c=relaxed/simple;
	bh=z8v2pNpEPucZpSLjuhLoeT3eCBhN0Puf8eDxGx3Q3Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usFeMCNfTHHuceOgF7m2yQDyLt80DLwa0K9LEhq1Ns5Yn7B3SvPSbH09AisHGcvAUreqyampJJvllTl7G0wZKn7AZGwFCAyh6ooujBkKIsLj7oqUXrkA+N4Oa9wCJhN/SZdvsj551Duz+yzh0zjbk5b3Xo/pxV5v0Upbh1RHg14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V4zgx+lz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V4zgx+lz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC20C116D0;
	Tue,  3 Feb 2026 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770119847;
	bh=z8v2pNpEPucZpSLjuhLoeT3eCBhN0Puf8eDxGx3Q3Zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4zgx+lzE3Dz5hBNJ1Hj9dPl4cBJejfY7sXXJi2DOhWEay93dffKhKKHTNM+Gss55
	 jWOw4u7LeafE28UkzfeV+0hvNWqofRKabNdeFn+FuZ9Hbi14c42occ2pBdq5VNsyn+
	 cFAx3G10ElRvm97j7IxwbPluhRNOcEPKNXTrfmfw=
Date: Tue, 3 Feb 2026 12:57:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drivers: android: binder: Update ARef imports
 from sync::aref
Message-ID: <2026020326-angriness-preplan-b704@gregkh>
References: <20260102202714.184223-2-shankari.ak0208@gmail.com>
 <20260131113523.7031-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131113523.7031-1-shankari.ak0208@gmail.com>

On Sat, Jan 31, 2026 at 05:05:23PM +0530, Shankari Anand wrote:
> On Sat, Jan 03, 2026 at 01:57:11AM +0530, Shankari Anand wrote:
> > Update call sites in binder files to import `ARef`
> > from `sync::aref` instead of `types`.
> > 
> > This aligns with the ongoing effort to move `ARef` and
> > `AlwaysRefCounted` to sync.
> > 
> > Suggested-by: Benno Lossin <lossin@kernel.org>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1173
> > Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> > Acked-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > No change from v1 -> v2. Carry-forwarded the acked-by.
> > 
> > Link of v1: https://lore.kernel.org/all/20251123092438.182251-2-shankari.ak0208@gmail.com/
> > 
> > ---
> >  drivers/android/binder/process.rs | 2 +-
> >  drivers/android/binder/thread.rs  | 3 +--
> >  2 files changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> > index 132055b4790f..db25307b5a4a 100644
> > --- a/drivers/android/binder/process.rs
> > +++ b/drivers/android/binder/process.rs
> > @@ -28,11 +28,11 @@
> >      seq_print,
> >      sync::poll::PollTable,
> >      sync::{
> > +        aref::ARef,
> >          lock::{spinlock::SpinLockBackend, Guard},
> >          Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
> >      },
> >      task::Task,
> > -    types::ARef,
> >      uaccess::{UserSlice, UserSliceReader},
> >      uapi,
> >      workqueue::{self, Work},
> > diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
> > index 1a8e6fdc0dc4..6a5c90547844 100644
> > --- a/drivers/android/binder/thread.rs
> > +++ b/drivers/android/binder/thread.rs
> > @@ -16,9 +16,8 @@
> >      seq_file::SeqFile,
> >      seq_print,
> >      sync::poll::{PollCondVar, PollTable},
> > -    sync::{Arc, SpinLock},
> > +    sync::{aref::ARef, Arc, SpinLock},
> >      task::Task,
> > -    types::ARef,
> >      uaccess::UserSlice,
> >      uapi,
> >  };
> > -- 
> > 2.34.1
> > 
> 
> Hello,
> Can this patch be picked up?

Sorry, trying to pick patches out of the middle of a series is "hard",
next time you do this, please do not make a series if you wish for
different maintainers to be taking them.

I'll go take this now, thanks.

greg k-h
