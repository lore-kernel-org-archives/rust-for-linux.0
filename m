Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AFB256C74
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Mar 2025 12:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742904037; cv=none; b=MtXXQvcMpYTb7cFV61WbepgPkBkAbU3CU77QHvxIbthOR97MTVT/nUpfv+9R1o8ua0wiz7bLRVvrf/TifBrJ5KPIdby/f0KB0XBMcS2wW9D4nz4OCPm/8OBZDT2s2M5BzABPL5nuK3zSOu58Cojxjxi8sU8cFeyV9o8wurxMpHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742904037; c=relaxed/simple;
	bh=TPALJ+iXx8ByrMxRHIhfmKR3DYQrcv1oCo5UhCwd8yY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ahJTAxmEM5TmG87PMfhZoIxcb5BNjZRgCBRC6lIRF/Y/dxUPvEbMb1xfdw2sNI6qKRi3JFA1H+wH8J4WjCHkIYqvEl0weOA45TV3bIwA3FdQDmh8HPAYcB3y5C9OjoWG9T2gsuBNvkL5OVy89kiVebISFoqGNuD2GIG5YvPHq/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=CpcWpoZA; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="CpcWpoZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1742904033; x=1743163233;
	bh=TPALJ+iXx8ByrMxRHIhfmKR3DYQrcv1oCo5UhCwd8yY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=CpcWpoZAAUC+nha0a3rdjoIquVxC2AeMUlsbwo+e6Ht5Onh3wAXRHKeFYxJfD8kUh
	 u4dRH0u85vsoa3rFJWLq7NFbLya+wRTMc87LmUgssk9rqlLXufAk9Bq0inspaVtTVq
	 mPxjXZ/fCCiE6OKpYmokL6dUQBCkXrZSQL/O/vUEbV+ypUQYpnZQBp48BQ0NjEr9qW
	 DCr3ZYnugWHEdxeu0R0K50PFuLNfdHVw49GDKDhhHjKKT6kwejouRfuIQ8vlwepfK/
	 DeICqtl2JTTmMlIciesdInmqUbN5XncAw9a0regZD2EA3TfC2p7iGD0+ugWDG2pOfY
	 ameSmQHbEILzw==
Date: Tue, 25 Mar 2025 12:00:28 +0000
To: Boqun Feng <boqun.feng@gmail.com>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/4] rust: types: Add Ownable/Owned types
Message-ID: <Z-Ka1sOIkp0h4EBU@mango>
In-Reply-To: <67dd8efb.050a0220.11e64e.7506@mx.google.com>
References: <20250313-unique-ref-v8-0-3082ffc67a31@pm.me> <20250313-unique-ref-v8-1-3082ffc67a31@pm.me> <67dd8efb.050a0220.11e64e.7506@mx.google.com>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 64d05fb8493feb0e411c4a623feb1cdaf8ff510d
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250321 0908, Boqun Feng wrote:
>=20
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
>=20
> Regards,
> Boqun

Hi,

I only added the Reviewed-By tag to the Owned/Ownable commit from Asahi Lin=
a
for now, as you added this comment only to the reply to this commit. Let me
know, if you want it added to the other commits, too.

Best regards,

Oliver

