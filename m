Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B674C33B6DA;
	Sat, 28 Feb 2026 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772304030; cv=none; b=f8qKiqOp67p9P90Vqmhz70vbQd+yhBUo4Oab1huUZo1Tu0qi1Q3LX6DY6LVrZa4dkvmhHt1GT1YHpgLknxgNRsgBmOESnPowBeQUWZseJIKK2Xk7TTYY/UrP5eoofp3BZCB0J53s3gN9kumtBC4ua5rgvH1gNUEN1GDTF7vmX+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772304030; c=relaxed/simple;
	bh=1MGoOeWO4a7jzpvdquCXe6JL9LK4o55NoxWsra1wzgs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=VrwHS2IBqSRh7PK8INnxi0WDgZqUWGfpY/9a1WPdXCUhvMYZ1swT8QKYVGV5u6HP9EUeigZjaThuwXyeKfwGGX3VqL1FSivEc31Nv4Zuz2toy/yO0OH9ajxYhuexICZwcjwZ9vWNXe3AayPoWgL7EKd0lUH6n0Xunhj3htpZNdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/InzrVo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/InzrVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F95C19423;
	Sat, 28 Feb 2026 18:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772304030;
	bh=1MGoOeWO4a7jzpvdquCXe6JL9LK4o55NoxWsra1wzgs=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=j/InzrVodnQsLneccidK60stBfW++8hhtyv7LFiOjfZZ9tCIY56BLd/YAo1sX6ZFg
	 zqrgiEZjHvKNc+JsvHiDprdj44UmhpbHicQ0n0/xe2tbwDuHca1uMyL/hKq7eXaj52
	 HV/H4PyPgAMege1M57xWBvGHUtGjzYn+IHv5uir1LCtwNsVxtOpOTUgXJHBUyLohpf
	 b7kGQCYIVLnQgEegoI9Kbm4rK55hQ53PUoPSmWau+v6va61MAcYtjNxiUpECBT96m3
	 WY8VzpQdCmbY1JIieTkbsnyjfKVGMMr0QB+3xfNXlO6VvDiAvwIbKf/qNL8NjYW1LO
	 3GmoYwJLkxnHw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 19:40:26 +0100
Message-Id: <DGQTCDOIVTHW.3OGUVXRS496FP@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Tejun Heo" <tj@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 2/4] rust: drm: dispatch work items to the private
 data
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
 <20260204-aref-workitem-v2-2-bec25b012d2a@collabora.com>
In-Reply-To: <20260204-aref-workitem-v2-2-bec25b012d2a@collabora.com>

On Wed Feb 4, 2026 at 9:40 PM CET, Daniel Almeida wrote:
> This implementation dispatches any work enqueued on ARef<drm::Device<T>> =
to
> its driver-provided handler. It does so by building upon the newly-added
> ARef<T> support in workqueue.rs in order to call into the driver
> implementations for work_container_of and raw_get_work.
>
> This is notably important for work items that need access to the drm
> device, as it was not possible to enqueue work on a ARef<drm::Device<T>>
> previously without failing the orphan rule.
>
> The current implementation needs T::Data to live inline with drm::Device =
in
> order for work_container_of to function. This restriction is already
> captured by the trait bounds. Drivers that need to share their ownership =
of
> T::Data may trivially get around this:
>
> // Lives inline in drm::Device
> struct DataWrapper {
>   work: ...,
>   // Heap-allocated, shared ownership.
>   data: Arc<DriverData>,
> }

IIUC, this is how it's supposed to be used:

	#[pin_data]
	struct MyData {
	    #[pin]
	    work: Work<drm::Device<MyDriver>>,
	    value: u32,
	}
=09
	impl_has_work! {
	    impl HasWork<drm::Device<MyDriver>> for MyData { self.work }
	}
=09
	impl WorkItem for MyData {
	    type Pointer =3D ARef<drm::Device<MyDriver>>;
=09
	    fn run(dev: ARef<drm::Device<MyDriver>>) {
	        dev_info!(dev, "value =3D {}\n", dev.value);
	    }
	}

The reason the WorkItem is implemented for MyData, rather than
drm::Device<MyDriver> (which would be a bit more straight forward) is the o=
rphan
rule, I assume.

Now, the whole purpose of this is that a driver can implement WorkItem for
MyData without needing an additional struct (and allocation), such as:

	#[pin_data]
	struct MyWork {
	    #[pin]
	    work: Work<Self>,
	    dev: drm::Device<MyDriver>,
	}

How is this supposed to be done when you want multiple different implementa=
tions
of WorkItem that have a drm::Device<MyDriver> as payload?

Fall back to various struct MyWork? Add in an "artificial" type state for M=
yData
with some phantom data, so you can implement HasWork for MyData<Work0>,
MyData<Work1>, etc.?
