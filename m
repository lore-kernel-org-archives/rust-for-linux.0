Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C3F34D902;
	Wed,  4 Mar 2026 23:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668798; cv=none; b=J6XqBy547zSTmgmiZ/6dKjToyTOde0pW+un1huikgn5LulX0EaMUd2nxeiEk7AtmMtM79PB1YKq/BMwxAPxUfIsgkVbdKIy4LycYIB34TUxJlWRLlkBjwt6b1x7J9c0qoyT5JJhjFl0646EDD3rYL+2enCvt4XGAToiuLYvxOQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668798; c=relaxed/simple;
	bh=7GqYw5Pu87/AffcDaoPwsaMLaPL9JlCKUhGyzO/+gKg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=XZlaMXQjtah4UHH4JfP266c735HwBkrMKuCaaZc7IVf0Ius2zuXNu3XEfxTEQ7y5J+RfUDxFteIMEzQnLKoK68IqfkifTVw2oZaDV0arRvvj2Na7tB5g3D07CpFSb5OO8rLNknGhG/UTKKxtlhkpZvyS9G70sNxXfelGyUUpJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGCQXwhZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGCQXwhZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37832C4CEF7;
	Wed,  4 Mar 2026 23:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772668797;
	bh=7GqYw5Pu87/AffcDaoPwsaMLaPL9JlCKUhGyzO/+gKg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=mGCQXwhZhhcR3WYvFKs84pAGb7agdeLh5/c+ksgy0GuMEwmxLSorkaTOjT78a+JpF
	 IlEh3tnFFCCWhoh64LTD1OLK7ZypbdnPD+eIjqEyujT0iztCA42CNid3IIkXkxN7ng
	 lyYAObhK8/r8Et4skyxG3e3H4wak7mxzGLDmGgt7xV0lTxWf2C6NvSkf3poJSz6Jnd
	 bTNuwpvB1rKZcXnveYhTOa+MjWJSaAyxdZAEdXKA/7wZhL27gpOPwhuSU++ESi3GJu
	 QflIUl4JlpD3zDZbErRg2frxRXmp9uvW0sF/jur0n1c4I0RT0iBLKp7A6kenB7ir/t
	 ptJjq+i7OWW5A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 00:59:52 +0100
Message-Id: <DGUEN4UNMUT0.3GQ73H7YWHQNL@kernel.org>
Subject: Re: [PATCH v3] gpu: nova-core: fix stack overflow in GSP memory
 allocation
Cc: <tim.kovalenko@proton.me>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me>
In-Reply-To: <20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me>

On Wed Feb 18, 2026 at 5:01 AM CET, Tim Kovalenko via B4 Relay wrote:
> From: Tim Kovalenko <tim.kovalenko@proton.me>
>
> The `Cmdq::new` function was allocating a `PteArray` struct on the stack
> and was causing a stack overflow with 8216 bytes.
>
> Modify the `PteArray` to calculate and write the Page Table Entries
> directly into the coherent DMA buffer one-by-one. This reduces the stack
> usage quite a lot.
>
> Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>

Can you please rebase your patch on top of [1] and use index projection?

[1] https://lore.kernel.org/rust-for-linux/20260302164239.284084-1-gary@ker=
nel.org/

Thanks,
Danilo
