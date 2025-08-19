Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487C6275AF7
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 13:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755608942; cv=pass; b=OuJX48BW4SXNFGXt6u/aKUTy7HZOMSYtnWH6X16AcjpGIorUPCzSDc5/iuIOIcU9xCrOPshLHbymB8j/gRTv2wdGIwi0qcsKwiSMlFIROYjRGOLeFSzU3JAlqxa0uj8zgVd+O67HHsVUOUBfzIkxp/11w0l7WvLlvB548OzsFu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755608942; c=relaxed/simple;
	bh=WqOSw410JoW3EcOJcBd5MErjbN2iQTEEC8gl/a+grVU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=o3YPkw3llvmkK3jLJWZQhWAIrOwyfVaLzaL1qFDLBKiUVwbTM6uA23xLaL9UOIT7cO8WxKBEBh07rkz9tRu8Xm99lCUNNsb0Nf/Y4EjN5zZvvN3d3KxYowNDStMPV2MU8ga6V3kbGC05HvdTG3He+a23VIDwDuNqJeT8WevFYlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=gIMGQhcV; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="gIMGQhcV"
ARC-Seal: i=1; a=rsa-sha256; t=1755608920; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MA/0r83lj/zVDMVwbuN8Gj3URJJjXO4cowX4M+fheYCF11TotdSS49UnjuDYh6QE0Mr7tG/98KeWQ0Dy/eQaam8vQnQC0HhHCOMEVDdUPjV68ro18hQOFjKrFUi1qwIjMwTZUjG4pKTepDIfggwXc/1K3yDvLmguQ+7GNMbi6/A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755608920; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tXeX+3dxNYN7UverDcfqRpF5VJTIpHHMe8sbRSzqs5I=; 
	b=awzOqUQ9T7oas9O0JkWNtrX6JFjJybMeYNOUEzTGBI+edgtXIJXI4ZTyRVutugyCoQbxC4xxR/uIDhRGBhgAnBKqAfCy/Lg6fwvcYHeNI9qHgQij00BNAj0OaWft/XiHekshEMgiyKZpuS0Qpx70NZvEhU29q+/Tl0VpLEOhZHU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755608920;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=tXeX+3dxNYN7UverDcfqRpF5VJTIpHHMe8sbRSzqs5I=;
	b=gIMGQhcVb/PCV17Afbd2+lsdYdYdf7PVgQd6Dr+foa8GilCpqWcFKvnwwZPpGuRr
	w0uCCH12jJj+1CXE6RiXDlM4V9hJeK1lIh35BBhFwlGKoYucu4/huOosxNJY6yNaWdG
	IGXqUw1aqw/7Ffsy2voN16M8UB2KGTom5xPg2hLc=
Received: by mx.zohomail.com with SMTPS id 1755608917151187.29102469721647;
	Tue, 19 Aug 2025 06:08:37 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 4/7] rust: page: define trait AsPageIter
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250814093427.19629-5-dakr@kernel.org>
Date: Tue, 19 Aug 2025 10:08:21 -0300
Cc: lorenzo.stoakes@oracle.com,
 vbabka@suse.cz,
 Liam.Howlett@oracle.com,
 urezki@gmail.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 abdiel.janulgue@gmail.com,
 acourbot@nvidia.com,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <36948F0D-03A7-47B9-A1B7-50C0146C9A55@collabora.com>
References: <20250814093427.19629-1-dakr@kernel.org>
 <20250814093427.19629-5-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 14 Aug 2025, at 06:33, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> The AsPageIter trait provides a common interface for types that
> provide a page iterator, such as VmallocPageIter.
>=20
> Subsequent patches will leverage this to let VBox and VVec provide a
> VmallocPageIter though this trait.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> rust/kernel/page.rs | 12 ++++++++++++
> 1 file changed, 12 insertions(+)
>=20
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 631718a6ad7d..8c5022c20472 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -103,6 +103,18 @@ fn deref(&self) -> &Self::Target {
>     }
> }
>=20
> +/// Trait to be implemented by types, which provide an [`Iterator`] =
implementation of

nit: I would remove this comma.

How about =E2=80=9CTrait to be implemented by types that provide an =
[`Iterator`] implementation of"

> +/// [`BorrowedPage`] items, such as =
[`VmallocPageIter`](kernel::alloc::allocator::VmallocPageIter).
> +pub trait AsPageIter {
> +    /// The [`Iterator`] type, e.g. =
[`VmallocPageIter`](kernel::alloc::allocator::VmallocPageIter).
> +    type Iter<'a>: Iterator<Item =3D BorrowedPage<'a>>
> +    where
> +        Self: 'a;
> +
> +    /// Returns an [`Iterator`] of [`BorrowedPage`] items over all =
pages owned by `self`.
> +    fn page_iter(&mut self) -> Self::Iter<'_>;

Does it make sense to break this into page_iter() and page_iter_mut()?
Alternatively, should this take &self instead?

> +}
> +
> /// A pointer to a page that owns the page allocation.
> ///
> /// # Invariants
> --=20
> 2.50.1
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

