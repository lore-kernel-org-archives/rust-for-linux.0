Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C4D2C2343
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763398751; cv=pass; b=bhRh9bxPOGXlh8LkPj9TY0PEEB/BdnQH3NVn2XQ+sIUh3We5zXLoFZxP1ku5ylivXuZTMUQTz2qiOeQ/hxRwAgbi/yB9ReUsvOg054bHRCrksrMhYS99Lj/Gaqm4HYKI5w4ltZso/KQqfbJ5lsRMJA1rF42dbXeAlKZ+SE+OIyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763398751; c=relaxed/simple;
	bh=cD+RXTJ+vEOnTEJ5K7glwO7upu9usH0BFUzz1AfM6cU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fGAVaQmLYGxkk/XL4xJ7RvVk/0bsFiPkPDDTFA927tRYgatr6pz0cOUVQD/M7OyHqbQPG5pVt/jRHgmGlQqUI7axuxvqdcjQzhRsxKL2JriMlZlnlTofzMUyJ0hQ4davT3z1AoyUaoGxBKY47sFy+qu/CJabMUsDIPFdlexXg9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=AqPKKNMa; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="AqPKKNMa"
ARC-Seal: i=1; a=rsa-sha256; t=1763398730; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C0N2dbjXyBooKgJ6SPOwvZo8iJWYgar/Hk5fOZHnveY4yXCJScVqgl4hgC3OLZsOtSnoJGIgQgU2N2bwzf8nMeFwWDdYdaoAeAcL3gdMkxOwezGdGntVuf+BPsRYkU6l/8C+qJX2yOYlbkRZjKgu8r9EbYxn2FIQQ//c5dn89uU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763398730; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zJPDnbgwWGEYQ/onoTPHrZcVFfdWA1uQthIX4SQdmwU=; 
	b=GgGq3bqCOayTnCNDr2kgYpwZQj2ocTE3O5RMSCQ1Ak29Gkxs8bzE33EuWNF9PFExQvFNhqSIGm0Xn6+91NSXGgHgRuMh2zVmw2yz7RmxCYaZXOcA3i2DOcEXljvN9YULxjYvgowOa50R70hXSe7C3PIbU6G/j1UrjiTE2BXGURg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763398730;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=zJPDnbgwWGEYQ/onoTPHrZcVFfdWA1uQthIX4SQdmwU=;
	b=AqPKKNMawM91y5m9leT4IN9KsIwPVqrN1+geTKVzz4ezNOcbpyV/SeqDjmORMra6
	WWDybZsbvIfWC/TCNptKex19IqfMC0/XC7V7jj7DEQ41dBR6dN3R7cpfyl2m0MPgVrC
	B8h2k5ke4tXHAp9GcsIzFWN0p1zVYzEdSM4Lw6h4=
Received: by mx.zohomail.com with SMTPS id 176339872811130.97997063854109;
	Mon, 17 Nov 2025 08:58:48 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: add a function that returns a reference to the IO
 Ports Resource
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251117163112.22515-1-alexandru.radovici@wyliodrin.com>
Date: Mon, 17 Nov 2025 13:58:32 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 Fiona Behrens <me@kloenk.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9DC413F9-40A8-44D0-9A77-D392D25F1E82@collabora.com>
References: <20251117163112.22515-1-alexandru.radovici@wyliodrin.com>
To: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Alexandru,

> On 17 Nov 2025, at 13:31, Alexandru Radovici =
<alexandru.radovici@wyliodrin.com> wrote:
>=20
> This patch adds a function to `kernel::io::resource` that returns a =
static reference
> to a `Resource` that represents the IO Ports.
>=20
> Without this patch, there does not seem to be any way of getting a
> reference to a `Resource` of the IO Ports. This prevents anyone =
writing
> a safe driver in Rust that requires registering IO Ports.
>=20
> Examples are drivers for PS/2 keyboard and mouse or any of the
> QEMU x86 debug console (debugcon) and exit devices (isa-debug-exit).
>=20
> The QEMU debug devices are one of the simplest drivers that one can
> write and are good examples of the Rust Driver API.
>=20
> This patch has been inspired by the work at of Daniel Almeida and =
Fiona
> Behrens on the Asahi Linux branch.
>=20
> Co-developed-by: Fiona Behrens <me@kloenk.dev>
> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Co-developed-by: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
> Signed-off-by: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
> ---
> rust/kernel/io/resource.rs | 9 +++++++++
> 1 file changed, 9 insertions(+)
>=20
> diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
> index bea3ee0ed87b..293b330c3d6d 100644
> --- a/rust/kernel/io/resource.rs
> +++ b/rust/kernel/io/resource.rs
> @@ -18,6 +18,15 @@
> /// `CONFIG_PHYS_ADDR_T_64BIT`, and it can be a u64 even on 32-bit =
architectures.
> pub type ResourceSize =3D bindings::phys_addr_t;
>=20
> +#[cfg(CONFIG_HAS_IOPORT)]
> +/// Returns a reference to the global `ioport_resource` variable.
> +///
> +/// This function is available only if `CONFIG_HAS_IOPORT` is =
enabled.
> +pub fn ioport_resource() -> &'static Resource {
> +    // SAFETY: `bindings::ioport_resoure` has global lifetime and is =
of type `Resource`.
> +    unsafe { Resource::from_raw(&raw mut bindings::ioport_resource) }
> +}
> +
> /// A region allocated from a parent [`Resource`].
> ///
> /// # Invariants
> --=20
> 2.51.0
>=20

I don=E2=80=99t recall any issues with this. We removed it at the time =
because there were no users.

It seems like this is still the case?

=E2=80=94 Daniel=
