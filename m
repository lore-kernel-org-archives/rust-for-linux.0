Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B771D86DC
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 16:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772384011; cv=none; b=uUEZ29V0Zjtyhulokg98xSn5jdbFkhHwjfZ7oj1alBJMFSzS2F1OdGQcqrWyr6d31mxxqhrIC7CWXZu8/Vshql4qRanKQdmfQ2sRseFcUy5drzz9kVPr6wVySrDa2XQaIUUkYFCpNShF8Fpr38tD/PruS4YvAwz+euPRPfJZExg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772384011; c=relaxed/simple;
	bh=y/n4171M5AXZrmPSe1LHW4DkH4/xTU37QaESKgeepEo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Eo77ebAcV4NN8WBzkjnsLuJtWddc/tyavoR4XJ8GAVTbXGDJ9psFyymIGl9t/OG3+dsdLHcCGEd8ShG/sJTzIQ8T5Buv2o5KD2VLvzNhP7Gmkz7MBYmcL6L/Kaf1guHwKbEJ7Tom7+NS5r+VvxtlxXYeUS89FuoRL80xuENML08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1I8DhpNl; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1I8DhpNl"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-439b50320a0so283718f8f.1
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 08:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772384008; x=1772988808; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PfdUfCNI/OQhhLtw/VeFZbribXWs9YmY3yISi0+RLUA=;
        b=1I8DhpNlFpzU+38LaUorn4sGdc8U6B25Sp5mTaH9YFGe5PcCEZgFCWoyioGCii3dgX
         Z5DWsIGD8cxQ/LaO92CUQDqzmMkYhQmpP78ngIdE9pmorPHz5NGFulekegSb+OBBmh3U
         Q4sx4WnBS2NUt0qWORVznzbkrkJrEWAmJ3xth73G/Q391peOK9q0uvT9CPiTj60ZRMOK
         bT0k/0E8158ArNzvUYLJAK3NfQuU5X8c4Id1JQPGnUFQWCxksxV6ENtMCLgr39D2+IXi
         KuQcB5Loa/jJU0pMQ4q82O6VL8GFOOW0+1Xlr1VM7hDRVDG5sgr3Pu6jyqQAXthAAX8A
         jkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772384008; x=1772988808;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PfdUfCNI/OQhhLtw/VeFZbribXWs9YmY3yISi0+RLUA=;
        b=gymCz1rdswGMYmZ9MIixYjzALuDwtjMxE768e8ZOskRMar9azqfImEOUKmDn3mxq/8
         zzS70LMhOR2FRKaM8rXYXLbY9ZCniB+MTf+wiMyZEqg0RbwpNUGckZL60uggKtfq8ewR
         0PKUPALUxJkDqTD+g4RdITdUjRMONVXBrQ3jAds83iaF6LORSGhDNjzOHi5nQto1VSsL
         lPXAiH7yIp2aL0MBfkRAx0zZilSyNKCv1y1s4k8MtLF1Fj8OKtaEu+ioGRf0sDqRRCUu
         SgI5c5KLK0udXrYFBvIXVLTOlXyhMAmz7CUTcyph6bSNiFTUEpUgE9kQRmqhJMD1ci4c
         0qbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUdRUcjRc9vmGvIBkzJk49m8q6AO48/DU/dhUyRke2J4QSDIajxwk4crFNkSQ7VNb48sQOQiJCBxoa7bGfZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhm0x8sFKUYCXg5zyGI4zKz77tnG1ViCwA3gFG/vltgxp04Vrl
	TqvHkeOGHJSjSQXpYnK2/MuF921+bhNJ5PoKleg+J1645up7X8Y4XSo5U7T8hDDzjSdjFBkzV90
	McwSA4Uao5dLPJbEVUg==
