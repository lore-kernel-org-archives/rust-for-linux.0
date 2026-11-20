Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795203899;
	b=wQ/2JopePBtb+YgNajcETnAXtexCQYxtYtfhV94/xxL6/nnz3cfDj+k1Jcl3o2BUFwtd
	 neHpImKMNXh/gX3VW68uc3uOnFal17vWGh2keCvnbrX8VlwTPhyav7eck1cq/OUSXjRxd
	 I5kPwsLaqMqHH4gsflUOOrEsDTx3KwAB0yRzbL49jJR7DAacuDlN0HZpNDPSuf3/bRwz/
	 5ceb4Ypy6s4nb6RQfTxU+KnYLZCG6rhEQYmsInKzDe/EGQw0akvIO/ZgcyJW//QjSyz6D
	 YIoYYfCVI6R394tS7wVJXg80yElIPg73ZBEhftwYbLGiRYAPz1MU7DF/ZaE+LkhZsBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x7+tW7HypPO42hLMOeRGLaulRUEYCU/KAN2PcvD0X5w=;
	b=v+tPe6UNvRzouXiKTEWoCoC15zm9LSCfzGJi7n1xjMuu/PNDL/GW+w6Be2r5SdXPv1Dz
	 FhXQfTeJGLh6CrCy9BmCHfpI1U+HOkqssDeoWelq2JmJh+SY9kPDvlOrmhots8jL8TQDs
	 o5qeQ9l7tuHyf+jz33x3/QhQOrPFOTAeITFH/Ht0qfKB+YoWuEX4nGgzuhEZQ/r0mmDJy
	 u4aUGaaWSQrQaC0/n43g5l2wD4z41c7ds2h8YR0Zv1mj0tdEsTcbVPOpRjALcBwFjkxtt
	 eu8V1tjVtiuh+Y4sHiA603zw326lfNsHfhcdZUT5zE0EGsQmrGjL07OpqEgHCdcwT1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gz2eTSaG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C780606A6ED
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 19:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C780606A6ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gz2eTSaG
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c0ace36e8eso88916e87.0
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 11:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795203897; cv=none;
        d=google.com; s=arc-20260327;
        b=lEDMxwv/RkVn2sCI/O0SmumYQCmWBvn0R/h+tU9jOE0VfUhPAr1TOQsXz7pwZf8evr
         qeXe+XrdsQG2RjHJ/qvbprLtE9FxBxrlhPWVa1HjwC0qozXd1KvKDXPaf2NVFe4aKvPG
         bDiGHaHZvPxC7kRKzkKEn6M/uxvKu3D3qDzLBxcg/DHu1hPXnkNBZf7liPPiKhz6aKz8
         Eel0GOKnvXHL+05KKAhxv+jUehIwHg8J/8YKBvc99IioyH9Lzg15jxKjoOCNxzVSTFGP
         Kra5XB1dBIEPckzi6nONbcj2XoHYTpgP/YsWgKMQWfcdkmrR70I/UrBMyyXxBzMHZcKE
         lfVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x7+tW7HypPO42hLMOeRGLaulRUEYCU/KAN2PcvD0X5w=;
        fh=U3JJ0ThqMYkFJDxn16a2ljIdXLb08pkVtaocIRavgcE=;
        b=fyxc/Iy+5LdULIEKVo5CTvi+/4BXqg1E9fOXj4Vu3yXo5rUb0sSsMM4z6l4FkROGLH
         JrYsAYToJawMIe9wkolYFNqZkahTkO1hbBGuSDaQvfXmxxmn+IDBVqqcY/AdjfPBN42G
         irkL7cl6TlF99cjM1xQEIlb9Zrs7QQhvKwyG+jOVJ/5+TDodereKNMlLVybUaHT85Bt7
         0XBHq1VsO2WzbaGFqHcRJdN5gsCS2+ywDIDMOXyXjaG2E0YMXWQx8R87leVWAQ2foR3/
         Hy8c4MSorIDZnyTJu4fUiNaxISExEWvYMlz8dtR99lujb5so4/Fg4Ps4JZtDNaqzpzFO
         YL0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203897; x=1795808697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x7+tW7HypPO42hLMOeRGLaulRUEYCU/KAN2PcvD0X5w=;
        b=Gz2eTSaGNril2BjpKUQtkMs26AMWQizJ5rPS+Q2Y4NhGnyxDR5NGvbHEcjHE99rAx0
         4f3wExIK1ULhLSBl7jIK+O7WAXJ5xQa2drkXltY+AtSG99KzYSYXi3Bu2fXZ+3oDK532
         FNtb3HOcnYZD45Z8oVRzZjBZJXbhplXeJkPWjcP2Pr4+QeYPbybJoAasfa72HA5Bd8lY
         OQPS3+NfQvJ6ZgmGITfkKnhUNJUs+2GWXlQazbhaH/L4bjmxh5rBuhQKyLQe0ytGBJrr
         QHojT1hnlodc4ZeoVypnVjDL9uMxh96YFDn/Hz31SWbD2TG1JK5btrp/85M9MRSz7qNb
         NVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203897; x=1795808697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x7+tW7HypPO42hLMOeRGLaulRUEYCU/KAN2PcvD0X5w=;
        b=fmDQjwcC+2yNdIcRxGIO4ovEWzGB6nw/IXE7hbLdWMVc4Imy75dUphv/gfGAcOHoOm
         /55JIPAJ6j+JU1iIZTjEgCzLbkqI5ZW1F0AA6m9cr1e588wo70g0vLOrZBcEETXJazzx
         2RujrhuKZvO1Up6XSLMe+LIV3aNaeVMvIZ9Oxs1U6vu5IYsgVrwsiIaCjeMLhv2w82cw
         +eytwWHnC9LCZsfrMIOW+Oqnx7VduyUkV34oId1f+pDu9/l4LvOuzktkpGlJFol0tAwh
         jMRjjVhKwWwfQKIvpt4R6t+TGH7XysSyIYMxRVu40K52JFugCsWJYGUWzyRIPYPwkPuA
         alCA==
