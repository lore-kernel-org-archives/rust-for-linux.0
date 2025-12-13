Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E47283686
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 16:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765643114; cv=pass; b=ThfZAsUrLB0UOTfqFBlDFXahabz4seLn2TWnfSIMKI7h+44wwbb1whpNs8gdmeuXbGr70VX5s+WxS33pQFwnrqQ667Df+fAf0WBOBsRr9FaENqzCELNgsLXNahxrhZUM6RGxgG/g0CdzBYxXjHvtSs60d9igRoU0UnyNQJqqFI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765643114; c=relaxed/simple;
	bh=YAnZzpjbBwBWlqenRjdeOvVeURSHJvqxbcXNkssf0m0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cn6lLnX1euPSd5Y6jKAGcpvfzxQ1u7Au8OcDOssaFy+cBUi7jRgT6JkfaGhQY3u776jVvKD0ezQ+zaoSyAGuEh2veh98iKjEUFkDyLgAEy2URtVYEI2APGC6V4hRV6Mv4GHLL0gfdbNe2ddH14ecB+Sp6hu8M7Wel0g07wFYH1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZXCYt6VT; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZXCYt6VT"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-645ed666eceso28847a12.1
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 08:25:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765643112; cv=none;
        d=google.com; s=arc-20240605;
        b=jSDiNjETEjSWO9ZgmE4hI1vCB4Ejo950T58pOn0JAmKGFCPM4Ds9HjLYRpv+VUTqe3
         x+UoFs09rmHRzuHpCUquS0PzA46NZUt+B2qkuGfLQi5NViLj0Z0RW8c2BngIJs773Q5W
         v7T2Lyw8qi6ObAsW6EdC3Q6lgGhPZ1RstBh7zUdbkHqJHMoPVZ0Uv8bmP1JN9JtJ1muq
         IuRX+1qrK0jgNyDYycQxSrnLe1BmoxgkLQl863IbtF5lW7UN9kYQxdoNmhXMmLq6q0r1
         Yeflm6spvonyt10ez0rrwKURt56qy4Fi8H1fCqAgr+Ko0Kh8KeUsLDn7GtMGoCOjCkLX
         As1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qkuU2QpOJIUvy477P8mZDSi2Umf+2ZZ4kkB+P93Igz8=;
        fh=ci9kPTXR86JEgDdyYtF/d5El/d5j8D1obSEfe4Tai28=;
        b=QYLES7oVvhb3sbhzfst4tbEqvz8bXoVmEklFjE0epSvZdEu3tEmA4LT+O9fauN34ZQ
         m0fHxfUeFWhsLiJ/sQtHVCgC58qj8DrxQmliPFRXv4fznLtbnhIeHPkuAolwKtHzZS4K
         6KCsliH6aaVrwBBaw43L8sohjQlODQaZHi2oFyDjKq0wDkALP2m+x137fA0/x8VFzEZv
         0qVOgSIqva3Z4iWsKYrHq2l58vDI8FVRM/jRgpWtRFqIAyIZunum3wcS2SYAqLRaCDBs
         ZRWxfAdMxq6VoPW/O+maDrdVkY7wiRImz+reoDvM+qp+PkbeLrtXpkvykpqsP+jYIfwS
         jjaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765643112; x=1766247912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkuU2QpOJIUvy477P8mZDSi2Umf+2ZZ4kkB+P93Igz8=;
        b=ZXCYt6VTniEINfW5eBE9SU8jVFKws2qN3OB7YTMuPVH3sINodC58UOSuifMKk8Q3mz
         rmz5ZxpkVXETrzaDUjZ1/wZe+YOMf8PTo4noWOVrKEkXJbdHpqK6pQkmrRVo1ke3EnrL
         gjC+xggg+d/AXSTckSpXhPJ3IRMGvWe7sfwtIIhx1ubzXkEaNW1kITtMjJscfOfdhJsx
         E5GEbGSvcUtgsSzsR2my9WsNIq9NrSUzjEDpuWuWO7shEG//DPh1yybyB/yy3jBP5kVc
         mPHI2Phi2+/XcxzPQ7rFBViANIcImMun8i1TuWW2Ktqd/oWKwVmRBMXg9TR/A2lCAaWT
         MnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765643112; x=1766247912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qkuU2QpOJIUvy477P8mZDSi2Umf+2ZZ4kkB+P93Igz8=;
        b=G0jJoTLlwZ80/3RSWNDDgHImOQ7XQ2VeocBDcHlp0aStu7U/mIX1xnkcS2DZhxF5DC
         U3aFRBR/vHII+jfQiZjmn7xJDSqhmQmaE4l3yErn7l9YiCJuNI4iE7Ra0z4oUNy58RH1
         WYlJe7XuRfAQkWvJq4OOtTkrzD6ovDKUdS3t4pCmSHRgp7NV60Zxo2y67ieh0hA7WexC
         LgHtyQ6daWKhzeIj9FV6REHnULrGmOFQ5B4HJ4uHU0zuWVVXNproEx/6NvyXRx3NkZFA
         ThdpRoGlYMcaWv0jgYsez3xpw5qmfKAydH36CHap31oO8sMCXsTbfTlfWUS3B/ETrf8M
         FQhA==
