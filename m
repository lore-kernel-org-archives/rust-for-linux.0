Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4BC4EB45
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732103154; cv=none; b=ssAKLOAJkixYVJnx6mqzgRgPy0yWN2RoiZgY5Hw65eH/XY7Yv6cwBbGHqKIsEyArx+ZnVgpobjlfW/UF/9x8o1KmJECVrmkxnbElabBg+hJFuiv7esikOUTd2Bn2wGUlXIY5IIiJtE1iDG9wKiGHhirjU7d3xLKxIVthkHp7EPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732103154; c=relaxed/simple;
	bh=OVoaJhAUm36FVp7AVK49tAGEAdPEa01g2tlHYG5cyUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mw4n0oHJLqeUT33y0YcJY8xdfJ3gvEUKMwcYBv8BVOulFDjDELWa1DvqJZ1yVt55l7xx2kv/xwgXOP0PaWDnc0eo0+ltcAS54qUFQQbOXzbRSKu5rtVSNxwbfVwJppKRMb4JjS2FxNvidorqoBrwUeqiRZcRYdl1tLtC41kqV+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aoa2thBk; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aoa2thBk"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb5111747cso53469051fa.2
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 03:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732103151; x=1732707951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVoaJhAUm36FVp7AVK49tAGEAdPEa01g2tlHYG5cyUw=;
        b=Aoa2thBkMaV06iQIAQh59vxkALuahXEmILaqgGW7HDDuj/PwLD63ONMHisPel7ERau
         iYptZ49Z9YXDTpzY4uYIjiqareM1BgY4ntJZ1DcuDCaLTbthHhdSwCLnlG84wwDLWuB1
         UXuPPE74W9eqoddgIWaDCBIIJpVSSbCQFO3E11RL3TO2mpziWFE5M75WP00RAN1o8I1N
         7Bdu7MAiT39y7oYUhuY5rHlUQaJpkl+G2WFJSZPqT/NnXgyWhBlDhk4Wrk6L0sonhH9S
         L+tCFQ7x1McK5jlvqHilDe2pToqUgEW22l1pqFJspkiWEKLM8E8p6qJd5owlAfvKAkC1
         pl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732103151; x=1732707951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVoaJhAUm36FVp7AVK49tAGEAdPEa01g2tlHYG5cyUw=;
        b=bKl1TNzkmhA/D6H/i10616BHHOlQxULWnuBd/I/Ua+hQNHQ6+1oD0318HTGSv2k1g4
         hid/MYXiwUyuSv2gUr2U5RN2+XrafHuwrqCF9d9BFZy1o93HA5EH/e6XJnTKOSAEUSc0
         hrUzv9bZ+R9YLDIb4LfsrKX8DL8Dift0L/1JY7vKBDAjrhltrQxh0uXCwxyUF1F7wyGT
         nDpx9K8rHPyeerc7JwJAoVEZ0Zicj9b7VNXuQFNY5brZOxyiltmuwEKbWmknPvZDIGbb
         nAPFRI5GM3JsjqgoM11rCjLARWDyny9dDnApsKQtHHKG9N3qcTS2OSjLCqrBFl5FIjuq
         zBJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj3Vgue029USwIh3IwCAaSa0lQc7yMy2hZuh+DJKjcbsBmN37nmpDyKZ+3jdezpvwP/pU+Z9vJ1FMUIMm6Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE9ZaPnvlj+u6D1T8w3r4y33A2Di0gvt7ju4tSv6tUw2XsNMcx
	WTLHen7XkpQeSH41ei/7pmJzGoWR9FAu5NZI/1SiBjCVoJ2Qe8W4tIYf+xlRhQJU/5ZTCQfQpOK
	WcpCpHDsip2oNZkwBTGH3AN0wvzk=
X-Google-Smtp-Source: AGHT+IFUI1tjMrh0Xftgop3LEQZdRBN54ts8dBHGpmRJQp090zmwn9WZ8o0v6wh93G+H4YmrDgYGrw7HKIlVqbG/MxY=
X-Received: by 2002:a05:651c:154c:b0:2fb:6027:7c0a with SMTP id
 38308e7fff4ca-2ff8db66029mr16716071fa.8.1732103150821; Wed, 20 Nov 2024
 03:45:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119192715.38282-1-daniel@sedlak.dev> <20241119192715.38282-4-daniel@sedlak.dev>
In-Reply-To: <20241119192715.38282-4-daniel@sedlak.dev>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 20 Nov 2024 06:45:14 -0500
Message-ID: <CAJ-ks9k=AX4POpBwH0vCxAa9szRQMRT=SD_FjhVSuMPSoYiWFg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] rust: kernel: page: remove unnecessary helper
 function from doctest
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 3:01=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> w=
rote:
>
> Doctest in the `page.rs` contained helper function `dox` which acted
> as a wrapper for using the `?` operator. However, this is not needed
> because doctests are implicitly wrapper in function see [1].

Typo: s/wrapper in/wrapped in a/

> [1]: https://doc.rust-lang.org/rustdoc/write-documentation/documentation-=
tests.html#using--in-doc-tests
>
> Link: https://lore.kernel.org/rust-for-linux/459782fe-afca-4fe6-8ffb-ba7c=
7886de0a@de.bosch.com/
> Suggested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off: Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
