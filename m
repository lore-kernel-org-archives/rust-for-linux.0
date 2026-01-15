Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B083734D904;
	Thu, 15 Jan 2026 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768484401; cv=pass; b=EjMsCuYoXzJT3RvF1Uv21tm89jrD/lZ7RD9G5ZC+8oruYuJtVc4l6aJlXmiaCpz8sQLwjiSaY9oM4HFEsNYX3KuUs3ztmO9s5DBzDPHcDJsaYxsZrwGNa2gEUjWDqvMipOfJq38Th9FH2sTKu9f0AgYcm0nJbwXDIjBUT4wWcm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768484401; c=relaxed/simple;
	bh=inf1JyE3IIZxFfxjLadK5OjglQwo2LY0aUaE1Bs8Bcc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=TXCr8Awmyo89pMPcK6CpcuUPZt1JZDEO69kxTl/v7upKdXqCRYdjSg0zFGu4rEHeL3psPEW9vKO4rjdygVRN71375sGLE3yUDXionWxDFjnTTNqyYIOP6YOWpPIBnX2sf26xheO0FzCgZ4OV1M9fxnnoyTl5UP5xDr8AmB/xR84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=j0iQ94lr; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="j0iQ94lr"
ARC-Seal: i=1; a=rsa-sha256; t=1768484378; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=StzyQbiWCmi6RaVpplq3QWIjPh/DI5Brrg/dmvtkEsgrhQkbeyGXY34VImiAaoIdyNaKHt+ljqelHSWNrP+pgdUM0fzNGEysn+nfMuzYS3nHQfn/2TU9Y8ZWfXjjTmVQiHvgbfXVIjZbYdlujq5RspXOzEQObRKdNQuA+E8f9pw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768484378; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gkyIeSYkG0ytPw/gBuRw2+qgYctrZoNGkO/Bp96mISM=; 
	b=B8cgjoF9R8uCN+mNnDt9Rfsgo8irT2bFDWc/PoMulZ6O+Pszf4rVGcE/+ONiQOtwWdf3dWR6KbcckKmHBOq0MA55nbcEHwuoel2zbzGmVpsToyO0UkE0mBe91CEebNUubCmRcVxB/oQyLQ7TScvl3goFkz5F5ctqWWV+zAm8B18=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768484378;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=gkyIeSYkG0ytPw/gBuRw2+qgYctrZoNGkO/Bp96mISM=;
	b=j0iQ94lrEdmPu2xY6MOzNHu0MBgzofqHh+1QtraqPJAC5VDCFgkz9GqsMQl9C72j
	Rf4gGqFRMnUR+DejWuO3h3c+UeasouAVboMgSIyLRN4mrl9wg83n4WHNpy4OCF3NJKt
	3Y65qs/DOxbdnhQD/sEBM6yTxxRUveLh6efW4CXY=
Received: by mx.zohomail.com with SMTPS id 1768484376079557.8912760029414;
	Thu, 15 Jan 2026 05:39:36 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v8] rust: add new macro for common bitflag operations
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <87jyxjf56j.fsf@kernel.org>
Date: Thu, 15 Jan 2026 10:39:19 -0300
Cc: Filipe Xavier <felipeaggger@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 felipe_life@live.com,
 linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4184EA49-80CC-4531-822E-935C2FB9BED0@collabora.com>
References: <2JpjX5S1c2QLiHUftMzVViS7xatVGkJperCPqxJU8ZQ_Opyo4KPge5jcRCPb0Gcgyxb4yeFhm6Y-1X8q3pbNaw==@protonmail.internalid>
 <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com>
 <87jyxjf56j.fsf@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 15 Jan 2026, at 09:09, Andreas Hindborg <a.hindborg@kernel.org> =
wrote:
>=20
> "Filipe Xavier" <felipeaggger@gmail.com> writes:
>=20
>> We have seen a proliferation of mod_whatever::foo::Flags
>> being defined with essentially the same implementation
>> for BitAnd, BitOr, contains and etc.
>>=20
>> This macro aims to bring a solution for this,
>> allowing to generate these methods for user-defined structs.
>> With some use cases in KMS and upcoming GPU drivers.
>>=20
>> Link: =
https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/=
We.20really.20need.20a.20common.20.60Flags.60.20type
>> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Suggested-by: Lyude Paul <lyude@redhat.com>
>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
>=20
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>=20
>=20
> I think it would be useful to add:
>=20
> impl Flags {
>     unsafe from_raw(value: Repr) -> {
>     ...
>     }
> }
>=20
> impl TryFrom<Repr> for Flag {
>     // Succeed if `value` is a valid `Flag` enum bit pattern.
> }
>=20
> impl TryFrom<Repr> for Flags {
>     // Succeed if `value` is the logical OR of valid enum bit =
patterns.
> }
>=20
>=20
>=20
> Best regards,
> Andreas Hindborg

Ah, true. There is a use-case for that in Tyr as well where we ingest =
the raw
values from userspace and need to validate and build valid flags from. =
This may
be somewhat common for others too.


