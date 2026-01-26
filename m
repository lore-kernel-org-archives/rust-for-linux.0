Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1432367B5
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 18:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769452672; cv=pass; b=McQMQAkIk4/Gu78JPUHJj7TCEbJV7khILPLKZAB7eG2GosooEejW3bJp1b2qt8aneKmJIf6xu67aUp0ItCUxBgUk1syThjWuJcSlw9ZmbIzesSZahn5+QEuA75HijwMe2vCl+hKGIReKPah6OHTt0MyS6y7cO/drH1cQ7z6LvV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769452672; c=relaxed/simple;
	bh=WpzeHBLSY+xjuvTaXlTYLto5hsZOV2p2fQ6GadC9+lI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mIro/wVvH0Tyem2e51vrWvCngP6wjS/YVd8hW+FNN+1bmTMKXNEEiuuAqupFlD15XRKTXtWw9SSUzS3h5uAFa47DXvvtOIZUuQMGIEKhSv7pc4DdE3l3WDN7KBZTBTfbABr7DNnD5XfITUcgMoA04F2bBwGTA1+FHCjOJbRzhps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAwliWU+; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAwliWU+"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12339e20a87so344805c88.3
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 10:37:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769452671; cv=none;
        d=google.com; s=arc-20240605;
        b=SvwxaW3FNEKPBZu0sk2xKB971T4KIHwb7ONKoy7YfXUuKdVE5Trw0uwRR9W3Vuwdpm
         /2yKcrGZEfx6oU8r6ab1VMcL7PFuObMJupqu0AS0oB+FsisxkJIbjlJKrUNsnFPKNdSJ
         FRJMJFOIcoa9jVzF6YXBhsCr2zrO59Nr1zJxVs8c4QJZbo2T2EM1YS0YNDeVA0aXskZC
         /ThiJVCTpopJwWw4pSe9NWcePdCib+46folR7fW70oVjIG6R0lOlArCBg5qGMYSBnDE2
         8chG6JoUWbuOOLzlSweMgXpeBxTOD27Et30LnRtWPqV0oOZZUEo0UxBzL6VlGqjgrE0J
         0ITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WpzeHBLSY+xjuvTaXlTYLto5hsZOV2p2fQ6GadC9+lI=;
        fh=Yd/scFRfW1fAEFDLNknWSDkcc1ZjfCOHOb3qxjZJrGo=;
        b=V9foJACClhCw1AOoVCv3wy6O9NNyReoErypvmj4b68/ez8ex231stuWnoZON/XvWtY
         TkjZhSw1Ozltlm+wnoRU/lUHJ44R9q86hgaPsr464UEoj0oyPTyTNqwgMFvpnsxtx4nx
         XwOCoFIcin7XZ+g6TQL4Cad2nO6P/OL++mp7ySCE1kpgY881jY+GINBbhoWXm9X/sBnj
         kiZw5MHGilILHVP0y5oXZaCMBuul4EdsmNdBS9BrCI+UAarhNSqgylFhKxFVIEnQAe+D
         5R5SH/1WILVTuqE6bXGbrH5yEBBwsmkVuFXEnr/qzP6I8MMNHGTbmg/ffK8IUnBThZ/Z
         Z0ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769452671; x=1770057471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpzeHBLSY+xjuvTaXlTYLto5hsZOV2p2fQ6GadC9+lI=;
        b=DAwliWU+My4OAqdqsJI2kCUXR8pJnuClvl+3HXeqUu9nvuTPKT9AmkJI+Ynb1uyRiO
         rQxTMdtL6ajLwxvvYDTkUX8dxWIKllmqh3KorzKlCPeWbgDniCOdWctGQ5JF5v9wDASL
         kkieUS9aM6gl2dc/qEmleGaU97xH9Yz0HplEGqWEAx3JrkWp8JRTix6wWSUIfvMjghbd
         stB+vGU5uR1ZkBsS6gxs84WsLBRIjErtIrMhUzpg3Lje8LxyX6o5JU06CwWS+u8UVkS+
         jjrRbhgd5CI+gDMAT8N0GVCwg/5Fi2/xsPnDeslyienqniYX1zyW4dvdyP8QM0zPjHSi
         OX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769452671; x=1770057471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WpzeHBLSY+xjuvTaXlTYLto5hsZOV2p2fQ6GadC9+lI=;
        b=Pi5WlpmK1NI0Vyl73OpPPT+DFT5ML/dt1Mj2Lc7OuOXFjHN7p5A9B63Ak+tOuAMgqS
         6e8i+FwgX4JaKypRORFjvf2+HmjhxYqutNZWMUvEfNe6TabX9OoA6IsarIiXTp4l9IZP
         jenH0TYtmKPezyLv6/sMLWowGGAnfvUs3ukIVNB6aJDnmpqC7DHTrlBTzClDQW9IZevb
         AFqBwqAFgLbFrSGhPFX41aPSbqilZzjJTBzkFcuvbyGfVt6adHXOA15GTLfl9Spu8Ism
         qnJxbI83vg7u0I+npDPahTZCU6nJNAPGCfqw3aCMg8TEawqeoLV1bxS+yBF+v7L91Mzj
         0FfA==
