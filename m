Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB47396B98
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 06:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085574; cv=pass; b=fjofjLt7rFUFTjwxBacjMH4ZEpQUtnUuu6ZqY1cAuAXo/MSzeO38kmYRd2TXw1+2NIo+RyXBX71b6D6vkhKGTzyqR4o6tOwj9FeklCeamiW6niRpRiEbVCQ40fpsnVseJAZXxlzSxrDV7brp3xjjQVQ8xaWA3+cCMx6Qx+Jzr5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085574; c=relaxed/simple;
	bh=SC+hj2r7sZy/orUfu/WbVe9pukvOsniWE/J3Y6s0KGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oW/ZXXyTsl/SIcvL7Lvq+92FQBdsmwjGX3TxyEPA6ISA5epERQXU6CX3OCaDq6PFFVJj0ae48rOvgMFPNd8OgmvrcnVJgT2CrXJLi1ofZ/fWfQS+brUS4UwGzJD8hQSTewMFHMrXB1IFrEqUYyYDgDLQPqYKmCq3Tevniq04xYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1aauYyS; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1aauYyS"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c8612812170so232409a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Aug 2026 23:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786085573; cv=none;
        d=google.com; s=arc-20260327;
        b=fEF+yKepi9PMmWCh+y0eXq+FEvRxRvU6gNOpsN+OYm931QoxxDvJuShUNgxDuCVDah
         WIMVXNGKg9o9EtHhTURNjkTij4bUZ2O8Wyj++M6E8ZHkZs1Ax7UQfU921TJvS+aw3POP
         x7kOL2XbA2VNy1ICeNsE+UCuHA9yUyjUCht5/s0G/fNQ9lJ5QFDM3MXNLISra6cD4/GT
         nwJ39rSC7aP6wf77eOpI3YzBxuX3hkbgamewGpc96D1bk82AQd3+ZXL0g6Ae153+O/vI
         rYAhBYme9HUcgBOMpsNmuFI6pkFoMtzMrO8VNoXMIXhxE+OQSy5WTxuimLBnizQ1yjbM
         kDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9ZZb4uA/vUP3DFegyRJn+OPpJApz2OlWvu9RoArL4Bs=;
        fh=f+yNwGrjD4rmQY4O4MlsjtLPPl1ebLxevGYpLdzOlvc=;
        b=GLubvij4SYcHvBiIo9Tx2/Np9rAZddaa+qs6A4PolQH/E6Z4EEImFiKn+lpIrPyppa
         7f4r0FPJYXJ1r/WLpGwSt3fh/tjY1rhnLunFzmwIMmzJAsAppmuLwJmulsIps1NbbfOo
         ApfNPcFlxkjKJNQ2zYfX8+kqLa83vHOuR7NYrVJL382WrY4xeKINpHh5G+IJa4zI33Vi
         n11XAMufZZRfsAvybW0/no0c0GBM3WGpabWPwDLyS00Ije9gC+53+EEnyuRvO7UzL+W0
         +p95eUPgKJqWb7+2ety+UdDAu+fI2JbfdkhSgYB5bNxntYPYfhE/o0ESqDC4xLt2RlQy
         HHVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786085573; x=1786690373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ZZb4uA/vUP3DFegyRJn+OPpJApz2OlWvu9RoArL4Bs=;
        b=W1aauYyS0vo4qel7/smDKdElXkfN6VsOKVYu4VChghpXyx4zCl4Oc+wv7S9eF0ulyH
         BMZZ+okpYutTBVS2tMr8Z4TDCgc+ZK0V9pX6MphxbmX6nso2EPCuQxTBLbrvrGQJuGfU
         cPM7sq9pnkMeSV8x56v893qmwLs6kJ+MXGdP9C6vwVftgxaUPKL1SRuVjMop2ThaorWT
         dtc0JDVEdfmMgM/atXyVCbxENimtClj8WV5MxDLLzqE7U0g82or4O6nX7ZUQcbTp/u9s
         LYpGUt/aYiEMTsZAHMRNO8e+IZxTx3FyMI/NYhekwzYKO9N7R5Ri9sUP2RDLuldjZL8l
         sQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085573; x=1786690373;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZZb4uA/vUP3DFegyRJn+OPpJApz2OlWvu9RoArL4Bs=;
        b=eKeMBCkLZef5/NZImj96HxPqKoxU/qqwcqjLHX07yWUlynkmSZ96Y4pD9EmQYElIM0
         QRb9WS8XK0YUtf14nW+1mxbAnRJVKp6vk+AcgOPADpRB6A0C+ARMu4PImdX5B+5OXYLi
         eA9rxSqDtm145Zg1Mimcj7J44MjIgcbdwOdpkTEmyCOMps+OBQXRBjJht96f9n1LY29b
         DpDLLD8+eWYK+Ppy74/8K1zWJzbu60ltRAB+VYaVgM8NGnKIxH7RCvD/xBraSvMYjmaD
         QtikVdhzdy39HLS1DymqQ4DUf8jPEk1WJR5MmJ8ilU+4q4XXQ5hMMMrZnnuJEOXp2TCB
         yaXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJ2XVEidtjiFTxO9Dp0sFCNjhLMSAv5xKJLgo574qrHRaq6pojr78BjNqABV0y62D2NwxFVUAsNDeZjJRbfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV1/YGF2szxgktRI0VETwuox7iiX+0EkGjhJRBjSnbkZUK2TuO
	Hst6IPHf/8zRvwwDehaGNrIhZC2R/OkP+zZJItUudoH4kACBoeDlHNpszXzICJzjeJOxJa1G5ns
	DvAr0tEwbGz85fk2Fz2MECKzYF/RxFlk=
