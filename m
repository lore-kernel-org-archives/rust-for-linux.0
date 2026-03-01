Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B2F319617;
	Sun,  1 Mar 2026 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772378301; cv=none; b=PPR/yV7R2nUaOfaSaO4wfxrCMwbipjurD0vAhbEeDb9Uf/VhxpDU49sFjV7/yunQ8N2uJwaAD3A7Ok4rFhchP1puPBj76mXALhfbK9GxnsAgu+ab3C7EAMgMABvk9EwamS5MfPRV/tm8EXLcr17EvtOFdvNmu+tCIRMLwN0lQo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772378301; c=relaxed/simple;
	bh=8NU8Ah0F63qBu5D6k2JnWZJy9yCU7jS6Qq9p0fTPUQ8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=sE1cNMcCvie7DGrYRHTtpKOtoC7UO7rWeGEuVhtRGfAl+70IcXpyJU93xWIAQYEUF1oVxBnKehy4oVNjrMEzzhqVeuCjpfOo0TpwhkEN8lk0M80wNyAyXotyS+SC6dL1auHNwIktKF3ZC7OnQ/XfZRTV+SZauMCVUcqmwYZXa/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbKxfdQ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbKxfdQ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C2AC116C6;
	Sun,  1 Mar 2026 15:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772378301;
	bh=8NU8Ah0F63qBu5D6k2JnWZJy9yCU7jS6Qq9p0fTPUQ8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=YbKxfdQ/r/B659DlTsn1ayrhVbGrI8TtaFrHcqK7TiUhx/3XzsFiCk86ym8zxHIHt
	 tyz2eRT89YzZCw+EPJxMzaCvUFfBCqMwz0r4QgfGlUalH2UAPXWPKgt9o1BJPf948X
	 +qNmefW3MIl5/IRBb7XdDFyemAFrJy899oyX6lpFOJ9oMdBaheZMItPQ+TjuRKQ15q
	 uycKyiYF4MGe45EdcoQ9SeJhW8tmg/S6F8edY+bPjzh94Z83yTKRoVBHDtlKa/XCiK
	 HLEFVbjYA16Bcbjt/x/eEfPrkbu337hnvI8SQeJfQuhxUm2F/ByHLk0QyAsC9T0NTI
	 vSvG0DibZx38Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 16:18:15 +0100
Message-Id: <DGRJO4NKZ4R5.2BZ2D9BSPXDMT@kernel.org>
Subject: Re: [PATCH v2 2/4] rust: drm: dispatch work items to the private
 data
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Tejun Heo" <tj@kernel.org>, "Lai Jiangshan" <jiangshanlai@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
 <20260204-aref-workitem-v2-2-bec25b012d2a@collabora.com>
 <DGQTCDOIVTHW.3OGUVXRS496FP@kernel.org> <aaQr0ntSw9Q5Qzws@google.com>
In-Reply-To: <aaQr0ntSw9Q5Qzws@google.com>

On Sun Mar 1, 2026 at 1:06 PM CET, Alice Ryhl wrote:
> On Sat, Feb 28, 2026 at 07:40:26PM +0100, Danilo Krummrich wrote:
>> On Wed Feb 4, 2026 at 9:40 PM CET, Daniel Almeida wrote:
>> > This implementation dispatches any work enqueued on ARef<drm::Device<T=
>> to
>> > its driver-provided handler. It does so by building upon the newly-add=
ed
>> > ARef<T> support in workqueue.rs in order to call into the driver
>> > implementations for work_container_of and raw_get_work.
>> >
>> > This is notably important for work items that need access to the drm
>> > device, as it was not possible to enqueue work on a ARef<drm::Device<T=
>>
>> > previously without failing the orphan rule.
>> >
>> > The current implementation needs T::Data to live inline with drm::Devi=
ce in
>> > order for work_container_of to function. This restriction is already
>> > captured by the trait bounds. Drivers that need to share their ownersh=
ip of
>> > T::Data may trivially get around this:
>> >
>> > // Lives inline in drm::Device
>> > struct DataWrapper {
>> >   work: ...,
>> >   // Heap-allocated, shared ownership.
>> >   data: Arc<DriverData>,
>> > }
>>=20
>> IIUC, this is how it's supposed to be used:
>>=20
>> 	#[pin_data]
>> 	struct MyData {
>> 	    #[pin]
>> 	    work: Work<drm::Device<MyDriver>>,
>> 	    value: u32,
>> 	}
>> =09
>> 	impl_has_work! {
>> 	    impl HasWork<drm::Device<MyDriver>> for MyData { self.work }
>> 	}
>> =09
>> 	impl WorkItem for MyData {
>> 	    type Pointer =3D ARef<drm::Device<MyDriver>>;
>> =09
>> 	    fn run(dev: ARef<drm::Device<MyDriver>>) {
>> 	        dev_info!(dev, "value =3D {}\n", dev.value);
>> 	    }
>> 	}
>>=20
>> The reason the WorkItem is implemented for MyData, rather than
>> drm::Device<MyDriver> (which would be a bit more straight forward) is th=
e orphan
>> rule, I assume.
>
> This characterizes it as a workaround for the orphan rule. I don't think
> that's fair. Implementing WorkItem for MyDriver directly is the
> idiomatic way to do it, in my opinion.

The trait bound is T::Data: WorkItem, not T: drm::Driver + WorkItem.
Implementing WorkItem for MyDriver seems more straight forward to me.

>> Now, the whole purpose of this is that a driver can implement WorkItem f=
or
>> MyData without needing an additional struct (and allocation), such as:
>>=20
>> 	#[pin_data]
>> 	struct MyWork {
>> 	    #[pin]
>> 	    work: Work<Self>,
>> 	    dev: drm::Device<MyDriver>,
>> 	}
>>=20
>> How is this supposed to be done when you want multiple different impleme=
ntations
>> of WorkItem that have a drm::Device<MyDriver> as payload?
>>=20
>> Fall back to various struct MyWork? Add in an "artificial" type state fo=
r MyData
>> with some phantom data, so you can implement HasWork for MyData<Work0>,
>> MyData<Work1>, etc.?
>
> You cannot configure the code that is executed on a per-call basis
> because the code called by a work item is a function pointer stored
> inside the `struct work_struct`. And it can't be changed after
> initialization of the field.
>
> So either you must store that info in a separate field. This is what
> Binder does, see drivers/android/binder/process.rs for an example.
>
>     impl workqueue::WorkItem for Process {
>         type Pointer =3D Arc<Process>;
>    =20
>         fn run(me: Arc<Self>) {
>             let defer;
>             {
>                 let mut inner =3D me.inner.lock();
>                 defer =3D inner.defer_work;
>                 inner.defer_work =3D 0;
>             }
>    =20
>             if defer & PROC_DEFER_FLUSH !=3D 0 {
>                 me.deferred_flush();
>             }
>             if defer & PROC_DEFER_RELEASE !=3D 0 {
>                 me.deferred_release();
>             }
>         }
>     }

Ok, so this would be a switch to decide what to do when a single work is ru=
n,
i.e. it is not for running multiple work.

> Or you must have multiple different fields of type Work, each with a
> different function pointer stored inside it.

This sounds it works for running multiple work, but I wonder how enqueue() =
knows
which work should be run in this case? I.e. what do we do with:

	impl_has_work! {
	    impl HasWork<drm::Device<MyDriver>> for MyData { self.work }
	}
