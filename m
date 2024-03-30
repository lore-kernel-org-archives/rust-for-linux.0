Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23C739AD6
	for <rust-for-linux@vger.kernel.org>; Sat, 30 Mar 2024 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711816560; cv=none; b=GQwBgcahGb2lrz3EwsR5ngORmA47hgI2XSD1oO7e9AavwkC1wBNGx+t/HfKZKkDjS/Kx1zYgexyB9iBMcWQv9AosaK75VPfW6F99yR4fr84ZeOBQ7UQpb02DrU3fKUnNOi0B40tRUHSUiK58TumVGHoeq7LArjywxWQWofOgc4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711816560; c=relaxed/simple;
	bh=ZcVKgwcn87ggwcxeEGFN3hxl0A3g/2VdRWsVKbfmT8s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oOIQlXcBa9LrymDCukEgpx6Anb0wfmvVauLxyIscbhKJIQw9az2AwUOTD4EhV0fp9DNcW61kAlEaiCpBenJkF4TAG27Vjx7KaNMfGwUFQtBhG4HerwA4ZUjompT7R27zRE+N81gpAO/487VVUUABfShaNtpkcK7g35CYnTjxHKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=nvCiSyO8; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="nvCiSyO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1711816548; x=1712075748;
	bh=Y6JR2Pysi9H9Uz+tGu4bo4VepIrHFF5RaEnfeLsWXYM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nvCiSyO8q9/39cFpuoRJC2m6YxzW+nMGLAo3VRkGQsa8QDjac8UXJX1CebNL9Qtxm
	 f8Q/cYH71Gw71bppwyevmcqLljCcW56QMjOnsviPfdLYKFo44Srr8Qm3sAqWkqOLdB
	 MBXN9bxzy+4S1o0RezCXpn/B6fB65XqeWMGNKnEjH8nqysedQdW1/5ps1lEMfB9B+A
	 UQx6Rmm8KnPAzpEsUys+OvJNrvUcgMWNOtcS2Ytz8+HJjYee12VH+FxZOcXUrWFRak
	 raM9cpKXzrDpubJp2H6+mkcVtEG7ppDOCEGyURMMdLYSL3TAeUAn2zyrY3fwRyUYQh
	 dkeaHiODP2Rjw==
Date: Sat, 30 Mar 2024 16:35:40 +0000
To: Bo-Wei Chen <tim.chenbw@gmail.com>, ojeda@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: rust: Fix improper rendering in arch support page
Message-ID: <fda551ae-90b1-4f3e-988d-f583a9fe448f@proton.me>
In-Reply-To: <20240324010915.3089934-1-tim.chenbw@gmail.com>
References: <20240324010915.3089934-1-tim.chenbw@gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 24.03.24 02:09, Bo-Wei Chen wrote:
> Fix improper rendering of table cell(empty bullet list).
> Rendering as a dash with the backslash escapes [1].
>=20
> [1]: https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#e=
scaping-mechanism
>=20
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1069
> Signed-off-by: Bo-Wei Chen <tim.chenbw@gmail.com>
> ---
> Changes in v2:
> - Use backslash escape, instead of the code blocks.
> - Link to v1: https://lore.kernel.org/rust-for-linux/20240323074006.29406=
79-1-tim.chenbw@gmail.com/
>=20
>   Documentation/rust/arch-support.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

--=20
Cheers,
Benno

