Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795813615;
	b=2J9n2rEKAjkfug7ikp7rclz0I/3KNI/+7NEwZ0nSMsUPmZxefwvu8DIKwslgBZ7NFEGj
	 aw+syGZGFgSqGBkH9VwqUDee/1lI9u6KNj87CZ0GKHpcrQQeB/LGLO5aXsDK3Y373cuxI
	 3hA8q31A+Z7SpZ6gpHPrstPfXwacq3kteAMqs2/wA2lOrJULftFwZEux+GDYb8qQ/lfOB
	 t0/71FNBBa+PghQMqKRPGCe/niPkEdrMMaZ/Cv6pg0pkWgJE42jxJeZTSZiyWZLtnmPTF
	 WQneqER7c+z9YGTFEvncK0+sqCiwtSH/Ti0Jb9BdA6aXFCHCbnIg5VH0qFv8S2EX2Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795813615;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To;
	bh=x2vbCxhKlDEYGyJLF8a1r9DvhsL84+yAuxXVlq9Dapc=;
	b=IyFCL1piDPBLPN0kUYL5LoMODW+D/PWg0Vjho+AKiH5mhum2FzVK/+4bSucx3WHgTjoe
	 XIESFvco7UL1AS7rGaBWoMZG1nGx5btA5L6HiTlbR8DgmO1W20SDT/1dNWsNBT2dZY31J
	 91xLwj8iuqTnl0PI3piTPaIdHXab/Jf8KOalgPzdt3LmrdTHivyKVtUWHmmygCOwlwvub
	 cXjTDcwumIBOO4fRYAUPSujhNGwkxOf+mbZRidM2otdXLYedk0btt1X/hxox5KfA/Lv5N
	 KrdIOIo22OZ3H7G7m1Rpp3VVUxtUmkzffCFjLzz99Bs8T1OL3158c1eHnMxjTbf7fBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrdmPbgt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B2D606A31C;
	Fri, 27 Nov 2026 21:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrdmPbgt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679081F00893;
	Fri, 27 Nov 2026 21:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795813614;
	bh=x2vbCxhKlDEYGyJLF8a1r9DvhsL84+yAuxXVlq9Dapc=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=VrdmPbgtrUh9fv6xn4MIpy2/VbzIxqsxaUK+so8t3HGTNxx5Fdf22S/BihAuOFu89
	 FM/jVk1tzAxNs3OCGXQTOIrXrXSFKZFYG6S5TJVOyS78eVoIxN7cSdKLD3dQV4HHId
	 uHCuSCFDn5Xg22M4GEw8Db3dMCxRboJHBFUZN/TMswBCbOy5KTzfrg2enlM/0E6qQY
	 4+N5Z3x/YrPTHclUQHwUCOOwuxik+/BiZvRyBRH7yHfApp6Aqhc8n3FcAEYHfH5ckb
	 eWPtnke6gZs0Fl5qyCplhwWYgZ9Lh/FInGRPLwVC1kXhR6BzyvD+aGSFMyPiomkIJA
	 7RnkuRW/oU9ew==
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 22:06:50 +0100
Message-Id: <DN6ASNF6NW8Q.13GAZAC9LHRN3@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] rust: dma_buf: dma_fence: add SignallingSection
Cc: "Sumit Semwal" <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Philipp
 Stanner" <phasta@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Tamir Duberstein" <tamird@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20261127-dma-fence-signalling-v1-0-c44e8f4910ca@collabora.com>
 <20261127-dma-fence-signalling-v1-1-c44e8f4910ca@collabora.com>
In-Reply-To: <20261127-dma-fence-signalling-v1-1-c44e8f4910ca@collabora.com>

