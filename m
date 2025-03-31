Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7303215064
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Mar 2025 19:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743448290; cv=none; b=YGqFxooYr0gWlDJBJYeGEDHD6DDpetD86v6Xs/kmCrCF1FzW/NP1gIdZNqy+zYba1fnbTfuR7YUh4N+0t571LaoGStzqypUHRlgu58I0oAC43w+0/++KysatrJ3vAdGECB+cu1xEi7/Aqb8Uk2Vpd64KFsDOzI3cJmoKMQyvyCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743448290; c=relaxed/simple;
	bh=jTxccXV2AfzgB2ZO8mIniuE07WaxQ5G9l7eZ/DlPSWY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWdISjQf+wNenbWjxiQti010D94GEfd1c5ji46wTYV8SX5zQdMKzhgGsLV13ZXZ0ddDIztzyLDivmczaqjfKgQ/udZs6ywRslChNBVTxt5YnVoFcH0hk/qXT1SHQcFlZEiIV/4vSfBgAei6jzyNgk807J8g5uaUkmvdfLUzUol4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Lq+1lSWJ; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Lq+1lSWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743448281; x=1743707481;
	bh=sq/1/GWSStOQN1tsUtblL99GpvBOzXDWe+zjwV4cK7g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Lq+1lSWJi0c1XDimph3SoTj7gHE6o4TirJOiS7dKCn904pbjF/dE0dZXlAO+PheAW
	 5BTGqlVWtk9SCK1rWQlVC1rnmTA3nebE6EB5jNIQ3HVMij3+vNM+qsgbZkqX+g2viJ
	 4Y1BVeWovFHJ0FrhOrZbBo0rP1q88fvuYzMPNpLbPrzFCCKanmHqe0PeX7cdTJCa36
	 IkpGa7A3o9UqA2AfnPw8eha7FMxg//bgdDElTLN1zgVa7iKs1Ta6ksS5qVkcFo/qmr
	 sg3ybYshj2MUJiip/Gt6ZfGAQxOOjF2Zr0dLipEnhwusiVtNcPYFLFWt9c3PvD7Ggl
	 T/6hwDYD2EEAQ==
Date: Mon, 31 Mar 2025 19:11:15 +0000
To: Igor Korotin <igor.korotin@yahoo.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] docs: rust: quick-start: update Ubuntu instructions
Message-ID: <D8UOTZS4QLAP.35AIGO95N2NEX@proton.me>
In-Reply-To: <20250331170118.1376899-1-igor.korotin@yahoo.com>
References: <D8S8C5W0FCVD.1LH1E86H6PXZD@proton.me> <20250331170118.1376899-1-igor.korotin@yahoo.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 52e19174e19f31ba70449aefd73df38bad5007c8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Mar 31, 2025 at 7:01 PM CEST, Igor Korotin wrote:
> Ubuntu=E2=80=99s rust-1.80 packages don't install tools by default, so th=
e
> PATH must include /usr/lib/rust-1.80/bin. Also, bindgen-0.65 needs
> update-alternatives to set it as the default.
>
> Signed-off-by: Igor Korotin <igor.korotin@yahoo.com>
> ---
>  Documentation/rust/quick-start.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Please don't send patches in reply to emails. That only makes sense if
a) the replied-to email is a cover letter of the series that the patch
   is a part of, or
b) if the patch is relevant to the discussion in the thread.

Neither applies here.

---
Cheers,
Benno

