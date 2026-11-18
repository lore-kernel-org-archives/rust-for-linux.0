Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795044113;
	b=CZ/OSVtlGAJI1KJXjxpz0BnLYl+1soOb0jrSCtduMTNRMuMcRPrFYwonw4ZOXt9bfdCg
	 vZX9frEOwSnIRA2A13ghc3dwrThbeHtMrIjKjRis/7rnmnW/8qs/mZLzil5sB/c1kXqU0
	 OZ/+y0Jmf78F9s6M0Bg0nrxPyKt205h+B7oUWEQqGKVz9itA4Fn/HElJzxRZjIDuhQ0Fq
	 5IZeYXbYAn0bKeJeAN7tMbxY7MvsybsrGSR25xTo3DjZOo4IyA3u8x3WTmF06wqlETNF/
	 TT5rAKD5z3AjcMKTSTndNOH/JWmbxzAxa3pzr3aqZR6AvAYy0dN21fGB/+cJ7YDAiBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QcRxO2kuT9Z7+xJgOgcab0cpZGjY5Ok9pnNNR1TSgjU=;
	b=PkvuwgVp4uss6HjRPcV9zpju0Qdfj1H6KaVxeG0eORGUk3X004jv2EgVWe4aU0qCByNN
	 Pk31KedJ9YWfUIwFwxXsGC/sWEE2vFBL0pSDNi5sItdSsiiee4GLn6pnflDj+rZUbHfBC
	 1VaRRW689iZ80bkKELtJZCeScLJSqqvbNG+gRr1vkK+Mvz7hrIRPaC6OXlxJyl1HgcTM9
	 nMPa7lLhU9iEkGhTweWhsYDdG+L94fWIknLm8wbzEiM70yzyJkvYGsXlGPg9EXEeFgxAo
	 7B3uaFwtIzloMoTUlm7hD1NuNDlRsqhjM9kaVBis+PGSzI0hLkaYETLOVOB4BBYxbGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BHRF4PWa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51745606A320
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 23:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51745606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BHRF4PWa
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so11586955e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 15:21:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795044111; cv=none;
        d=google.com; s=arc-20260327;
        b=FX1vWj5y5sc8208YDWrKp36KKg/MGERIOreVw5MO73fuvDWmJeEuu9usB2VnClV0Uu
         Otj2IxteZ3ALMdfLV1kEywi29ooI24qLPLOdIcfIBuTi454QyJhphTw9TnO3TcxDFzJS
         kKizSAF70ZYLUzWpdn6yY6UffPQsVmBKArgN0e1F2CNijZpOqk0pMh4rbeCaVwnw8i/y
         SyQjNbsWOyHQ+RFZhixYiu/50B1DK0AEcE3hc2i6ooimvOXt4cIJAZFy6xZCRopz9fbl
         fttFWa6dNvU8yyQ7/psOMw16uzDA/JvrqfxUSig0nIOjWbqI0ubzolP94HdBB6lhbXNw
         Zmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QcRxO2kuT9Z7+xJgOgcab0cpZGjY5Ok9pnNNR1TSgjU=;
        fh=cw9jM9iLxLdJVsqGzu09pE4U/OKlM8mhJQw0XinB38Q=;
        b=IFB83eTJSnZ1YO9ZcUiwfpvPbPhRCneG0VuuT3E6VAFRK3iPcKzVoD24wC7OsP2syx
         U6U92BNlZKEwZUjaBlRrKF2SdK7Ir20gy/8zOKlg23pnHei0RiHc8Yp6HEcZKIdqw79O
         4P5l+epZTdppaaIJwsf3piXOCqJn6elWtiif1JHyDERQ6ziNhPsobSjLtKU07icjORG1
         pbHvrxoUjhR49SZlLjJOEH/biyDUUYaIAe1Zt6AYdyHBKi4Tzh6gCiSNT20Iv3WxNct5
         mqQZH4ueq+DA8UYRBCmkvgHyXThJlYgtXol0a2hQ4gBwjsa/58p9iuMBfA0uyN+x/wo4
         MIXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795044111; x=1795648911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QcRxO2kuT9Z7+xJgOgcab0cpZGjY5Ok9pnNNR1TSgjU=;
        b=BHRF4PWaT7gACZGfSTNSEZFTqL0LWixSsam/KqgghngKTFEMf0v2IyWbuLIxNlP4sR
         z4GKVzlPakCRdb7EByBolbSK+P3SV7F5V0XP8hRIR86GVI1n2H8qHz60d/jtZLyj/xbW
         D4ozudJmMLcZAbAw69gOy6VIENlEbLcZlrP7WlNH/mdu2muflM15MPx9/aPYQdu39ExF
         8uvM7+4YASPaR3Kq2stDV2KlUAsZWYtiqFae+cb+Cuhyh7OY5qKbwPzJDH6CoySIVp7G
         usZ+9yl8i7gBKJS7iYNB4fTzqqUxmc7Z8FPwIaKXm3dDqKr/DSEn9MuTK2oIJXD3oWcC
         lhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044111; x=1795648911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcRxO2kuT9Z7+xJgOgcab0cpZGjY5Ok9pnNNR1TSgjU=;
        b=xBtDhI/toXuECVMlRlqDbuD8KmCfozTxH1kcIjpVZhvlUo6402rmUDZS21xymmwZdO
         gsWyzHadUR/b4+gwt4GoJolFtqg/r9gMeF1EEdGBCICZ7JiuxAFhWEwHLEWXoT7Nu48n
         XyS5CND5jW2/3ApAyljb6Y/DxilmkZlNAT6cvo+pMBO0BtAxx5xnrVfRw5uMmjTK0BnL
         6iEVGe//hm6f/h1QG0vyWwRL+22g2k5S6eswmdk/WljavmWqewrUEhZzN+n6WylOuilw
         TcpwQb4QxiKKqYPuEBECkNuPdffjzZ1o5+bOSCjSoGbwL/UBQcpn7WqWJSxhQqURqhzI
         uOUQ==
