Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA2113C8EA
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 14:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768660516; cv=none; b=Uk5LWbNCcn5v9eLlPFVs33sbSyQLNwjdERknbgQTus2kgxjeG5aUxVDsu4gjlZ6KoV/9Kflx1oQXCeMxMwN044zdnL1zq7bd3RLjS1IDorH9nVsYAIm6BJBVGcpHX4HZDBRUq4So/QRikxaP6Yn4EVOaQ9tr4ysotvEzxyAUu9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768660516; c=relaxed/simple;
	bh=3McJbgRsgFufQhosw7AviBNc4LDGUtbjIfgDRPmgZI0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=NM4Xuoft7XTME4my1q5tWnp6Q95DLzaeagbkhaMFytVjRpEuD/jfQr9Bu11xoKrtfhfRYIrrtKOWXnDKfwN5AyKm+gjCSBsBiqyUUBuJ+mZe1Z//QruSgKxf6n5uv48oRpHkuiW6XWUJ/K7392uSiQQQbuW4C9YzQTfhdSdnQNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1/CLjYn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1/CLjYn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FE3C4CEF7;
	Sat, 17 Jan 2026 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768660516;
	bh=3McJbgRsgFufQhosw7AviBNc4LDGUtbjIfgDRPmgZI0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=I1/CLjYn6LdnoSzHtqBKCtuzNL437lz5rM3gUVOCgf7f5qbtSlzQgzNbgJeQAQUNf
	 ug5zOR81KD7uAC5Tp8ee2lS1EvDm6AIDC6J7tifWIFcDu9CIpbp81+ITVb46F5Mo3K
	 xWBylcnL6DBjUmhOmn7VkciczcfJmOAbSRzCydXzPqies9zA/a3WmmNchw5ekvNAee
	 SfniDP3ce5QvIF8+e4ZVmaGYmgSfyyXl7RLXOSn+UG1eF0fk3RBvelbhK+JENe/NvL
	 fsEx7aTPiGF1vJ+oq1VqfV4g3NIqD4jGULlY+WrZ2MKDcQIpqyny7B2GRJquFEj0NJ
	 Jq+zqIXbicNVA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 15:35:12 +0100
Message-Id: <DFQXTQJSCXV5.2FSUVMTSF2OB3@kernel.org>
Subject: Re: [PATCH v5 3/8] rust: uaccess: add
 UserSliceWriter::write_buffer() for raw pointer writes
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Matthew Maurer" <mmaurer@google.com>,
 "Gary Guo" <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-4-ttabi@nvidia.com> <aWuNbUywGRH1zo-0@google.com>
 <aWubWE4kstGI42P9@google.com>
In-Reply-To: <aWubWE4kstGI42P9@google.com>

On Sat Jan 17, 2026 at 3:23 PM CET, Alice Ryhl wrote:
> On Sat, Jan 17, 2026 at 01:23:57PM +0000, Alice Ryhl wrote:
>> On Fri, Jan 16, 2026 at 03:49:54PM -0600, Timur Tabi wrote:
>> > +    pub unsafe fn write_buffer(
>> > +        &mut self,
>> > +        data: *const u8,
>> > +        len: usize,
>> > +        offset: usize,
>> > +        count: usize,
>> > +    ) -> Result {
>>=20
>> Why not this signature?
>>=20
>> 	unsafe fn write_raw_slice(&mut self, data: *const [u8]) -> Result;
>>=20
>> You can implement `write_slice` in terms of it.
>
> To clarify, I think this would be a simpler signature for
> `write_buffer()`. And `write_raw_slice()` can be used both for DMA and
> to simplify the existing `write_slice`.

I.e. you can use it also to create a safe helper for DMA:

	fn write_dma(
	    &mut self,
	    data: &dma::CoherentAllocation<u8>,
	    offset: usize,
	    count: usize
	) -> Result;
