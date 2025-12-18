Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1853446BB
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053112; cv=none; b=FuIO/+StQFHqQd1YZNC0MYA011+oRb5qj5d2zSA7hvSgrIwQRWtaPwSwb65ZLBggD+YfCE1A479w00p2+j8SV5IQxlDwULXWz4hUGT4OAqY7GiN9M3p79CbwPhL+DRXcDg66hIPHuzvxeHLZcFes6Hi89vaZoyAsg+2Ko1MUBqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053112; c=relaxed/simple;
	bh=I/6kvKM9p8XY3+0CKtKDEdvBP+NxnC4Rq9qspP9kerk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=EkNFZMP3/qQYzfh+Mw+VTu5h3EvmQuvMb+ndqrUiKuc2XiMKDNaNs1AeqNfTN//9Qq/Slv8eBTRMxmQVl+EIoBqMT77NknRGkNhw8K41abVwCakISwc4ijwsC9FNubKJXylSSCl/2qFfzophth/85J0kr+OB6T3YNbjiuIliKAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/THVjnM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/THVjnM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56396C4CEFB;
	Thu, 18 Dec 2025 10:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766053111;
	bh=I/6kvKM9p8XY3+0CKtKDEdvBP+NxnC4Rq9qspP9kerk=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=Y/THVjnM1abEaJR+U1aTdEdX6K+6AeFV/du+Aq+CHT8c4CoEXDkcm9Cf+PPuz3rJ9
	 5B9eL9CTda38tTo++OYWq1sW1R3wemxZgUw/WqAsats/psF7yQx8F85pxfo8pXLyJ6
	 WLvCsdMVHluBfiiFMpOhk2X9jh96oBfWYU+xw8v/cxesibp7OEOAc1Ssdo5WcdTte2
	 keTw0LWLTIQMt6Sqes/2SirtQyuT6tyMuQKkwz7PjFO/sxx/9mNneI5xH87FBBivUy
	 a+g2rLs4k45DiTXqcSQLMBbs4b6tMDicQCcP0/W6EX8ZjrXlQSFFE4M4tuikdro2H8
	 yiGHFbJU4m/Wg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 11:18:28 +0100
Message-Id: <DF19KTQTKOS9.33N1KT9WNLAUO@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 7/9] gpu: nova-core: implement BinaryWriter for
 LogBuffer
Cc: "Gary Guo" <gary@garyguo.net>, <rust-for-linux@vger.kernel.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Lyude Paul" <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-8-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-8-ttabi@nvidia.com>

On Thu Dec 18, 2025 at 2:39 AM CET, Timur Tabi wrote:
> From: Alexandre Courbot <acourbot@nvidia.com>
>
> `LogBuffer` is the entity we ultimately want to dump through debugfs.
> Provide a simple implementation of `BinaryWriter` for it, albeit it
> might not cut the safety requirements.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index fb6f74797178..860674dac31e 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -3,6 +3,7 @@
>  mod boot;
> =20
>  use kernel::{
> +    debugfs,
>      device,
>      dma::{
>          CoherentAllocation,
> @@ -117,6 +118,29 @@ pub(crate) struct Gsp {
>      rmargs: CoherentAllocation<GspArgumentsCached>,
>  }
> =20
> +impl debugfs::BinaryWriter for LogBuffer {
> +    fn write_to_slice(
> +        &self,
> +        writer: &mut kernel::uaccess::UserSliceWriter,
> +        offset: &mut kernel::fs::file::Offset,
> +    ) -> Result<usize> {
> +        // SAFETY: This is a debug log buffer. GSP may write concurrentl=
y, so the
> +        // snapshot may contain partially-written entries. This is accep=
table for
> +        // debugging purposes - users should be aware logs may be slight=
ly garbled
> +        // if read while GSP is actively logging.
> +        let slice =3D unsafe { self.0.as_slice(0, self.0.count()) }?;

Unfortunately, it's still undefined behavior to create a slice when the bac=
king
buffer can change unexpectedly.

You can use UserSliceWriter::write() instead or add an unsafe method to
UserSliceWriter that takes a raw pointer, length and offset.

Given the context of a debug log buffer, I suggest the former.

> +        writer.write_slice_file(slice, offset)
> +    }
> +}
> +
> +// SAFETY: `LogBuffer` only provides shared access to the underlying `Co=
herentAllocation`.
> +// GSP may write to the buffer concurrently regardless of CPU access, so=
 concurrent reads
> +// from multiple CPU threads do not introduce any additional races beyon=
d what already
> +// exists with the device. Reads may observe partially-written log entri=
es, which is
> +// acceptable for debug logging purposes.
> +unsafe impl Sync for LogBuffer {}
> +
>  impl Gsp {
>      // Creates an in-place initializer for a `Gsp` manager for `pdev`.
>      pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl =
PinInit<Self, Error>> {
> --=20
> 2.52.0

