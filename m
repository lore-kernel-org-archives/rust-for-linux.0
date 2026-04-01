Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE53378D92;
	Wed,  1 Apr 2026 21:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775078435; cv=none; b=g90Cb/bDZoWX5w4ymI9uR+WOLQYKVjqgAH+TZm5b56PciBN7OIFcWGy6rsO//q7TYy8iKHaBdeSMY75S6p/gbkhweDikQK0X+YpCXC5R3JX6/9ECcZysjsNyo+GXcBG/3cyApDT/8k04Su1AiSeT/udQC4QrqVOujMxTtgJfisM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775078435; c=relaxed/simple;
	bh=q9S6iIfdBNXpxiC30urfs8a/m055N43RF3Gm86qD2hQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=A13RY3cPy63CeowJLGoOn/9V9LjbBPmYaEhenpUliSjnNxGYeMSaxA11aCVHwuM04FcukcxggMrTEGDSDdHCLL7Fx46NcpbqRbGwu7+MMbmClB4OxSeNzTCF1NPmiZUw4lhWty7UxscP5BEdNbe5OHoEjDP7D9WqhmwB+soWP6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipXfYV7m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipXfYV7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15096C4CEF7;
	Wed,  1 Apr 2026 21:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775078434;
	bh=q9S6iIfdBNXpxiC30urfs8a/m055N43RF3Gm86qD2hQ=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=ipXfYV7m2oOB3qdLxpO6zBD2EuxvN9ZfHDVHh+D5Rrikq8aE9I8LKy/z+OCKNP34N
	 nADvA6Xd+JtJjt0QnzxWFo1QDqrny8whTk6ki00JcZ9sCfeAkFr3duXMfifSHbKU23
	 1PEtThhMC+5qb1NPbV9pjLl9WnruVjDObEu/DVllIJz2ZRNsxQ+6s8jowqmb29qx54
	 RDAJ7gd9rR2ILza6B7dy0OwL8mQJ2HAbf8RZMVe0Hz6o/0+Utr4PZHXqlknlEBfuwb
	 evQdns46Os+LDaX+7VI1rfgfigQVMmWdebwP3Q1zppL3tMYFH+PJbxJI1ta3CE83Wz
	 vSNO10ILjRxOQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 23:20:28 +0200
Message-Id: <DHI4SCEVOQXG.1LN5Z1S7XYYLM@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/2] rust: sizes: add DeviceSize trait for device
 address space constants
Cc: "Alice Ryhl" <aliceryhl@google.com>, <'@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260331224319.107082-1-jhubbard@nvidia.com>
 <20260331224319.107082-2-jhubbard@nvidia.com> <aczpifqz5CoOFB3N@google.com>
 <c42c7074-5f17-4f61-878d-414762461826@nvidia.com>
In-Reply-To: <c42c7074-5f17-4f61-878d-414762461826@nvidia.com>

On Wed Apr 1, 2026 at 10:22 PM CEST, John Hubbard wrote:
> On 4/1/26 2:46 AM, Alice Ryhl wrote:
>> On Tue, Mar 31, 2026 at 03:43:18PM -0700, John Hubbard wrote:
>>> The SZ_* constants are usize, matching the CPU pointer width. But
>>> device address spaces have their own widths (32-bit MMIO windows,
>>> 64-bit GPU framebuffers, etc.), so drivers end up casting these
>>> constants with SZ_1M as u64 or helper functions. This adds
>>> boilerplate with no safety benefit.
>>>
>>> Add a DeviceSize trait with associated SZ_* constants, implemented
>>> for u32, u64, and usize. With the trait in scope, callers write
>>> u64::SZ_1M or u32::SZ_4K to get the constant in their device's
>>> native width. All SZ_* values fit in a u32, so every implementation
>>> is lossless. Each impl has a const assert to catch any future
>>> constant that would overflow.
>>>
>>> A define_sizes! macro generates everything from a single internal
>>> list of names. The macro takes the target types as arguments, so
>>> adding a new target type requires changing only the call site.
>>>
>>> Suggested-by: Danilo Krummrich <dakr@kernel.org>
>>> Link: https://lore.kernel.org/all/DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org=
/
>>> Link: https://lore.kernel.org/all/DGHI8WRKBQS9.38910L6FIIZTE@kernel.org=
/
>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>=20
>> The name `DeviceSize` seems overly specific to the use-case you had. It
>
> Yes, actually this name has been worrying me from the start. Because
> it is not necessary to tie it, conceptually, to devices at all.
>
>> also makes it sound like something you would implement *for* the device
>> type rather than for the integer type. Why not name it something more
>> generic such as SizeConstants?
>
> Yes, thanks, I do think SizeConstants is more accurate.
>
> I'm inclined to make that change, unless someone else tells me not
> to...let's see.

I think I brought up the name DeviceSize when I proposed this.

The reason is that when I proposed this I was thinking of it as a marker tr=
ait
for "complex" types around u32, u64, etc. that we can use in DRM APIs (or a=
ny
other device centric API) though generics.

For instance, instead of GpuVm<T>::vm_start() -> u64, it could be
GpuVm<T, V: DeviceSize>::vm_start() -> V.

Another example would be buddy::Block<V: DeviceSize>::offset() -> V instead=
 of
buddy::Block::offset() -> u64.

This way you can interact with the API with the actual device native size.

That said, I'm perfectly fine renaming this to something else; the "device
semantics" comes from the API using the type, not the type itself.
