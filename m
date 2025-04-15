Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EBA2512F0
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 20:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744748275; cv=none; b=BcKiF7/yMC6hv76SJulTZ3K3XOTAZ1qd7KAUeqLENUvN6kgh4qAIB2F9ip/5RDsi9u0VlijIC3dti5G+gB5hD77htOxPY6A2mZKTsv1Trl+MTWf7GAobXeZCmIox7L2yEZd9DdTKtN3HKspAr+wFWRsq7MYwgQ5H/V3vbaDgp7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744748275; c=relaxed/simple;
	bh=DOUOOaOFEnV0VmZG0/f7k7aME0imtDVPbBeCHzEz5EI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDjjYDvrGIyfnxbELKDDsJ8tpySty/aRoTfn6h0aGB8Tg3zdgwdEWB4B5c90clHFQD4TMIPA6xphMpv2qWfY5t48Pfv+2Ov6YMhiqwTmdN8gywiYEK9/KM5Ig/aXBOMKbqOZguFzRIrjWtwJKe+sWA+9yw4LNdzM1ZtAzQThlyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu; spf=pass smtp.mailfrom=ozlu.eu; dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b=cxDBR3wO; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b="cxDBR3wO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlu.eu;
	s=protonmail; t=1744748263; x=1745007463;
	bh=DOUOOaOFEnV0VmZG0/f7k7aME0imtDVPbBeCHzEz5EI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=cxDBR3wOSZ/rL4ue2UYZv97YMkaacMZgsmjE1qFjkYRIbxMYQ6L11jwj47NsBQ2dq
	 8tJEJgt7WvnExxhQqTYS9uvSEvZwljT5/YyzOFdQRDl9MD+GeqOy9g4gNnv2KNL/Ph
	 vYKBIG7qLNJnFDYijoble4zCYKx++bhWwzRod+6+yb6Hugy1bJTPUMA5Vrbbd8r09G
	 0XvC56VLHN6GYY2rMj6+7U+euElwCY6kpnSh5shaMulxnv9MXx0ZBMCsuZL1CezKnM
	 V4eZ63gFLTD+ibyTKrrQz/S9A5NYqon+GoQpj+kkhS6+r/DCdZET1pNgB7wiHB1Cbh
	 WUGVsoKrjJF3g==
Date: Tue, 15 Apr 2025 20:17:39 +0000
To: miguel.ojeda.sandonis@gmail.com
From: Altan Ozlu <altan@ozlu.eu>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, altan@ozlu.eu, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net, ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v4] rust: static_assert: add optional message
Message-ID: <1bbd399d-00c6-413a-8509-0325b3902615@ozlu.eu>
In-Reply-To: <CANiq72k5MtUaGpCaMOgj-N-0Th-PqWpBKfdHYsS_6ps8g_U9xg@mail.gmail.com>
References: <20250326202520.1176162-2-altan@ozlu.eu> <7f1708d3-be21-47cb-91b1-68434fc65853@ozlu.eu> <CANiq72k5MtUaGpCaMOgj-N-0Th-PqWpBKfdHYsS_6ps8g_U9xg@mail.gmail.com>
Feedback-ID: 127873954:user:proton
X-Pm-Message-ID: aee6c5fcc789f712b0caf32d136c86cb0be0174b
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

>=20
> If you mean applying it, I have not picked any patch for the next cycle y=
et.

Yes I meant applying, I didn't knew about it. Thanks, have a nice day!
--=20
Kind regards,
Altan

