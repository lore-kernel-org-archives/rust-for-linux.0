Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E64A38836C
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 04:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337576; cv=pass; b=Sssv0ZK04L1F3b7CPy5rQX1kmh8UuZmNKhFgR1a1GIlXhTbo45I3G+Nq/qMBVMwVQDtAqwyp1oqLCpO+Es4ez5ndfj3NZH+rttXt0pGryQCHiicqw684HsoJl2CzKoBes+BpkMZh0OCzn7NlOo9xnAx1am2WwAMmgWN5zsh9X+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337576; c=relaxed/simple;
	bh=VegkRDC67PNmD2YX0S4rXH6cezVAjKSTW6ZOepmj8vA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+ZeVHoasxw57UzW1X/inlDTvI5Nu4E3MsFI+VvxZEYaghcBzWEyPfmufhPM8hUe/yKSv8+gQ88WLCceSQkGu+/RYQBDw65bz64bd47x7LrGqAFGopqzMfiKeoBrc0rpkGo7dvUJXuf29GzhoIh5HMbt4KNJkutg/wfUAlrQ9EU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjB15CnP; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjB15CnP"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cecdc24b1cso879175ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 21:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786337573; cv=none;
        d=google.com; s=arc-20260327;
        b=DKMJml/1BMNbCK9EfHO/cr/xtBVRBxHyIAyQNvAZd1VjiZ+D8AaL8z3CTIGO5DlAKD
         M8WJha5qfquPDQ2LjBtEfDlwzsBGIakNzwZpkAPGZd4zqCx6jAme2oWmxt78wjjhssZ1
         ZiY+OuUhFVfupRidGtQKOT9lJOVTmI9sRIN8DSg6BeitxEn4M6tQnsAyFfvlnIKbzRCy
         0z0+PcgQWVM95O0fycIY+LQyxb6vIHsliCu2Eb8WdYukiL7JTahAki1E9KEgx8OFOlXN
         GSjOIBTawhY6ONQowvF5UhynY1BMeiheIRyU7h87UoCvo1506wtg8eZ+nwz1fA2Q+7Hz
         vPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VegkRDC67PNmD2YX0S4rXH6cezVAjKSTW6ZOepmj8vA=;
        fh=Tx71YxTeIsy4D4eSpUnkeIUJu+23gMH/Di/dBKaLs6k=;
        b=UnGex1TKAW3IPyjNdE718AtXjtdsw6mM1o1JPs8RRhpPf9Re5XHT+CpcJHkncOfqYH
         zeDUx7itdoEZyO+Y5nqE6fb7CHLYyRL1PLg3g+IznNvChMIysQdBAFAP4WHrrrFxlWES
         Imr402sjTsObjP2eskBXl7zGe6rRu+IGBY6L2Fe64cxrMHBXdHxTURuuLKg++tVYnuOU
         vEEI0G//byxqEIYrKtI0guJl0RoWnEg4pixqR41VU2oPud4I4Sj1Bu2uDi74zWr2xk2q
         Y/whRB5GFy5uEAznL8g0aTtuQZR7Nixk+tq/7bodZu6zQjniLAOKsjeS9SwABIZcf+w4
         YPVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786337573; x=1786942373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VegkRDC67PNmD2YX0S4rXH6cezVAjKSTW6ZOepmj8vA=;
        b=SjB15CnPQwSpD6OzTbyYWf0YOB5KY3i9ZUROfeCwJIkU+CDSBbfcbty0VSuLQQ8ueP
         eNeOXbUDQMG8XPvQmKNWPXYHy9tWBQLMYowI19MPZI476Vsr7obAFMo+cAcG9PwpyQEA
         GlK29ACrxUg6GMCotbZmM6BLdkuTDE2uyinzHCjGLLy/1rI/lAEqcoCzw9+IVWvfGlJ0
         Rf7sfXEPHALx1NLZL4EUqKIbDhytB8e518ONMKkQ+z3/wSLxiMKVA4b0bWY+IMFGMsHn
         NN4/N/yOAzl3wRFC+rVnaa3vZJEagn1a+fL/+kwsyoNmlD+N+StklS9bLLOBVe1TP2Kf
         3+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337573; x=1786942373;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VegkRDC67PNmD2YX0S4rXH6cezVAjKSTW6ZOepmj8vA=;
        b=loKuyq/YjNkTTahGHZVaPa5h1hNNX0rcRbHIAASHLrF/tjFg78PEnT/d3/86HQ5nwr
         fYoK9pASax/VhTuiBzox7q9/8gfMXn6D7j2EBkkrjhEkC4hW13v5bVClBK0Yoamf7/wI
         RZfE/UqtT4C1UwJfa3sDOzMRzybA5++lWFbZKTlIQtgOufBH69mOebkr0T0orpDJY2Q9
         Ez+2qO3Z3k26OC7OXIP/VYgklbQMXyQJFhwlphWvGvUnzFz/D9HS26oxzzSqZytOoWl3
         W9ERlauZqkgtlMmDNcwbMXeK2sEGpDcIGudPgsErSSkUsu0CZrWrYj4U9aJJDek56f2y
         mQ5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqVi6mvlHwDZmgNlOkU2rVi30VpjqTjc4QuUXAFHJNCpiL7NzUqmeQbEShZw9KcFxX4tAfGoJuReNCQUe5S+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YySeDpk5VvR1Jgxofm/RI7FNcYIwXfMNzUMfSgGe32JgKeT6A88
	CZ2+0X1JdWqA8buGJKCNYX4RbolXJu/1N/2/SPUTtR/eL/tOq7GpRpaEaIzSUrmnLhX4+wTL4Eb
	Cs/Ncf1j+mBANKiQPME+scocq0kqWnS0=
X-Gm-Gg: AR+sD13q4yWnn1R0DEVHMjwxJYEGdR2LivbY/Pk5w7oSV/zfKWFDOZcMU4GCM/w6IJ4
	i54yrf1CwFqQzhiJGGCh7py9jlFsDldOHt1R9wF2z18mCGx9fYH18l34FzYdKMPIDgaZRX5bEGj
	L0KN/paQEGw4AaGkVGD2smnogukecz3IFi4tNRGRXDDowgjv0QCWbT68fE1/ah2HOug1Gvff37Q
	SQzo2pDqajCz1evtECW9MxkV5LNk5UcOrfSUIgxR3qkdk6uhmz9aZ1VHbA32SDGaNRvRninV3fT
	MNMU66d538hk1i/QTD5vVhPCPA8RMhzAC690R1vCLjzbfQl3ItatVqdE11DQZMqXC4T+Umyf4rR
	dhEcjsqj0kXIrytQx2ayzpCHAXLe0LYdce5B6xI+whxK/x8FX+/AmQZIiLde6
X-Received: by 2002:a17:903:19cf:b0:2cc:f4d4:29a0 with SMTP id
 d9443c01a7336-2d0cab0db0dmr346208065ad.3.1786337573359; Sun, 09 Aug 2026
 21:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709204926.139252-1-ojeda@kernel.org>
In-Reply-To: <20260709204926.139252-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 06:52:39 +0200
X-Gm-Features: AUfX_mzrrjmhZ3ysCAix6Cno_hzVC-niwAJJlVfExKc-WLmCJ2v_8gXexN9QN2M
Message-ID: <CANiq72=wrECqHJQS+jNTi=DXxWOaWMG6VLxs+Y+HziRL-UuibA@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: quick-start: remove Ubuntu 25.10
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 10:51=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Ubuntu 25.10 is not supported anymore [1].
>
> Thus remove it.
>
> Link: https://ubuntu.com/about/release-cycle [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
