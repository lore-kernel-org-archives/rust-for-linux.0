Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700909;
	b=l1lDtXsb9kP24gViZFsyGKTXG8RwLbgVtjOeT2q4BIZpwuGOXa88BLb28W8/CP+uNglm
	 Yr7g/Ujw7fCcOgn02gJNxTdCpHPG1oTqPIyOu5TqlhWiRT73l3WN1gnxjhDEOJPtGtvw4
	 Q7lpMkVtFkiJk7wfMakFJ787WD660lcuzJKGhUH/ZOr2aPf+Uj2fzKRawl8w3zjdu67FB
	 qqU+wb9jfztfZuTLkyWxl0x2421LLXMrDcw2lhv7q23FkqxSzB46m/Dp8vqkBrk4KRv5h
	 M/MF/J5Tew2olxGoUlnOMtJjhIEEmQ/bNFw9pI/CkmjPTG/pFS4AZUtATTh5580loXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=VtBIJPjXIIg+HHFMzUuDZRNIJbDv3nZ6Kp6imhbfLPM=;
	b=ug8gsAsIbuuGm2PocP1XN76DNLD0RNBTUj1q/3tkfT50+zcjZAE/vPbJ9xKvoyLgGZMq
	 5XFH2uo1VvAGdSio5seaTxs1pUPm25JzLZFQgYaPB4wskFrEU97eF9vxhIRUctfwSRSi5
	 oYJznHp//Zo2yW1jE3xKEqnOzuO1Hx4xoJKD28Xlv23M5xk/aJhcn0cBxNqilZeXBR1Jy
	 +ypMQVN77sn95GLcrx+ihSKZdDAI3lqo9vrPAwCtwOhKmJjC3oTrzzEY8+94UT2RXSqzp
	 OEgV5Kc3MP9pzOMRbT6eNPrHHLU1LKT47MGpbA13EPwUsJf4PcTovZtbMmD//ffd6mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OQBpUL/z";
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C03606A31C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 13:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQBpUL/z
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5ed2f163a2fso2256193e0c.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 05:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795700908; x=1796305708; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VtBIJPjXIIg+HHFMzUuDZRNIJbDv3nZ6Kp6imhbfLPM=;
        b=OQBpUL/z+LIsM8xhyvJfSd26SnpwITX9l4cvtx2mpX2NkUSuWVKRbjhtC95H2Ndwx0
         SIPVAb37fNdmSYmSmppM2euqUf4jQ05xdDdYd7GtMk+aqD/LENyNhBClKX7BzyOCUqtO
         snE2f+a/82fzcF5ftLsvehKWh//Hu+URoeEAlzPqjPKZ9Z7MqfwiS++QstVKQLT4tonu
         zi8x1HXC+Qkmt7qeWuC4fOlUJkwcoYNklEBKIYB3W4ztl/3yN/jkp+IjMrpwyXtOY5QT
         P8iDNEKtvPb4JQcGbb9x2JksmupBgTUsun6xh2lZxVVKY97i8zAyy5OS8sG3Z+T9G/mb
         xRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700908; x=1796305708;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtBIJPjXIIg+HHFMzUuDZRNIJbDv3nZ6Kp6imhbfLPM=;
        b=zrNXYvB9+WF6DzWRlQ4DdOwWXfT1ByqBt7JTYttCz1SC1eNKqbsTLQJ15ZqrlJ6585
         8rHBqLXLqs5OIZc83nDRt2WLtqE8Leub35qLUglFMRrzzBbz6pSaTdOAQNS0CWoTWSru
         AMSddo56k0hd09CZLHyCsvO8wE3FIqTlbMbBgCba77RRFFhl7xvEcO9Ivksd4gRQvi9T
         Etrax4XNtX9BtzELaLKZIx2JnM1d1VSrA5ug+MB0XMO6Bm65oKWpwYl5m9V4il/K9wLD
         WMQAfCld8lcfXrXwNvfdwa0NncA8Ocmtw/eBafPNnSu0/qTPCSCQqEDlm35ZVXr5PLRk
         rSAA==
