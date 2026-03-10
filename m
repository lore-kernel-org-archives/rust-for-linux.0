Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0CD3CE4A0
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 22:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180552; cv=pass; b=tIannvuogWiAvJwZh2nNCD4bgymzpIPMCLRelFKGPUwtXa4fJxjEPSeJOqMvMFMArk0IYqZY4M6I6ngC/nvf/OHjuCIG9LNF/FBSFMYMYxSDIg8RNRXZR+y6WMNWBnLhu9jRJAYmQ2FDzOcpKNLPU5EUBoa/O/fn60x49YDEbqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180552; c=relaxed/simple;
	bh=wLS8ZuVk+K1EIfr1RZsdGmPYwBVKSAqnfcayfIj3r0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpup2twy4YGXRH0IQLCmXOi0uBlzVG1HCEZrti3we8RRvBOzY9XUpOo2v5jven1Z3/nQ68rmaw0eWq9fAEs1lOTwlPgqkhZyDt60M6lzuAs3KCu7HuQjSmiZ31d2fpAYrAO/fUwSKqnMXrmypIRzyyCVDKJ/Q74hRw2nSjaiiWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pt8UBQCq; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pt8UBQCq"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1273c690e5bso33727c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 15:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773180550; cv=none;
        d=google.com; s=arc-20240605;
        b=jkz1e6hkAkMcznhqObgMr1dq1P7hblGtp3I1FAjZytPp/5n6vKn3AYCdUIW6Eqjvwl
         CWRRzIxT2vTxGuol9uhveXaOlbvNTIo476tl9w15XNdrfBDw/fLgJ+KL9GhYYdJ5Jd1Z
         BOlvXwn3No7PZDZ3g7E1tj/AcrltbNsGIbn9xBwgEKALyz65jxCwPYtN/r/3lZ6ojNwI
         pV1zXrtJcq87lmIEwUCv0+Qh8gwsGZSetuDoIWrTGEjNxnR4Sd2ZaOGV9UaqjZ6Vvpam
         WDlVTmB/LVnUbaGrCb4IO0Oxl1ET+tKn9Wwu6b6j+WiU4LaakLQdL6p9uvOCb+Wljc+c
         yr1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wLS8ZuVk+K1EIfr1RZsdGmPYwBVKSAqnfcayfIj3r0U=;
        fh=tT2ZH5ODTufO9JR4le4vT5ggNpOIX5oN80nYBpVS2ic=;
        b=YNGvZ4pc/DG4kNfr01cCJgn8zXXRlB8a1gZl1KbgKSHUK5S/YOkFUXRzYDuHTfNw9L
         Uf+x/RJeb8tF8kFPE46jMJxVkfHTt+npum89m41V1Ca4FwpAnKSSJPEjCGu1vExNSW12
         UCW+f2NVyF5nGuSiPLmy5wXmVjMyTlV6hufcljMseHx64UFbLLXciHvM+mNO0au3zaHd
         1/eNlTGf1ulmuBfhL6P9OIIcAwdGoMOeFYlzogrMeGEp8RdNsKSZ80U6VbT9KycYW9cF
         2T2i4btej//LoYZsOlZSSQp3Fpp2CL9oiL71KVW0fDTaJGqqp7AfOB5Lx3f1akmGn6kT
         5jvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773180550; x=1773785350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLS8ZuVk+K1EIfr1RZsdGmPYwBVKSAqnfcayfIj3r0U=;
        b=Pt8UBQCqFC3XppfTxlnjkpzLLM0nFh4Sw26iDqM2Fh7QSG8lNzi7+vUqlePgxFcNM6
         c/ugPl+CmlQSnvZNghWj6h2Gf8H188tOLFzwhZKdUHlePKjWma9zuXmWFMO7nw1StYVs
         BsFjBglkDqH7UFWcQT3EJbqkurG9bPZiKaguzSnMN2cWautI636VmETZuaEvbOVW4M8J
         DjYcIckgAA5HG7t1bQcE1kC878f5rOMIs8Z21NtCIAVMNBV1RYjmk7VWv9Z5FtydMW2F
         VKAeXBu5ySQQa7njaGuBbbkP+zwUStL27V79cGTv1iq+HhwLllSwIPZuRu9CeXnRdnRm
         i5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773180550; x=1773785350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLS8ZuVk+K1EIfr1RZsdGmPYwBVKSAqnfcayfIj3r0U=;
        b=O7ieXMI+iYjt1iJ69d5isPlrPAjvwHv+1XgZZVFsxCwJnusFxxAhQdbV3D5PJmNxG+
         IPqbtkHb3zM5qiSQckaB822ZXp+Gm33zLby/uRo01V5GXzWvBLK5jKXdOGPLAheXweEL
         M0cgyKyUG722m2t6X/25EEUNIdSFcxmo8yzJpCNjNkdvMAewGWlVAG2wsV9qsZI73c5m
         gQQvvhyyTMr3NGyH5z8X//Cllm25Xl4/MExTfrCbmH7JdyxDdjlmGterHKAebrhLO+Fu
         c+EhkZ6hSbtVLDKx+/VaQpWuQSGAeJPa7si+EAU8v1F5g7o0f5YuOmtqzeT1lrzfajsH
         4Trg==
