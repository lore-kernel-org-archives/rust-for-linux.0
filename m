Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D3C3E8C70;
	Wed, 25 Feb 2026 15:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034416; cv=none; b=hOQyqpgrykAwdhfrFqN6US7Zw5vn/IgIzxkrvxqXv1OrIHMIbaTHLcgroiBVBBm6EH2gTYBeyMtHVrZ9neGJS7DxZJrLS68l55F49k/gxUMRXjuAVENSa+xItG59Uv2pcLpIpi8n7RroiDssr6I3RpvrpWuLpFYBJJTkMUblqgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034416; c=relaxed/simple;
	bh=AlRNYr0g7ckHbt4Eg1IUwmE97fw50dZyzx1GZdf8jT8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=o10dyGkURuVDbr4kXIrSzZespzO13cS17AKMZHdqanDFOBvceXjaY0aNlc+50/iks+X6Pbeg5iDio3bfRnvvMP5UP1ep/RRVb+SQluwQylWXF/VIqEsyxJWl2kjF3biHgdcOmqsQdRARHdUjarfBI+IYC0K6tcQcwledcbIzw50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvNkwDZl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvNkwDZl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC6EC116D0;
	Wed, 25 Feb 2026 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772034415;
	bh=AlRNYr0g7ckHbt4Eg1IUwmE97fw50dZyzx1GZdf8jT8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=bvNkwDZlNgPGRlnV+Fdo27F0RxpIL+CihI4VZGz9Kma9FraNHV5bGvf8bHqJtRnGR
	 kL57CPox+9/83r4DeMABa8LbkQcy5B7gty+zRLg+pZrGAzkwZb+KHz6WVeZvwWMNVW
	 8oDPZRmlplQ9y5xN2eDC3nytguqZhcn+DuYGCK8HvaQj7mNwPpgWlV4O8W32DFkCp4
	 gbl9tgUC29Vv4OTmY90qdZOgHhBjB64RwRgAVmVRT0jAHnNaECLaVjyy6SRDoGOGyR
	 p7IqvR+OPecFVUuVfSXa24mZRAGxqDqoKPVrHjRDbeppKZZSvc5uxR6YPzQzXaZfYj
	 rtTIi67ZiMHyw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 16:46:51 +0100
Message-Id: <DGO5RUMC880T.2BBB93GLBFSIJ@kernel.org>
Subject: Re: [PATCH v4 3/6] rust: gpuvm: add GpuVm::obtain()
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Janne Grunau" <j@jannau.net>, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Lyude Paul" <lyude@redhat.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com>
 <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org> <aZgYY_fetgz_GDR8@google.com>
 <DGJX3FI97W1G.371MAMC60FX24@kernel.org> <aZlw3SGmLetHwaTM@google.com>
 <DGKQH7Q9QONY.4GLSDMQ8DOY1@kernel.org> <aZwalt_6KlOIDzkN@google.com>
 <DGMA3158PGED.1BQ63TEC2FC60@kernel.org> <aZw4hCxvx_2oFIha@google.com>
In-Reply-To: <aZw4hCxvx_2oFIha@google.com>

On Mon Feb 23, 2026 at 12:22 PM CET, Alice Ryhl wrote:
> On Mon, Feb 23, 2026 at 11:44:12AM +0100, Danilo Krummrich wrote:
>> On Mon Feb 23, 2026 at 10:15 AM CET, Alice Ryhl wrote:
>> > On Sat, Feb 21, 2026 at 04:09:41PM +0100, Danilo Krummrich wrote:
>> >> On Sat Feb 21, 2026 at 9:46 AM CET, Alice Ryhl wrote:
>> >> > So, should we get rid of GpuVmBoRegistered in favor of ARef<GpuVm<T=
>>?
>> >>=20
>> >> I wanted to avoid exposing the reference count, as I suspect drivers =
might not
>> >> need it in Rust, but I don't know for sure.
>> >>=20
>> >> We could also define it as GpuVmBo<T>(ARef<GpuVmBoInner<T>>), where
>> >> GpuVmBoInner<T> is private, but I also don't want you to go back and =
forth with
>> >> this in case it turns out we do need drivers to be able to take a ref=
erence
>> >> count and I also don't think it hurts too much exposing the reference=
 count,
>> >> even if not needed.
>> >>=20
>> >> So, either is fine with me, ARef<GpuVmBo<T>> or
>> >> GpuVmBo<T>(ARef<GpuVmBoInner<T>>).
>> >
>> > I don't think GpuVmBo<T>(ARef<GpuVmBoInner<T>>) works because we need =
to
>> > be able to talk about both ARef<GpuVmBoInner<T>> and &GpuVmBoInner<T>.
>> > The reference type is returned by several different APIs, so the Inner
>> > type can't be private.
>>=20
>> I meant NonNull<GpuVmBoInner<T>>, analogous to the current GpuVmBoRegist=
ered.
>
> Not sure what you mean.

What I meant was doing what you currently have, with the following changes:

- Rename GpuVmBoRegistered<T> to GpuVmBo<T>.
- Rename GpuVmBo<T> to GpuVmBoInner<T> and make it private.

The downside is that both GpuVmBo<T> and GpuVmBoAlloc<T> can't dereference =
to
GpuVmBoInner<T>, so we'd need some forwarding methods.

The advantage is that we can hide the reference count and keep it simple wi=
th
only two driver types, GpuVmBo<T> and GpuVmBoAlloc<T>.

But I'm also fine with just ARef<GpuVmBo<T>> and GpuVmBoAlloc<T>.
