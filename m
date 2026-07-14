Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17E8445AF1
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 12:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032287; cv=pass; b=BAg6VP9R+YfaXBx9X3CUNKNcrUU9h0VSdEwONtYtWQkru6NLZFWxofiDE+zRDGuFzRj3yGJvK6mIjIODdEtLCwA/8FoK3mLt0P0SxvGcRAdJLO1WEHXbdj/dvV+K9DT47msUqu46xluoHu1rjAD2vh0CjjzbgkeA2zyU4q3k2YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032287; c=relaxed/simple;
	bh=cE0dLe/VzXxY4EekWd6mUpPjyUnr0cmBLEXjzuP6elE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PauzctZFQIbJokxR/tvTebj2XxzPOZFwj/5LMjT6UUQU4IngoqYfDur9Cg7ar8cCBeD+l2F0e2fQ9oEWRtdMF29E3D0jPv7mdRTIhUzOvuqm1c7Oyag4YUhwSkJZhTJKs/BOj+8q0ZyDaUQOKEOKIT/oSsMegiDr38kkYEoiT6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZ2Fn+vv; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZ2Fn+vv"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dd9c4845dso239110a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 05:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784032276; cv=none;
        d=google.com; s=arc-20260327;
        b=mnUuUm8hL5ETLseP5Rz98m5s+YrpuGxar3AyG2Fk7Zd7hTw+uOfTz3ZQMfdLRR/TJu
         IyIl+iLPSw+g8QsR2uLn/TjJ6YO6m+Aj6OzlBofljl3Ui1GWjPIOukLWlNCFjlvNemny
         LfpGaqpAxrRR7Ycpb0IAVKxZG6uCCH1GNrdVb6sGgL5GQWj4eWVxBLRu0TCRU5Wcsa07
         J1wdF8TwMVJLWfS5v6h22wxxFYiKSPlTptM+zIIwnepkabtHmHaK6RQpATib2NxPx2Sw
         kcF/qIUPEQClIPtQp47g+I19dKPqKtbdzt/7TN1kZmfZ4EmEqdXgbVI4KMJ0TpL1uDuW
         SeMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cE0dLe/VzXxY4EekWd6mUpPjyUnr0cmBLEXjzuP6elE=;
        fh=KXsisN/5aB4H8vmMiCuyrYROdd6tZJEmoBiLBPeCIpw=;
        b=JTDpHsaPIvlQMeBwfEdSSjPw67N+D1mKQ7ed1wREVsxd4gIb1THICVkWNqC3ysgFC1
         NLGJPg127+AABdKWM6HpJCJohLnfckWdl72VkQpLOEeKWfyFVpRArEyrAI0JUFaVVhAg
         YHzY14eFcxLzZFcWWsySe/qZuMrp658yvSp/A5p7wCUYYsZ0BoUzDXpTzcs//Dr34ef+
         tSNHhzvdz66llreiYkNxbSV/Y5Lcph4EdkqvKpn//3nYlCqeE7zLYPDbloODxeiySKGa
         AWqdKuwGLnmTmXLzuyC2hGDhN0egE5pUqA3r7QjeU01zECSASPCAnFEs2xn9H05OQ25L
         Hekg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784032276; x=1784637076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cE0dLe/VzXxY4EekWd6mUpPjyUnr0cmBLEXjzuP6elE=;
        b=gZ2Fn+vvEXInWYMEya8ffw1hBTWIB1QtGQ+Nf1jlD9XF+K2/Mac+xHEEjD3xFjEBBQ
         EO18vl3cGhSl0Jop/66z3I/o+jh76xKc7RRo0W1bmUMSlXF1Dzc8j1NUSL02W6rvbRIF
         aOejo7n8hDPOsMSUsEagdIVLYgQwXOumZKqtRt99ULcXiIuD72KA1Z9m2Jnp6qa5uchA
         /tH31bocJNh34oYTwRBqgkCypMHevTSHJMfpt5IB4g/EBHHA4kQoH8Vu2Ia5yVzZT+E7
         nKogstcnAh6wcZ70FOB8dJw7wzvbQoSfkQUi+JYaC7cr9WlYSq+INCiUo6RJ4LFD/Hso
         nJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032276; x=1784637076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cE0dLe/VzXxY4EekWd6mUpPjyUnr0cmBLEXjzuP6elE=;
        b=M9VV92K5q/HL951xiAF6lIlwRmIEMcZnbzCxXxN4mQpPLKjl75PHF5PxWQDFk0X703
         OeKaw+4l5gqFx7SvvjKKHSVyBqPiAY7LMSvKbw4PZPUq0BGqEsCX6mFaatyMkqvShfp2
         WDcjd6KNnThm4tXTKId5qq0cBB8Air531O8hNw9LOjKtay+NYCF59tWHPLlRJ9qZUiCO
         CiiPqM2cz9EACjMIOvKZF4/b5N/TTgWXCg066q+R01sgORvOJ6y3WkPiNjyPypMRwAP8
         Zpmec5Af+HdZZoaYyFsR4ryJV/vw1XsVvICQJd2XX+l1Ak/eMRbGpWAyQImdsW32EI7x
         irag==