On Fri Nov 27, 2026 at 7:30 PM CET, Daniel Almeida wrote:
> dma_fence_begin_signalling() and dma_fence_end_signalling() mark the
> code that the completion of a dma-fence depends on, so that lockdep can
> check it against the dma-fence rules. However, up until now, it was not
> possible to use the signalling tokens from Rust.
>
> Thus, add SignallingSection, a guard that begins a section when it is
> created and ends it when it is dropped. Code on the signalling path can
> take a &SignallingSection to require that its caller opened one.
>
> Use it in the DriverFence example, which has a TODO for it.
>
> A later patch in this series makes DriverFence::signal() require one.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/kernel/dma_buf/dma_fence.rs | 70 ++++++++++++++++++++++++++++++++++=
+++++-
>  rust/kernel/dma_buf/mod.rs       |  3 +-
>  2 files changed, 71 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_f=
ence.rs
> index a1d851656562..7ee87935d3be 100644
> --- a/rust/kernel/dma_buf/dma_fence.rs
> +++ b/rust/kernel/dma_buf/dma_fence.rs
> @@ -17,6 +17,7 @@
>      error::to_result,
>      prelude::*,
>      types::ForeignOwnable,
> +    types::NotThreadSafe,
>      types::Opaque, //
>  };
> =20
> @@ -589,6 +590,71 @@ unsafe fn dec_ref(ptr: NonNull<Self>) {
>      }
>  }
> =20
> +/// A dma-fence signalling critical section on the current task.
> +///
> +/// All code needed to signal a [`DriverFence`] must run in such a secti=
on,

Hm...this makes an annotation policy sound like an unconditional prerequisi=
te
for signalling any DriverFence.

It is clarified below with "Without `CONFIG_LOCKDEP`, the section has no
effect.", but I'd probably first explain the annotation mechanism and then
explain what drivers are expected to do.

> +/// from the point where its [`Fence`] becomes visible to other threads =
up to
> +/// the point where it is signalled. With `CONFIG_PROVE_LOCKING`, the se=
ction

I'd add a bit more detail on what cases we need to protect once the fence
becomes visible to other threads or is published.

Especially the more subtle parts, such as indirect dependencies on memory
reclaim.

> +/// is a [DMA Fence Signalling Annotation], which validates that code ag=
ainst
> +/// the [DMA Fence Cross-Driver Contract]. Without `CONFIG_LOCKDEP`, the
> +/// section has no effect.
> +///
> +/// A function that is part of the signalling path can take a
> +/// `&SignallingSection` to require that its caller opened one. Sections=
 nest,
> +/// and only the outermost one is annotated.
> +///
> +/// [DMA Fence Signalling Annotation]: https://docs.kernel.org/driver-ap=
i/dma-buf.html#dma-fence-signalling-annotations
> +/// [DMA Fence Cross-Driver Contract]: https://docs.kernel.org/driver-ap=
i/dma-buf.html#dma-fence-cross-driver-contract
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::dma_buf::SignallingSection;
> +///
> +/// // Code on the signalling path takes a section to require that its c=
aller
> +/// // opened one.
> +/// fn on_signalling_path(_section: &SignallingSection) {}
> +///
> +/// let section =3D SignallingSection::begin();
> +/// on_signalling_path(&section);
> +/// ```

Hm...I'm not sure the example is overly useful. What about an example that =
shows
how it catches a violation? I'm usually not a fan of this, but in this case=
 it
kinda makes sense.

> @@ -704,9 +771,10 @@ struct DriverFenceData<'a, T: Send + Sync + FenceCon=
textOps> {
>  /// let cb_reg =3D unsafe { FenceCallbackRegistration::new(&waiting_fenc=
e, cb_data) };
>  /// let cb_reg =3D KBox::pin_init(cb_reg, GFP_KERNEL)?;
>  ///
> -/// // TODO signalling guards
> +/// let section =3D SignallingSection::begin();
>  /// assert_eq!(waiting_fence.is_signaled(), false);
>  /// fence.signal(Ok(()));
> +/// drop(section);
>  /// assert_eq!(waiting_fence.is_signaled(), true);

I think that's a separate patch, or actually the subsequent patch is a natu=
ral
fit.
