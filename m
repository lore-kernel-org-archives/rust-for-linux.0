Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2F61D5CEA;
	Wed, 11 Feb 2026 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813150; cv=none; b=BXlYGGZneidUfmLfgU6DAwPFN39rq2ME435j5Yrup93GU6ehE1IQLNw+w/yXtWdnDhpCSFp7sGNBY4BGpyzZjAazPKvgu7/YWQvPfBTSb2BS7iJPGIPeUi02+tlSkhyhYkatzu7yM+5mHG38TzgQjbx517AFJ3GsNjgJ8JhlROw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813150; c=relaxed/simple;
	bh=45hvgsjd20dG13SZJx1xNNTWjt2+41qUKeuB63ppTMg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=V59QasDpMp9PYZQRhKBE8xQmmdAkqBBcA6WPnYCtMMSeuGXAMI2iBiszcoo6s9RLOmiLasHVyNm/U6FGA+C7xwdk4jm2mRwYP/gWsVciKrKRZKvH3/xWtO0Xu6hdsEyCWj+2VQDfiPw8YBUQ3Fx/rEmAoTNrJmcqSHg3kuKQy8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UyjNWZHV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UyjNWZHV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2AAC19421;
	Wed, 11 Feb 2026 12:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770813150;
	bh=45hvgsjd20dG13SZJx1xNNTWjt2+41qUKeuB63ppTMg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=UyjNWZHVyDkWoJc/nle5HmmWqqMzusulrTP9FRU5Oeh7/utD67EwrobO/E9JtmOFf
	 xG8Rl6+oj4ZPj7bj6uxVkWwfYpQjOFzXNUnkDPQzWDIg/7e7bj1UT+zdYg94+WwEKk
	 OFK7I9NIQx1IMqMT/oNGA8hB0PxEqWvAyD9q9HaRwQgsx6zy0dXaQeTBwDuBVhmnqZ
	 WBPKgNmDn+H9mXWuobXrxfqvWqBeV52vkDaPQm4w61GVLfMDq+aOVdppF4QAxDyxLW
	 HpFlQZTfnICx33fIwHzagMaTHgtGKm2LOcD0fJn5HolNekBsZyLhUsW2AYzWomtTOC
	 iMJMjyX+E+sNA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 13:32:26 +0100
Message-Id: <DGC4VCT5JRD8.32Y99ERIGUTSW@kernel.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
Cc: "Philipp Stanner" <phasta@mailbox.org>, <phasta@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alice
 Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora> <DGC3B6XIY3DW.M3CRU3IAUKOJ@kernel.org>
 <20260211131015.7bf38cf9@fedora>
In-Reply-To: <20260211131015.7bf38cf9@fedora>

On Wed Feb 11, 2026 at 1:10 PM CET, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 12:19:04 +0100
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>
>> On Wed Feb 11, 2026 at 12:07 PM CET, Boris Brezillon wrote:
>> > I try to avoid using concepts the language I rely on is not friendly
>> > with. =20
>>=20
>> It's not really a language limitation. For instance, you can implement l=
ists the
>> exact same way as they can be implemented in C. It's more that a memory =
safe
>> list implementation is quite tricky in general.
>
> That's what I mean by trickier to use, they are because of rust safety.

Yeah, we agree on this. What I don't agree with is the "avoid using concept=
s"
part, because it came across in an unconditional way.

> And again, that's not a case for saying "nah, rust is not a good fit, it
> can't do easy-to-use-lists", but rather a good opportunity to think
> twice about the containers we want to use.

I think I never implied that you were saying anything along the lines of "r=
ust
is not a good fit" in any way. No idea where this comes from. :)
