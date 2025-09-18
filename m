Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958FB248F75
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 17:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758216144; cv=none; b=T4SB/IikQIRXWtv9uxwkJeMc6fM7lXRkk32+e9IjIBPECOAqDMMXwfoG5iKpFeUWkQ0ESXZ8qvZgoX/q27UzhsuEoBUWifdjZqvO/oGD8Cu7PoHJGpwRNHNaz/qBSsCXdk2leXdb1oJQQAsMIq5xKIOt7r7csvCRbP/MxIiujTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758216144; c=relaxed/simple;
	bh=jNT7NsEMRuj8wCXtxJyomrcmRAYdUu7xw3SsvTQHZ4I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ibn2MEizkxWE7u/kSgmg1rXr+FZG32HqNd2jipfSGGJJuJQ/4Zd3GUe9pEaJpvYI280BeihTErlBiQlKPs6w/CcpDmawVMCNENyQmS49yZGkl9t66JOUStE0S8SelD2xdkn5bGvA3tIDpV+6cr9PMLqP2HmAjnGl8+MJ3XvtuPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=sj5M8gan; arc=none smtp.client-ip=109.224.244.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="sj5M8gan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1758216140; x=1758475340;
	bh=jNT7NsEMRuj8wCXtxJyomrcmRAYdUu7xw3SsvTQHZ4I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=sj5M8gan1fuxkC0HR5kJhRA1bWT4D5YBPatPda/mnbfYCde3JGuqC8sFTZnFdR9Sf
	 DtY9DncF24mG9xZiMb2wY2TwhXMS7YQ+VXBYXWGYY347ibtJnaXW2UI5+9p2NzTmeb
	 yjcDXMpyLzkAxkruFCx0YUxke0fcAj6darY/OCwfzzctKeAyS8o0StOVY/AkJiBylP
	 53Ff5v9J1u5g3cabyIwaonW071ePluev+OsDbimffG5/UtBOAMmIp06Ojyd+LQcQ2n
	 Yc/iOTgfI/HvnvQt4m2DhJ9sApTxvxPZJQMkdyW4EnJydExZ2QGEpTmZN4tjYVy576
	 VrKDjZ39dVt5w==
Date: Thu, 18 Sep 2025 17:22:14 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: ManeraKai <manerakai@protonmail.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "arnd@arndb.de" <arnd@arndb.de>, "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] rust: miscdevice: Implemented `read` and `write`
Message-ID: <d90b10f1-2634-481a-beec-ce9f31aadb74@protonmail.com>
In-Reply-To: <CAH5fLgiDJbtqYHJFmt-2HNpDVENAvm+Cu82pTuuhUvgScgM0iw@mail.gmail.com>
References: <20250918144356.28585-1-manerakai@protonmail.com> <20250918144356.28585-3-manerakai@protonmail.com> <CAH5fLgiDJbtqYHJFmt-2HNpDVENAvm+Cu82pTuuhUvgScgM0iw@mail.gmail.com>
Feedback-ID: 38045798:user:proton
X-Pm-Message-ID: e0c2ba71e39bfc9d433a41b48e14f54805f8b739
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

 > We already merged read_iter / write_iter functions for miscdevice this
 > cycle.

I couldn't find it. Can you send me a link please?

