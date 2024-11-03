Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2EB189F32
	for <rust-for-linux@vger.kernel.org>; Sun,  3 Nov 2024 22:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730673404; cv=none; b=gTUBVgLMeB603LbIhS5zLyAAlz7IvqvueVsyClyiVxJO6WhnsMpawRc1fEJoHdoKWjDM4az9/xyyyAeE/Cr/1tcy5w8jfc3oRnF4RjWtQruIxo42gudHtYa8yerA00CiuzNOamOyaB/BbU7+4lgmyFFCvo1eXUqTtEDQ7hQXIk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730673404; c=relaxed/simple;
	bh=TDkFFV/K62MtYNgXv68Cvdk4YnPUrDrDmbMPnOCAQ/Y=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=VjytuAL6mb0g7dGaR4yRIRLHqBbmUeBcbo5KHek7IBfC5IWEHjhwdQAeP6CX/y4SsVuDgqiNc8cL2OHcfsBk4Mk00jy5JJb8Bb9keJyNc6of0jw915jS/H9N5N4uDudhE26rSjJ3VMyNgmTChZBExi3ToVYqY1tQ+1BYE48fqgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io; spf=pass smtp.mailfrom=tuta.io; dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b=EvwvsEkB; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="EvwvsEkB"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 868DF34FF1BE;
	Sun,  3 Nov 2024 23:29:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730672969;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=TDkFFV/K62MtYNgXv68Cvdk4YnPUrDrDmbMPnOCAQ/Y=;
	b=EvwvsEkBcszDcZ61RRVyrkm1zm0VleiGRk85HWsS5nawTUVqmIb04juZ1LxDjN0W
	+XuCL7ORzOoRcw5o1j33jn8CXeQJxcrf4eWJceroxY0aW+OTDm1zZJCvJzmj5w4lztM
	ujaFSL4UccX1q0Fl+pcVl2LrIVEMDO7+0EBFenJ/4ajqTOnGYGSPiBWDLaT2C2usW69
	3KtH7DIY5BMeOqKLBlvbNGbz3yLsQzDvleVeKAzLAWgWG7y65lpblp61KIwjrTfTEXA
	I/DUjnIhIOXJy5/CAFAqk4Chygs7fBPQcrMoRhUStRy9N1thnA3+jS0ljRU6MC1iQ4i
	syhpJ59cvQ==
Date: Sun, 3 Nov 2024 23:29:29 +0100 (CET)
From: jens.korinth@tuta.io
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Rust For Linux <rust-for-linux@vger.kernel.org>,
	Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary <gary@garyguo.net>,
	Bjorn3 Gh <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	A Hindborg <a.hindborg@kernel.org>, Aliceryhl <aliceryhl@google.com>,
	Tmgross <tmgross@umich.edu>
Message-ID: <OAo8RFp--B-9@tuta.io>
In-Reply-To: <CANiq72n3bdNoYsSo47BGK2AJX_yhREoOxfKwkMBwz4v3bR-UHQ@mail.gmail.com>
References: <20241103030530.76756-1-fujita.tomonori@gmail.com> <CANiq72n3bdNoYsSo47BGK2AJX_yhREoOxfKwkMBwz4v3bR-UHQ@mail.gmail.com>
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> Hmm... Isn't this derived from what Jens was working on in Zulip? (Cc'd)
>
Looks very similar. But more importantly it's missing the hotpath improveme=
nt suggested by Boqun Feng, which improves the perfomance significantly:

@_**Boqun Feng|411647** [said](https://rust-for-linux.zulipchat.com/#narrow=
/channel/291565-Help/topic/warn_once.2Fdo_once_lite_if/near/478155223):
````quote
FWIW, you can do this:
```diff
diff --git a/benches/once_cmp.rs b/benches/once_cmp.rs
index 322e420..1bfc9cd 100644
--- a/benches/once_cmp.rs
+++ b/benches/once_cmp.rs
@@ -124,7 +124,7 @@ macro_rules! do_once_lite_if_abool_swap {
=C2=A0=C2=A0=C2=A0=C2=A0 ($cond:expr, $e:expr) =3D> {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #[link_section =3D ".data.=
once"]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static ALREADY_DONE: Atomi=
cBool =3D AtomicBool::new(false);
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if $cond && !ALREADY_DONE.swap(=
true, Ordering::Relaxed) {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if $cond && !ALREADY_DONE.load(=
Ordering::Relaxed) && !ALREADY_DONE.swap(true, Ordering::Relaxed) {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $e=
;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0=C2=A0 }
```
to improve the hotpath, because you don't need to xchg() each time after yo=
u set the flag.
````

Jens
