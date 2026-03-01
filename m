Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3D22E3AF1
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 12:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772366806; cv=none; b=qX73V2toF00ovHGjocgbHCj7SIFjPWN4P+v+xpE4pdYjyFMtuDoTYXulNDR4ete2K7dTMXsS/t7CNUcPvQHIwf5k2khQwqplnpxH9i8/I8k45dIn1IeH6FGJG8TJuC1qqRp7TCiSlwik3Q+NgTJakTw/FaxplfnpshyPOXXVfxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772366806; c=relaxed/simple;
	bh=FeleZhOk7QOWXPg9E516Bw/faCMDeGYjcX7FBu+s7MU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KOGD/Cw0PlCQvclBZUmqaqewbmNPqJ6xjsl1Jmh85urlnPM8kPif8kD5HP/UU2923OABq5yFq1bKmVqAWp88IsS3Yo7w1pEUsNAJIknvgueQJEsjl4XmDrA6lEiwknT7DOk7UWJR/YgdaJ7fus7Z/tIgXPDT8K0qbqzrCys7nEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U2Jp7Cio; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U2Jp7Cio"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837246211bso47763035e9.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 04:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772366803; x=1772971603; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+NLDKguPnGJnQnFRD4unNG+va9+3jiMJbYExTIJsz8s=;
        b=U2Jp7CioNOCMCHIyyZDBtRiBbzjBVpbVW8i1NzuCffA0SwExWrGstivXTLDKhm/Bj6
         2yYokM9rZz0ukiTeQE/dOTdTZ4Zqrpvze3OzX/EuZ6tKHFdMEqWZLV/hS3GK9FIkOYPH
         FUFtRSYhSGfJX1Wc8CIQ0kXkVHs4jPWuLlv8A5/J6iycmHK9vLHahaD9IQ+09Q1+4a9b
         hhZG682UkSgWuFgALe3XSdty27+j7oSG6ITl9Zes4IVVhIJyzz5xn44Opg80yXs+Ct+i
         KTBg7t22do5vD0SWi9Fbyy5xXiiAFb3gVHIAIdhxtV3rjToHTnfbw8qzE3GwCECiD/3L
         hk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772366803; x=1772971603;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+NLDKguPnGJnQnFRD4unNG+va9+3jiMJbYExTIJsz8s=;
        b=DrbRdR4J/+4l4mEVW1UlVKsIpOwbrjXwgB75XkdYHvpesGobenlAMu+ne4HVFgqIVl
         29Lo22SurCbyHwJ9RT6zGDyEWNiQXQpEYyDMsPzHmXP/JvLP0EQJ3Hnlwr2akCi1sN5z
         wDQw/ParrYR1wXNbke6onI7Du3c/fY7UbiksmjAqNI4OsiOIVEi2ytV98Ha8xcaeVPUJ
         ECIn/eKjA6Q7fUyNlO+FSBDi2iC8679AF1nFGDvAAn47DCX5I9/RaC/qJHiKvz2WeA3M
         HnZJABLGCKEiWu0RjAoM+0AteubetbPhsMcHEBx+5nBTTaZK7+Hc7ibWWFknlBbiN+6l
         H9NA==
X-Forwarded-Encrypted: i=1; AJvYcCXXTCh3W0+HL8ByJNMa0AYEbUu2iFGbfGngghUldI1O2EOj6tbiIVK5tT1meZr1vrCmEGvNr9dZhU9pfbr/7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVB5Dkc5G1QI7m18MNwO9wML8dUe4wReP6yyRQoHarBFk8Akzz
	ckJcy3n+ltcJpLQXR49PrHNfsYcTctF64HbuLGPp8uyv083ofbNGdSEOTJAp9JuDvqSEfOscGUC
	oGReR6zKhEnWS/v+d8g==
X-Received: from wmby4.prod.google.com ([2002:a05:600c:c044:b0:482:dff5:2424])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:348a:b0:483:c12b:fe4b with SMTP id 5b1f17b1804b1-483c9bc19e9mr146027225e9.9.1772366803234;
 Sun, 01 Mar 2026 04:06:43 -0800 (PST)
