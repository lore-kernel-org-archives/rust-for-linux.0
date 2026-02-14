Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4221242D60;
	Sat, 14 Feb 2026 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771079854; cv=none; b=sOi4GLLmdA0UUFEnIQXUiruyLHnd87uCmuFFjepd0vAsuZOm4zDP3YWZvGaOYcC2/vhngILYKGAycCtD+gtS7VzDZ4/4PbQXRxEEhe/WQj4WCBwszw38PrYGfy9QeWP5O77dn8jD2XI8hiJHBY0ZpZ8bfo2RZ1M8g2H6T+4Ja6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771079854; c=relaxed/simple;
	bh=suxEFfATGqzz1nA88wp7TQ9ZlgsSFa6SG0LLHp3o65w=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ePb5L64Uhjozfd0fLcyP5r0KXftjjUJnd6/rputenIndQvBH+NOecEbr2uEZb5ZKhQknDiErYXLpk2cM8Vpy7V+KL6l7Vwt28v2gZIJet4aK7Awc96tj3vUuojIuoZqrkLFbKNH1N5FbaEYCo1xnSqfxQQNtOZGF7fQc6gQKRMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIt4ghK4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIt4ghK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686A9C16AAE;
	Sat, 14 Feb 2026 14:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771079853;
	bh=suxEFfATGqzz1nA88wp7TQ9ZlgsSFa6SG0LLHp3o65w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZIt4ghK4suEO8Ldpb6awnL0DOzSaN0yT1dlBV3L7GNDCKejagCJL+w5Z3JHENOYiL
	 Hfan6/RmH+IK/pHl2Yhq+FxOsLqZ5lpea/n0eUiCqKVyRN/gsE5z9dkpztYYEA8UAr
	 h/jD/d3llWBl0Zenw46cqkCuUWXBbetQFA4aqWWHnJQu3C1TCFVSgDNy0VghZZfjpG
	 dAFmHeO8900FiisVRQ03fryoPFloM7AjqBqnlF7SzztPiNaj5f9qiU91H+JGPXs6be
	 CfAENfH7CQzqgsT59mJgTJ3zqvxd8Cft/Ab/e8S1hlUPi2izSYhDUvaXFCOPDz5CmA
	 ZA1dZnafwDqpg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 15:37:26 +0100
Message-Id: <DGEREP9DICFE.G48HXSA36V7W@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: allow different error types in
 `KBox::pin_slice`
X-Mailer: aerc 0.21.0
References: <20260214-pin-slice-init-v1-1-0b174fbb1844@kernel.org>
In-Reply-To: <20260214-pin-slice-init-v1-1-0b174fbb1844@kernel.org>

On Sat Feb 14, 2026 at 2:28 PM CET, Andreas Hindborg wrote:
> Previously, `KBox::pin_slice` required the initializer error type to matc=
h
> the return error type via `E: From<AllocError>`. This prevented using
> infallible initializers like `new_mutex!` inside `pin_slice`, because
> `Infallible` does not implement `From<AllocError>`.
>
> Introduce a separate type parameter `E2` for the initializer error type a=
nd
> require `AllocError: Into<E>` and `E2: Into<E>` instead. This allows the
> initializer to return a different error type that can be converted into t=
he
> final error type, enabling use of infallible pin initializers in fallible
> allocation contexts.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> @Benno, I would like to add your SoB and CDB tags.

Please do.

Cheers,
Benno

> ---
>  rust/kernel/alloc/kbox.rs | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
