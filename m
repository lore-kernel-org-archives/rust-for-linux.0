Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47572C2376
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Aug 2025 17:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756315207; cv=none; b=JifFfszuZNsqOzZDGC5/7SW+gC0o+qHUH4dpVRi9fcogd5a1pZZe0reuB4n+8NEweJDLcKdCYzEQOfVAipBycrGVNfsl85V1/G24+0mkHxaqLnr+jjhyfaYnP1tR03f729DKLzDnpr5JbD5TD00Ih9E8FkkHqNCyfLpwxH0EiUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756315207; c=relaxed/simple;
	bh=AtyBHXQigmmnrosaztOmxJxbCKbpZ+in1zFFFAuiRQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvS+ripYd8/pWbmGDr1P6lK9A7Bt4LLU9hLZO+j5FFzNu9UKQkXhDm6gaEtdktdP3MYapbA6U55oOGxi3wIGWYaPHmtd0sBE/+4ULjb3q4B1U5ib/QogDkJjNDhMy6OjdabSy1rVrGfen42emytp3RfAoSAV6Jk+EwQ/gVIeoKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vp/Su3Rv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vp/Su3Rv"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso36016f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Aug 2025 10:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756315204; x=1756920004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtyBHXQigmmnrosaztOmxJxbCKbpZ+in1zFFFAuiRQg=;
        b=vp/Su3RvRoSMJp30W0ZdqGeGyKcljU60XHEkuAiQpp8kAgP0kZ+XpoZIT5Bi2LGkOk
         d4FZlVlypZFAfehQUlRp5VVrDPeNg9Ofjoo6gmlFeAG716+pIFDSwHH3EOrTZ8fqHfJz
         z3qw4hauuoVH9WarTKWx65nAXmdBlpc9ofpR6XQtkimzssJlse4uVKNeKIIxQMiRAx76
         Zm0RzFWmqdiLyKJY0j5RXv6P4spP1MRFOoLQj4hQd8BWj+pgspVa3KRpIM0zL4YZIbnm
         1ygnMi2uAA/KGNkL8HP+bKI9s58jvIRIJzPXl8K47yAaE09gZbXG4nEJdmNuS3CzZz1y
         D0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756315204; x=1756920004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtyBHXQigmmnrosaztOmxJxbCKbpZ+in1zFFFAuiRQg=;
        b=pcRU53HF1D1hhuovW19EzVxoHbagxa+XvyDm32LwFfqIwR62+9xsSPnS3uVrWQmkl9
         5YlnwqGpf+mkDY6cglExbdxVbYu9LErPQvrzvESQWO9+dQbyH5VW1JwxhlGFRWBdtPFK
         zvRZwSePYEJ2tYgPELZVlxYpMiAz2T61OTmk9lLZVqiKTbyU97Jxr96OOKXrJ6Lr5KN1
         BvrEoNGy6XAhcSMtHUcKuoXwR+COPejaE2DPALni/XumZNmpTcsFwIgFj8ipEWCHOZ2X
         jV/OlzgXfyxfwHqrfCBUc4NR+21sxH5BJCYzMaAw10tMXsE/DD4uQoVKpzD3IZAaVa3V
         V7gw==
X-Forwarded-Encrypted: i=1; AJvYcCWj5b6FK5GxE/A1HW8Eg4chTrV3iLXtWkV0OAYOFrjzs/DcrBR8yB1kW+UoT5mg27B19b78orRLHd+KmYL1dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ZTcsytPnxc41knMG2keGrhw4CMUt6sVobqzL+2uR/PLBpLv4
	3pe3aVkVMtbM1tVbRSZp3AXJZC7CTL/054GQ39IltO8JxLK1GiFUa/Wg5Zxn53RCLPbAFG3Iebf
	qPQqgInyUBPJGv8lgIqbHnU7HWz+T9ozzHqH+9+xQ
X-Gm-Gg: ASbGnctRlj98YJ8+x58pOIYUK62CnD+rqFcpEC1Mpwd8ud+9bOSzfFwp1s6mrWZfzp3
	XDetU3Ekh5ez8irvLdBOgCtGfsp9LJCF58uGwIsDOBdRfKH6Rsk5EizuqsYdpQ1oi5hB2L6avuQ
	913qRb9fPIaVZ1sJtsmsjHJ/46ZLxTd5l+EP1IKwZ0aWOfZMu9TVsbpTLhhxI/FBPKOhzghIVov
	hq1vU+1r9QpZazRjYfq2UysPi7dhohm/wBVbOt6cm2A2O1946M=
X-Google-Smtp-Source: AGHT+IF91RosbuTBQmuenrBrzkd0bNfI7T+bhZOUTEGjKUB50mdWYkmEDUWEcwNNyBjkAFlVVH5I8C6vV+MP4YseCIE=
X-Received: by 2002:a05:6000:18ad:b0:3b7:8892:ed8d with SMTP id
 ffacd0b85a97d-3c5da54ed40mr14871026f8f.6.1756315203984; Wed, 27 Aug 2025
 10:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814093046.2071971-1-lossin@kernel.org>
In-Reply-To: <20250814093046.2071971-1-lossin@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 Aug 2025 19:19:52 +0200
X-Gm-Features: Ac12FXySBt3iaKnVxY4Sec1qTaFktwMcdrgmb_CZfRKIe1T4UflapWsW0oYc8O0
Message-ID: <CAH5fLgiattq7gQNStyW2J651EqOnVOoav7uviNvA=xFu0ZSxXg@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] `Zeroable` improvements & bindings integration
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 11:31=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> This came from a discussion at [1]. And I added some more useful parts
> to the original idea.
>
> I'm not sure on the impact of build times and rust-analyzer. We're
> adding a derive macro to every struct and union emitted by bindgen.
> Building using my test-config took 27.7s before and 28.2s after this
> change, but those are only two runs on my machine with a very reduced
> config (that enables all Rust code that we have at the moment).
>
> Maybe we have to reevaluate this when more C code is scanned by bindgen.

Imo we should re-export Zeroable from the ffi crate and use it via
kernel::ffi in most cases. I don't really want to see pin_init here:

let mut ctx: bindings::lsm_context =3D pin_init::zeroed();

Alice
