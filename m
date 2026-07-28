Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B413D399352
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 19:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785267609; cv=pass; b=bA20ZRaL+0wjs+9o/qAYuNYl8b7KSZzAx7Phufu52GkqTvHPtev2vQU2MTWAXK5K28//ANtE6eOVPXT9jFlE3zm5XZgJFRReLpJlEVuBELTpHzjSFcmUthj9r0qXEQMuEMKSfYxhaULvpKx8NcqroZ4lSpjsFZDGElq+19m+9WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785267609; c=relaxed/simple;
	bh=DME2bxOuBWHVT2Ozl9o0AuOi6bZJacMW5sFLBLDf1co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDVYvohvy28sgi326G6PfPNrNoSCfp0RHhHtGUrGgxGYdKZ0YUeOH/ca7hFSudgh0xkCuyVfDdnwf8Riimd4c1kxzG1m0TyEvGLHdq1WAUgZvNBYaA3PyxGrgzbeusPezM4o6+wi94f1AAZSka9/cn6A1uR5+6XZ2HsIF7bbvl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZ7lJhQI; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZ7lJhQI"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cffd93cdedso264595ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 12:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785267607; cv=none;
        d=google.com; s=arc-20260327;
        b=EQnBgN3dSryWZ0x5kPmLdMLgCdcfHEvL7MIaOJRlMkFeNHr8TUieY2048ZjoYZumIJ
         dWjOx+LE8ui28rCdurlua2iTbtdOWtsfPtxJEO0oo1mE/EOeEwkbiijpwtctGmDf6JYi
         UqImYVKTxRtrCv41HUvbonAbIw4p380j0GjXK86NZDTdwItabPW3Gm+2WItNYEc7fSkX
         37Ea07zoy9xm+Y04nmj8NiOINI5UB70tBMH51oEN4UCnJXaRMePsxedKMEWhW22RdFmP
         MJD+ddiDPsi78/g906YCEhyIqUlJyw7TfO4Zlm19U/yTIN2V5whtwxwkKd2h7K8FnUxb
         Q3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cpPQ24EVyvfhB0gl5C6A7Ib14qQkrWJ9dSg9UQ/L0F0=;
        fh=A6L3us9dzAPaOm1sZYsCZNd61HemSkvN92AYYdgLygo=;
        b=fCyxZPM769zUy2w5USjV4QQDK81Qu/kdmY3N/3QiPugzQyToI5Xpwi2avUPxGvA/sD
         +pWw5NDhh6cY4KpMVWXuJ2Dc3RwsxnVf73h1D5zEQuvVZ8bFTOqEWh9WsxlVaO50XzlL
         o2rcz8ci7QJtiQMXkJhW590W1+C/IgHV1OleAcefcVnTN27favOfmBDDuOLUsuNQfGzT
         iXh9qlE/dBvfs4riik6o4bcQJ56I7OK+UgokHM2ZVbQtj6kQzDRp0iXetD0ie6F+zY7u
         SQwDh4FglG5FSFy6IkQtzhbecPAfXgA41SJGjkYIf/rVuzGcZNRqD1z1+F7nj8B1y5b0
         iMlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785267607; x=1785872407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpPQ24EVyvfhB0gl5C6A7Ib14qQkrWJ9dSg9UQ/L0F0=;
        b=HZ7lJhQIXjTK+d8x5xZcoR/OZ2gFRmhqGSFa1SNeglhtX5QbilvRIu0kv5z6TqW2K3
         7WGyAKwKrRgujAp2FEAg28XOmEGbZyFUKrhfio+BsgvIyoaVBmO0JBIwbpEPvfYsETF7
         anjcqw3qYikxsILEChoK29sormLxoTCrKxTrYGqxj748kPCWsTy4V/1rE6eu4+DUhaZD
         82+EH80KRDV8+7xKDCnej37eZbDqSQpHb9S4QBcXIsx8Ti3gc7UYpx1giwxubIDezj6b
         GSMHds9EKqiLQGJWn2AVF52nvP9FBdXHQm374bSYj+VSKXr4COUd1gKiW+V03gAXBGBN
         2MsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785267607; x=1785872407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpPQ24EVyvfhB0gl5C6A7Ib14qQkrWJ9dSg9UQ/L0F0=;
        b=PmXwOUhIPgCiU/Akmx7lSlU+aM+w+wYnEG9z5sNZXHVyU5eAXm1cUEG1Kd6XTRZ0gF
         H8OXUvobMYaYwFg0Nrsjf7aFZbwp1qjaOXY0fEkVAbeZ4J8fwXG0bN2tT47jRcJ4F80n
         b6uyh9dZqLcBhq9YJkPhRh7uIXuBrEdjDPQo9YFSRF/xqgbp4SUzNNaOUCkhN90l+hTw
         BzlErpci9I9jERyZd1lPnUy8Qq2QqLDx/4OMvUBrDzNsVU3cSTSDH7xcFYXpTtVxeFLy
         l5iD9/6NT6zGAPXD0/Uyn76ioaHJpVEv45bDUTkVxGQjR4EkmpEPPKj/SrhEUv8eZkLW
         j/cw==
