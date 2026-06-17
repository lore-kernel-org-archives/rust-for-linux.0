Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B2138E10F;
	Wed, 17 Jun 2026 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781682443; cv=none; b=V0PSShBOk6ihJtoFRBZbfxQ4ebMo5CZ3NYW/lP/6tKQarOAwV6rr+k/1a1IDvXLAf77KQc587cN5WWO9eUcjOmpQzJ7BFLn8xgYp4J8hmqIbNpudsU/e+Nojd6wQ+793rSIR+N5fFPIf1W425pUV9djqhyafd1QZPTnIBmuwVno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781682443; c=relaxed/simple;
	bh=IiDvCNfelEukxghA9cDpClZV8Za061cU56laZEwSAzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wk9sk6BGxI1cEWitc9J1rE6IffklZlLG1ZEVvE+bHb1v0C3l3FGhkpRA7wsfM5TJEJZYBAjAYMNjIu32ph79BBwM0X6KDwBF9qcWO5/RF9N38ulESl5BFklvpHvEAK+X7yfnmH0c+dk832V04KSSuxlvbyisioNhs1o2J/piVm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.56.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a3250fe-044e-7f0000032729-7f000001b99e-1
	for <multiple-recipients>; Wed, 17 Jun 2026 09:47:10 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 17 Jun 2026 09:47:10 +0200 (CEST)
Date: Wed, 17 Jun 2026 09:47:10 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH] rust: kbuild: Replace and dissolve procmacro-extension
 variable
Message-ID: <20260617-cordial-rousing-marten-0be55e@l-nschier-aarch64>
References: <20260616-rust-kbuild-replace-procmacro-extension-v1-1-cad72998faee@fritz.com>
 <CAJ-ks9kk2kQ0JVf3deTtCqGnp_MFTTRxecAwFWe5H6FBHrA-tg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJ-ks9kk2kQ0JVf3deTtCqGnp_MFTTRxecAwFWe5H6FBHrA-tg@mail.gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1781682430-137E4962-D849FB0A/0/0
X-purgate-type: clean
X-purgate-size: 709
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean

On Tue, Jun 16, 2026 at 05:40:42AM -0700, Tamir Duberstein wrote:
> On Tue, Jun 16, 2026 at 7:26=E2=80=AFAM Nicolas Schier <n.schier@fritz.co=
m> wrote:
> >
> > Use make's $(suffix) function [1] and substitution reference [2] instead
> > of $(patsubst) to extract crate names for rust procmacro targets.
>=20
> The implementation uses `$(basename)`, not `$(suffix)`. Please update
> the commit message accordingly. Link [1] can remain, since it
> documents both functions.

uh yes, thanks!  My first attempt was based on $(suffix) but then I=20
forgot to update that here, too.

I am going to send a v2 in a few hours.

> Otherwise this looks good to me.

Thanks!

Kind regards,
Nicolas
