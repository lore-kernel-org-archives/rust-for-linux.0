Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71661270EDF
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 06:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755496805; cv=none; b=kZx8zF3JASMcew7HLxzSwe2OesNkaAFtg6g7GHigTTtWT5H49NNSZWm/dMfyPCiUJhD+YYrymzqg6PXYor+V71DPRlvJ1mfOqiesaUcdC6vRX2V4Qk73wsjyKweevRBYvzrMlLWNDWHuGend4lcoawnv8To+9Yz1axHmcYsC7QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755496805; c=relaxed/simple;
	bh=wORigAie0fiYMxhzI6L5fiZcWzlfKLbDv5YjO8Y0F1w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVXbSUXoOVXqJ5MV0VlK7tt1JnDuFmHvpeQ1Oj7z7GeNc2R8BJpd83KbXnjDieku7jaHpD54a6vvfB4tH1iPK6uE5tZ4MqklduF2ivK0Sw/HRO18nn0k7B5IfMVxrAg/kN/ZwRtxcXotEWgnO1/BzVeer1+97QH+eKXOilcdqfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=jNmes4O9; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="jNmes4O9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1755496795; x=1755755995;
	bh=wORigAie0fiYMxhzI6L5fiZcWzlfKLbDv5YjO8Y0F1w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jNmes4O9xc6bS828QP5HelCHwHuDunmdP1Pd3BCwX6VL36/4Fkg483ivi+xysDuhW
	 UxrlhiVUT2gkQsJLgfEzSgy/dU4c+AKVGuZ4cnqnBAnyVmW1J8TZaj8sAHxeV2K1bG
	 iFt9zrCJ3UdI55YImplUQimxXT94kQJENRmn6REBARMx0Iw+zwcpvjrwnOr1V17PyW
	 rePbmbGHjSRYnevoLoZdGcGd/c0gcXtDD/Ol4zvwAySDQW9LUj9dpsVjw3r42HZXUz
	 FZa7ixk4/ZIsKYCdfBFL/6XSFzwy5QNt3X1w9AUqgVe1fATnj6pWyirhufa/hcTJHx
	 iTncLUbUGW7tw==
Date: Mon, 18 Aug 2025 05:59:51 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/4] New trait OwnableRefCounted for ARef<->Owned conversion.
Message-ID: <aKLBUwwAnR0fPaMz@mango>
In-Reply-To: <875xeoevvr.fsf@t14s.mail-host-address-is-not-set>
References: <OYpTDi4YYXiWvLG3nO_8_WKsgOl9KOpun9l3a34m0jza6nmEWDCLTldSwCfZ2PRRprjXqGmrgSL2JN8rPOQH8Q==@protonmail.internalid> <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me> <875xeoevvr.fsf@t14s.mail-host-address-is-not-set>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 9aaa9cf2437c21b81693ead90fe955f10970a011
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250815 1212, Andreas Hindborg wrote:
> Hi Oliver,
>=20
> "Oliver Mangold" <oliver.mangold@pm.me> writes:
>=20
> > This allows to convert between ARef<T> and Owned<T> by
> > implementing the new trait OwnedRefCounted.
> >
> > This way we will have a shared/unique reference counting scheme
> > for types with built-in refcounts in analogy to Arc/UniqueArc.
> >
> > Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> > ---
>=20
> In case it might save you some work, I rebased your series on v6.17-rc1:
>=20
> https://github.com/metaspace/linux/commits/217c7ba3b95213abf9c1ce1a98ca49=
6a48401f10
>=20
Thanks a lot. I will use it. I hope I find some time soon.

Oliver