X-Forwarded-Encrypted: i=1; AL+hErH2xJuuIKF2R4LcyxLDY5bnrCB5lKm5y+eq7m6MH3YEJxQIiB21oJzbcsO2NKkPtj1AryoaAZHdESdj31cuhg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ovzXgKBFASlPupkvfzTZgka5qSqWeA7sGG6ZVIyTawGQAdyEV
	r2svx90eR2nJUnaHdcmD1MvbC/q/jjKW3/CFKPvLIf6fGoon2Xa3XAOd6mP28POsp7zxflR37bQ
	aNAjlwISfhjERY3XbI1Of5oDx0WxX9Ko=
X-Gm-Gg: AZFdTZf94FKyV9YRV/taxDPNaiHDG3oR89HKS2d+I+ZHbklT/D9R7/xiR8jp0QlyLd5
	8iSi76GqceZFTxSeb+kEFNPXUdb1sdGaKsaZer9JlJSlQPQ4VbLNotb12ZY0ii+0T17OshiiOry
	kpiRwlnO6Wv8SFgTTtgfFQKy9blT4pmfr3F6qUyXNJiuX5Mi3jq98pb3zFumP5DVR53fndrGkD4
	KbcB/WelVSU5nJ0ePMqSDMnL4RtBb9n6fbvSCA/dFDgZzIOeM6EU70vOAv/LKUODRi7H1/btSOi
	Xc4B+8ea6+zopK171LhNBbfUczFVvv1zrKM7nC4QEGyVPgufid8oITRwJW1QzCxqW2tGyFUmqgG
	H1GTLPhcg1k6Pm2gTeQ4hRqHDEn9HoKd2gR1TsRMZv494fUFJMLioGkr7d6yGEdAOTyiTuPUQQw
	64ugvEoMOxChwJQMa9dyv3vfkBQKax7Bh4vSCUygR9VFJsguamOl1kzpcPnTv6gytCJIU7Ek9Oq
	i6YHBhz6dDv8O4uNoEuj8DFpCTL99FoqzXXi81YZEVmjgALpqOC8z1TWZxtOWEVkQbAphF99Cxd
	B6tq3sfJsBA/hXX7Kg==
X-Received: by 2002:a05:6512:1394:b0:5c0:da9:407b with SMTP id
 2adb3069b0e04-5c1bc8722ffmr1651344e87.5.1795203896543; Fri, 20 Nov 2026
 11:44:56 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-fix-schedstats-bindgen-layout-v2-1-1c42e4a996ae@gmail.com>
In-Reply-To: <20261120-fix-schedstats-bindgen-layout-v2-1-1c42e4a996ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 20:44:45 +0100
X-Gm-Features: Aa3M54qL7PawZ3rq6zWWS_GSU8uuvKfOSc8NrmthN25EzkgMW8lZpFzXsfgYK0c
Message-ID: <CANiq72k3e5ko2vA26Dy2GmVW+8Ja2xmzPydX8wut+XeLT0uYDA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: bindgen: Preserve sched_statistics alignment
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Jules Mercier <jules@les-mercier.fr>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 6:19=E2=80=AFPM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> +# misplaced. Making sched_statistics opaque preserves its C alignment.

To clarify, in the comment I suggested, I didn't mention
`sched_statistics` because it could be that we need to add more cases
into the list, i.e. I was trying to make the comment generic.

(Of course, hopefully the bug in `bindgen` will be gone soon)

Cheers,
Miguel
