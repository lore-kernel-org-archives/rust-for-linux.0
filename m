Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5AA17ADE0;
	Mon, 16 Feb 2026 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771234633; cv=none; b=fx/b0oODq9x+N48OZttyodYlY+0owv09E/IABxp/p3+gCD+RmaUazZCF+Jnu5igEU5V6Mn2kYKIRdEuRGSxAIG/TKE4f97b5YajP/mIonE2G4gt0no6geNFP/xSKd/76lyKTiAByQHKAik/gMjXgT7WuAAn/7oAF/zqQZo4+FA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771234633; c=relaxed/simple;
	bh=liuP6NnHCj4ItILIFl0ESOZ4Y4BMVijyKl3unO1FZUU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=IY8SLIv7cBOdPBChgHUgzkeZL2Ws8NZoBtv28WPr/ZpViR3AGgj81SPRFwgJTwyIf9MN/b9reMI8uazgx3iPbdhljBXRCK++igX3d2dK7fsla8/PxRWuCsuYULR0bU9fOeImC3hmIPqSvlY3TM3h9edhYqzY5+cGUhjy4IHM+/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOwQnoK4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOwQnoK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1FBC116C6;
	Mon, 16 Feb 2026 09:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771234633;
	bh=liuP6NnHCj4ItILIFl0ESOZ4Y4BMVijyKl3unO1FZUU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=UOwQnoK4p5NZFVzmibpH2IeZAau/vjOxvQrQ9vLmmF8GdCEcR9sR5PXFgMaHNpgme
	 xytNxPDgCyUXOhvfLKOz5lx5+ZBGpWouQynViJ5S18tdIFzNqxKpXvsDg8lUuyXFut
	 mlGtUfGEPYM/PvDpuFxkOtRNdiZejqzlPB9ep+AYC/jZffgqbuYC1j+zGCPWGws0oj
	 lCuKgwm/Odi7gg7aX3fyet4DBfIqT0IqLZXx5vil3XXefor+sF9O8qr9JHuNLOYgk7
	 e9O1nVt8496bihEvxtrI5uzPMM8tYrbJiAihKl3W7BjNKdle6/iNbFlOnD4UCSyBGM
	 OkX2+uiMIdPIA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 10:37:08 +0100
Message-Id: <DGGA9UY5W4XM.1QXWP29ZW1YKE@kernel.org>
Subject: Re: [PATCH] rust: alloc: allow different error types in
 `KBox::pin_slice`
Cc: "Benno Lossin" <lossin@kernel.org>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260214-pin-slice-init-v1-1-0b174fbb1844@kernel.org>
 <DGEQZHTOW6FC.2SWNBWY9XE3LD@kernel.org>
 <DGERGXTEJ2B2.24F7OWLIZZAK7@kernel.org>
 <DGERTGLMB5S2.3OE4VYDYHMJ3M@kernel.org> <aZLZ69umB8rA2La2@google.com>
In-Reply-To: <aZLZ69umB8rA2La2@google.com>

On Mon Feb 16, 2026 at 9:48 AM CET, Alice Ryhl wrote:
> On Sat, Feb 14, 2026 at 03:56:43PM +0100, Danilo Krummrich wrote:
>> Yeah, but isn't this only because of [1], which does not apply to the ke=
rnel
>> because our minimum compiler version is 1.78 anyways?
>>=20
>> I.e. are there any cases where we can't implement From in the kernel and=
 have to
>> fall back to Into?
>
> Probably not, but it's still best practice to use Into over From when
> specifying trait bounds.

I'm aware; my point is that I'm questioning this best practice in the conte=
xt of
a modern and self-contained project like Rust in the kernel.

This patch is a very good example, as there seem to be zero downsides to a =
From
trait bound, while using the From trait bound allows for cleaner code.

(I.e. we get rid of the matches and can use the '?' operator instead. To be
fair, this could also be written as `.map_err(Into::into)?`, but still.)

I'd even argue that using a From trait bound here is a feature and not a
limitation. I.e. if someone would pass something that implements Into (but =
not
From) we'd catch it and can tell the caller to implement From instead of In=
to,
which is preferred and should always be possible in the kernel.
