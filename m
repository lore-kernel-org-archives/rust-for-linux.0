Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A46346AD4
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 19:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773429577; cv=pass; b=JXYJy57xxsDq/EqZXtWZbCNUSgPBqyk7LmoXHHn9d1xkMavDDa8hzbZqiAN6gV+FDfFArT7f7eL9r8HgeZ/WvwG8OV3rTUiZftFS60uH3LoGWC2Iv/WVjZdvBYoe0E4pkniio5RliOx+I5Pz/hAU9IDYMbOwcdnrhnJbhiHDOC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773429577; c=relaxed/simple;
	bh=TCigopsbCpUgXDHfdao2eVvDJWebBAj1svGa7MunhYY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=o2xQbbBrkeFBuUglSHtSz4kNM7y5JnweKJFEwc97waQKlVKgoORK9Ep4S0+gOYY3gpRxf2a7VcWIRYDSQPlZ4U82zb195pEkG9PFFuH7+MnvI3o5nuIhl0LaSaRJ7CSjiCHbduM3wkfro45xQYXXq1pblC8Mg+IxfES4p5ROJNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=U7BWopFG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="U7BWopFG"
ARC-Seal: i=1; a=rsa-sha256; t=1773429553; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bDbaw1w3PslTNM25oV6x88wM2KxstmcTTCYyDFzsaIGXwwLj7CgKBpwcvcSUTb+SWZ0hOGNncUjhriEL51Zi9lbz4uLSTGjA6wc04cbSxFsQv+xiPs8BfOWSLeYFWkk/HoF4Jp7y1PJHMGfF1RNYjQiA7+WME/86DdI3gAh2c90=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773429553; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CoKyXRFATQaNQaIfx0ExjD58Ac/pvYYKQkj0sFiiIQk=; 
	b=nqoHHvPZ8XoWQwj2v5jNA6NPsLalG/BjtYu05feMWeyulZyxNsIDqB9wEFWiiah71eW/3ylAc7+4axR6X5IT619N9qzTm0XAPWLQtyhckTsH/UPYuwmoUKjChYP+Tk2WDpAoKKpBE9szhTtkCdDtCDG81ot/EG9PhZcVgZUxPKo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773429553;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=CoKyXRFATQaNQaIfx0ExjD58Ac/pvYYKQkj0sFiiIQk=;
	b=U7BWopFGJIm4bfde1qPs0zDF0h8+Vl5NVJlIGcDAm+608nnfZyh5UZQfebs6IzYz
	YyBvqepKErKQ+Q7OnWs8AlB9YCRbg/fdQhMBokC4QW93XWJeMBi6zJGqp5Tvyglanrg
	HMYzOF3E24kjWKhcgEiBh7QXkA3R2a+aYobiqJ0A=
Received: by mx.zohomail.com with SMTPS id 1773429550667736.5198846363646;
	Fri, 13 Mar 2026 12:19:10 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 5/5] drm/tyr: Remove custom register struct
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260311-b4-tyr-use-register-macro-v2-v2-5-b936d9eb8f51@collabora.com>
Date: Fri, 13 Mar 2026 16:18:48 -0300
Cc: dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dirk Behme <dirk.behme@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Boqun Feng <boqun@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7A452659-65D9-48A6-9437-96E4291C3923@collabora.com>
References: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>
 <20260311-b4-tyr-use-register-macro-v2-v2-5-b936d9eb8f51@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 11 Mar 2026, at 20:04, Deborah Brouwer =
<deborah.brouwer@collabora.com> wrote:
>=20
> Now that Tyr uses the register! macro, it no longer needs to define a
> custom register struct or read/write functions, so delete them.
>=20
> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> drivers/gpu/drm/tyr/regs.rs | 33 ---------------------------------
> 1 file changed, 33 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
> index =
6c16a041ab3c36f8aaf785487ad61925be65a026..3fc5101c2dcd5d892abc726ea07d75d8=
f22b5d23 100644
> --- a/drivers/gpu/drm/tyr/regs.rs
> +++ b/drivers/gpu/drm/tyr/regs.rs
> @@ -27,39 +27,6 @@
> // does.
> #![allow(dead_code)]
>=20
> -use kernel::{
> -    device::{
> -        Bound,
> -        Device, //
> -    },
> -    devres::Devres,
> -    io::Io,
> -    prelude::*, //
> -};
> -
> -use crate::driver::IoMem;
> -
> -/// Represents a register in the Register Set
> -///
> -/// TODO: Replace this with the Nova `register!()` macro when it is =
available.
> -/// In particular, this will automatically give us 64bit register =
reads and
> -/// writes.
> -pub(crate) struct Register<const OFFSET: usize>;
> -
> -impl<const OFFSET: usize> Register<OFFSET> {
> -    #[inline]
> -    pub(crate) fn read(&self, dev: &Device<Bound>, iomem: =
&Devres<IoMem>) -> Result<u32> {
> -        let value =3D (*iomem).access(dev)?.read32(OFFSET);
> -        Ok(value)
> -    }
> -
> -    #[inline]
> -    pub(crate) fn write(&self, dev: &Device<Bound>, iomem: =
&Devres<IoMem>, value: u32) -> Result {
> -        (*iomem).access(dev)?.write32(value, OFFSET);
> -        Ok(())
> -    }
> -}
> -
> /// These registers correspond to the GPU_CONTROL register page.
> /// They are involved in GPU configuration and control.
> pub(super) mod gpu_control {
>=20
> --=20
> 2.52.0
>=20

Ah, much better now. Thanks!

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
