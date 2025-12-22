Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0467930274B;
	Mon, 22 Dec 2025 16:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766422712; cv=none; b=afsdFso81cP9r+ABwwQBemzCpgZ4VaLqpiQSSbmFWzKJjLX580tovc/Dzd8AuZ2zLgfOOl7p6KqpFPZ4D36f0eRuRBMMhHwdujBpBSSXvd4wlny4dMoDe5C0UBqkyG8FnDUe+NjguYWjQ95V9cx8OuoUepZ8Mt0wvIstgt+hHho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766422712; c=relaxed/simple;
	bh=Jt8y+TLci5YpF2GwIQAC9U6va+XnEFxp3SVTV8kkOAQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=FBtwoLs3WrX8pp4AH+XJzDf4OymdQm06t+HloV/+SeUTGzde0VycfyCF7EshMaExk88bGj+MDKIujlBTxoFQElyGOogiSXA73EJ0XMnoOYP75zG1sWhSAovUh7WKib3vwVrRHDLYJf23Ag0L9NTT35hbfTlwFHXnmTEwRnv5K9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adNhm9LB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adNhm9LB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DF3C4CEF1;
	Mon, 22 Dec 2025 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766422711;
	bh=Jt8y+TLci5YpF2GwIQAC9U6va+XnEFxp3SVTV8kkOAQ=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=adNhm9LBUsrrX+DenP00f+d1onGx9CMbQVcwRi+QychBpcZn9LpCuKw6hY+hG5FZh
	 YDkQ0AOnOGmYRdKPr06ZAibR+unUh1UU6EL444/AY0820H1u69EnJUHuHI/loBTXO2
	 fDLze0vpoHFyr0dzMySitB6+zAsHueo/AT2zG2jndQH6PMUHQV8JafK/EDX0VZdKQX
	 8uZdRnQjkX4vadyNmLXoRNLEV931OylnXYIyKsO36YnzV1p8l4qVxw8utcZ/Hl0hba
	 TQ9hEtIVzvODY3xA+WtWHHtUOfs0nC4I0vDTQnr52s9TEN6m2ypPvdqRLIMuDULupT
	 /T8BPZBrZsBXw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 17:58:23 +0100
Message-Id: <DF4WL7CPEB0G.34Q08IOBC1I5L@kernel.org>
To: "Tamir Duberstein" <tamird@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: replace `kernel::c_str!` with C-Strings
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Tamir Duberstein" <tamird@gmail.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20251222-cstr-nova-v1-1-0e2353d5debe@gmail.com>
In-Reply-To: <20251222-cstr-nova-v1-1-0e2353d5debe@gmail.com>

On Mon Dec 22, 2025 at 1:20 PM CET, Tamir Duberstein wrote:
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to drm-rust-next, thanks!

    [ Use 'nova' commit subject prefix; use kernel vertical import style.
      - Danilo ]
