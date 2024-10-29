Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A12E205AAF
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730200270; cv=none; b=ndayzO9kvs2f2ReoWlX1tTuJG0Qub+czyDx+yiNkesj359nesO+HosPTztH6K19Vza3OUNIsb5Y+4hByxKH/NhAYxSAmPJfT7rKF15ZoYaiY6Hhaj5FirCqTUZLUz+P1rUgL5SLQeNkSFJyMBpAxnD1agZPYDuvKfEoZ2F9ewCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730200270; c=relaxed/simple;
	bh=UfOE9w/6Qzv5cFH3pXGuDSahN0zTktkw61P3fk3GaUo=;
	h=Message-ID:Content-Type:From:Mime-Version:Subject:Date:References:
	 Cc:In-Reply-To:To; b=Go2WrsU8CH310UY8BlxXHZiA3GXPic5wOMubZP4hiL82JhuoOtT6P/xmfCWKLoHtd0RzGm6Aawf8DxqJ3CAcIafrjiIQ14sO6SVFbIojWmrC69g27OiRwCjoJvFUuWPjlaGkiKu1+0thXfwT1f0u4BbfGhn/hKF2nBDiTM+uAyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=D09KM+MO; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="D09KM+MO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1730200264; bh=UfOE9w/6Qzv5cFH3pXGuDSahN0zTktkw61P3fk3GaUo=;
	h=From:Subject:Date:References:Cc:In-Reply-To:To;
	b=D09KM+MOhGxxhaXqyUEayROFzdg95ZIP5MhakM4K4M/annsttTwO7jEv6Vexa92ft
	 ZGEl6pYe5qz30CUBnQmUcYyAMYrbhTYk7lSDIjITqjQt/HT4UL2icRtOYVbrGmMGJX
	 YSqfw7VeJhO8cpVJfBPCwyrGmyr8VsgasnK7ppvs=
Received: from smtpclient.apple ([240e:47e:d800:409c:48c3:2f09:4c53:9e21])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 127816BD; Tue, 29 Oct 2024 19:04:39 +0800
X-QQ-mid: xmsmtpt1730199879tzw65ejoa
Message-ID: <tencent_D5D7AC8B48B72FC53474E81ACC73D34FDB09@qq.com>
X-QQ-XMAILINFO: Mm/8i8/T4yneHhO7wcvhttmoIeHmwr0lXvG89tCCFEPRAE2gIDlFzpAYcuEu6P
	 obqh5e/LcQOupPROy7ihupWeyfahefx3M1NRd8bZMLEueEaxzVsO1nYLDovv2M9992+eXSSnAM4F
	 hWnnV6WIXGNDJSFCSRi0Qko3/ck4iYUEUi0MLe6V3LaY1Y0cInEm3cPp8kRa9zvMU7+JNeN0mjj0
	 aCBUfXIuzeDbit2OWHi25fmRbKu3AaIwqLoKv2Uy1JwVfnYMWlriNtpui/a5e5VJDP/v8QOuR/Zb
	 nCw6QBRqrSN+AH5WdFvu4tUKERLJn4Rqj5ll3es0cYZ1xLa+TkwVEs17EGr7VFr8+Bf7eIkA2uXk
	 RAaUImb+D2ejxAbp32QPRS3KTt0JDhx1Yuc7Q4ENPPtnF1e1vzNZSpNjyh9DaHOKtY0zW/XBnOTI
	 r3oEOr4sB3KHuTCP57GxeyCmLhEEx4+XqqTao2Gs8CTggKKnMwhrHf+laLZRbIdHPvaE8OUwkIMW
	 IZMTljd0JKcXnasaJmVyNK7hTyDfhPMYIbXK1JpGO+cjBdEiOHRibxCGG/9cuvvt8u6hfT5j+fng
	 0stVc7xmXqHYZ7PFEEw9LBTiW6OLUNAQ3QGf/E0V3Wu/EtrsWps3gYYw+ENkH2dkFIpBJA40hb/E
	 peBw2165J0gld/SZpe/Sh1b0Voykmj+VGT3jN+JTsDNlfuO6Hrf/FNiHOHCuWJ7Ip8PD/cjqpCTB
	 eWSGn6G3kl4oPEGeAtdjCr5BRl/cljmzBLoZYC78Jq0bd+EVrTbNWm6WjkL9apEd4itcwqYqMB7t
	 b9GIZ1T6hpOclGLuqLH7/cX2nswWSs/BjYzIvMBeGxnxdJ+ASZ8EfTb6uPiokKT6gll/mHBO2DtU
	 fStIi/VyuhsHeNbl8Gi8yYea0WEXV5NNuGbzDao7OsrpXw+SBi/0p1Decg/mYGG4Xbwr69v7bx2l
	 OSQU08Gqs2e5Y57D06JlXteGJgijpwVifXO1hAKSM=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?B?5bSU5YWJ5Y2a?= <2407018371@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] rust: Implement Display for Box
Date: Tue, 29 Oct 2024 19:04:29 +0800
X-OQ-MSGID: <9A2B5992-3482-4003-92D1-8D69B09AFF9A@qq.com>
References: <CAH5fLggUUG5dCTjqM0oMpLff1xdGRFxdbkL=gpEaRfkq1fZgng@mail.gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org
In-Reply-To: <CAH5fLggUUG5dCTjqM0oMpLff1xdGRFxdbkL=gpEaRfkq1fZgng@mail.gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: iPhone Mail (22B5023e)

> I had probably written this as:
> <T as fmt::Display>::fmt(&**self, f)
>=20
> This way it's more obvious that you don't get infinite recursion from
> having Box::fmt call itself infinitely.

I think these two implementations are equivalent.=20
Maybe I=E2=80=99m wrong.=20

Regards,
Jckeep=

