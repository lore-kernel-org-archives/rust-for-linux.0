Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBE810E4
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 10:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478108; cv=pass; b=lAnsEITk2CL4io4dWC7+be56b6xG9pSLWYRgE8oI8HTkeJZo54MensIEm20H9AsWYTj6mWGJtmM85quA0Ph5jUrYjvegeO1yKdIAFRMGole55VEKLakuP5kBykrhc0msP6j5KXbzbpQqulgwyshqZ1tDNOxyfqqGGKTU95pMaaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478108; c=relaxed/simple;
	bh=DT/K4LUz9mRky/gVLcHBgRitqPaNuFUPZW//Y1x0J98=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gAQRCNc4UrEMh/uf9f7dkEvH8fduoeVxEMYcoSwsh+uNo2o8cs09HZIKEDCec69BouC8v3EuNyYP8YPJuuclV9an0nCXQRqEYe4z/o9cyJ4it34B9vbnjn0Qqemph/nsFJQ5XCuLt+tnHdHnNcAb2ULTVoGO0MRYtESm81XHNPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=fAagK/DV; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="fAagK/DV"
ARC-Seal: i=1; a=rsa-sha256; t=1740478090; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bjCE3lYgrRu6qduOY7CcXc5r/OZ+LQUT9P6U57RE4iUPnKuKkSGfJWIszcfgCOAQY6CtdD6j6mV/XNrHerlkAIGrsqLVcy3Y0DlZKrsqzD6gBwsWFrYBGd5+zLa6bQhZxF3An856Q3HrBJqc/U2AFiJKoPwxdfefTDFClK5m1OM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740478090; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IeuGKlxkDRWpEvw871NJWEMXU/W/lnplCizDAK0isUM=; 
	b=cd+E+GFgeF427nA7poqfSItBP2Vps+BsdNoXwFC/Lr3GO497EV9+qPCR1KcbKTyjr0SUO7yYvsU571bUUG5cwvZSxBoSkpnu4KnO6pugMojtdal+Zl3idmYAE2llVSgXvA2wlN/uKWFBuk9h3nokeoHlpJ6JwkVkQAQNCqGzczM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740478090;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=IeuGKlxkDRWpEvw871NJWEMXU/W/lnplCizDAK0isUM=;
	b=fAagK/DVlKnW7zF9wRSN+RH4G0W8xO83eywwMuKXu3jQhTdJ5Y16qIA8RObNRE39
	IB2rECwMOrLAC7tS2WUUO+2bed/oCNMCGR8I5lB9ZwNWC4xWVdw7B0Ziwgn5kd8+s7S
	0PJbMN61skr5v/SpoiRlmNxjIE0PuzWpgNRhQrmY=
Received: by mx.zohomail.com with SMTPS id 1740478087785762.1541628229277;
	Tue, 25 Feb 2025 02:08:07 -0800 (PST)
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
In-Reply-To: <87seoae4u5.fsf@kernel.org>
Date: Tue, 25 Feb 2025 07:07:53 -0300
Cc: Dirk Behme <dirk.behme@de.bosch.com>,
 rust-for-linux@vger.kernel.org,
 ojeda@kernel.org,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CE22ECC5-135D-473D-AD79-A07510432A4A@collabora.com>
References: <20250219055516.359454-1-dirk.behme@de.bosch.com>
 <qR15TFA5w7m-em7Om-XpDqJvZbPA4T-_wgdtpb2lzfqhHWXVz6MT3cIurrB2_JbUbNqqlffrtGTN8cSUrtTL1A==@protonmail.internalid>
 <20250219055516.359454-2-dirk.behme@de.bosch.com> <87seoae4u5.fsf@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

Hi Andreas,

