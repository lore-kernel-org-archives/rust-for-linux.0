Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F9E265CA7
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Mar 2025 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741863398; cv=none; b=br0EsMpAI0I/S8UhtlQDlp3EVLF5g+1vO3JI93ryVBGDgWrLujhoeSoGlLTA+2w71l9Je/44VU6c16DonIBxlO7QdCnk46xfzeI/rXFwr3PwKlkJZL5e6cDvBx4w7rDMKdAYlsWAwfr5Qr/rzFCK+sQ9dCTTadWpJxqG4OATKLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741863398; c=relaxed/simple;
	bh=PEW9uDGEU8ys1IZjXzYmhExffAw/eLwERo5YnnluYs8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNjo8nTCduCOzED7aCgazZwNT/aYlnmd+bgJ5TgwdUr6tAoVg0Ht08J+57bcTtQPmT18vwH85q4ctexHbUKNSdugUnyS52IJUkbNWRmue7Ips+ZaR8GvYs63qoXNMPWk2atjrsfMI84369Ef4ZJzUSLwQ9+8+q6r8nFRR31Ky3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=levgGoQ7; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="levgGoQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741863394; x=1742122594;
	bh=2hNBX660GcO26GbhJqxD2G5sHgt7JHgGFhDKGFxxWVs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=levgGoQ7QaX8bsnVbFboKjk/eLHe5Dr4uFY6zC/XXaLVO99RIVMU299qGekU3tWwN
	 gwwf/+870OpqqmHNd3NwFrTZAQMggbUnxBNkiaIMgrSdqE+KcAZqP0Q9zeSWthXw2u
	 4BJ/EhgO4UTHdERZ0ZZB016X44XVrKWdQ0GTnsOqwTNpep/Sa4qvpaVKdJlVvNsqSH
	 qra+2HAoNuOKvfWNpW8mj9A3zr0/SURw3PJQOXQh/C8QK/w+4b8yWfK+r3daCfEKOa
	 N32YJumNcKr6n/FpZHm0wqzTIiuHb20s1prrMcKtboFHTb0aD4VyxjZ++NkEfmJWPT
	 wWl9RUStbvL8Q==
Date: Thu, 13 Mar 2025 10:56:30 +0000
To: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Lee Jones <lee@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] samples: rust_misc_device: fix markup in top-level docs
Message-ID: <D8F31D220PWN.AJV57JVJZYXY@proton.me>
In-Reply-To: <20250313-rust_misc_device_tld-v1-1-a519bced9a6d@google.com>
References: <20250313-rust_misc_device_tld-v1-1-a519bced9a6d@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 160c2b85675c8be54b8ac9c0eacd88a9f2ecdb51
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Mar 13, 2025 at 9:52 AM CET, Alice Ryhl wrote:
> The meaning of /// is to document the thing that comes after it, so
> currently the example is documentation for the `use core::pin::Pin;`
> statement. To write top-level docs (and have them rendered as such in
> the html by rustdoc), use //! instead.
>
> This does not change the contents of the docs at all. The only change is
> changing /// to //!.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Good catch! I think this should have a fixes tag:

    Fixes: 8d9b095b8f89 ("samples: rust_misc_device: Provide an example C p=
rogram to exercise functionality")

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
>  samples/rust/rust_misc_device.rs | 181 ++++++++++++++++++++-------------=
------
>  1 file changed, 91 insertions(+), 90 deletions(-)

