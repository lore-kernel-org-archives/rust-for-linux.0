Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9293B2D6E6F
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 00:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769818497; cv=none; b=sVM8BpJl4qMnb/+puEWHQ/MJwg2B9ExlGDlUpwnMt+5tJw7Lv0uoQ23VHn8qgw2leGo+zbP8FcbhH+tKj4yNu7uaGjksx0sW/lA64cnvLF9moet2jCLikrmNu5pLSC/kN6hX0sdqUHmOVDkI+jVjuSssdtef4nK9TFxR5KDEuy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769818497; c=relaxed/simple;
	bh=ZoI+iqcGgdae+p1gydlMNbQ0hxd1od8WckPfjNXZWJw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=bYli+H/kF3GKEc4PIIgproTkhiBiUzQvH5r9+NqL7skes8/kfQF3fs+bmCw9Z//9qSWjmjF8NTiXdJym04kPcieHPD5zEjPF6wPoMkiBG9EuIL4wbYJ9cF3ladTAO0q0i3syKlKXAodKqrvFC7TDtz/v8ltVHEjLzp1wp+lEzP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AaGGZFUb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AaGGZFUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0911CC4CEF7;
	Sat, 31 Jan 2026 00:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769818496;
	bh=ZoI+iqcGgdae+p1gydlMNbQ0hxd1od8WckPfjNXZWJw=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=AaGGZFUbd4ACQjN1xiENPYTqIQwGB3DdInquu6A4JbNWpePzoCtAbQg7KAoiVZ2bI
	 AJbnPka3j09sI5uyIIXSP5ChY4FUqqDVj+bEoActgFuqmi9m1kqIedsCPJNaDTu7ve
	 pwGXJ+wOMERcRwUU5Vsw0R9W5/5DMMPCc8+edEPg1BEwWSMj1nB9sLL25n5Q3VlNf1
	 gnJMFfJl2M96CXBX+6QvXAaxqrB9Gv5PB0Fjk/tUBcREJvQR3qVUYLtLh1e1x/HiRr
	 AZOrCbsi6j6hiNWLloHlTi3e3D/lPbwyfXvYJxGwAriDwKT0ehvdM9/yJSBU0W9ENA
	 es01X2Ya5wk4A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 01:14:53 +0100
Message-Id: <DG2CANK7QMY0.2W8S2R1ZML3UW@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 <mmaurer@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-3-ttabi@nvidia.com>
In-Reply-To: <20260129022837.4133832-3-ttabi@nvidia.com>

On Thu Jan 29, 2026 at 3:28 AM CET, Timur Tabi wrote:
> +    /// Writes raw data to this user pointer from a DMA coherent allocat=
ion.
> +    ///
> +    /// Returns error if the offset+count exceeds the allocation size.
> +    ///
> +    /// Fails with [`EFAULT`] if the write happens on a bad address, or =
if the write goes out of
> +    /// bounds of this [`UserSliceWriter`]. This call may modify the ass=
ociated userspace slice
> +    /// even if it returns an error.
> +    ///
> +    /// Note: The memory may be concurrently modified by hardware (e.g.,=
 DMA). In such cases,
> +    /// the copied data may be inconsistent, but this does not cause und=
efined behavior.
> +    pub fn write_dma(
> +        &mut self,
> +        alloc: &CoherentAllocation<u8>,
> +        offset: usize,
> +        count: usize,
> +    ) -> Result {
> +        let len =3D alloc.count();
> +        if offset.checked_add(count).ok_or(EOVERFLOW)? > len {
> +            return Err(ERANGE);
> +        }
> +
> +        // SAFETY: `start_ptr()` returns a valid pointer to a memory reg=
ion of `count()` bytes,
> +        // as guaranteed by the `CoherentAllocation` invariants. The che=
ck above ensures
> +        // `offset + count <=3D len`.
> +        let src_ptr =3D unsafe { alloc.start_ptr().add(offset) };
> +
> +        // SAFETY: `src_ptr` is valid for reads of `count` bytes per the=
 above.
> +        let res =3D unsafe {
> +            bindings::copy_to_user(self.ptr.as_mut_ptr(), src_ptr.cast::=
<c_void>(), count)
> +        };
> +        if res !=3D 0 {
> +            return Err(EFAULT);
> +        }
> +
> +        self.ptr =3D self.ptr.wrapping_byte_add(count);
> +        self.length -=3D count;
> +
> +        Ok(())
> +    }

I think the idea was to have a common read_slice_raw() method that can be s=
hared
between write_dma() and write_slice(). Can you please factor this out?
