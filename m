Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C75420322
	for <rust-for-linux@vger.kernel.org>; Mon, 12 May 2025 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058053; cv=none; b=Ga+SMSiB+XUFnnhgDfHwJqeZkuPj9J9POXgALgbLv5mT9VodPvp+Esiw3MjOdYYl9T6AMhzGTJVkfk9a3xlMzksPOJKdroxQ4UrHw8haggUX4bcfRk3Ic6L7YxdVJu7kwjebOQP7YWKqTMkqJ1Jlt45f0GEawyaimdWJUXCFR6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058053; c=relaxed/simple;
	bh=B7+2zDiRKF4/RS2/IqC2ij0AHeTviu/NTwygC8XVf/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OPScYPgTE3WeBKPVTblRp8EtOtrsoMt2xAhIMgfRffN8+ej5h45PKaXrU/0UrJOvYNFlWCH0YLlDnzq92xzE5YkbPL/g6GaOaN6KUQCthLkwPd6pzgRvdXchIZuCXO88M61OXyOeGa4KdnVQlyvoTcXkBWlvXuWslTfyQR+PZjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EILA5eda; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EILA5eda"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AF8C4CEE7;
	Mon, 12 May 2025 13:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747058052;
	bh=B7+2zDiRKF4/RS2/IqC2ij0AHeTviu/NTwygC8XVf/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EILA5edaprv6wI6nAakRCInzk064vTu/2QFlb5ssh5UIlXlgCmGYuIWMTb1r5eVhb
	 3IKArzBdh09+zjmpXfusCQ8zDNS+upWMDIMw5iY/8XIrMEkkZxD0RT3wygrFfvDQmf
	 jBYn+6vqGoYL8qC9QY+nvawna2WTUb6zwo5Fe690g9bVQdvh0DdlP09/rwsh4xxhBc
	 HTBO7JGlRxPOmhe+/1pTwAOJ7L5SxVpHbji2jSn5hRr6WmxZD0XQ502Q4ZwUE0ofEB
	 bWLXRgamS5aTOroNCl+7ArY6+JhB8Pe/jJ8noXRc1/6YZ8Kij3qvbRfLBniig1GQji
	 AHGx6TMjgiVvw==
From: Miguel Ojeda <ojeda@kernel.org>
To: xizheyin@smail.nju.edu.cn
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v4] rust: convert raw URLs to Markdown autolinks in comments
Date: Mon, 12 May 2025 15:53:24 +0200
Message-ID: <20250512135324.1412214-1-ojeda@kernel.org>
In-Reply-To: <509F0B66E3C1575D+20250407033441.5567-1-xizheyin@smail.nju.edu.cn>
References: <509F0B66E3C1575D+20250407033441.5567-1-xizheyin@smail.nju.edu.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 07 Apr 2025 11:34:41 +0800 Xizhe Yin <xizheyin@smail.nju.edu.cn> wrote:
>
> From: xizheyin <xizheyin@smail.nju.edu.cn>
>
> Some comments in Rust files use raw URLs (http://example.com) rather
> than Markdown autolinks <URL>. This inconsistency makes the
> documentation less uniform and harder to maintain.
>
> This patch converts all remaining raw URLs in Rust code comments to use
> the Markdown autolink format, maintaining consistency with the rest of
> the codebase which already uses this style.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1153
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: xizheyin <xizheyin@smail.nju.edu.cn>

For some reason I didn't get this email.

Anyway, applied to `rust-next` -- thanks!

    [ Used From form for Signed-off-by. Sorted tags. - Miguel ]

Please double-check you are OK with the new SoB. Thanks!

Cheers,
Miguel