X-Forwarded-Encrypted: i=1; AL+hErF2AwP0fiJoYQ7zfSylejR+HStnwln+O990S27WeIZJXhFCGQg/zuPSZvZoSSN2j0wVzWTDbzVUyHV+SvuGQQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+eKkSm49kZIElMxyo1wXhsExSKO8ftPVptpYYlK1DuhLNKS/tc
	hAZABiEe9JRkVoYSkSzS/q7viQtq7NXZdcS/BYdoS1qkcKouhuF1wxqWWx49vjegicPynF78Rsu
	+NTef//DtxOcpqbFT/42f+AxYxxm7cztxSUAqwskh
X-Gm-Gg: AYBFou2/ekmbkuBhVXhFNzJxpNNNKgAZwRyEncD/sY6OJQG2p1YlLvg2Iq/OWzSpfTO
	IcfSOM6six6ZLjt+OvMhP/sj/hkcz4oJwUmPBK17NsFg8L+UMv4jIxqLpCivqP7RBrpgH6tYzks
	nxXxnFaNukK+2WkKa8mdm0DJ6pD36Gj1oKH2AUrrqhOij+5wrIGGqb8B159VVP6nA8Rrb7N89al
	6zslRLJo4WRd+kc5zOf9EY1SSGYb9lbRTj6mLzYprBxheHTZ1UkxYYpBvwumkE9V1dOqL0kk10c
	M7Xtw7Er2bW8m7/+VZLywgpDVvlYqWpV1uR1n+An5Ls5Tzkv06VB/b3MEGz9RGdlEVZ50VTJWnJ
	e+Sq0bu4hCtICD81/nbXjaMNCvw4E3WMaSDidSVni+BnhSCy3Z7AhGvGZn9cyxB3xd2Rfn3x9dW
	7C7M1WmPaFJLz7
X-Received: by 2002:a05:600d:a:b0:4bb:7e4e:de53 with SMTP id
 5b1f17b1804b1-4bb7e4edf38mr61411145e9.12.1795044111141; Wed, 18 Nov 2026
 15:21:51 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118230708.2599659-1-tomo@flapping.org>
In-Reply-To: <20261118230708.2599659-1-tomo@flapping.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Nov 2026 00:21:38 +0100
X-Gm-Features: Aa3M54qyk-UmY9sVUkrUOj7ssJo7h0trQeMNNMRhDuHPVxPMgki0q1lEJXcx4oc
Message-ID: <CAH5fLgh9jZyOwWDb5FfjM5JSqKH7poRfxYGcFiuEGq1FAK2hfQ@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: add #[track_caller] to Delta division and remainder
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, acourbot@nvidia.com, 
	anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	gary@garyguo.net, jstultz@google.com, lossin@kernel.org, lyude@redhat.com, 
	sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:07=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org=
> wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Delta's div() and rem_nanos() panic if the divisor is zero, or if
> i64::MIN is divided by -1. In these cases the caller passed a wrong
> value, but the panic message shows a line in time.rs.
>
> Add #[track_caller] so that the panic message shows the caller's
> location instead.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