X-Forwarded-Encrypted: i=1; AL+hErH8zJr0Xx4RgxMVC2Ypy43biDg6tb9Q5ohPEBxT3PURAx4XeB8b4VQoIabrjamhoEj3iF9VpvgczzlGxasCRg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9nfTv7fzggPoEGUPh9MObmqRkfAT6iZswqhv41IxNtiGHBSb7n
	l5wtDDTOU9Ceq9mwf9mZnZYn1qNYCO8RY3g8CjxWz5pRIInsaEEdBIM=
X-Gm-Gg: AZFdTZf2Uo8Y2sxE8Q0xPuaS+Net32dHvsw/TaM3IWB3XZUne+yL4EGMEVn+vIWng+y
	Lom2gGwTABRVQpek+n7YLGJQLqv4ldCam1DDp1v2xtzQZRqF3UH+MsP+O9JoqEH41LE0k3UkqKQ
	B43nZm47kvNx1KZjEphZroZ0HO0a1Nzj38o7Q+wBB6SPnlgTdpSms8He9xkA6NXkVpNAR4uZOJh
	jE+5JanzhhpdX3e7qdO8bdtGrlbXPSxaD08Jn2PG7X0AcBc3rgM8xVieWdLT1s8wbpwNSNaEfDl
	uX9308zLKD0zaH1BX2/bN4u33BT98VWR6DCsl1Vln+e04h3DZtHZRxcMlFm0Vjj+QgJgNTbpcVA
	C2Cxhz6yoxrL4DGjoNNsRGA6po1Hrodno596IT3zlBLR6Gn7aEsh4WEalKtXXahJNFmC1K31n2i
	3PL02LLv6tVygsauniTfuUxt9ezuFIOTHFK/cxIcp68h/1+aiWmc7uAsyrCSwDcPRIxuczLoIIa
	SiF3hTI61DabByXXcQdnrCpuqwVTxJk1LgmERb5An6kIF4AvrHIXoUmmtH9QS/FQXMdin7UTBGD
	oImmdQ7xsONbNkO8s34sNjocHf69E+1dhipnrXJfG6i0CRjoxL3GkkSAoltVV9rVwg==
X-Received: by 2002:a05:6122:3295:b0:5eb:2a6e:d3a7 with SMTP id 71dfb90a1353d-5ee8aeeea34mr11674738e0c.12.1795700908379;
        Thu, 26 Nov 2026 05:48:28 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b555137sm20586545e0c.3.2026.11.26.05.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:48:27 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 10:48:20 -0300
Message-Id: <DN56UDHKNLEC.22J1K2RGIUUJ0@gmail.com>
Cc: <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <dakr@kernel.org>, <daniel.almeida@collabora.com>,
 <tamird@kernel.org>, <acourbot@nvidia.com>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <oliver.mangold@pm.me>, <igor.korotin@linux.dev>, "Trevor Chan"
 <trev@trevrosa.dev>, <vireshk@kernel.org>, <ukleinek@kernel.org>
Subject: Re: [PATCH v3] rust: sync: make AlwaysRefCounted::inc_ref an
 associated function
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Tran Van Tien" <7enlab@gmail.com>, <ojeda@kernel.org>
X-Mailer: aerc 0.20.0
References: <1795684556.6d661f19@gmail.com> <1795688552.31c01b07@gmail.com>
 <1795689815.75b422ec@gmail.com>
In-Reply-To: <1795689815.75b422ec@gmail.com>

On Thu Nov 26, 2026 at 7:43 AM -03, Tran Van Tien wrote:
> In-Reply-To: <1795684556.6d661f19@gmail.com>
> References: <1795684556.6d661f19@gmail.com>
>
> Incrementing a reference count must be a deliberate act, and every
> inc_ref must be matched by exactly one dec_ref. Making inc_ref an
> associated function that takes a NonNull<Self> mirrors dec_ref, which
> is already an associated function because the object is freed when the
> count reaches zero.
>
> Having one half of the protocol take a reference and the other half a
> raw pointer makes the pairing harder to review and easier to get wrong.
>
> This was suggested by Benno Lossin.
>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1177
> Signed-off-by: Tran Van Tien <7enlab@gmail.com>
> --

Hello! There is a patch that implement this [1] with some 'Reviewed-by:'
tags.

The last patch is from June, maybe it can be coordinated with Trevor
Chan or you to take it over if it needs some updates.

Regards

[1] https://lore.kernel.org/rust-for-linux/20260628100731.64885-1-trev@trev=
rosa.dev/