Date: Sun, 1 Mar 2026 12:06:42 +0000
In-Reply-To: <DGQTCDOIVTHW.3OGUVXRS496FP@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
 <20260204-aref-workitem-v2-2-bec25b012d2a@collabora.com> <DGQTCDOIVTHW.3OGUVXRS496FP@kernel.org>
Message-ID: <aaQr0ntSw9Q5Qzws@google.com>
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

On Sat, Feb 28, 2026 at 07:40:26PM +0100, Danilo Krummrich wrote:
> On Wed Feb 4, 2026 at 9:40 PM CET, Daniel Almeida wrote:
> > This implementation dispatches any work enqueued on ARef<drm::Device<T>> to
> > its driver-provided handler. It does so by building upon the newly-added
> > ARef<T> support in workqueue.rs in order to call into the driver
> > implementations for work_container_of and raw_get_work.
> >
> > This is notably important for work items that need access to the drm
> > device, as it was not possible to enqueue work on a ARef<drm::Device<T>>
> > previously without failing the orphan rule.
> >
> > The current implementation needs T::Data to live inline with drm::Device in
> > order for work_container_of to function. This restriction is already
> > captured by the trait bounds. Drivers that need to share their ownership of
> > T::Data may trivially get around this:
> >
> > // Lives inline in drm::Device
> > struct DataWrapper {
> >   work: ...,
> >   // Heap-allocated, shared ownership.
> >   data: Arc<DriverData>,
> > }
> 
> IIUC, this is how it's supposed to be used:
> 
> 	#[pin_data]
> 	struct MyData {
> 	    #[pin]
> 	    work: Work<drm::Device<MyDriver>>,
> 	    value: u32,
> 	}
> 	
> 	impl_has_work! {
> 	    impl HasWork<drm::Device<MyDriver>> for MyData { self.work }
> 	}
> 	
> 	impl WorkItem for MyData {
> 	    type Pointer = ARef<drm::Device<MyDriver>>;
> 	
> 	    fn run(dev: ARef<drm::Device<MyDriver>>) {
> 	        dev_info!(dev, "value = {}\n", dev.value);
> 	    }
> 	}
> 
> The reason the WorkItem is implemented for MyData, rather than
> drm::Device<MyDriver> (which would be a bit more straight forward) is the orphan
> rule, I assume.

This characterizes it as a workaround for the orphan rule. I don't think
that's fair. Implementing WorkItem for MyDriver directly is the
idiomatic way to do it, in my opinion.

> Now, the whole purpose of this is that a driver can implement WorkItem for
> MyData without needing an additional struct (and allocation), such as:
> 
> 	#[pin_data]
> 	struct MyWork {
> 	    #[pin]
> 	    work: Work<Self>,
> 	    dev: drm::Device<MyDriver>,
> 	}
> 
> How is this supposed to be done when you want multiple different implementations
> of WorkItem that have a drm::Device<MyDriver> as payload?
> 
> Fall back to various struct MyWork? Add in an "artificial" type state for MyData
> with some phantom data, so you can implement HasWork for MyData<Work0>,
> MyData<Work1>, etc.?

You cannot configure the code that is executed on a per-call basis
because the code called by a work item is a function pointer stored
inside the `struct work_struct`. And it can't be changed after
initialization of the field.

So either you must store that info in a separate field. This is what
Binder does, see drivers/android/binder/process.rs for an example.

    impl workqueue::WorkItem for Process {
        type Pointer = Arc<Process>;
    
        fn run(me: Arc<Self>) {
            let defer;
            {
                let mut inner = me.inner.lock();
                defer = inner.defer_work;
                inner.defer_work = 0;
            }
    
            if defer & PROC_DEFER_FLUSH != 0 {
                me.deferred_flush();
            }
            if defer & PROC_DEFER_RELEASE != 0 {
                me.deferred_release();
            }
        }
    }

Or you must have multiple different fields of type Work, each with a
different function pointer stored inside it.

Note that this is a general workqueue API thing. It's not specific to
ARef<_> or drm::Device<_> based work items, but applies to all users of
the workqueue API.

Alice