X-Forwarded-Encrypted: i=1; AJvYcCXBHfump7CPTJSWeu6BjoTrFrbv9FN9/UO0bPF9xwttqrcfXRmSWYJtxtDITSmrAvZH9iwhF0Y+yxoNzO753w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRMHMWfWIKz9DmL/L3mxJC1lXif3CA8qi5vZ8oLvu3SfpDfHOn
	Pi/owJvNiYVP0FNy6fX/Gt+/pA8eQydSM71VIOz0/0B/gs9vNJAbhMAd1s0UeCfg+Y+DP1l3pJy
	0LBynDraJCxqGFCCG8FbBkHp2NTMbge4=
X-Gm-Gg: ATEYQzzWfReZCoBQi5QMWms/2APPESSrldco0HPaCcBYuLrXsdK96jHKQSuk0Vsfot1
	mtNRQ0zKoO4Lwwxuz2655IQtKeikuCL6+uuXTNWU/nFwJ0P76NrEtzc2c9sdJBCKU2pXyfNLPmc
	ARaXUTi9qlygtMm5PfwGpDlOqFO0vGQQ0xwFgl0Zy+uJGXKFrC4RVcU/TBvTOj0924evEovHsAT
	kUh3QQbbgk83ZiAcUNwVU3brcBfYCfkAo3cKplInKjt5KrQ/Tbm9dPdSuAukr4CvGYwCv5eqcbP
	DfvOxARoPsfhhtVP/DHmBfzdIDxjX66830ULwfQdQQu1nf39tsLmQlIg15HU7dZi88emn2JHAV1
	A67ZRevJTagPbrKtctGkOxgwLu8VHqpi/gg==
X-Received: by 2002:a05:693c:2b0a:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2be8a553e6amr67357eec.3.1773180550156; Tue, 10 Mar 2026
 15:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310023145.120037-1-jhubbard@nvidia.com> <20260310023145.120037-2-jhubbard@nvidia.com>
 <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>
 <CANiq72k45b+famoLjUyk+UFnZbEONLNSgiwDDQCgUoV6U2m1uQ@mail.gmail.com>
 <DGZEBEPLULOZ.2GT5QV8I8VBXJ@kernel.org> <DGZEHD0JWHZ6.3HW5U5JTEN9NT@kernel.org>
In-Reply-To: <DGZEHD0JWHZ6.3HW5U5JTEN9NT@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 23:08:56 +0100
X-Gm-Features: AaiRm52VOULwhjjJRTCmeIenz99paxgR2nFN0LF0SfIyTSnIzK9qzwEKOMZzI9Q
Message-ID: <CANiq72=OJfRgJB1fA1T1OkteAzOYZP5OAkFqKV+WueE5C0N+Xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: sizes: add u64 variants of SZ_* constants
To: Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 9:55=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Forgot to mention, the background of this is that existing DRM components=
, such
> as GPUVM, Buddy, etc. just use u64 as a common denominator. However, this
> becomes annoying when the corresponding device is u32 (or even smaller ou=
tside
> of DRM). Because then we have all the fallible conversions on the other e=
nd
> where the driver interacts with the HW.
>
> So, on the Rust side I think we want to abstract this, such that drivers =
can
> choose the actual device size type and the corresponding APIs just work w=
ith
> this type and store the actual value in the backing u64 internally, but h=
and it
> out as the actual type the driver passed in originally.

I see, thanks for that context -- yes, if the types are different and
known, it would be better to abstract over the right one.

(And perhaps it may even make sense to use newtypes too, depending on
the details.)

Cheers,
Miguel
