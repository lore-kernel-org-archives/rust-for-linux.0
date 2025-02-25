Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC6F14A4F0
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478891; cv=pass; b=R0KU/WsEhXZZSPxqqK+XhQDa2FB+FB/YbYrJAF8Z8e/8SX062RHatbjVxzGbeMgCpJ4irJL1zZqcwdzrNXCQf1ypoiqktTk/7KC4NWu7Shq+ETVBM2ThWDHgq5TgJp356+JuGteS1Ndj4rB62jGILRxl4V7p3jhw5wTaRJ7FzPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478891; c=relaxed/simple;
	bh=4VR4mHHDTuf6+mVN0onu3f5UdnciQinXtLbmw6LkPZM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dYolLNpMfSU1gL/+0fjCTwI/Z9R3DPQhKIQbBIvGkihN0MsoBtXlTl959FbtQywaeqtkg1F5lklNCVRbjUCJrvkNHGMmxpBwIc4/Q3ethrSOURkcF2I8EcHBsvBW9oya+GugwlPhGWCcf8t+sg9Ur1r2wBzywCCqjxCzQADdKUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=gGiqr4xC; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="gGiqr4xC"
ARC-Seal: i=1; a=rsa-sha256; t=1740478874; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=APTy7hbGIK1ajnmZcy3mAMnYxqRatnQJf/iL+K+wGnn2mnUsppg1p0yONemi7H5r5KKoALsZzbtc4OM8IKgIkjnhv1vWUDYjpC5G3Yi2nV9IW7p1ZebKPVrVVZlheo+viCFWaLbsRFN42lxYGN4XxqIOaHkkIBaD5dQGiGGK+Ls=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740478874; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OnBf06KAKgEl0XB/zL0sEromeC3LWNzTjUfufD9Ospk=; 
	b=fWKPhx0f22piVy/Fm+0l4+hR49DISArM8qCI502HIcnrmDVpplIsJ4t2lrMiTGCLPFS1zgrwRjcygT68str7Tq8xX340sNOA9yhOBmjoI+SXLB8FCAZNXL5lJzjS1anTD8gO7+VC/KYu2wq57bJ4dppsaCNq8a/V3ksn76s78ng=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740478874;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=OnBf06KAKgEl0XB/zL0sEromeC3LWNzTjUfufD9Ospk=;
	b=gGiqr4xCQa5uJe61X2GWeylA70Th+p798TDPzw/SgaQvXTt3uF04b7Q+JqUu5fTD
	uA3XAKxljFpyaXy8Q7X/MfjCOAybCkhbXLBBmXXQqhFNpLSOfCEHYen2hqE/QmEzL/Y
	5BXkmFnDD8WyWEbIkmXHyt0iDi4lxsPykxdwB63Y=
Received: by mx.zohomail.com with SMTPS id 1740478872451423.2621281374053;
	Tue, 25 Feb 2025 02:21:12 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v2 2/2] rust: types: `Opaque` doc: Add some destructor
 description
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250219055516.359454-2-dirk.behme@de.bosch.com>
Date: Tue, 25 Feb 2025 07:20:57 -0300
Cc: rust-for-linux@vger.kernel.org,
 ojeda@kernel.org,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
Content-Transfer-Encoding: quoted-printable
Message-Id: <66B28675-5D89-4E1B-A572-8B784673E31D@collabora.com>
References: <20250219055516.359454-1-dirk.behme@de.bosch.com>
 <20250219055516.359454-2-dirk.behme@de.bosch.com>
To: Dirk Behme <Dirk.Behme@de.bosch.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

Hi Dirk, thanks for working on this and sorry for the delay :)

Even if we ignore the =E2=80=9Cterse vs not terse=E2=80=9D discussion =
momentarily, this patch doesn=E2=80=99t really
say when you should and shouldn=E2=80=99t use Opaque<T>.

> On 19 Feb 2025, at 02:55, Dirk Behme <Dirk.Behme@de.bosch.com> wrote:
>=20
> In the discussion [1] some `Opaque` documentation updates have
> been proposed. In that discussion it was clarified that `Opaque`
> is intended to be used for (partial) uninitialized or changing C
> structs. And which consequences this has for using raw pointers
> or the destruction. Improve the `Opaque` documentation by adding
> these conclusions from that discussion.
>=20
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Link: =
https://lore.kernel.org/rust-for-linux/F8AB1160-F8CF-412F-8B88-4C79D65B53A=
1@collabora.com/ [1]
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
> Changes in v2:
> * Split patch into two (Miguel)
> * Improve commit message and subject (Miguel)
>=20
> rust/kernel/types.rs | 14 ++++++++++----
> 1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 8ed802444c594..08ff4949d2a61 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -274,14 +274,20 @@ fn drop(&mut self) {
> /// [`Opaque<T>`] is meant to be used with FFI objects that are never =
interpreted by Rust code.

What does this mean, exactly?

> ///
> /// It is used to wrap structs from the C side, like for example =
`Opaque<bindings::mutex>`.

OK, can it be used for anything else? IOW: can we rewrite this as =E2=80=9C=
It should only be used to wrap
structs from the C side, like for example `Opaque<bindings::mutex>`=E2=80=9D=


> -/// It gets rid of all the usual assumptions that Rust has for a =
value of type `T`:
> -///
> -/// * The value is allowed to be uninitialized (for example have =
invalid bit patterns: `3` for a
> -///   [`bool`]).
> +/// This is useful for C structs that are not fully initialized (yet) =
or might change their
> +/// content from C side at runtime. [`Opaque<T>`] gets rid of all the =
usual assumptions that
> +/// Rust has for a value of type `T`:

Same here. Can we rewrite =E2=80=9CThis is useful for C structs=E2=80=A6=E2=
=80=9D as =E2=80=9CThis is meant to be used to=E2=80=A6=E2=80=9D ?

> +///
> +/// * The value is allowed to be uninitialized or invalid (for =
example have invalid bit patterns:
> +///   `3` for a [`bool`]).
> +/// * By dereferencing a raw pointer to the value you are unsafely =
asserting that the value is
> +///   valid *right now*.

Thanks, this is very helpful.

> /// * The value is allowed to be mutated, when a `&Opaque<T>` exists =
on the Rust side.
> /// * No uniqueness for mutable references: it is fine to have =
multiple `&mut Opaque<T>` point to
> ///   the same value.
> /// * The value is not allowed to be shared with other threads (i.e. =
it is `!Sync`).
> +/// * The destructor of [`Opaque<T>`] does *not* run the destructor =
of `T`, as `T` may
> +///   be uninitialized, as described above.

This is also very helpful.

> ///
> /// This has to be used for all values that the C side has access to, =
because it can't be ensured
> /// that the C side is adhering to the usual constraints that Rust =
needs.

Some clarification is needed here, i.e.: what constraints? I assume this =
is about aliasing, if so, can
this be said explicitly in the quote above?

> --=20
> 2.48.0
>=20
>=20



