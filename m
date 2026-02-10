Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7CD31ED8B
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 16:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770742625; cv=pass; b=my4xY/fdSJzUy4L4+H+Sf/HpEcUrfeB4E4roV4SWIiiohCGgNydQhza2AzqgPty2EnMlYbItklMZvsKRjgiQQLNVkRB9JWub7dbt71lgqCVJdCuokJ6KwM/gfPMQZ0Of32lqyjKHpUhJGy5vOOT4EsMyxGv+9BGwLYj+HHZUuTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770742625; c=relaxed/simple;
	bh=NM8yzmMo0YvFNuzUYh1WtYxgc6x1N2Dyjb0Z3/nF1tA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q57vpk6b5S/gkUry50WQYO3ip0EF0qris0mpJmEllP7q1ARzISwF+jbcsHvhZx73YKrIZP6ULcMKzdX8970b1eaOLSQY4kMEW2fXwQwuEzotIlKKkru5vu23YIzKSXCvUVRI+sEGEx8RMhCTVqyGJau4PFvj2X9tdPoB3d9eJcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8mfGtYl; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8mfGtYl"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-386714da2a2so34479911fa.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 08:57:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770742622; cv=none;
        d=google.com; s=arc-20240605;
        b=FUxc2tNSkEZ47etLJYaKSVptf20M8HPdq0KvC1aysYfgUc0Bdat/jUh811QrnbFt4G
         aTthP0M1EWu1I1Kiu/1rnKMIYhUEPQzJZEiNO/jixG3jSrbXG3gCEGTYLZTbsE+ky76t
         Fk1t58QhH71PnJYk5Yye/h0MZLXsrVjllVtnT1iLs2Afoj4YbZpRXaUkV1v2xQSXRrjK
         oLWABAvrpUCLjwqENA3f3wGIi6/Q1+kcNx3c+eDxGck/vEg1apr1CzY/NrqP3EOVGAt7
         k626ZSMvlC5vAIynbdL7KIPxrmNc/CbC08f+6CQYFAzni/rWQlcC7y5ZTfN74vWzG7vS
         pI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NM8yzmMo0YvFNuzUYh1WtYxgc6x1N2Dyjb0Z3/nF1tA=;
        fh=1wzTHGUw605ngyQkxd4RqSPtxpQgsSlNwgurgB12oTw=;
        b=blR74GBGiwKlNNfJ3sOgQJPH4gS7HOsZvSNK60UoqLm13NMU8t0n4rxfx7U0M6q5sM
         ZwW2YeF67NW9zFeXoEgEg83liBB8poaePhipjERTWskqJbzoUanBpsIAadjlqK99qx22
         TYZPW5FTHBHKj9x2edTZt1UbcBqsrhgFSyg1aL4HXNg2Hkq+NCeHhRkQn25nF6u38pOY
         VumUdFNC2uSWerwYF0odgn37+pterZJ/OENMnP8Wl8PDOlshKV40tJ50HccF5/+jKW6v
         pgZjECIBtZOXBU2JkZUqAAuiDNcTOKIxAeTSLSCgeH4m+e4INfAlGnmTTZ5pEf1j/KJW
         Glrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770742622; x=1771347422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NM8yzmMo0YvFNuzUYh1WtYxgc6x1N2Dyjb0Z3/nF1tA=;
        b=l8mfGtYloSLOpZZhSWG8/BxbSin4m1VauQlEZA0y405y7/IvL8z+T1EKdL9JAVtx+N
         dL2880DiG7/Q3lrTJjo4zA6MN9OIodYqDzz2E5lt/cQ4ZSuSf8AxEbc9sIuEnPc35T1e
         wDXPFCXg1qP3IGxjdpCq732ynJNq1kxrQk5N0WxB02KBIjjoIvB3hHCe8iDl2DwDYByW
         R1xw/169FMD7a/yirZa5l/Ld8SIPoCZp5Nf+uLT/s+JBFznRsbXMSccLghE+GXlnEIMr
         D3oYDvR/vg+2pwIz7ru2Mav1QKkPUZMGcCW1GfKpOhqcDT54nSt8AIxGN/5aC0GZFKco
         rPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770742622; x=1771347422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NM8yzmMo0YvFNuzUYh1WtYxgc6x1N2Dyjb0Z3/nF1tA=;
        b=O+wpUk87ZtrbSFVUE7J7hK7n/4mO8LGOH/MEZfZMTUXO8bckmoPqqcTbbxojIRVxT9
         sJERovKT7p93nzJuXxGU//BGmIGjbv36Mw7pILOYkItgyEHyxJhPt4RcBDPuc2Z5OWng
         N5PvlhQ9XVjdmxtAh+7GgysxHnLZedMBMKewe0Htz4Ya/mXsnh1K2bvJfGSzWSLMdV1C
         ItrFpY7xYjl6G+k8VyhZ+HSKMS6k9ksBzXbyXySy54QdQDUfBT4PoUzlcAOEuiAHG2zM
         XSI76wO+Z/cISj203bUogTpd5x4rxZjOgi64LjzdKyoF0dvGl1xHqBAMrgMJCxpn/Kkr
         WLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqANddKXT+LtEJk6vRnrEXk2/KKC9sGoE8xDFSGQe3/wAqnL2HyllMIKxOLfHoLTbMQCI4x7LlhkSMtTfSrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEJLPrBqrkIkxv1JUN7f4TlBj3Z8zwqTTtj+aqGDOyIsIC7ri7
	qVAPAlvf1CFmieMHLT7I4rdPxs9z+Y1ckaSdva7nJPlj8ZCV871sgpZyJnFNUcJeEnBdpxIA6cE
	+zESq2fQa97aJzqR9y+fPdEP0gZzbtLc=
X-Gm-Gg: AZuq6aJ86CFlkOl/USSGdIvE7mgfQ2aSl/EFSshgFCs3Y4lLVNftZoXxCB2/UjLw/ns
	TVlZNf9V3DQ0RAb9+rggyTk7CNXI1bIkGBaN9/xHyMqDB37pcnHMkEThf3P4SRo6IISoAx4BhlZ
	cwZvZ3WJlvkxU3yzAHzBKP8NOYtGSABToyCSaETIDreWOMxqKq3AAxYwFJRC7kuhNc1v2zm0bUf
	bwfmIlNd0qyBY85vYYQfe++niFYG+trJ0fJJTu/X9tjJ3fyLBQcm6iDoNdhhhz0pDpAhQ3jyxB4
	7p9vVgT0N328GUukFCJTO6r2bKk772Hn/018A/2VZemRkMjA54HKViMjMYRjd6JyARBDsu1DTHH
	+xD47qbY/smmK153L/K5T
X-Received: by 2002:a2e:a58b:0:b0:385:f7ce:f31a with SMTP id
 38308e7fff4ca-386b4edd477mr50694621fa.10.1770742621694; Tue, 10 Feb 2026
 08:57:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org> <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org>
In-Reply-To: <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 10 Feb 2026 11:56:25 -0500
X-Gm-Features: AZwV_QhGTu-A3iYfBvY7CEYwEttuJWC6gRlgajiCgkGLDyHNWBy2jB23t8hDt-Y
Message-ID: <CAJ-ks9mF5x5mAUcfN6dWN-NWoaE=j-8h0y_F5AM2Pnfn8RcV6g@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
	Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 6:38=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Add a convenience method `contains_index` to check whether an element
> exists at a given index in the XArray. This method provides a more
> ergonomic API compared to calling `get` and checking for `Some`.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

As I said in v1 I'm -1 on this change. As gregkh would say: it's hard
to review a new API without seeing its user.
