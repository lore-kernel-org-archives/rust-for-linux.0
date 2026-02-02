Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B890D37475B;
	Mon,  2 Feb 2026 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770046213; cv=none; b=UR1fBrk97wekpYFWYIRqMTyO724I51stzl35O2y/shfXFozKw7owHGCDkyocIN5eWo6EPXLm/QJlPtJxQlN6rejnZrBSgu87dSdk5qEKkBlJJHHhnKZaO/GkC2u8BabtN4T4Bt69pb3qS5auh9Fym4hHeWz7cAKhtZl0ZajRZMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770046213; c=relaxed/simple;
	bh=NhgHDfuOdnhZ8vjAEapUw39dYzKBpvAT7v6UDxWFAn0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wg6npVMa/HeBV9jk2Xz/w2vfqCn8LuB9V1D6ewVZiopciD/awzao1agmqwdE+fYim8XNx2deIy+heZzvWcbbthfujQR94N1C/Y5ZoRGYksaTK6zB+n7kZGqmNsUJYbWjCeCdQ3qqJsI1IjCZ3OkTMXlsV8LXnFf/waOg24mzlP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qh+AvGco; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qh+AvGco"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770046210;
	bh=NhgHDfuOdnhZ8vjAEapUw39dYzKBpvAT7v6UDxWFAn0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qh+AvGco/f9rLQHbiNF7UQcW7NqsHLSI6VMBW771EKwBaBvLvNjTipWPEo/SxDSan
	 1QobQMP9e5IlbN85C9cUbmS85pQsM+h2KvkgY7m7Lp5rOO81jFL8o6Kq0wgAF0/ihI
	 BWQwUY7wDL1YpBkCSMc0XUWDbF4BHRKJ+HdbgyF7MzJvqwDGO4I7MMws+LRyyhtr5t
	 zjPe5uuE4XPcGRNcbgG2aB7tor5+SeCOiIZLV7JbDwdEsgCglvoewI9W8ZaY3Izw1w
	 mQW3VMU4sA9iPKJmjxISYJmQAtHG+5+NgK7+9trwI+R+dCcA7rM7eoJasq2OrqfSk9
	 +X4pFInywX/0g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4040017E0E4C;
	Mon,  2 Feb 2026 16:30:09 +0100 (CET)
Date: Mon, 2 Feb 2026 16:30:06 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Alice
 Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, Asahi
 Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Asahi Lina
 <lina+kernel@asahilina.net>, Viresh Kumar <viresh.kumar@linaro.org>, Tamir
 Duberstein <tamird@gmail.com>, Shankari Anand <shankari.ak0208@gmail.com>
Subject: Re: [PATCH v6 5/8] rust: drm: gem: shmem: Add DRM shmem helper
 abstraction
Message-ID: <20260202163006.6f83f44c@fedora>
In-Reply-To: <20251202220924.520644-6-lyude@redhat.com>
References: <20251202220924.520644-1-lyude@redhat.com>
	<20251202220924.520644-6-lyude@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello Lyude,

On Tue,  2 Dec 2025 17:03:31 -0500
Lyude Paul <lyude@redhat.com> wrote:

> +#[pin_data]
> +pub struct Object<T: DriverObject> {
> +    #[pin]
> +    obj: Opaque<bindings::drm_gem_shmem_object>,
> +    // Parent object that owns this object's DMA reservation object
> +    parent_resv_obj: Option<ARef<Object<T>>>,
> +    #[pin]
> +    inner: T,
> +}
> +
> +super::impl_aref_for_gem_obj!(impl<T> for Object<T> where T: DriverObject);

As part of our integration in Tyr, we noticed we'll need Object<T> to
be Sync+Send. Given T already has to be Sync+Send (part of
the DriverObject trait constraints), it shouldn't be a problem to have
Object<T> implement Sync+Send too, since, AFAICT, all the functions in
the Object<T> are thread-safe (resv lock held when acting on the
underlying BO, either explicitly, or implicitly through the C API).

Regards,

Boris
