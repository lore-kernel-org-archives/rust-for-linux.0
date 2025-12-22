Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C940A2FE593;
	Mon, 22 Dec 2025 06:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766385562; cv=none; b=vB8U5M0TRfRbwUbb1IAd4LOLs83Bjq+U9juIt68beomfJdpD0ewF7ooOo9oHQ85KMKjzG0oUVDeuD7irAv0SGmXIKvffP1NW3jfsAGMnueqOljeHnUjo64a9VIZbB4Q41neZuD5AXsX34qfgdnYT/8+gkUaOGHPVJefH+B0wfFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766385562; c=relaxed/simple;
	bh=ZdDHH5BFKhFrbzOLIUAp8IB/KDwFksiPzhwjJRZkQwQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=ZbtXr+RaWZEmBEVwoGnjC2wp7BIAjEmbFmn52lqNlA0ycT+2jyOYpXLq5O7WCA5EDMj+qRjAO4V8p1oNdJyKII1iyXgSa2kPhz+Vb+NbBSwhN887vdyIZNirFYcNnINuaKRMmNP+tPty8Xa9CsDSCSgfNAZFR3Cf35sVlxfRKdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxgDSvoj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxgDSvoj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F347C4CEF1;
	Mon, 22 Dec 2025 06:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766385562;
	bh=ZdDHH5BFKhFrbzOLIUAp8IB/KDwFksiPzhwjJRZkQwQ=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=RxgDSvojXtCRx6ToQqwZDsCFExHu9laqghL7A33aeNGYVu4KEkc8owvxOzWTlxHiL
	 Z/wWOFf9o1FTJmbRs4jKS1kqmrgzM1SExcyi/TeK7cegNcABdNy7w4wJtKYgHFvL6X
	 UlqyPYu1mGdrKr1aP/2j0VPEUN/smZ18pGOVsTFETWbV8gc54iYf6FlZj87wx2+VYu
	 2bOrHfVZTuV4PJ7n7sDEvDOsz8QFvoxjcm4QFwHcJTNadwQAGfGmKzIXZ8cjwau8xr
	 drqCHSslEOaXuTBZRT0/qvhLdYm5uwhzW+ClcJ/2PkpJB26Gdrj6YsfGJrkObiC/VF
	 W8YjFw+GGB7QQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 07:39:17 +0100
Message-Id: <DF4JF6WJZD16.2LDTMQMI3SAWQ@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Fiona Behrens" <me@kloenk.dev>,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, "Igor
 Korotin" <igor.korotin.linux@gmail.com>, "Tamir Duberstein"
 <tamird@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, "David Gow" <davidgow@google.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/11] rust: macros: convert `#[export]` to use `syn`
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251211185805.2835633-1-gary@kernel.org>
 <20251211185805.2835633-7-gary@kernel.org>
In-Reply-To: <20251211185805.2835633-7-gary@kernel.org>

On Thu Dec 11, 2025 at 7:56 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> This eliminates the custom `function_name` helper.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  rust/macros/export.rs  | 24 +++++++++---------------
>  rust/macros/helpers.rs | 18 ------------------
>  rust/macros/lib.rs     |  5 +++--
>  3 files changed, 12 insertions(+), 35 deletions(-)
