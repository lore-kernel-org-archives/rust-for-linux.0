Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4597252904;
	Wed, 17 Dec 2025 19:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765999287; cv=pass; b=QYh4MohiaYMopXya3sfnLyYGP+/zV7N3BArrr/ILfJUZ8nSFIZPAUaUdOZfpTifgqNLrQQGWjaEcDZIwiAGNDDlAj5RG8nxNG2TdMtix4xR9SRHpslVL92dOjqt91Jzv+M1ohgrV6TQzTbp1/OQ0WZ+Zn3uRFDuauPbbazbRwwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765999287; c=relaxed/simple;
	bh=51uiJRAIZH9vp3XSWMEBMnJ20qbjGjhJlqmFP3xUIDM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Dka6Lau0YImhuva3gbEekfsofraa+4wfyr7kkE1lAhLW1DJhp4yrh6xzaGqC+wcde3mm2rf9tDe5QFGm95X04RHIQlwl543MslfvobrkGsc5SrCKcg9SH37sAlV98mJG7RAFi1jdL/HTI54Tzs9v4PZUXnX4ZpB7Du0YiHv7iWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=G8Db9/a5; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="G8Db9/a5"
ARC-Seal: i=1; a=rsa-sha256; t=1765999274; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NdmQQuJH+LP+I2D9vtGrH9S9r6rsqLRAMGrbIkUrgx2nECY3qOuU2aHW31LeJSQU7AYgBxJRXjyBVSg38hprmmcn4D0i7MY3rEz4isnwkOAMTzDCEK2e+vxRwotATSThHwSLNnU/yCxdqwRFREBgcxoSCDHNQ+2AnXct1kr88ek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765999274; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pj/1WQj5iLgSG1WQ91wAvZsxqqO9+6/mcpI5aO5FO9g=; 
	b=PHgzoGXgdZJGqcnTa7eXLBUy+wYQpWgwGJsm+3fWFeZF5VKx+hdf4DMOeAtNtYvnJbP1ZheepTS6HcesEhmSXj7kHqplbjfSMesQnl3CU4zYjxQFWJEOxPiz72PWHCDaekVWhZEGpf3arkTCPHHyg3C73s2ht50yVc6B4mHrUuE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765999274;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=pj/1WQj5iLgSG1WQ91wAvZsxqqO9+6/mcpI5aO5FO9g=;
	b=G8Db9/a5POTiPJmIVqsaT2xRDm0KoduEzVx1Mea7xEbv4E6391yiRU9o6+m1aI1H
	2itcbiGVeqyrrG9pqIsRjSU1PNNdO2iW9FSFil5mQJOE8oqcQBSIBPLQMNJDvRpeJ0L
	2ORe+S/LP4qfOYAcoCpJyXmqmRx2H3/pyr3hTihY=
Received: by mx.zohomail.com with SMTPS id 1765999272899246.76303127335018;
	Wed, 17 Dec 2025 11:21:12 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: sync: implement Unpin for ARef
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251217-unpin-for-aref-v1-1-84711b747d02@google.com>
Date: Wed, 17 Dec 2025 16:20:56 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4B26E76F-3863-47EC-8515-4B859ABFD82A@collabora.com>
References: <20251217-unpin-for-aref-v1-1-84711b747d02@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 17 Dec 2025, at 14:37, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> The default implementation of Unpin for ARef<T> is conditional on T
> being Unpin due to its PhantomData<T> field. However, this is overly
> strict as pointers to T are legal to move even if T itself cannot =
move.
>=20
> Since commit 66f1ea83d9f8 ("rust: lock: Add a Pin<&mut T> accessor")
> this causes build failures when combined with a Mutex that contains an
> field ARef<T>, because almost any type that ARef is used with is =
!Unpin.
>=20
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> rust/kernel/sync/aref.rs | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
> index =
0d24a0432015d09509a255df0a4f114171ae9fb0..c4be6f5d4884ddd6cbfbd7c27d396310=
a7cde30e 100644
> --- a/rust/kernel/sync/aref.rs
> +++ b/rust/kernel/sync/aref.rs
> @@ -83,6 +83,9 @@ unsafe impl<T: AlwaysRefCounted + Sync + Send> Send =
for ARef<T> {}
> // example, when the reference count reaches zero and `T` is dropped.
> unsafe impl<T: AlwaysRefCounted + Sync + Send> Sync for ARef<T> {}
>=20
> +// Even if T is pinned, pointers to T can still move.
> +impl<T> Unpin for ARef<T> {}
> +
> impl<T: AlwaysRefCounted> ARef<T> {
>     /// Creates a new instance of [`ARef`].
>     ///
>=20
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251217-unpin-for-aref-3dc0fe3fd5b0
>=20
> Best regards,
> --=20
> Alice Ryhl <aliceryhl@google.com>
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

