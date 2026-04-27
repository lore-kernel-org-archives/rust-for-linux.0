Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B4A2874E6
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777308841; cv=none; b=USkh9Dt4QjLXho1nVd1BaVALkx9XOFkZ0idlbv9CMWqs/Zb3LPsrTVu+SiNuZkFJeA9u79doVWFHfB42SQhIOAUaCmR9hw5yIFTMLQeUIj6ZBKUzZhMz0RxdSk7MFwJPaxX9tOwf9q9cZQkopEqW4rs0ZuP8dOwAKWBFF0Bz9YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777308841; c=relaxed/simple;
	bh=aX8LJIwvB6vEJ6v28KDFSxkfpA1c7e9HX8FQkc9t7ck=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iWWVQPKyW68g9fabtCrjIT5PXvJmq7y2x8QnbWbrxQ4AE/P4UE7RUFkYS3dZOyq02nqxBJDuyhWcmw4vspFIROPVpegWnk9IipZIzD96rpirlwtqESMUSABK2nOVXa+tNQVkVdnvoYNAd/iTPkel5DI11TxCHLRDQ+T24zzaboA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch; spf=pass smtp.mailfrom=protonmail.ch; dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b=Z5EhJseH; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="Z5EhJseH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1777308830; x=1777568030;
	bh=9lDw3+0SrpNsauyW2yUsmvB2Rmj1TpmrH9OnpiiY+Gs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Z5EhJseHMvEDsbtUHDpjsnhtr9r6dq1mluVm52MR4GWKYltn6iosDaNcAv0JoAc/I
	 5/8Iphn1cJQE7ZS+zkXgsWRp0wYs6qvy0GbOhcvhO6FMNFaZkPdWEFORUO1eafsUeW
	 T+bMPwdkbiUYuughRyaMB9H6536+VzlBmSig2xKOZY/iEauAwIjYdsm68R+jXnxHYh
	 sv9WZEpu/JREMDtOo9b+hwHgs75NrweeGVaQywMlDQ1kM8iVic/6XP2xX2rfT0gg7U
	 nSKUJreEOB4zuka//L5OEO92XEKCnhFclwPduLESm3YjM8zoUgakb17b3Xp+8xVoLz
	 4s6k2P/VnJCTQ==
Date: Mon, 27 Apr 2026 16:53:46 +0000
To: phasta@kernel.org
From: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, ojeda@kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, lossin@kernel.org
Subject: Re: [PATCH 1/2] rust: list: fix SAFETY comment in List::remove
Message-ID: <i_q9YNda77b8VwQ-EyK1uAnt4tqcSiGoTZ8YdIVmjBNi8NDf5fBm-S7pqL03VRx8mI6jXxcF8N1asgnpX1QFqDoZ7TQ1lyxiQms5vQSe-b4=@protonmail.ch>
In-Reply-To: <eca3a1b9712a132a400e51247320fe44aeef168f.camel@mailbox.org>
References: <20260403220751.15374-1-t1bur0n.kernel.org@protonmail.ch> <20260403220751.15374-2-t1bur0n.kernel.org@protonmail.ch> <adS9JslFrhFK57os@google.com> <DHMWK36LPD3S.2V9DV6BT60YJ4@garyguo.net> <eca3a1b9712a132a400e51247320fe44aeef168f.camel@mailbox.org>
Feedback-ID: 190658113:user:proton
X-Pm-Message-ID: 5cd676f53d7730872e3e72217a6fc6ef89ef41f1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Phillip,

I am interested in taking this on will do so. I had reached out to Gary abo=
ut his email and asked if he would like me to. I wasn't sure if his email i=
mplied he was to make the change or was mentioning the idea to me for me to=
 do it. I am, however, more than happy to.=20

Sorry for any confusion on my end.

Christian Benton



Sent with Proton Mail secure email.

On Friday, April 24th, 2026 at 7:29 AM, Philipp Stanner <phasta@mailbox.org=
> wrote:

> On Tue, 2026-04-07 at 12:56 +0100, Gary Guo wrote:
> > On Tue Apr 7, 2026 at 9:15 AM BST, Alice Ryhl wrote:
> > > On Fri, Apr 03, 2026 at 10:08:15PM +0000, Christian Benton wrote:
> > > > The SAFETY comment for the call to ListLinks::fields in List::remov=
e
> > > > was left as TODO. Fill it in: the call is safe because T::view_link=
s
> > > > returns a reference to the ListLinks field of item, and references =
are
> > > > always valid and non-dangling.
> > > >
> > > > Signed-off-by: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
> > >
> > > Thanks. I agree that `item` being a reference is the only thing neede=
d
> > > for this to be sound, as reference implies that the pointer is not
> > > dangling.
> >
> > (cc Philipp)
> >
> > FWIW, I want to change `item` from a reference to a raw pointer.
> >
>=20
> Are you still working on that, or should I or someone else pick it up?
>=20
> Regards
> P.
>=20
>=20
> >  In Philipp's
> > WIP DRM job scheduler implementation, there is a case where the list is
> > conceptually a list of `UniqueArc`s; each job only needs to handle that=
 is
> > sufficient to locate the item in the list and remove it.
> >
> > I suggested to him that keeping a pointer and do a list iter with ptr
> > comparison is sufficient to achieve that without needing to do addition=
al
> > reference counting. Of course I don't want to iterate the list when I c=
ould just
> > call `remove` function on the list itself; for that use case I want to =
change
> > the `remove` function to only require a pointer (with additional safety
> > requirement that it is valid).
> >
> > It's orthogonal to this change as I'll probably be more careful about p=
ointer
> > provenance too when making that change, so just a heads up.
> >
> > Best,
> > Gary
>=20
> 
