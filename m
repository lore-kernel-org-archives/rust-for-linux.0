Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A53F36A341;
	Mon, 28 Sep 2026 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790581950; cv=none; b=QL1ismwOhVZHZNpYN798io3Fpg4csKnElSgDkxj44oMJLl+k1TX2sfk49XiOcmWV69FC77WNz6Ya4+cFPbaWooepZG0JFyyfZzgZDtuxgoVIZ6iptOLzTCyFTVrJvM77j5EnYaFxO8G2GjLV6sd/jSRgV+mR70YZXJ66eZ4Z8O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790581950; c=relaxed/simple;
	bh=S0Q12XIqRS+/VWq87ADVWPUIHoe67p7zh0+nJPxnflQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZUBxe+t+9ot3xMmp/yVsphnZV4SjhXOF57OoWOArDpY2Jo0MhneeIkx2brtO9juhXiC1IaucDp3RFZZbmKNyu8gAT2jTgzJQAzTVHmDf/6l26WPDfKvHqYCW4Zm8zSiA3B3qPzCjfhPMtTlC1QyGK1xqnpGyMilgNuPXEYtWRvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Caqixg5r; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Caqixg5r"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4htYS73SwyzKnyW;
	Mon, 28 Sep 2026 09:52:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790581943; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S0Q12XIqRS+/VWq87ADVWPUIHoe67p7zh0+nJPxnflQ=;
	b=Caqixg5rJHjQeJ/TDqXNmxaiLWFBIVoBy+TjcBWjfBw8vMZgCImfWKI1aH7/JWRp3Hyk+s
	Jla1+WSMYnumlTc0jwJ6ezFPrxkIwsPnB//clPVnOYaZJbQNfbkRhdKyRi1H1EW0H+5zAg
	W2Cjg1ZfbDOkIG3+d1LZzxd2l6rv1decxfSo+myl+fJTrKQclTRAbDr0KbB4K2dVHPZQIn
	vBYES3/YUKl8iv7waAFh28POikqWthTkLbmz+Cvb2sxRiR4vM3hbEaRxZFwbHRsmZzYsEI
	y2q1Uos2Y5dijtGm39svGvLSOXEZ6EG5NBGa4dN7f99Cw1m+bq6CTm+yJASeLQ==
Message-ID: <37a2858a4687e4d9bbe0aba4c1861b96875c4ed7.camel@mailbox.org>
Subject: Re: [PATCH] rust: DmaFence: Add better warning through Device
 reference
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Gary Guo <gary@garyguo.net>, Alice Ryhl	
 <aliceryhl@google.com>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng	 <boqun@kernel.org>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Onur =?ISO-8859-1?Q?=D6zkan?=
 <work@onurozkan.dev>, 	linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 09:52:17 +0200
In-Reply-To: <DLOKSGU61PUG.WSZBN04H0A2Q@kernel.org>
References: <20260925081958.3048112-2-phasta@kernel.org>
	 <DLOBPY6OBEOG.2Y4I4LRA276WU@garyguo.net>
	 <DLOECU7X3MTR.31Z6N1I0WB0MJ@kernel.org>
	 <f0248d1529378ab8be957009a93a0a73ee74bafb.camel@mailbox.org>
	 <DLOILT0V4HCX.31L2PE7YIAKY3@kernel.org>
	 <ab1241777ac432666bb1564d875211bf142a6398.camel@mailbox.org>
	 <DLOKSGU61PUG.WSZBN04H0A2Q@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: yrbjxiebmrubnbhr6kqippf3d7oihwb3
X-MBO-RS-ID: b2a0f0269502aff8178

On Fri, 2026-09-25 at 19:32 +0200, Danilo Krummrich wrote:
> On Fri Sep 25, 2026 at 7:21 PM CEST, Philipp Stanner wrote:
> > I guess we agree that it would be a horrible bug if there's still a
> > command buffer running on the GPU that can access memory which might
> > have been freed once the associated fence signaled.
>=20
> Sure, but that's unrelated.
>=20
> > So I suppose what you are saying is more: there is not much value in
> > the case of *JobQueue*, basically because all the jobs live inside of
> > it anyways.
>=20
> No, I'm saying there is not much value in general. Whatever thing owns th=
e
> DriverFence has to represent the "device access" of some resource, which
> already naturally establishes the relationship.
>=20
> IOW, whatever thing owns a DriverFence is also the thing that stops the h=
ardware
> in its own drop() implementation; anything else would be rather questiona=
ble.
>=20
> > So I suppose we agree that a warning is fine. It won't fire in JQ
> > anyways, but might benefit others.
>=20
> What scenario are you thinking of?

Drivers doing "rather questionable" things, like we've seen a great
many times already ;)

Note that the dma_fence backend fires a WARN_ON if a fence is freed
unsignaled, too, for the same reason.

Life finds a way.


P.
