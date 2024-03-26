Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3974A0A
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 16:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711471493; cv=none; b=YPBKhLzL0sIyqqKG9I6F6onAn/7j5E+yp69/BiiX6c58at0ezHO74j6bCZh+XJRfN2mJT9blBPtTWrt2Ic4TsPitSAPJpRn39Sb0QhzMS2IwRRi5ElY+RM+VSX4jal8QCCsl/K+3oV1CQJvh0jmeIojSUxKdDeL/PeUhMrYHz5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711471493; c=relaxed/simple;
	bh=1gQH+2tZI8zwQ2qZlk46RPoabx1vjeQhTZKr99UHtyQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mXyZCPA0OjsR312zYA1rPa+efJeK4VsKvRMnE2BXwHDjKU5OR45ci7BpbtgESHr80ZtRZ+4shgWXzex++hKHwgOtnswbO1HbjOuiXCWl7+q2zXzLp9DuV0wKCsHpDm5JDt2RH5Lf0RXVkE/xEBa5nk62F32HCG5ccwGb5rEP88w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=gHBDUKqh; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="gHBDUKqh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1711471489; x=1711730689;
	bh=eb4Uog2nSYqmvOmyV3gi+b3HfJY/4XsgBHX4glybeyU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gHBDUKqhfXSah1+a6Em72Wqhfn+3I0hV3j37Y5byKFz60Ojn/V3xTLQZBgTRgom8y
	 LEg3YAmzpiut9WAgJpOrlET9jouisBVDSiWdaxNM1YJx7LOJFaFYT0vs7+sRDiK0c0
	 WSiEl/ToA57R6eSCeATVvwsWe0DkTo+3Sj11uo+0rdWM+ogcaMZdj+RCVo8DdUVBE2
	 TS/GTrble6IjCqAVp+9rvZKayGV35LfbEPX6MihxBtkPNZB9HXLg5moqxEdqKt7SIo
	 QLdmgEgbHvKWJyDk/xK+st6XcJeQ6SjmcPtUmd1sM1T6TOsGQJr4yUSt0HH+j2B9Bm
	 C7DJnD0nkyIWg==
Date: Tue, 26 Mar 2024 16:44:39 +0000
To: Boqun Feng <boqun.feng@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Valentin Obst <kernel@valentinobst.de>
Subject: Re: [PATCH 1/5] rust: time: doc: Add missing C header link to jiffies
Message-ID: <u80hyBY_r8f0yDIURNlC7D0gy9PPC7AsAaHKJICX4JK-rZGaU3g0hSmn1ok9wh9KZxeYbcnbuB9A9cSRcy_ubr5tkeesMYuTw_UuXoIZgF0=@proton.me>
In-Reply-To: <20240324223339.971934-2-boqun.feng@gmail.com>
References: <20240324223339.971934-1-boqun.feng@gmail.com> <20240324223339.971934-2-boqun.feng@gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 24.03.24 23:33, Boqun Feng wrote:> The definitions related to jiffies ar=
e at linux/jiffies.h, and since
> `kernel::time` provides the functionality dealing with jiffies, it makes
> sense to add a link to it from Rust's time module.
>=20
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
>   rust/kernel/time.rs | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

--=20
Cheers,
Benno