X-Forwarded-Encrypted: i=1; AJvYcCVdWJqNw5fsnnU4qvnqnq+a8dZPzgItrEQYhz8hSfKM+DEv66i7puO6mrNGR/V7I5aiuFOxdrGGbEa2YNHsEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW5hzlt9DWKc0qJXvCD7Fa3Hxd3JK1aZnfnoILHzf9icQUYYau
	YBOj7imy4VZwniAwU6BlA23NXR79kU7STU4xn5VFZJShj80afse5oADAE5uq3OtN0bNNw0XbhFe
	mnd6/3kYPkEdA+bEVMQkEAJSInGar/BU=
X-Gm-Gg: AZuq6aIaiIFI6tavd5zXR4ZVxEgbbya0zOGhNxC5/Nsqk31Qpn1818jIFZqVZE6VEsf
	5BuA7LcWrN3ad1Vg4XRNLE0V9uTiFMP8pZCZ2+fxtbkt8K7Ln6qr3Kv60xLT130tURWRoLWU2Zg
	mEXUF9YHhakjgmpUdIBe1c8oTSXrVSKIMikF6Rq6gZwGhwu8ecRNTh1vcP/Z634lxeVNkv7SHsM
	QdS3DNjdJS7nMhS32DIRqF/y1uZvE9esqC9IeLLg0lYnKOzWLfhhBY58oZYJz2WpGQIyCOY327Y
	KAvhiauZlXfa/mktTi4YS/V93JrFeaTJAYTHSiKmlNacVsPPycchlpakzo7KlHRzP5JXJHDcpJJ
	Kg1q5PNmKXiHU
X-Received: by 2002:a05:7300:fd05:b0:2b0:4a1a:657 with SMTP id
 5a478bee46e88-2b764827c0amr1293844eec.8.1769452670619; Mon, 26 Jan 2026
 10:37:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123172007.136873-1-gary@garyguo.net> <795qzMaJiv4J6R3ywJGnvJsSEz1Oo9XKAOGd3DhpySquL_JrdxisQmp0NP1EPBFuvBshX5Tcb-ld4_Pu2nfPFQ==@protonmail.internalid>
 <20260123172007.136873-3-gary@garyguo.net> <87wm14rzz9.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87wm14rzz9.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 19:37:38 +0100
X-Gm-Features: AZwV_QjWY_AZnJS2reuCtbB7R_Ey3d630g_c6F3LtKnM0bZ51qre9qmk1Xtwcpg
Message-ID: <CANiq72nLrYzc0Pt0COX+gpQUgwgF+nO4jYiawdW8MATm_b666g@mail.gmail.com>
Subject: Re: [PATCH 2/3] block: rnull: remove imports available via prelude
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 7:27=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Acked-by: Andreas Hindborg <a.hindborg@kernel.org>

Is this for Jens or do you want me to pick it up?

Thanks!

Cheers,
Miguel
