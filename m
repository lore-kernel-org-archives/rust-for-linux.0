Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2490D1D8DFB
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 11:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768648769; cv=none; b=d9OExHUaygZq5i1Gydx2cG5VKe7RVOZ8YzKI63SfdNK54TIGkjR7g6T55+QeW4uWnVLwZ9sfOT+KOiw1Qp0nHKZPnx6KKN+DRu0UxBDthIPvgHTvDcwcYCdzWV9tQhhJpx3e/avR4X6Zfy5JHfAnmwi9GLQ40ANMumLEsrEBLOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768648769; c=relaxed/simple;
	bh=fB7T6W9WSy/Dus3CVGYgcLzz7Jj4LHH2sIpcmY23ob0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=WE1sIauQgWX+EUXHOpCG7YkBOvFvJdXIwJVTzn0a55MIIOsyl0VpccQL0xDCR6esJvxlrjDrHoHQamOQ4764VbLDKlJfyezqcJ6fcOFoPYG4KGbrje4YEB+5PZaw5gTO+jHDxODpbewQwq6w1KD6nXFBQXksVJYIpLYPQVgSoMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYuMSjXE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYuMSjXE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A62C4CEF7;
	Sat, 17 Jan 2026 11:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768648768;
	bh=fB7T6W9WSy/Dus3CVGYgcLzz7Jj4LHH2sIpcmY23ob0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=BYuMSjXEXi8nUfo/eWyB6QoP1ih+mWBxgI24P8d04YVEgPr8mBpcPuPJgvNuWSlqd
	 SsHdniX+Mtx2TxypWIgjd/JZoe3u0RNuJNlyzXqcn+1G6UD80mHKa/m908BJozDmZT
	 bC4bNWWuyZfgOYci7wYME7LiiFAJMOl66ITP6nBkMOz8zLMCoNLanp06vhoh0eT2g4
	 OFhzO/XSQCMpCxokpYpHeeMtIfMRCZkoSruzpwUbtVMDCSM7EwiqFndb5vSoflLrnZ
	 13Brw5I2FLjRDfURQPMae49HPt+/1tI3UPPXnEdo5LHb57xBJdQX04BgkTwe9XVRam
	 jbWRCkPYjChWg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 12:19:25 +0100
Message-Id: <DFQTNTW9TTG5.2M3A3W2GDOL9B@kernel.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, "Gary Guo" <gary@garyguo.net>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Alice
 Ryhl" <aliceryhl@google.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 3/8] rust: uaccess: add
 UserSliceWriter::write_buffer() for raw pointer writes
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-4-ttabi@nvidia.com>
 <DFQTMWT0ZFOY.1EMLUIFZZ31OA@kernel.org>
In-Reply-To: <DFQTMWT0ZFOY.1EMLUIFZZ31OA@kernel.org>

(Really Cc: Alice :)

On Sat Jan 17, 2026 at 12:18 PM CET, Danilo Krummrich wrote:
> (Cc: Alice)
>
> Alice, for context, this is used when exporting a DMA buffer through debu=
gfs,
> while the DMA buffer may be in use by the device, i.e. no slice can be cr=
eated.
>
> On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
>> Add a new method to UserSliceWriter that copies data from a raw kernel
>> pointer to userspace, without requiring a Rust slice reference.
>>
>> The method takes:
>>   - data: raw pointer to the source buffer
>>   - len: total size of the source buffer (for bounds checking)
>>   - offset: byte offset into the source buffer to start copying from
>>   - count: number of bytes to copy
>>
>> The method is marked unsafe because the caller must ensure the pointer
>> is valid for the specified length and that the memory is not mutated
>> during the call.
>>
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>> ---
>>  rust/kernel/uaccess.rs | 50 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 50 insertions(+)
>>
>> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
>> index f989539a31b4..8bbb0084abb1 100644
>> --- a/rust/kernel/uaccess.rs
>> +++ b/rust/kernel/uaccess.rs
>> @@ -481,6 +481,56 @@ pub fn write_slice(&mut self, data: &[u8]) -> Resul=
t {
>>          Ok(())
>>      }
>> =20
>> +    /// Writes raw data to this user pointer from a raw kernel pointer.
>> +    ///
>> +    /// This is similar to [`Self::write_slice`] but takes a raw pointe=
r instead of a slice,
>> +    /// along with a total buffer length, an offset into the that buffe=
r, and a count of bytes
>> +    /// to copy.
>> +    ///
>> +    /// Returns error if the offset+count exceeds the buffer size.
>> +    ///
>> +    /// Fails with [`EFAULT`] if the write happens on a bad address, or=
 if the write goes out of
>> +    /// bounds of this [`UserSliceWriter`]. This call may modify the as=
sociated userspace slice
>> +    /// even if it returns an error.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// - `data` must point to a valid memory region of at least `len` =
bytes that remains allocated
>> +    ///   for the duration of this call.
>> +    ///
>> +    /// Note: Unlike [`Self::write_slice`], this method does not requir=
e exclusive access to the
>> +    /// source memory. The memory may be concurrently modified by other=
 threads or hardware (e.g.,
>> +    /// DMA buffers). In such cases, the copied data may be inconsisten=
t, but this does not cause
>> +    /// undefined behavior.
>> +    pub unsafe fn write_buffer(
>> +        &mut self,
>> +        data: *const u8,
>> +        len: usize,
>> +        offset: usize,
>> +        count: usize,
>> +    ) -> Result {
>
> Instead of this we could probably also add a safe method write_dma() that=
 takes
> a dma::CoherentAllocation<u8> instead. Once we have generic I/O in place,=
 this
> could be replaced with a generic write_io() method.

