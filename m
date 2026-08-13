Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18D3446853
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 09:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614401; cv=none; b=lWGHI00X1K4HfZ0Ug4Hs8d7QbJSxXKHkwI7hwOFBSsjTjApjKaY434JWrknuzA2BC4bWlkiIAvTVf0Acn8B5BBcpZEeuaH/p9Lxbs6ebDjNa1UZFVOCwRclwtQGy2Ao9ZRKMGkg5mHyqrCh33glTgCrPmGlcCRah9T9inaTScSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614401; c=relaxed/simple;
	bh=9ySGFpbhzpVuu7tU4hYwBY0jisB6pgM9sk1GSA8qUPc=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=eFut3CAVuRsNwxvEhotcHfEqxArU9PKhAwlHzePZ5SjU6rH+E4URa66RlMZ+s6cRE2G1+8k1NyxYqapF3vM8zhDe0gGy6X+OnM8VisTl75L49ce0wA8U358OYxV531l6kTS3HbcihHa7f6sRwfUTirk7Fnc53nJ5R/gn+LenCdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=younes.io; spf=pass smtp.mailfrom=younes.io; dkim=pass (2048-bit key) header.d=younes.io header.i=@younes.io header.b=la71/nVI; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=younes.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=younes.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=younes.io header.i=@younes.io header.b="la71/nVI"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 339D2171441CA
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 11:46:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786614392;
	s=s1; d=younes.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=9ySGFpbhzpVuu7tU4hYwBY0jisB6pgM9sk1GSA8qUPc=;
	b=la71/nVIMY9aDG9ddPZcKCmelOXFNt9KnXMRX5N/rjhJOBdNOszun/iMSwDWZph/
	AeId0MfrN7ZDHXDo6N7XbRshoHdiQLQT1pWpvguQbqcjbh+F0sWXzP72M/jb89Z4Und
	bZ3PrIZvQNO6JejH8n3ahVz+blz5JN+TSsmoBUtjwifjYG65kjHQpKZrXOdSDbOH/4L
	oX7DvxkqCpxNbXSgwiaarxoxZVrd7Og53psN8oNXIknEifG4Qxd3y4z1/Pz9fhsHIhE
	nd3pFMjNvk1lg/IGZGybohxqrNBNffzGU5DZktFFYTMWle2+tngK+P9yL0rfVSUT2kG
	t98WilFEoQ==
Date: Thu, 13 Aug 2026 11:46:32 +0200 (CEST)
From: Younes Akhouayri <git@younes.io>
To: Rust For Linux <rust-for-linux@vger.kernel.org>
Cc: Acourbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>,
	Ojeda <ojeda@kernel.org>,
	Yu Whisper Personal <yu.whisper.personal@gmail.com>,
	Git <git@younes.io>
Message-ID: <OzuVxu0--J-9@younes.io>
Subject: From<bool> and Bounded's invariant for signed N = 1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: 017a4576e383ca5e4eccfa1f2259bb19c2dec03584c01d38b9d90ddf5151b20911e3d9ef144c55bbe3dc4f7ace3695f8c3:TurnOnPrivacy!:tutamail

Hi,

There seems to be an invariant violation in the generic From<bool>
implementation for Bounded.

As I understand it, Bounded<i8, 1> can represent only -1 and 0, while
i8::from(true) produces 1. However, this safe code is accepted:

let value: Bounded<i8, 1> = true.into();
let _raw: i8 = *value;

Bounded::<i8, 1>::try_new(1) rejects the same value, but From<bool>
passes it directly to the unsafe __new() constructor. The resulting
Bounded value violates the invariant relied upon by Deref, whose
failure branch calls unreachable_unchecked().

Am I missing an intended constraint on this conversion? If not, it
seems the signed N = 1 case needs to be excluded or handled
differently.

Any thoughts?

Thanks,
Younes
