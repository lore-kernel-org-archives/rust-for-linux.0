Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F5622425B;
	Thu,  5 Mar 2026 08:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697945; cv=none; b=Lc34Mk/h0zWPi8ibefOUL9AmbMrHknQ92/le3Wv04+BAo8dVXzQc+XBsLZJQcM3MLHt+m9exRHyJ6ismCfj9zTCgy5w2gPK/9xBT6dLE/Fcg7WQGOrZHGX8qbi3QS6UKuV+ki8xiGRMPdDOAs17/M20TUJMo/CJ89mqZGwX40RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697945; c=relaxed/simple;
	bh=vA6PYAMRHM36XFlE5PCJYcHBuMHbNaBZqJ9H6p7K5dg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=gCbrJEBu7nEh1OJj1Uc09b8xdoWDF3e18/1wboBBGX9islVNPFc3OspHmyiUejDeBq0CO7c+Rlj5k7Mktl0y9yNE/TVAreRy4AdmRXMdNKGDbaQF4e4AV6rvnY3udfnoT9O5yh+KCXdZ9QvGdyJgou0Fd4xXIlC848zH/l+/i+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8vu4B9z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8vu4B9z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70967C116C6;
	Thu,  5 Mar 2026 08:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772697945;
	bh=vA6PYAMRHM36XFlE5PCJYcHBuMHbNaBZqJ9H6p7K5dg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=N8vu4B9zw9meGzC9Ue0wr0hvLnw+5NbaV9nOFgqFQ/HuwQwVxLbOl/8pWAuLKGIwj
	 wyyDcPl8yoSxvuw5FFsVFMa0W9/3etmzjimY3qBINzXS6HekN3DH+MDYpHYbAsxTB0
	 9e1q/JCTgRT7+79XysTCnSRED/pmrc4N3FGhq7DYaWmh6tl0hRVwC+j4JTYKOZUPdD
	 Hi9eRPnuB6V1PaedpwE3XR/Mz3CAg7QmajHEr+LvMsKL6QnP9AgJUalTv1yi/ytaLM
	 QyOtu4jKUL5v75DuyYeLal1eTUIBzkrzN5f0SskS82aw4HDee/l+MVnZIF4x2KbPHE
	 xQxMVSTJU+qcw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 09:05:40 +0100
Message-Id: <DGUOZ3GDF3D4.3CBJGK1S3DPCO@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: pin-init: internal: init: remove
 `#[disable_initialized_field_access]`
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Janne Grunau" <j@jannau.net>,
 <asahi@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302140424.4097655-1-lossin@kernel.org>
 <aabGlKYNd0CrO7_f@google.com> <DGTSY7NPZEDA.27MENGDJA87B8@kernel.org>
 <CANiq72kNdc7=-uoWXBpxkn2No6-Z0hVnx_yWMNphyTVscsMkUA@mail.gmail.com>
In-Reply-To: <CANiq72kNdc7=-uoWXBpxkn2No6-Z0hVnx_yWMNphyTVscsMkUA@mail.gmail.com>

On Wed Mar 4, 2026 at 1:26 PM CET, Miguel Ojeda wrote:
> On Wed, Mar 4, 2026 at 8:00=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>>
>> I figured that we can't really "close" a Zulip topic (we can mark it as
>> completed, but that topic was originally about the field accessors, so
>> not sure if this makes much sense.
>
> Using Link: instead of Closes: is supposed to mean that only part of
> the issue is fixed, i.e. whether you can "technically close" it or not
> is not important (e.g. Closes: to an archive like lore.kernel.org are
> very common and actually what the docs mention as the first use case).
>
> So I would say Closes: should be the "default", and Link: is for
> particular cases where an actual issue (or message) carries several
> topics and could be confusing to have several commits with the exact
> same Closes: line.
>
> In the case of Zulip, we can link to particular messages in a single
> thread, so typically it is possible to use Closes:, though the current
> UI isn't great to see where exactly it was linked to... :(
>
> Anyway, I guess the inspiration was the similar feature from forges,
> and perhaps in case someone has a custom tracking system that actually
> auto-closes things in a forge, but it is a bit confusing. Having
> allowed "# ..." for Closes: or a similar Closes(foo): instead of
> reusing Link: may have been better.
>
> I hope that helps!

Yeah that explains it, thanks!

In that case you can make it a closes tag when picking.

Cheers,
Benno
