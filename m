Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EBA57311
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jan 2024 09:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706001019; cv=none; b=K1VioAZ4tw38Hl06mVLeJpYTCP92e+oqU0ll35RtMrBt+zHlqgUSai1KqkeIVv8Cnv5RyvmHUJ4WvW6S5Z+nEeu/eS6MSK1auo3oUr+5HQiftMP4eMxMUxHGFeNpz48z2XBjaJ4IdeuIM5CUY9Rohf1SHuFi0GR4sIK2oCCqJDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706001019; c=relaxed/simple;
	bh=21TpX9p/MunhH6oZZSVQAPfjw7j7JznR54Me4qZf8r8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bCUMAiBibwC0DBEXjEDrsSNSJITEb4blTPnlrAIeaXsOrGY93MJ43GtgppbxzrNd80tIHC/E1O1D3Am42Z6fqg0AYC6WtVR2dTDyxRlo6puChvE5rdfh6N+SApVnhIS/DFbOT5zB99RxeT38ZIB+VUjkDTrIUoGSpqzpnfY5nTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/RlupZE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/RlupZE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E5DC433F1;
	Tue, 23 Jan 2024 09:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706001018;
	bh=21TpX9p/MunhH6oZZSVQAPfjw7j7JznR54Me4qZf8r8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=r/RlupZEOaf8Jea9MrXuKhOwE7EuQPz4CEcM4mSjf7g9+yF2TeMtAD5SJE4MuSQdA
	 PMygP2mk6+IpKgGneZobjQBVhIiMFspvZOtWsg5hyBIaQxd9t9GXAqxK6eWMQzSpk5
	 HkT9cp+Z5q4MkmBIXNHu5UGfKy7uA9T/VkaiN4L0+8eBOWOs4ucBzy2sTvnKthmtDl
	 T8KoZsPN9VuBvh1ionSAE0r1f3Th3KslHOZQ96oxSNMoUYWiVpy6j23pyA+GVZwAq6
	 i+P+5qD22oJdAM+jx/HtYD5M4IrkqbHfUiYimXGmhKydPIagNcqCROrvZ6vH3aLHtX
	 E2pOCNlrUVo0w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jan 2024 09:10:13 +0000
Message-Id: <CYLYVXYNETD2.11ZTBC8IY529S@seitikki>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Wedson Almeida Filho" <wedsonaf@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@samsung.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "Matt Gilbride" <mattgilbride@google.com>
Subject: Re: [PATCH] rust: types: Add `try_from_foreign()` method
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Trevor Gross" <tmgross@umich.edu>, "Obei Sideg" <linux@obei.io>
X-Mailer: aerc 0.15.2
References: <20240122162553.64610-1-linux@obei.io>
 <0100018d31fe5238-538d9c26-64a3-49cb-ac76-22362f73d80f-000000@email.amazonses.com> <CALNs47v_2LxKnpWRYnM0Jcj+wdzPFQcfuaHyh_GnbLgNDXHLZw@mail.gmail.com>
In-Reply-To: <CALNs47v_2LxKnpWRYnM0Jcj+wdzPFQcfuaHyh_GnbLgNDXHLZw@mail.gmail.com>

On Mon Jan 22, 2024 at 8:33 PM UTC, Trevor Gross wrote:
> On Mon, Jan 22, 2024 at 2:11=E2=80=AFPM Obei Sideg <linux@obei.io> wrote:
> >
> > Currently `ForeignOwnable::from_foreign()` only
> > works for non-null pointers for the existing
> > impls (e.g. Box, Arc). It may create a few
> > duplicate code like:
>
> Minor nit: commit messages are wrapped to 72 characters, looks like this =
is 50.

It is actually 75 characters max:

"The body of the explanation, line wrapped at 75 columns, which will be
copied to the permanent changelog to describe this patch."

See https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
the-canonical-patch-format

BR, Jarkko
