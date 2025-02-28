Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DC5277030
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 19:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740770220; cv=none; b=d4Nqr+SMwrokfBWqapuiHjfnyPyJd/vUEmCn8ubmruM2cNPqxTM5nIPITzTEuKWGbwYRzwwTPlf1suVnRTwBMjRFReKmb36rgMiy3iMqhwk5AtcnfQJk/CHSAcXfr0qdwLRAR7zgGo9+a8CuncKn9ynOz0tqxMI8u9gngkPPqMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740770220; c=relaxed/simple;
	bh=beHI5Po5p0RjCoxuB16ei45Efw+qOgFITPlrDu9pqv4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b/LN90Rsuz+ndZMv1CIHWMxqHh//2glOdlRuKH+05OJuK4TH8aby3zJhS8YSaP7aQ6b7LJwe/OPkQtETM5IXdBqNVogceZGwITlKyxQ7C8kxjFeVG7kX5Dam7zgolPlufPoSNRjeVUdyq85T4h4hnPh5WiNck/mMXl6dW94Srxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=MRcgRCOr; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="MRcgRCOr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1740770208; x=1741029408;
	bh=beHI5Po5p0RjCoxuB16ei45Efw+qOgFITPlrDu9pqv4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=MRcgRCOrQZKKvfwk08CLkR0LUnLviGiOrQLJWTDfG4MG0/5VjnhIzr2XFHRqmvSgd
	 ZXIHleeLf89/HMcsgObHVCdn+awV6igMLeyPz/qgXNh2ri98S9u2VucCbtrff/SJ72
	 IRlVsv6mvHr3Qpmou2YNyFtST871fNv7rSgH9NFfulmOkvdLn8b/Ff17SFCyiZ2DiO
	 6V6eXF7sInJ9jsvGLXMfJOa7muPDb1eANW/aQNJ+MNvhpVTAGOWqQmnNEQ9kl5IObF
	 zjcvWnwjN+rmQKeMyc+MKrEOqNJ1v8Ml0mPNYiCMouK96qGkday1Bin80ONhfuXh0/
	 DOB3Whkel9eig==
Date: Fri, 28 Feb 2025 19:16:41 +0000
To: Boqun Feng <boqun.feng@gmail.com>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: adding UniqueRefCounted and UniqueRef types
Message-ID: <Z8ILlUMGQ221hLJY@laptop>
In-Reply-To: <Z8IJPzlvioBZaV5M@boqun-archlinux>
References: <I2EuahEO9YG75qdfIlsanLJ9iOfr0OlKJr6nw_cqOG0rVrZUEZGhdfENkLawNCpSqP8uSGMODCeEmsYv6clgYg==@protonmail.internalid> <sOipp6LTmtfq5A37VN_kCA4Kw9zfclZ2HLIMSJYnOdG4ebnuTKUlXIlT4X3GVRLMXFmwT4IwyIA-eqF69yOhSQ==@protonmail.internalid> <Z8IBiBi6CSRxfxiE@boqun-archlinux> <87senxlwpo.fsf@kernel.org> <Z8IJPzlvioBZaV5M@boqun-archlinux>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 9aea20535d7a6fffc5684da12ed58c2fb2461fb4
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250228 1106, Boqun Feng wrote:
>=20
> Probably because some of Oliver's replys don't have the "in-reply-to"
> field in the email header. Maybe it's a known issue of protonmail?
>=20
I think you are right.

Google couldn't tell what to do about it during the last 5 min, though.
I'm using mutt through protonmail-bridge for mailing.

I will look into it, but if someone has an advice, it would also be
welcome.

Oliver

