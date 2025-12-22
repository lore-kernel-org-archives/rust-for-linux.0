Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223363321B0;
	Mon, 22 Dec 2025 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766422996; cv=none; b=PTf0VbmzKu+suhv17JrCALMwrbL3De2hTjkj8Pw38WwABZzl7FaiUJKFbEu+HGzSXm2eQ2ZLNt7O4/J2BHltSjX/bpg7YcPAPEQEfDR7w69EyZvMS2/OIX3JhA8lGcpHf83FXBmNGjFDk14jRAAykUZ0wo0TH4dmliOQfmbRpBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766422996; c=relaxed/simple;
	bh=tH4Nnl/oDlWWOeWn9ajIyRHG8aXXOcTM2+Wkimr9lTk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=WPB5/jBNVP13OkcbOgWHUJG6vTB11nPlzjWHJPiIGyhCPKK3mURtc+SBmyH+lzYkFr2xjzoYba14A5cymjYybihV/I5ZleiswOF/xUsj9deQ9eo2nYNY9XZMq3JCvwtDn6rpMIcZcHUxnHtPsuG/Ce+LDMrP54NLjA0rmaZGZYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6xmozyS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6xmozyS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0373DC4CEF1;
	Mon, 22 Dec 2025 17:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766422994;
	bh=tH4Nnl/oDlWWOeWn9ajIyRHG8aXXOcTM2+Wkimr9lTk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=F6xmozySx2DQMXHYJx7FgT0KkMkOcfp7m8x6HYQsNEKVXIlhelEMiaLDLqDZfOmD2
	 agDpQb9nx8OZ8oeaIYc08tgHD8LJfMtRPJNmXKsrffhQ7ZxLnBK++FLNeQ+YgZ38WM
	 al+uDED8Y3JvWzjaf2Q3ZNKr7z/SPfpfPA6pdFR7beB+CE4qSO0jV5gxJoubi94CEa
	 ZSG4GOZhiMa0vr6IAs4RE+8s/FoJZ0zOqd2dOfmYyHkbAJBuFYy0+JX5qbPyXPIIUp
	 i7X0HaftE3gno/kaJyj3PcOzc02df6BI5dNuUKXNtKdKMyaLp2W1IbopfHZAAH+E1X
	 dg+k0rdp9RvJg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 18:03:08 +0100
Message-Id: <DF4WOUGU3RJC.1XHFZM27Y3C1R@kernel.org>
Subject: Re: [PATCH] rust: drm: replace `kernel::c_str!` with C-Strings
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Tamir Duberstein" <tamird@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251222-cstr-tyr-v1-1-d88ff1a54ae9@gmail.com>
In-Reply-To: <20251222-cstr-tyr-v1-1-d88ff1a54ae9@gmail.com>

On Mon Dec 22, 2025 at 1:27 PM CET, Tamir Duberstein wrote:
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to drm-rust-next, thanks!

    [ Change commit subject prefix to 'drm: tyr:'. - Danilo ]
