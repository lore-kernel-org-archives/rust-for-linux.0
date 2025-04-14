Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4C828937B
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638919; cv=none; b=KGWZpCsrECa/aN2XgVDrMXa5Qy1YWk8pycy+cSahtEQwP/K7PA+kIibbUcWFZPe3WoGVgWjDp4nyHx5X7QmFJpuKZartSg4qidRXow7hcMvyadrXOsYUsATA3wKuBWfKg5S6zU2IGBJLNs7IH0MxtbkC+B0G4HnCatS0M3y1PlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638919; c=relaxed/simple;
	bh=pojWnocpsroxcE/0P6xgtWHEuGyxbIHoIa33XvYDLqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFFZiNRq8ZclHe0CeH5w92wybxk166eViJPzpuo0MuVPFLKr/rOJYpfm+fF+dKWkXDt0B2Bso0TACCv17QckEyVJDarz+31ejf36RTMflIkag55i8C/1JLiZFkgffZ2yZd0YE9AuBVIqOIxH5H2h5eI7opH2wOz5eYd4DEa6f98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=Rn3zdGMO; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="Rn3zdGMO"
Date: Mon, 14 Apr 2025 09:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744638912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F/MdT/GT22lhEdP4LBdu35R2s9GJelO01gNuCCRQDT4=;
	b=Rn3zdGMOJ2Aq03sA0vAX3WocF09ITQjWxjHVhumGNPfeH4iPJ4hgq9jBrCfq1WkAza+4JT
	iMUIHPlrqTFLeHT9ZoAHyzSp6YO299mtSrXTZGiz/3FlI+VZr60+Xkte/0sKFdfwWn7QFG
	9aGM2mOH+0HjDPfsUZkJ/9ieQ9jlAxHB5gFi/qmqrCm1rnsjJ8ODQ0xShwg59N1dMQwqzm
	2mG5VYKHDriupJbobqzyYB335jbp5gu0BHFCY2Ur2HaiFZFyABx/ipitsi0a7M6Y/+JzXl
	YexETBaB0/i+Rgwu3TZRMiiTjr6SF242bZJqbTgc5JW5jrwE1UCyBEynU8Ky3w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
	lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/8] rust: drm: ioctl: Add DRM ioctl abstraction
Message-ID: <Z_0Ts6Tj6NeaDBo0@blossom>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410235546.43736-3-dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT

+/// `user_callback` should have the following prototype:
+///
+/// ```ignore
+/// fn foo(device: &kernel::drm::Device<Self>,
+///        data: &mut bindings::argument_type,
+///        file: &kernel::drm::File<Self::File>,
+/// )

Needs to be `-> Result<u32>`, please update

> +                            // SAFETY: This is just the ioctl argument, which hopefully has the
> +                            // right type (we've done our best checking the size).

"hopefully" in a SAFETY comment raises eyebrows!

The argument has the right type /by definition/ once we know the ioctl
name and the size. If userspace passes the wrong type, that's not our
problem - we're still doing the right cast from the perspective of the
kernel. It's up to the driver to reject bogus values.

Maybe something like

    SAFETY: The ioctl argument has size _IOC_SIZE(cmd), which we
    asserted above matches the size of this type, and all bit patterns of
    UAPI structs must be valid.

This also documents the actual safety invariant we're relying on (that
all bit patterns must be valid... which is "obvious" for correct uapis
but not true for eg repr(Rust)!)

> +                                Ok(i) => i.try_into()
> +                                            .unwrap_or($crate::error::code::ERANGE.to_errno()),

It would be great if we could statically guarantee that the types will
fit to avoid this error path (i.e. static assert that the handler
returns Result<u32> and sizeof(u32) <= sizeof(ffi:c_int)). But I don't
know how to do that in Rust so no action required unless you have a
better idea ;)

---

Anyway, with those two comments updated, this patch is

    Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Thanks!
