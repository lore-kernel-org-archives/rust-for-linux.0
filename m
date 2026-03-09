Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D597413251
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773086388; cv=none; b=mIXv8MiGHQgRKe8hgFoaCidUvsODQ2zzcFNCJFlETcg25b5qfrlDP999Z7Q46bDkEo8soYJ/jpSO5bN45msZNQqgxtyGdO0e3ByMXP7q5zBzWuQyubxdX8l8pHCZO+juPv1Ni+EU5yAC8pS9ngZwRA8Ji3tqTvzf8JX0wj70KtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773086388; c=relaxed/simple;
	bh=Tl78mMV6soCSfLvpu1T1j4NlBTgw9RXXeBsUL7JJlBQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=XBl4S0UZ7P+NVPBiSmygx9/UJfIDxCgneHJpVpdLcLcv8iQbKw667b7XtB1N3DFb76gkDx1Yi7iM6GemFrWdvkwpJYxTUhoAKd3XGJVNmFMj12wpc15P3OfPubAXyD31JMyvnxw4nLTL2vckolF6/Lz+pHIqi+SXmWOTQb4dGSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWjL+J+h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWjL+J+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C144C2BC9E;
	Mon,  9 Mar 2026 19:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773086388;
	bh=Tl78mMV6soCSfLvpu1T1j4NlBTgw9RXXeBsUL7JJlBQ=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=kWjL+J+hqXGQQrNsT8O9Z/e4pRvMk57f6PYAXuGDM0Hl/txD4r+Kmel4j1SZ+NUH7
	 qG6Y801TUpLgCzHpoIkCgLI4KrwnKBU2vkRevcNdoihF1zPLFJqb9lg/XQv5dAVisi
	 G3K6hOewWaIP6eRVsBMSGW6q2+mPTZ5FJbCyGX74Q7SsvtAe6Nkpq0wcu/wXQI5/NU
	 eQkOzRgUd06XZEASsjm9om3duwd2WxoZ/tYCSw54QP4fjsJd3KM+wMWKX6abmu16MV
	 7L7jvA7QoLG+MUWteVk1BjfDNaZXZcuQjjxISx5Nta3B9JkdXf2+vsmhJkcRvTf335
	 aT8BQp6tk1CPA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 20:59:44 +0100
Message-Id: <DGYIO09FC9VC.5DQNYP82VVFC@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 <mmaurer@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260203224757.871729-1-ttabi@nvidia.com>
 <20260203224757.871729-3-ttabi@nvidia.com>
In-Reply-To: <20260203224757.871729-3-ttabi@nvidia.com>

On Tue Feb 3, 2026 at 11:47 PM CET, Timur Tabi wrote:
> Add UserSliceWriter::write_dma() to copy data from a CoherentAllocation<u=
8>
> to userspace. This provides a safe interface for copying DMA buffer
> contents to userspace without requiring callers to work with raw pointers=
.
>
> Because write_dma() and write_slice() have common code, factor that code
> out into a helper function, write_raw().
>
> The method handles bounds checking and offset calculation internally,
> wrapping the unsafe copy_to_user() call.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/uaccess.rs | 74 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 63 insertions(+), 11 deletions(-)
>
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index f989539a31b4..d29a52f2a878 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -7,6 +7,7 @@
>  use crate::{
>      alloc::{Allocator, Flags},
>      bindings,
> +    dma::CoherentAllocation,
>      error::Result,
>      ffi::{c_char, c_void},
>      fs::file,
> @@ -459,20 +460,20 @@ pub fn is_empty(&self) -> bool {
>          self.length =3D=3D 0
>      }
> =20
> -    /// Writes raw data to this user pointer from a kernel buffer.
> -    ///
> -    /// Fails with [`EFAULT`] if the write happens on a bad address, or =
if the write goes out of
> -    /// bounds of this [`UserSliceWriter`]. This call may modify the ass=
ociated userspace slice even
> -    /// if it returns an error.
> -    pub fn write_slice(&mut self, data: &[u8]) -> Result {
> -        let len =3D data.len();
> -        let data_ptr =3D data.as_ptr().cast::<c_void>();
> +    /// Low-level write from a raw pointer. Caller must ensure ptr is va=
lid for `len` bytes.
> +    fn write_raw(&mut self, ptr: *const u8, len: usize) -> Result {

The method has to be unsafe as the caller has to promise that ptr is indeed=
 a
slice with len elements.

Another option would be to pass a fat pointer, i.e. *const [u8]. write_dma(=
)
would then need to use ptr::slice_from_raw_parts() and the safety requireme=
nt of
this function becomes that ptr simply has to be valid.
