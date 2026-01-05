Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4515F1E885A;
	Mon,  5 Jan 2026 22:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767650619; cv=none; b=TXOAouGXzKHZaso/dW2WZY0AT/S7Zew7jBhMHu9TtDfRaWS0MgC+viv3Mv+SERNhgD7oJ35aYwiW1X5mYRunwLw3iKZf3wMjGt7Tx38889x8mAIwChajJYfrh+65JK6FXJKC9fO3jgtsvDLSxFUu9T1cLtqDVjYHyP40Oc+LIf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767650619; c=relaxed/simple;
	bh=7PqAJNnSTmCk03me6D9R2IOLB0vM1Dp+lacjBF0xU3U=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=pJshLBwXSa+XHtZQudAlIrXnzApkcqsAHF0eoE8INkMYgMfH7x1gVmTFLKkuqwkzRB+xR+N8N6SYiVo1ndYuE9WiWm7Px9PWsubash58JtP+s1atgG378sJ748n/DxF7kuNlvNAPh7LAon2wJt5K4LSXYw02xU3nXu7N9vb7Rdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWdksuDW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWdksuDW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B23C116D0;
	Mon,  5 Jan 2026 22:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767650618;
	bh=7PqAJNnSTmCk03me6D9R2IOLB0vM1Dp+lacjBF0xU3U=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=JWdksuDWGXu86n/msSKQajKTXlcCIaPzTVtGBLeKXtl4BcdHqCX3jjxlHNHR+CWbs
	 LJnqYpYTDlMx7icZlJkPClijMT5YJ09v6llgjKiW0bEfesfSq8WxAp+zeBrEH6RauV
	 WvIlqjip9NRNgy0TEsPIyqsVrmFp/DFYiTo5AkfD11G91+4+quIWX6nNAtcRiGbixq
	 MLy+p2g+5J2h87d4/+aiApyI/MSJzEkgTmwLnNlq83U6fCql4Qt0I1aLTa2euZ6v8U
	 jKdH5KX6+wRupUv29QMfUbeLtlfAlPNnw62Pla8LMdD+BdXdA+IrzJxvRLvj1RLIKK
	 ZXg0Mwy/JH7aw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 23:03:33 +0100
Message-Id: <DFGZUHLJ3ALF.EZDC85ZEFJA9@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
Cc: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 <aliceryhl@google.com>, <acourbot@nvidia.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <ojeda@kernel.org>, <boqun.feng@gmail.com>, <bjorn3_gh@protonmail.com>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
To: "Maurice Hieronymus" <mhi@mailbox.org>
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
 <20260105161110.5d1ab548.gary@garyguo.net>
 <cd9d7dd56e8191eb2d61dce1c3fd88ccffcff690.camel@mailbox.org>
In-Reply-To: <cd9d7dd56e8191eb2d61dce1c3fd88ccffcff690.camel@mailbox.org>

On Mon Jan 5, 2026 at 10:11 PM CET, Maurice Hieronymus wrote:
> Before I start implementing, I want to reach common ground.
>
> In my opinion a derive macro which implements Display would be
> perfectly fine, as long as the name suggests what it does. So for
> example #[derive(DisplayEnumVariant)]. This would communicate the
> intent clearly to the user.
>
> Benno, would you be okay with that? If not, Gary and Danilo, are you
> fine with the proposed trait implementation (e.g. the variant_name
> function)?

Actually, it might even be reasonable to have both. In the Nova driver we h=
ave
the case that we want to print the enum variant exactly as it is defined in=
 the
code and a lowercase version of the enum variant.

> Are there any common use-cases where one wants to change the case of
> the enum variants? If not, I would not implement an argument and rather
> name the macro accordingly, so the intent is clear.

As mentioned above, we do have a case in Nova where we also want a lowercas=
e
representation to construct a firmware path with.