> On 19 Feb 2025, at 05:06, Andreas Hindborg <a.hindborg@kernel.org> =
wrote:
>=20
> "Dirk Behme" <dirk.behme@de.bosch.com> writes:
>=20
>> In the discussion [1] some `Opaque` documentation updates have
>> been proposed. In that discussion it was clarified that `Opaque`
>> is intended to be used for (partial) uninitialized or changing C
>> structs. And which consequences this has for using raw pointers
>> or the destruction. Improve the `Opaque` documentation by adding
>> these conclusions from that discussion.
>>=20
>> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Link: =
https://lore.kernel.org/rust-for-linux/F8AB1160-F8CF-412F-8B88-4C79D65B53A=
1@collabora.com/ [1]
>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>> ---
>> Changes in v2:
>> * Split patch into two (Miguel)
>> * Improve commit message and subject (Miguel)
>>=20
>> rust/kernel/types.rs | 14 ++++++++++----
>> 1 file changed, 10 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> index 8ed802444c594..08ff4949d2a61 100644
>> --- a/rust/kernel/types.rs
>> +++ b/rust/kernel/types.rs
>> @@ -274,14 +274,20 @@ fn drop(&mut self) {
>> /// [`Opaque<T>`] is meant to be used with FFI objects that are never =
interpreted by Rust code.
>> ///
>> /// It is used to wrap structs from the C side, like for example =
`Opaque<bindings::mutex>`.
>> -/// It gets rid of all the usual assumptions that Rust has for a =
value of type `T`:
>> -///
>> -/// * The value is allowed to be uninitialized (for example have =
invalid bit patterns: `3` for a
>> -///   [`bool`]).
>> +/// This is useful for C structs that are not fully initialized =
(yet) or might change their
>> +/// content from C side at runtime. [`Opaque<T>`] gets rid of all =
the usual assumptions that
>> +/// Rust has for a value of type `T`:
>> +///
>> +/// * The value is allowed to be uninitialized or invalid (for =
example have invalid bit patterns:
>> +///   `3` for a [`bool`]).
>> +/// * By dereferencing a raw pointer to the value you are unsafely =
asserting that the value is
>> +///   valid *right now*.
>> /// * The value is allowed to be mutated, when a `&Opaque<T>` exists =
on the Rust side.
>> /// * No uniqueness for mutable references: it is fine to have =
multiple `&mut Opaque<T>` point to
>> ///   the same value.
>> /// * The value is not allowed to be shared with other threads (i.e. =
it is `!Sync`).
>> +/// * The destructor of [`Opaque<T>`] does *not* run the destructor =
of `T`, as `T` may
>> +///   be uninitialized, as described above.
>=20
> Thanks for clarifying the docs. What you write is correct, but I would
> prefer a more terse and formal language, at least for the first
> paragraph. Perhaps you can include the following in some form:
>=20
>> Opaque opts out of the following rust language invariants for the
>> contained `T`:
>>=20
>> - Initialization invariant - the contained value is allowed to be
>>  uninitialized and contain invalid bit patterns.
>> - Immutability invariant - `Opaque` allows interior mutability.
>> - Uniqueness invariant - `Opaque` allows aliasing of shared =
references.
>>=20
>> Further, `Opaque` is `!Unpin`.
>=20
> And then after that paragraph, you could elaborate with examples and =
so forth?
>=20
> Best regards,
> Andreas Hindborg

IMHO, your =E2=80=9Cterseness=E2=80=9D suggestion goes against the very =
intent of this patch.

It takes something extremely clear, and places it behind some technical =
terms.

In as much as I agree with making things formal and professional, our =
first priority should
be making sure that the docs for this type are clear as day, so that =
people do not misuse it
to introduce bugs.

Note that this discussion sprung up because it=E2=80=99s hard to =
understand what exactly this type
does and when exactly it should be used. The code is conceptually =
simple, but things like


>> +/// * The destructor of [`Opaque<T>`] does *not* run the destructor =
of `T`, as `T` may
>> +///   be uninitialized, as described above.

are 100% a pitfall that should be warned against in bold letters and =
plain terms.


=E2=80=94 Daniel



