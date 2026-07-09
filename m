Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EAE23392C
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 14:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606434; cv=pass; b=jXjDYnC52BdISBpHeio7ctCxVzOkbTQfE/GNjg5Rb6nsJU0Aj3QxWVBnXDeluwPLbixj0qBoAL3BCNOqO1cQuTQ/98N2KDeJfzwctXQxuy04mV6Q5kvyeJpaMN6m6nT2tb74y/mg7ZYU6/MlHdwqdRlB6cJK/sPtAiyoMPS55Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606434; c=relaxed/simple;
	bh=THIwa+RK6gvfbtOhXyQCS68FClxcC2sC4koXL97cyKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ki1PQZutDx2icx8RnhFlg1TGf4Ec0tMLLk7cQboyMJ3iHM0dlLeBuN2gGspdr9dQEQm/dSYVNeAArlFflN2hD1+cjb06cAUr1atMvC6sS/rb8p7xH1h+nxU+yWeRNifdngfvheX1vibzDBbRnpa2bqvA3ERWWwxEVyZSu7Ym1mY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOjtkRex; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOjtkRex"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-380f3c1b087so211660a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jul 2026 07:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783606432; cv=none;
        d=google.com; s=arc-20260327;
        b=GyIOl+/IwXn3NU3VLzrX7b9FxUv3a/Pzij9WiVmHNFaatj9TJpz0v5ySO8kbgoEzvU
         P/UU5sDflxfwccpwROwU9M2b98yvSXFzVVU/wRpHMR+nhmK/qjXrvx5jrClfwA98JAV1
         vmAabt0zWuZz22hvnts/R7VZQchknTndq9FQ+n3lMwR/qD+6hQAVvtPW7wcwWyj5IxFA
         uFuaXR4zLEuJPJjLfPmuirYcwSushzTVYilhRM61tPyl9o7LdQoQi/JZaptz7SMaSXTk
         TSSWAWNWEqmqhFm2sb6S7hn0ijtb59mLLCLfMEwoHZsRUiV6Z+sG3dHGBd+20kIWnxp3
         Ye7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=THIwa+RK6gvfbtOhXyQCS68FClxcC2sC4koXL97cyKo=;
        fh=vr4REsUsksqhjs30DfqqLwmmr5IX+xf/qXOTMu+Mxpc=;
        b=omzF7ibliJTqYTevaJHT09CZ7akiK0r3vQpCo0YksdE/Abag4uIBP39t7Wc4+okuuM
         6sAVBxd+UGnjJJ23qZJzp9q8ugy97kaD3y/TGRDucUSHJtRM72Yh3xZplkzCWy/a0gQS
         y8I7X38cIwEwpZ7bCR5VtVhiyur63N3j6W/kHGS2jeMl+4LCr3CJQ9Xbdtna8iDTPeKD
         CKreXq70MnKmlzuEvLCFtg8fNTXqXAJUkNFOKb3QOAxyymbst/w0RjMGDYQQ3lEqxF3F
         FB0RqKJ94VtXBHTu8QZP7Ot4ssLjbBQHjkK2ka4YAa8ZFJWQbHpRLwfMOVIdOLGTU0td
         aijg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783606432; x=1784211232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THIwa+RK6gvfbtOhXyQCS68FClxcC2sC4koXL97cyKo=;
        b=LOjtkRexhHEfA2ZplKeDiPtsf46UwNkZUT0P5zEba8i19RIJBD7MrVG0MWVpX4JstE
         BEkeE2eRxcOvehB7VaLPoduUbDTLufNvbQ4cqnWl8+BGipGjNg9L9641qAHJWBKDJPJL
         iIzNffgyOza4CWsXZ8ffFYmfbzVTk2yF4uo5gLP3QZaOMDnjus2O56ROZiriwqweHqvJ
         8LHmEauDqelHrWbEZA7Lw0BSReDfM40wI1L4R/BW9qXgcKWyzldaQc7ftq6IFrO7CyXO
         00oT0lCSKyU7ZqFHSykSlH41Iye/s/fGts9LQZUn4SM4IvkjfB9KFsowdM5PLbQx0GyO
         UhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783606432; x=1784211232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THIwa+RK6gvfbtOhXyQCS68FClxcC2sC4koXL97cyKo=;
        b=Fp+WV8XJYrpYmN1c9XCANIT8KoE4kpxLfNnn4rWiLQbLZ/Pzx0WA3gFwRRDQ+546e4
         lKWNZmy+OKKzLDiwKHm7S4xKPNPs1Iie4mAJPlUaLP17/kIfWJMMIbmfaiPbyODVMJgT
         q/oHfLB3tXItFuFKHQ/aedk+ws7TfFQxooBvIwuE6DAqZz76rX4PdR+yFVQr3/cKElZy
         rzIGBxfRCX2YGd9dRjR0yGmmay7EyI1LCCYVqxTFVtULhFi6xRMLumPLpgXIFNWpQ+aO
         r8JiOKu92aLIVXbTXKbz0dCDJ1PnVDOp2OIls0mHV3eOViW1bcYiWcDKb2Ef5IjYDn68
         epTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMv8eJcVYyEAQR7AGosYVth4yzWYme9nH0uz6atlF4kfwQEymf5pBboje+VaJQNIScbqIGCJI9vIDqTSonSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3hJPOjWEwWLxpHAiwYpl0vY4KerM3B1E5+BIBNzZ8jpVpE3Tu
	zR4JBOBXiCGWC8iHvi6kst/XrlIN5ud284I4ATFPNzj8E0A6Y7D9EsEjN4nTzwtxfvkkaefmbHC
	zAEQbFBGn8FQcuxgZxGB0H2jlHfjgtWo=
