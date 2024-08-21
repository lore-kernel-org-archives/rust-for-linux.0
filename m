Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3998614A624
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Aug 2024 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724238146; cv=none; b=XMgTHTq0comRcteSUuQd84A9GkPSOGL1BJnftSrrONPu+SimBiRdAE5CQfMz7XhgUfAc8jpje7Rb24yPb+9BLPen9yieNTGkTYgdMgsJLgQ60+EJgWsa5JE46Jx4MTiLoSYZ2vttuG/z8MjQ0BR//AZPINmWuXUY3l2PyMGTFsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724238146; c=relaxed/simple;
	bh=Q69u3s6znEibL2nrdLZJ0oVIBCpsr1Pw9TkJln4Hpw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTn+3HPOyks9VylQ95yF6pGtwDr2GTorVYzZ8hoalRguYFyLaoMI/mdEDhM5Mif6DJNT0gmid2rYAAkmL+z9BlBB0q+8/7LU1VY7avW8BQidh+AgiTDyCyoFlbFYDdsim78k1N+TcqD1wHU9U5LWSP9XjGcWOUh7Lh213Hrnu/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4L+NE7t; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4L+NE7t"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70d2c0ee69fso53730b3a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Aug 2024 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724238144; x=1724842944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dRbAXO2LsR/RvpbzIEFop2mvkzIduzNIQqtnzKp4nc=;
        b=V4L+NE7tg5zD7YhYMhaXz8LvdvOMEV4OpTaC8+kA2b0ahgkibgrMbpbCgevAO1EosM
         cr0PpwvprtcRLwPUnAa+nEI4MtJ0J+eKzJNbE2yhBrwoGjdsHg7HcJTUr49KiuQgyWx0
         8n0OCur4o0VqGGwZWbEZWtaNZNPNuvJyz5I/NykYVkKzQg8hU26NS2zlkm074v7VkOw7
         Pr1NRtUamzYOK148lA7B9ouK5StTkgGO7jmCGSWKahaFi0t37JSdYITTyKTUSYu73ZPe
         LtO07bX+BoVp3FpEAuPfz6SoaQrBHDNPk91QXRTLgLaxKoR/Ec3HclWH/Gsz7FwxhFhu
         bLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724238144; x=1724842944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dRbAXO2LsR/RvpbzIEFop2mvkzIduzNIQqtnzKp4nc=;
        b=MyLrjbj+zxU5FzoBdTIY5ED8lLoEPptbltIq+5Q0MPgtaKqsBn+mhTWvpd+w5aUIlx
         srgVs6yeJOZMdfTtz/D+3yr5cz4ICJqvV0akDLbStmoa/vt5KwhpCw0Px3CvEjmjILZf
         MOlfrIAdjo3SJeAvfPPmaHzco9mLTfcsujedp6Qkquab80XpeZx8i3FXWdJNGjyiAGK1
         pZ/zlWaacTtdwlzv6SbF9WAa6ZkiL78zG//NTu/DRB4MDWAajyeyhtGCvHPIWiha0Nbl
         0EDbyCcpwYheQQ2LzBBpBRRDipSc07pvAREvj5jqBkKab5HhvsZSpX1br1y1f/lye9AB
         UhSQ==
X-Gm-Message-State: AOJu0YzSCpI9tZoDtbYKrvnrp9smH+Ut8u1J4OGNZGCy5U9IhEbVg9dQ
	kU3eES2tnm84hvIgluFrQqFX6isBnP35iBUBdUwaLRQcN9TiNHE0lz2XPeVKdo6kCIiPubC4aMe
	8wu+FuWkfqB15dl54nURhcTHO5pQ0P5oO
X-Google-Smtp-Source: AGHT+IFh1cgEgi9FpP9ye1LlwndvjkMRTA2gcAQyGPPFRgTEQKpgzwLch2++kcvNTmBEP3vd+wNRHvZR2Vnzy7m+CCM=
X-Received: by 2002:a05:6a20:9186:b0:1c4:88e1:7c3b with SMTP id
 adf61e73a8af0-1cad9ff33bfmr1227636637.1.1724238144412; Wed, 21 Aug 2024
 04:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819205731.2163-1-jubalh@iodoru.org>
In-Reply-To: <20240819205731.2163-1-jubalh@iodoru.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Aug 2024 13:02:12 +0200
Message-ID: <CANiq72kJcnMF=xoBTC0fW8vu6PQ7+hTMG0pCz62GgHEK7oiJDQ@mail.gmail.com>
Subject: Re: [PATCH] rust: fix typos in documentation
To: Michael Vetter <jubalh@iodoru.org>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 11:03=E2=80=AFPM Michael Vetter <jubalh@iodoru.org>=
 wrote:
>
> Fix spelling mistakes in code comments.
>
> Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Applied to `rust-fixes` -- thanks everyone!

    [ Reworded slightly. - Miguel ]

Cheers,
Miguel
