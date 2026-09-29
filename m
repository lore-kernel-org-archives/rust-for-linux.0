Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F07E4EFFB6
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 18:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707615; cv=none; b=lAuKtbaBmgnBThiPjspf6hy7yeCXrmM9mSqeAX4K4IVNaAicSmwJikTZlA8M1O4GVpLSCbRNOGK9uPxqBlH87i/GcmCAZAEsNeuYZcnEFbNxd3qiQshi7v+FF1Q9shxZ3YiAKHRqxoVBKSCLdGqR4xx9Bf0fyIupOqMD21eFn64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707615; c=relaxed/simple;
	bh=MS+C9CG8ZjFQUZ8u4YopmSKoNzh+cSFS7S51WeYBYMk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qxHRrq6xEWMn3RIaNoYAoerlQJi26nwNcnIWj+MFv+FYO2x/W3AVMdrx1CbdH/JJCOjfq8trDzWE2R872/c3PMz6ECsoh0Ogo+cbCYHUs31qOWC071Qyuj/aRwK++oBRKiA8E4DAZCfbh5EcGYtCuZHdjFDQFtEEUoCZs2Q+KaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=quFw6EmT; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="quFw6EmT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1790707599; x=1790966799;
	bh=MS+C9CG8ZjFQUZ8u4YopmSKoNzh+cSFS7S51WeYBYMk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=quFw6EmT62H2Kzob7a+fyssRgBWOYjq0wdGkXb+lCF2bxpUECy1/nhAdk1Z+8iLBg
	 Qrm0wpZ+3qL8Of88/Y9CbbIN5VrSTKXXMqxK2/CXP508aDH0kxDr/GX2UkkiRWH6bk
	 wDIbDpDVyR3gM9uJ8urfOlDi80RdpAkrW16w2AV/fXuPbwYSstbeHq/SdzrSgAQSUC
	 CcRUQDqJlsjcXuHQxp5nSPY7i0iEnYelRem80xbB9udVBHN6Y7V3CUZwuz91sGvLQl
	 x6h8f8F7YAlKVwhZ2ruYd9S5d/ts0TkDmHbSCU2p+5HB61AP93jrNJ7Qy+WJk3DmRE
	 RzNVwOohFv9wQ==
Date: Tue, 29 Sep 2026 18:46:36 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/4] rust_binder: add transaction buffer tracepoints
Message-ID: <hdnI7q1dwylKmPbpvwy_SdsHwoCt-OJfs6orHIhdc8ltPvAn5r1zCVtNLDNLf6AzrkdvpgFuD3QZR5gx91K0qeMv-XvaIU0EsrHr77HSxG8=@proton.me>
In-Reply-To: <CANiq72nzgVKu8BcmWSLLXx0ve6zA9wt2GnYZkFoyLnRnBvH6wg@mail.gmail.com>
References: <20260927125622.676342-1-sagartaunk@proton.me> <MA5WohQDVE-anywwlBsIffVgVU36GPYOzQQ5luqbMOCk8jcyKSKBHucUT4ISOAP0lG_6B_5UFZmFSG6YC1HlBVBW4sNL0BRcnuU_Md42-bs=@proton.me> <CANiq72nzgVKu8BcmWSLLXx0ve6zA9wt2GnYZkFoyLnRnBvH6wg@mail.gmail.com>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: cec06f70d78c6e160981198eca2b0c599a063346
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


-------- Original Message --------
On Wednesday, 09/30/26 at 00:07 Miguel Ojeda <miguel.ojeda.sandonis@gmail.c=
om> wrote:
On Tue, Sep 29, 2026 at 5:57=E2=80=AFAM Sagar Taunk <sagartaunk@proton.me> =
wrote:
>
> Are there any updates for this?

>Since you pinged within 48 hours, do you think this should be
>expedited in Binder?

>By the way, only the first patch had the `RUST` entry in Cc and the
>rust-for-linux mailing list for some reason, not sure if you intended
>that or if there is a reason for the difference (the emails did reach
>Lore via the LKML, so that is fine).

>Cheers,
>Miguel

I apologise for the early ping. I mistook the follow-up window for 24 hours
rather than 48. There is no urgency here. As for the differing Cc lists, th=
at was not intentional. I had wired scripts/get_maintainer.pl into the send=
 command, so each patch was addressed separately. .

Thanks,
Sagar Taunk