X-Gm-Gg: AfdE7cl2Fpm2dhjzSh9LeZC7UUW96zukFnIEWSL2n7hiuQukxRHQk7k3fn0ZaWgdKeL
	UnHLGX10Bi0u3gWsS+HxEYRYgQIyEbwdJKRlyrUVuul1ydVhT03apOuIuDJKCPGtfWsDae2ZHAI
	AZzmPlePNi9hAOg+Wg/ODCaFlMRpSgFkfc7FZQjucJ+2WjDoAioc6y7hbaqExCMOo7/CTILK8zJ
	YtSa7Kph/7m6ueUeHHmFmk4R/yrEQf+zQxW+NvDqHXS1MgfqRFJI60NV16bn8yu0QABoEDZbIXa
	1iiaxUvT1MP5bzM8ZjXF4qRwOnvv5IE7KsNNGiC2zObZXia49XATX7zoiwvRRYFMAVwlmXjwtZ8
	1aUtywBoiR1Bj
X-Received: by 2002:a17:90b:5886:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-38a20e414e7mr3741911a91.3.1783606431960; Thu, 09 Jul 2026
 07:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-modules-value-ref-v2-1-12ebbf0510c9@kernel.org> <52feb9b1-2073-4fcf-b2d1-a7f42f1e72a5@suse.com>
In-Reply-To: <52feb9b1-2073-4fcf-b2d1-a7f42f1e72a5@suse.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Jul 2026 16:13:37 +0200
X-Gm-Features: AUfX_mxmqn7_OUUAoJ3yj63oM47R7thf01Kt_RIaWnast_nQWj7WfkIeu6L0i7E
Message-ID: <CANiq72m3w7L5CmAsFvOpSh_jNk4jL8+A4vz8GEp+E8FY=TJcRA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: module_param: return value by copy from `value`
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 1:48=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> @Miguel, please let me know if I should take this patch on modules-next,
> or if you'd prefer for it to go through the Rust tree.

Please feel free to take it through modules-next, of course.

Thanks!

Cheers,
Miguel
