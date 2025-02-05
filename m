Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B55616DC12
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Feb 2025 12:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759980; cv=none; b=aNQClsZ/TlXdPCmbRQ5zyWL5k44USvOA+/OgFzd5k7LKfcTX4vdkHSweo1QD8eRay6dCcnJ1bpqidUCuZWJfxP4ysWjWiS7BQlDBuxxQmTWu99mY+2TfbyISfQYQxC3baJpoGJ83SjPd+t8PM+4ULwIlfYM6zc4h9Gk60uI5gC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759980; c=relaxed/simple;
	bh=bNZ14gx6Laah292ytLTzsG+X9dGK3fn4GwhhVA4OFQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5UwpUpkatVbWeHdzzDVGYa/cTf6Q0MHjYBhmu5etKKSO9NEckHjNS0SHHD9vbNT+fQvMw4661SuQ/Pc3as6NnNnPLLQJ9ai1OOpJ42RaPQE7Vz8CWFEnwse+K67X3gdXHdzryZZgy1eYD3gmak133iWbj5I5kkTeZOBPmIJSKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cze2EUXO; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cze2EUXO"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f9b8ef4261so452004a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Feb 2025 04:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759979; x=1739364779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Meg2Zp7PV1/Vonezh5KCfgh6b0qyiNzN0k6NSBzIcrc=;
        b=Cze2EUXOt3hJm5XJH3uVDHncZVzTXze8TstRnTRwbxGOjJ/Eq0f6FPd8wfZiMccXjL
         xnfU87uc/pOC2W446flmiPcRovGHCh5DTlGr5l2s5g2B78T3lirKcg2TVo3wJUGOWIWd
         QDSJSnC+zogKPaFjLt66yqc0nHgVrxnf5/dOhOWBjQcgwZzbsx9hd69wZG4HnDLMuP9S
         HpQsNYMmnjTPRR++VEN4K2Y/smCncVZ1YDRwr7LyE/n89Dc00B+SHEHxVq6qiruj3hjW
         6Ufku738NUymXftDJcu/ZSt9/KO/kGIJmQCpaIQRl577R4A5dFssXhHMRXGBFvc9ysYE
         D0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759979; x=1739364779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Meg2Zp7PV1/Vonezh5KCfgh6b0qyiNzN0k6NSBzIcrc=;
        b=stwvUs/nkkLV7YjWsXn2gcDgPc1NQcY2IQfXEdHohYF2OtZCVZH+7EMSvvvsWjCPIw
         KDSjOyBR28wBcv7vh+19ocl1h92Gz3dUfcgZGF1cp0mdnE0eClJM5Cuc4Rz36xc1jkbP
         yAXWihq+CHHnVpKjcaWr8nuql9bVIjDOILd2RHy5dbBm8eh2+VxpAcy1pHznFnAcLTnO
         s/YMcKjbIov8KGYLIj7hOM5XZ9MTLjG4y65GWWlCKnsr2kYyf76YJY5KWkOttVKYJEtI
         Eta3Gn4n9hjnaTMvleiZUfuLn0o1H0ve5XkYx2OTMH/W4WwdiFl3BaAXUxI3LEEwqi7c
         JpUA==
X-Gm-Message-State: AOJu0YwgFVs9mvul+8bxbXEFrlQylIC2JWDzK/LdYa6BXzHjAJW5CUOK
	JXy76ehEwJLNp9oTtfPQzjFUC4XQOwLSw+Fnl5YxmVFxOosLXXTRaY7PqsmFgRQRlSgPT6nwy0r
	QG652rcIbpYQiI0l+i8Wptre07aw=
X-Gm-Gg: ASbGncuShckQXu3/9u9lYDHfs8HkAKSUMJW20hb14H9xuQ4agM1GwdFgfXAJr41lh6K
	c+2/c9ZIvX+VInoBoQhRSqjlwU5GeHsPoLGyBoK+MqzT4Ft7rmmEOV35+gHS7LaE96X1nolJ5
X-Google-Smtp-Source: AGHT+IEPoZ/uUgZFx4ZUzkCv1pDIzmhGG1eUtkfdR8qle/7Iqezx8nA75MRDr37A8pleI7N/7o/oglQiKFad9djocT0=
X-Received: by 2002:a17:90b:2b4d:b0:2ea:c2d3:a079 with SMTP id
 98e67ed59e1d1-2f9e0825e0amr1682794a91.3.1738759978657; Wed, 05 Feb 2025
 04:52:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203133717.264522-1-kurti@invicto.ai>
In-Reply-To: <20250203133717.264522-1-kurti@invicto.ai>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Feb 2025 13:52:46 +0100
X-Gm-Features: AWEUYZmP_NTxMu88Q6n_DqmQOswBOz0JVPyqX8dNcRXO2Bj4EWCOtJV3TzyzqxA
Message-ID: <CANiq72mXvqQCH6TYPCPG=B+TvLrFakfNC46=tzOeZBt=E6C8Kg@mail.gmail.com>
Subject: Re: [PATCH] rust: printing macros sample: add missing newlines
To: albankurti <kurti@invicto.ai>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 2:37=E2=80=AFPM albankurti <kurti@invicto.ai> wrote:
>
> Signed-off-by: albankurti <kurti@invicto.ai>

The kernel requires a "known identity" for signatures. For instance,
the name you use to sign documents in real life. Please let us know if
that is a problem -- see:

    https://docs.kernel.org/process/submitting-patches.html#developer-s-cer=
tificate-of-origin-1-1

Cheers,
Miguel