X-Received: from wrbbs10.prod.google.com ([2002:a05:6000:70a:b0:439:901b:97cb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2013:b0:439:afe3:6185 with SMTP id ffacd0b85a97d-439afe364e1mr6850853f8f.15.1772384007596;
 Sun, 01 Mar 2026 08:53:27 -0800 (PST)
Date: Sun, 1 Mar 2026 16:53:26 +0000
In-Reply-To: <DGRJO4NKZ4R5.2BZ2D9BSPXDMT@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
 <20260204-aref-workitem-v2-2-bec25b012d2a@collabora.com> <DGQTCDOIVTHW.3OGUVXRS496FP@kernel.org>
 <aaQr0ntSw9Q5Qzws@google.com> <DGRJO4NKZ4R5.2BZ2D9BSPXDMT@kernel.org>
Message-ID: <aaRvBmfx-YTp5zEa@google.com>
Subject: Re: [PATCH v2 2/4] rust: drm: dispatch work items to the private data
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Sun, Mar 01, 2026 at 04:18:15PM +0100, Danilo Krummrich wrote:
> On Sun Mar 1, 2026 at 1:06 PM CET, Alice Ryhl wrote:
> > On Sat, Feb 28, 2026 at 07:40:26PM +0100, Danilo Krummrich wrote:
> >> On Wed Feb 4, 2026 at 9:40 PM CET, Daniel Almeida wrote:
> >> > This implementation dispatches any work enqueued on ARef<drm::Device<T>> to
> >> > its driver-provided handler. It does so by building upon the newly-added
> >> > ARef<T> support in workqueue.rs in order to call into the driver
> >> > implementations for work_container_of and raw_get_work.
> >> >
> >> > This is notably important for work items that need access to the drm
> >> > device, as it was not possible to enqueue work on a ARef<drm::Device<T>>
> >> > previously without failing the orphan rule.
> >> >
> >> > The current implementation needs T::Data to live inline with drm::Device in
> >> > order for work_container_of to function. This restriction is already
> >> > captured by the trait bounds. Drivers that need to share their ownership of
> >> > T::Data may trivially get around this:
> >> >
> >> > // Lives inline in drm::Device
> >> > struct DataWrapper {
> >> >   work: ...,
> >> >   // Heap-allocated, shared ownership.
> >> >   data: Arc<DriverData>,
> >> > }
> >> 
> >> IIUC, this is how it's supposed to be used:
> >> 
> >> 	#[pin_data]
> >> 	struct MyData {
> >> 	    #[pin]
> >> 	    work: Work<drm::Device<MyDriver>>,
> >> 	    value: u32,
> >> 	}
> >> 	
> >> 	impl_has_work! {
> >> 	    impl HasWork<drm::Device<MyDriver>> for MyData { self.work }
> >> 	}
> >> 	
> >> 	impl WorkItem for MyData {
> >> 	    type Pointer = ARef<drm::Device<MyDriver>>;
> >> 	
> >> 	    fn run(dev: ARef<drm::Device<MyDriver>>) {
> >> 	        dev_info!(dev, "value = {}\n", dev.value);
> >> 	    }
> >> 	}
> >> 
> >> The reason the WorkItem is implemented for MyData, rather than
> >> drm::Device<MyDriver> (which would be a bit more straight forward) is the orphan
> >> rule, I assume.
> >
> > This characterizes it as a workaround for the orphan rule. I don't think
> > that's fair. Implementing WorkItem for MyDriver directly is the
> > idiomatic way to do it, in my opinion.
> 
> The trait bound is T::Data: WorkItem, not T: drm::Driver + WorkItem.
> Implementing WorkItem for MyDriver seems more straight forward to me.

I missed the part about `for MyData` vs `for MyDriver`. Since you
talked about the orphan rule I assumed you wanted the driver to
implement it for `drm::Device<MyDriver>` directly, which is what the
orphan rule would prohibit, rather than for `MyDriver`.

In any case, I do think it makes sense that you would implement it on
the struct that actually contains the `struct work_struct`.

> >> Now, the whole purpose of this is that a driver can implement WorkItem for
> >> MyData without needing an additional struct (and allocation), such as:
> >> 
> >> 	#[pin_data]
> >> 	struct MyWork {
> >> 	    #[pin]
> >> 	    work: Work<Self>,
> >> 	    dev: drm::Device<MyDriver>,
> >> 	}
> >> 
> >> How is this supposed to be done when you want multiple different implementations
> >> of WorkItem that have a drm::Device<MyDriver> as payload?
> >> 
> >> Fall back to various struct MyWork? Add in an "artificial" type state for MyData
> >> with some phantom data, so you can implement HasWork for MyData<Work0>,
> >> MyData<Work1>, etc.?
> >
> > You cannot configure the code that is executed on a per-call basis
> > because the code called by a work item is a function pointer stored
> > inside the `struct work_struct`. And it can't be changed after
> > initialization of the field.
> >
> > So either you must store that info in a separate field. This is what
> > Binder does, see drivers/android/binder/process.rs for an example.
> >
> >     impl workqueue::WorkItem for Process {
> >         type Pointer = Arc<Process>;
> >     
> >         fn run(me: Arc<Self>) {
> >             let defer;
> >             {
> >                 let mut inner = me.inner.lock();
> >                 defer = inner.defer_work;
> >                 inner.defer_work = 0;
> >             }
> >     
> >             if defer & PROC_DEFER_FLUSH != 0 {
> >                 me.deferred_flush();
> >             }
> >             if defer & PROC_DEFER_RELEASE != 0 {
> >                 me.deferred_release();
> >             }
> >         }
> >     }
> 
> Ok, so this would be a switch to decide what to do when a single work is run,
> i.e. it is not for running multiple work.

Yeah.

But in any case, a single `struct work_struct` can't be used to schedule
multiple work items. It only has one prev/next pointer pair.

> > Or you must have multiple different fields of type Work, each with a
> > different function pointer stored inside it.
> 
> This sounds it works for running multiple work, but I wonder how enqueue() knows
> which work should be run in this case? I.e. what do we do with:
> 
> 	impl_has_work! {
> 	    impl HasWork<drm::Device<MyDriver>> for MyData { self.work }
> 	}

Both WorkItem and HasWork are generic over an ID integer. You can
specify it to disambiguiate.

Alice
