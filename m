Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEB5313541;
	Mon, 15 Dec 2025 07:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765784727; cv=none; b=D9nWZ92izZU/oAAUwRWY7S3uGW61IAocYqYyj4hnsSK2c4psiMVdWA29QeQ5bzEXmN5jvZWSMmfY0jQovKZju1jSHLpQSx3CJkMpLrw4tcck+cFbCTv/xX7rV7pLOPQgAi6zQCps4SydJAPNGewme87eQyUS/wnvyo+PtwLgwUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765784727; c=relaxed/simple;
	bh=eH0jaAcuJa2hFPcSUHeSei3Jy9xiqy+tznbwzjT5zok=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=tD2AahTIrsJknPcX11OnxmyO+6Fyeaq0RQXvwY2/17esJakYmXS8KAsYfD+m0Fgao2ICungXP1q2UwdRcZqh7Imjswwm5dUN8bMC3GnThMMCnMkp6Fo77SaWY8FscAG5+gM6WAND7Su04roIq9tajivSsCRVmK8qiSenxa95j8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6U8WBrU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6U8WBrU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC02DC4CEF5;
	Mon, 15 Dec 2025 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765784726;
	bh=eH0jaAcuJa2hFPcSUHeSei3Jy9xiqy+tznbwzjT5zok=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=W6U8WBrUEyXfgE2l1YzKlz5Y4JS6SSdKfqTNwjJDlDbhsj8HrmG845epGjRhwecdN
	 f1MIvQ663HFvM4GPmppFdd9cxbHLpN73R/kHXOb1hOBRAFuktDyGp6OWAUGLMR+ZuE
	 10EvIdTpOxlV3FNjV3GXYlA0EEidReyWSvEalA0y+UfpyCMeE8BmXRdbLjsoP1nNWr
	 HluDrD9dEnEI55A1wWuTKFijSO3LfoMGi+wZQFjI3rQZChpZeWVOV8LFOWESrjNYIP
	 q5ohCbTMVQ/32g4v9Fbj4fjOnaMC/1Q4Kyw694hfyXJaO83GcB+1qb8yaCAkeT6tzC
	 oeBZtWh7Kt6Dg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Dec 2025 08:45:22 +0100
Message-Id: <DEYMFYQH2GY0.3HF506HL8OHY6@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
 <20251215-transmute_unit-v4-1-477d71ec7c23@nvidia.com>
In-Reply-To: <20251215-transmute_unit-v4-1-477d71ec7c23@nvidia.com>

On Mon Dec 15, 2025 at 6:49 AM CET, Alexandre Courbot wrote:
> This is useful when using types that may or may not be empty in generic
> code relying on these traits. It is also safe because technically a
> no-op.
>
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  rust/kernel/transmute.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