X-Forwarded-Encrypted: i=1; AHgh+RpqIASmr8a3wFMU/fVRQUYZJZY32as/c1AzyyeZs6zYja9Mm7MCfzG1Lw2EwbWiGSiJiFe4B/gT/v317S4tCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHLHgfBZnUYvJuJYK3PVMzdWXtdGTutb5i+FX0mpZzBvodCm3z
	UPPTvOu5ofb2RLR+zmmy8qUTzIjayFzZDq2sNB1BAcgIYLn6EbvajuWGA3QZaBSgO5Dq6z1DSBj
	TBsAdUWVMLx5Vixs4Jp/Ra0bq27sjBNg=
X-Gm-Gg: AR+sD10Y0G5WiuUu/ETkAnjsZLsZqZVrhCBRlVYWzRHNSKLWaaZR1mOFZfY02BwcdrX
	bbhZkL4pHFvOsGA/0fanVS7htURcRMs88XdiyL0R3vWr0l71mEbqX/zITr1D1gmpr42nB/R4B6T
	jGHoa/FrcTL9908a9bJxQDuRf0Bvpk5+v1MW/xwUo5ZqKeKz42yu34NCsNKLCmmurqoT+tnWCsZ
	RECGuBMlRN+GB7td4cw4vCYMJ/2+Ei9uLZCKDpY7Qcz05qhRLMytykQcXUeI8RZMklZ3hcf3NDB
	k1+gm1yW+5tHmb59i0iTN0UQ5GppPY5FsD5y2GsOAuSF7PakV4XfAxoqGr78JDVYJw3tXS710cA
	qaB9yYkXOxXyCuCh0O5pMTiDh9E1YKnR/M1loovgxf6/WR7nD78eYcSF81SO8
X-Received: by 2002:a17:903:18d:b0:2c9:d8c6:1db3 with SMTP id
 d9443c01a7336-2d015ca0006mr30230635ad.8.1785267607090; Tue, 28 Jul 2026
 12:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331190053.482607-1-ojeda@kernel.org> <d47bcff5-ae97-4a27-8348-efef67ed3d98@app.fastmail.com>
 <CANiq72nFZT0ZZS1R82qVjPg4A=FEU675-3yx+tv3XVA=twnUWQ@mail.gmail.com> <18cf2372-0558-4a90-8faa-bdb2ca1cef61@app.fastmail.com>
In-Reply-To: <18cf2372-0558-4a90-8faa-bdb2ca1cef61@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Jul 2026 21:39:54 +0200
X-Gm-Features: AUfX_mxieED903ZVOSDzaT4nr5jZsRFAL90RWlFLtxi1t75KjzU4CBXoDz2O-m4
Message-ID: <CANiq72nLWbdu1yW_tB1T_=JVhVeD9bnfnDvWYn0Qun0bEVcX-g@mail.gmail.com>
Subject: Re: arm `rustdoc` Rust 1.85.0-only build error
To: =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>
Cc: Miguel Ojeda <ojeda@kernel.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026 at 7:19=E2=80=AFPM Fabian Gr=C3=BCnbichler
<debian@fabian.gruenbichler.email> wrote:
>
> Happy to report (with some delay ;)) that the next stable release of
> Debian Trixie (13.7, planned for 12.09.2026) should contain an update
> of rustc to 1.85.1, which got accepted into the proposed updates
> suite today:
>
> https://tracker.debian.org/news/1778462/accepted-rustc-1851dfsg1-1deb13u1=
-source-into-proposed-updates/

Great :) I see the update also on:

  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1135220

which I was tracking in:

  https://github.com/Rust-for-Linux/linux/issues/350

I added your tracker.debian.org link and the planned release you
mentioned there too.

Thanks for the update!

Cheers,
Miguel
