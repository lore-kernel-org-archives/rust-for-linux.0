Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C82A202F65;
	Fri, 16 Jan 2026 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570747; cv=pass; b=I9DbGI4zSiTwhLD3pDpAM6hJJmqQio1bkCjOeAcpcTgxuHwrfw1G1gnn/icZVH0nSdq11PKVXBq3bbvSlE6fOsGEmagvFehlGpnNm/DHUte07mZZgPz4hhY5lnzFK2j9u9xJPDgOhmQTlz7gEqNVkeLkG6kPt1jNslkEBGt4W2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570747; c=relaxed/simple;
	bh=enPjwzl5bnC2GLEGcSl4XbJTUWzDnyudvVwrQkvmoU8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=nz/3sQBns6kJBz8Nnr6c7Gj3Xw2nD4cKFOjSfWICD7VE9Zgv5r/CTHtUSdQHGf70BS376GIubdPgiZH7BimJ/yQ8Pyak8UUECSbw62yhI9e6tkilO7b1Dzaot5/LFyef+C3SyOV5GyjptyXKjZ2j1OBZh3w6PMGFmrP6UKvrUY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=WmnL5hd5; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WmnL5hd5"
ARC-Seal: i=1; a=rsa-sha256; t=1768570727; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IrHRJsfrKhqu8fGDVtYj6phtF5yN8hV1zx6BRI48BhQnYJyF/MXJ2xM0zPqKKjRekhWLA1oXLi0VbvKiiP3eXKV+5FDlh79UPN0LkIPugXHfNmnWV0WjzIkRhHRDPHffooVRovDqutasw0lK2dC/uT2n2ib9/GWKwykTmPy18no=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768570727; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=enPjwzl5bnC2GLEGcSl4XbJTUWzDnyudvVwrQkvmoU8=; 
	b=cezAtbdKDouguX+YSN+6AdKU3pqWe885k10GLc/CB/x4R1YEoP1kTecb+rsJa/g2OjnPUrYHTh6MXxyHxQNYCDLx5Dt+iGgY3wUxw+jK1FZpxyJICCX13MvuYBaf8O1TLkHmPnONoC1aLucjEpfJGeb0QIdKm705keShqH3D2xk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768570727;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=enPjwzl5bnC2GLEGcSl4XbJTUWzDnyudvVwrQkvmoU8=;
	b=WmnL5hd5C6EOsdm9nQYo1UqOZdpGZUF46/CReJjXrsPI1u/weqz3qmOfYDtoKPkl
	UzXyg+HV/iOT8WsbuMSaIkrvYZGxICsFxY+eF49GP8BB71yikoJ+/Ks4zBi9m503Wtk
	ZHYhT8xyG1XTGEYft4IiQbYkeUOImevJE3YEGK7c=
Received: by mx.zohomail.com with SMTPS id 1768570725196465.4311800451652;
	Fri, 16 Jan 2026 05:38:45 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DFQ16QS1RAEL.1Z0ESXE0MBA7G@garyguo.net>
Date: Fri, 16 Jan 2026 10:38:28 -0300
Cc: Dirk Behme <dirk.behme@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Steven Price <steven.price@arm.com>,
 dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <25EE982E-B03D-4C50-B973-34AC4FFA96B6@collabora.com>
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
 <A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com>
 <DFQ16QS1RAEL.1Z0ESXE0MBA7G@garyguo.net>
To: Gary Guo <gary@garyguo.net>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External


>>>=20
>>> Is there any reason why you replace the UPPERCASE register names =
with
>>> CamelCase ones?
>>>=20
>>> I was under the impression that we want to use UPPERCASE for =
register
>>> names. Like in nova
>>>=20
>>> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/gpu/nova-core/regs.rs
>>=20
>> Not really. UPPERCASE for non-const items will trigger the linter. =
The Nova
>> people chose to #[allow] this to align with OpenRM and, IIRC from the =
LPC
>> discussions, their registers are automatically generated from some =
internal
>> docs.
>>=20
>> We have only a few, we can simply convert them to CamelCase.
>=20
> Frankly, register names do look nicer in UPPER_CASE, especially that =
they're in
> many cases, packed with acronyms.
>=20
> Best,
> Gary
>=20

I don=E2=80=99t have an opinion here, to be honest. I think CamelCase =
does make it
easier on the eyes since our register names look quite simple, specially =
when
compared to Nova. However, I can switch to UPPER_CASE and add an
#![allow(non_camel_case_types)] if more people chime in.


