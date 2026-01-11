Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA274349B17;
	Sun, 11 Jan 2026 17:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768151043; cv=none; b=l5X0Swf4BBBrQUOgvLQBG7YrFJHLGMiZ6s/lAAVNLysMTSG7LBXD02YfZyu9KPYDRuvsTD57abMEz75swGGZc7IbGR3/DkfbbRQ2OD2goJW4L480r/pZ0sNX7xlLBYgCUwaj0hCocFE7eO6Akm5JrwY8HE/etb9DiPjEKGvsYMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768151043; c=relaxed/simple;
	bh=ssiYcnL+pgdc3EXEZj7ab6esDcb4tkuAkRl0/i1ZtXE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=AKe47CspYcBrytgFVoG7IfanZOd9KIVrHfVPMVSCk/XiLqn7hZzNGNkoFVpJQZ0nzRaXYpT9ny4Wjmvs2758fAee/2l+BSnrMN22kpL+StQhU76H/XQRklnmPn1R9UkogBukr8KIFeNWYVHQ1Jb2RNou/eN1jvsTjvW0vR9CKSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvgfadU/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvgfadU/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2AFC4CEF7;
	Sun, 11 Jan 2026 17:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768151043;
	bh=ssiYcnL+pgdc3EXEZj7ab6esDcb4tkuAkRl0/i1ZtXE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=VvgfadU/aIFcRLYqqsjMkSGUZA+i0FxP/KPQiBPPELueckaB7/r8F50FrMowPBwWe
	 DEsZdzaSgp2iu0Z5jqnnyjSu7hN0RWOWbyTlpKXiR5RYuHnFfEG2h+xvyP+0HPf8UH
	 TQXnsHSsYyOm0LRoe0IljXYQMjAwOhKmpp4uRPwzRBdId39rrReCQ7a0PTEwhvYIw1
	 Hzv2bOEeFFyBjn2cYyGmbuOOLA8NqYkYJ3PvRc578vdj51oeZS5MmhYuW05KwpyNr1
	 +JjwWVx2JbKuTUlwXSwiUYfNfuaDjz6+5uXX7ogYRMcv06Bg9D+TDiEjzjCTKKdIpr
	 kJcZgeXK1Mnag==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Jan 2026 18:03:58 +0100
Message-Id: <DFLX8DNUAIJM.K5WFHHKGTWPP@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 03/11] rust: macros: convert `#[vtable]` macro to use
 `syn`
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Tamir Duberstein"
 <tamird@gmail.com>, "Igor Korotin" <igor.korotin.linux@gmail.com>,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260107161729.3855851-1-gary@kernel.org>
 <20260107161729.3855851-4-gary@kernel.org>
In-Reply-To: <20260107161729.3855851-4-gary@kernel.org>

On Wed Jan 7, 2026 at 5:15 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> `#[vtable]` is converted to use syn. This is more robust than the
> previous heuristic-based searching of defined methods and functions.
>
> When doing so, the trait and impl are split into two code paths as the
> types are distinct when parsed by `syn`.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/macros/lib.rs    |   9 ++-
>  rust/macros/vtable.rs | 163 ++++++++++++++++++++++--------------------
>  2 files changed, 93 insertions(+), 79 deletions(-)

> +        // Skip if it's declared already -- this can happen if `#[cfg]` =
is used to selectively
> +        // define functions.
> +        // FIXME: `#[cfg]` should be copied and propagated to the genera=
ted consts.

Do you mind creating an issue (probably difficulty medium) after this is
merged?

Cheers,
Benno

> +        if consts.contains(&gen_const_name) {
> +            continue;
> +        }
