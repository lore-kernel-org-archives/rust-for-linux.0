Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07420329E7D
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 11:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768648697; cv=none; b=uaBWNARi8BPjV6QYvUDVo5+RYAVKbFLDH6b+DGQm2zHOb9eTFCyUo574Sy9utU1JE84sw+ReQEQFPo4DiK0G7pgzgsCqQ/XqGQgQdv0waFiaaeCKeOmjw6Lj4LB8+7UvZOJRYtYeifsG2eUouTn1ubZp9/ttcRJq/tOJreY0CIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768648697; c=relaxed/simple;
	bh=r8pFE19enbEpY7dhMp0/C2AB6nWk5mDSkT6a80RWyqI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=kIly3vUDvCtyZ+Q3crVl95UrRSQ4+iayfp3eFzq64rek4zkj4JDtHBEp9k7+c5STzq8fDal/qR51n/3M2IQcrCch4qWjw+Lq5S6DzjCngDxWNhWgOHHPVKUW6STjvwC+mnott67ZaaFdL8fnnnMSYZi9rnOH8ThszefvzbgOjJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4W5icmm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4W5icmm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0235CC4CEF7;
	Sat, 17 Jan 2026 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768648696;
	bh=r8pFE19enbEpY7dhMp0/C2AB6nWk5mDSkT6a80RWyqI=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=p4W5icmmAKGZxgj0llhic9EJcPcciAHWRUgg2ptPSvqsDsCEdphtvZcB2aL0CD4V1
	 hlXryIpiW8W3O77m/jBm+bG57x7ds0iv3npPjWknrv/l9a9xIvr1NKUrhrGf9boLOb
	 WWRgsI6eMZ2f6USU5DAA+tJs3t+AThIYd5mRP6nXlDysYSa1q9hHODMnr4VQgEqusj
	 Yce7DgoEfgXXYsXvNccdy6CgHqIoEwGH5jX2raFKh+IVZxP76SEgXgIpOCgQ1MuXkO
	 rG/zRSNZHBfwZKedeQ0XSNIAlFn8zJnr5BzCj295r6QeaFmQJDP/LnF3zzx+O0/Yvd
	 oooLk9R+v6OiA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 12:18:13 +0100
Message-Id: <DFQTMWT0ZFOY.1EMLUIFZZ31OA@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 3/8] rust: uaccess: add
 UserSliceWriter::write_buffer() for raw pointer writes
Cc: "Matthew Maurer" <mmaurer@google.com>, "Gary Guo" <gary@garyguo.net>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-4-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-4-ttabi@nvidia.com>

(Cc: Alice)

Alice, for context, this is used when exporting a DMA buffer through debugf=
s,
while the DMA buffer may be in use by the device, i.e. no slice can be crea=
ted.

On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
> Add a new method to UserSliceWriter that copies data from a raw kernel
> pointer to userspace, without requiring a Rust slice reference.
>
> The method takes:
>   - data: raw pointer to the source buffer
>   - len: total size of the source buffer (for bounds checking)
>   - offset: byte offset into the source buffer to start copying from
>   - count: number of bytes to copy
>
> The method is marked unsafe because the caller must ensure the pointer
> is valid for the specified length and that the memory is not mutated
> during the call.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/uaccess.rs | 50 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index f989539a31b4..8bbb0084abb1 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -481,6 +481,56 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result=
 {
>          Ok(())
>      }
> =20
> +    /// Writes raw data to this user pointer from a raw kernel pointer.
> +    ///
> +    /// This is similar to [`Self::write_slice`] but takes a raw pointer=
 instead of a slice,
> +    /// along with a total buffer length, an offset into the that buffer=
, and a count of bytes
> +    /// to copy.
> +    ///
> +    /// Returns error if the offset+count exceeds the buffer size.
> +    ///
> +    /// Fails with [`EFAULT`] if the write happens on a bad address, or =
if the write goes out of
> +    /// bounds of this [`UserSliceWriter`]. This call may modify the ass=
ociated userspace slice
> +    /// even if it returns an error.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `data` must point to a valid memory region of at least `len` b=
ytes that remains allocated
> +    ///   for the duration of this call.
> +    ///
> +    /// Note: Unlike [`Self::write_slice`], this method does not require=
 exclusive access to the
> +    /// source memory. The memory may be concurrently modified by other =
threads or hardware (e.g.,
> +    /// DMA buffers). In such cases, the copied data may be inconsistent=
, but this does not cause
> +    /// undefined behavior.
> +    pub unsafe fn write_buffer(
> +        &mut self,
> +        data: *const u8,
> +        len: usize,
> +        offset: usize,
> +        count: usize,
> +    ) -> Result {

Instead of this we could probably also add a safe method write_dma() that t=
akes
a dma::CoherentAllocation<u8> instead. Once we have generic I/O in place, t=
his
could be replaced with a generic write_io() method.