X-Forwarded-Encrypted: i=1; AJvYcCWxoZL+zWGpr+eZhxn0LhMYCOpAMTdWo9I8KxIoIa/Qzoe45JA1r7Jp7m5OO33A3zdvShUHg4iLMQvehMHZSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCAYpg29BDN1e1IqBr4MKKQlmpF6Swf03FA0kY8FwpOpr0QD0g
	IsBOXLHBzBKjoU67Z0CjDE/XBnvEXZasZlFXQFUMPGTSTJhwIVV58e61r2PjGzi5MvnMMPDmquG
	5DPgEqSLCLChKUr0V0ZgiqRItqLiZXNlpqefnKFuD
X-Gm-Gg: AY/fxX5H+/wp1ydc/JhFm2jdgNVfi3sgAyi6b2Tmf9+VTYdg/oEAaP9UD+jGMFFfnKU
	X6y8accw0SRSotX00tPA+S952HAaWwD9j3e/odqv1V65lw2q/MVvL609aI8iG4AuF/7X3Z+JMYK
	TcRymWqaeE2p8kPCko5LTIhROQ8VqybL1VuMYSwjym6CfwqvuBEWAgI7vDwYA9pkDY/BLzoRT9r
	DtbRPQUvbqAZsNRk43hzhfJdV3SqbgVIJK/NcgB6hFaWG3n4SCxV3L1l7HMMGhu211wJlaJt+7F
	FeBaBUuIXovloN2pwnCgmqVq/w==
X-Google-Smtp-Source: AGHT+IHlyJhnracVgNkSH6sJ3VIaGS7tv2RfDg7Zb2bwsXSyz7Si0k9LU9wFEB63RmvI9k8PDpzPf7a543mVVoDz97Y=
X-Received: by 2002:aa7:c4cb:0:b0:643:6975:5380 with SMTP id
 4fb4d7f45d1cf-649b0899656mr27353a12.14.1765643111359; Sat, 13 Dec 2025
 08:25:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com> <2025121303-railing-fountain-bebf@gregkh>
In-Reply-To: <2025121303-railing-fountain-bebf@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Sat, 13 Dec 2025 08:24:55 -0800
X-Gm-Features: AQt7F2rNZWVlEAhBEp8mKqO2tMqx4M7nqSCG6O3FgARgI9k9Njcg_E4ZsUfDmiU
Message-ID: <CAGSQo01yhgPVRzeZjGu=xV-eHMARRThYL7bbD4o=VskG3mYLCw@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 5:57=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> Shouldn't this all just be in 1 .rs file?  By not doing that, you have a
> number of public symbols (that are very generic), that will "pollute"
> the global namespace of the kernel symbol table (unless rust does this
> somehow differently?)

Rust produces one compilation unit per "crate". In this case,
`socinfo` is the crate, and the other files are included as "modules".
Symbols defined in them are not public unless annotated with `pub`.
`pub(crate)` makes them only exported within the scope of the crate,
i.e. inside the single produced `.o` file.

> But putting this all in 1 file should solve all of that, and remove all
> global symbols.  Especially for just a small and simple driver like
> this, no need to split it up at all.

I'm willing to put it all in one file if that's preferred for
organizational purposes, but as explained above, this shouldn't bloat
the symbol count in Rust. If it were my own codebase this would be
separate files, so up to y'all what level of granularity you'd prefer.

>
> thanks,
>
> greg k-h