X-Forwarded-Encrypted: i=1; AHgh+Rry81nyM1/n5/R+V64PhT3x1GAeVHWhbUl8Ir6cxR9yJEMfGnuJieOOIE9MPiUoGAklJK4wZZffb/dXaxO1Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/1QAZwyWSgASLtHGP2fu9jZxpqcz7ychXPkmCVgF+Vk2apT4g
	Nbt88A2HuGhyYj8Id8r4YH0ztHciEHGE0bbj2SvKVp+RJfq4E6V7gtMLLpYNC3Vk7Ugmdge0zJI
	Nig6bVJf4p0jusb25/DPoezrQWPbgBhA=
X-Gm-Gg: AfdE7cmkVYXGGSSaabwleLGPQDTXAKOjjZIWFUQ0xELkNP2UagTTTj1hREqEz09Fbqu
	WW4U8nmIvjvhg3Z7u3eGYSFLSUpBZtlGuOw0RQ/MnersHDrZA0jzRfBCKO0wt7DxYZ750nkvhuk
	5H1M+Mi6H7gS1FzGMDDZjPVdSNh2kAEXqFGAMkpPMBBLu1pEkb8uLg85JP5XE2agx5jbsvNI2OS
	EGOnPJFHvH8N3/m0xsy7IICgttBe5uqww/OEDRsGm/LvrOv3/ZwwdjROCJLBmjo6+zKqjCeIdRN
	zgipvT1IaOxcyz93HVUe/qYJfv2+amNvIi/cG6qzGLNJL8hThSzlrm3/BsP8Brcf5axzxbeGt4v
	uIpchVBOKK8Oh
X-Received: by 2002:a17:90b:3890:b0:383:5a16:bd67 with SMTP id
 98e67ed59e1d1-38dc7754e8amr10723616a91.4.1784032275713; Tue, 14 Jul 2026
 05:31:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72m+mx-z6idfdTLh+mcW76nxRr_eA-a6vgjFY6a1GE_ygA@mail.gmail.com>
 <20260714.194916.571807180513332641.tomo@flapping.org> <DJY8NM7TIHZK.15213B4MWETHU@garyguo.net>
 <20260714.211751.124079232269470730.tomo@flapping.org>
In-Reply-To: <20260714.211751.124079232269470730.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 14:31:02 +0200
X-Gm-Features: AUfX_mxir_bCNKtiW3jdbvxav-Ukdbes3tqJCaTnBYr1jFdKRJLZ3W9_zsSDJLI
Message-ID: <CANiq72mokH0-CnObPnFJWsSaofOmiAqtBuvGxPvXSruPT-Xn3g@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
To: FUJITA Tomonori <tomo@flapping.org>
Cc: gary@garyguo.net, a.hindborg@kernel.org, ojeda@kernel.org, 
	acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com, 
	lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, 
	tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 2:18=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> Can we agree on something like this?

Something like that example is what I meant, yes (i.e. the groups with
a comment header, the N and N + 1 thing I discussed with Andreas,
etc.). Thanks!

But timekeeping should decide to what degree `9_223_372_036_854_775`
is meant to be documented, i.e. public, private or a middle ground
where we only mention it to explain the boundary case without the
intention of anyone using it.

Cheers,
Miguel