X-Gm-Gg: AR+sD11WccnLmwm4VuOf4mYaHyUPGUVapaty4pyq/UNbS4YEjnU1eW/NhZM908fcVzw
	0L8juY4xZpd1gkEuvw9sks7rLFukkZTZSgzVhpN6R0idPqmdZftWBNONgaY7K+ETMzUtSuiP+Q2
	A6fyYvLkPf1agf66RrV9NQWmqEHj7ykYm9ygRl9LMoZ8ZAaO2XvBrQ04ZRxJPTgwD+v7pGvEaAu
	rW5Vfs/K1K8/ykSKbKJpAjPbZty+ORo+ksrfi9rqNc8MCZogqpze1fALVFwlFVUZIfv//3AfbQP
	FSSTOxuSBzIDp1rMDZoNIw77x4bZ8jXm5D+F4gjkAETk37fNHw0WpXpb4BzvaZEFXXbnZcEo6yg
	W5dK3ubTgUw0Mivwd3FZPK3AyHnkTGudlb36DlFfl7EFagCS7bv7iJnAEBq7f
X-Received: by 2002:a17:903:184b:b0:2ca:ecf6:9105 with SMTP id
 d9443c01a7336-2d0ca6010d1mr169669205ad.1.1786085572579; Thu, 06 Aug 2026
 23:52:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801022501.722493-1-tomo@flapping.org>
In-Reply-To: <20260801022501.722493-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Aug 2026 08:52:38 +0200
X-Gm-Features: AUfX_mxj2A-IR7_iAbCUKcJ0mhFhqopvk-MPVA4_QBPaPZ6FidBVU90MxLk2040
Message-ID: <CANiq72kzmPnu_UPHryLMSwGMmTruirNUL5H+aD4tMiNUqqRELw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: bug: fix warn_on macro build error on UML
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-um@lists.infradead.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 5:41=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> Use the free function `as_char_ptr_in_const_context()` instead, as other =
exported macros already do.

I reproduced this and the fix works -- thanks Tomonori!

Do we need to use the free function? i.e. this is not a const context,
so should we do e.g.

    $crate::str::CStrExt::as_char_ptr

?

Also:

Cc: stable@vger.kernel.org

And Cc'ing David for UML in case he is interested.

Cheers,
Miguel
