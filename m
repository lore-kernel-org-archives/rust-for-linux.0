Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2C02D97A4
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 16:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765643186; cv=pass; b=jSY2uzXlu/Vsllpm7MiBuijzoAItlOaauGkv8GFQ7HahxlATdIdUUpNehOiIw/ZPSRBVc3KsLK102U4+46qOQfN54ALC0ET6/z+TVtaVOWZJGBtk8qzOiZSpkANkFblDT3xjwMEAYAfkIjfKCsnvaSIbicbxyxyR0+ft2by26c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765643186; c=relaxed/simple;
	bh=hEBudBX3Q01w199DsTrrFGpPOeohMRWrBP1pwxGVdm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSQQUSUK0Xgff2zLN+ule+3RDa1flnfF1smpCgvrGtR2j9crUaVqynnDFc1GFi1Tm7dBfEliSRnIKPhitR8qsGXoEECCqFJbaH2RtpghjRqJxT7OICNYovvxqI4G02kdvs1stG7dNeDp+T7veeJDI2b8cYYdVn0eEMDF7xdsBEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t8QKCbk1; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t8QKCbk1"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64969e4c588so30582a12.1
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 08:26:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765643182; cv=none;
        d=google.com; s=arc-20240605;
        b=LG4PvDlwbdG278M7hgDU7ORduXsHE98ScYrPfp1Q/58VzO3KgdTpdMWdbj3z+B3l/b
         oXJ59FT7BRj+Cv5GyYL6s1f+/i6BTvtfpEINEBJ2ZJt6eIsSA/5qAjwqTG3L94j3xKwl
         AeGYjEWvPj2WpDUKRdezlDNQKmXHz+h2PkzGrFtEU+CSWwiyxgFu26t63ZKCQCR+dtA+
         zQGWEBLIyJTKymmdYoL8HeVnZAdomTgCz8qEr6by+4mFdz+ku0x6Jj4GAXU6oeTaYCxz
         QV8i3gx5MIbRZOyfZO5HddNso9vjvF+TArg/C/T/YtZXdNXxAPniuZo5u+NEFZqDYNgE
         +c+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UCcUMaLmmuSJyWtPXvbL8wx2gaEQjZqepTePqkogohg=;
        fh=ucPSjvuqRr+Lkyy0HA1VScUFy9VegmmBz8TuajFYVuw=;
        b=ERXCaRKnmhjge/orcq5gHcsr1zRtp55LakSIDRy5dE7KI6jVY12wc1RxQaQgC+8/Z0
         MxA9v8mlT+eVPI8vDlNdOgL6XtKQX5PBHdmsSp67JXRk6UfJU9MYQnJ4KSkIJGHjfcPi
         zlZwZmfn+8ua2MSTdUTYP+MOvsVVIzySecjFdtDtd+C3r025K3EGVe0xnOnNKCSiD9m1
         cWTKBRT8tUHf7XWYrOuMNGx6vknLSGeIZkU5qD7jwxZGDjNL/YuDRJnpjSfirDkJhSuf
         8zw6RpvpwyjDjLJxnwbVGlIfr/k3y7uP8Km5CKbkNyCJujyUQ8Sz9tA7Wj1MFICruqjO
         DUOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765643182; x=1766247982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCcUMaLmmuSJyWtPXvbL8wx2gaEQjZqepTePqkogohg=;
        b=t8QKCbk1TybRm+hIkp8I6RokTjqO4TMhksmZT6mXwPPet8rYm4J6qT/2B/h+XszKAJ
         I/ueeejSKGbimJSjSIM+Y9kMZ+osBljaucqEXHgqS7bx1NU6je4/5GaEoWbBn9QT+eNz
         OGGTS1QTlRnjfjqBld7wOetHPz/t8vYKMjVKnlkuRG81ty/5kVpD8a/ca3OZEMvawCfi
         jMXxiXKYdWawxb9owE8WJEtV+Od+5oqud7AJtJJ6XEIQGFDC7pFjuM+ZYorM0ryGYsts
         OlNoOEZM5/d9fd8eb2g/z1TUeQ7vFejESQwnIAscVfYNfAhxhMDlL6QiziTRawMBDNwq
         8c/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765643182; x=1766247982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UCcUMaLmmuSJyWtPXvbL8wx2gaEQjZqepTePqkogohg=;
        b=ki6M1/50l3FedyduqEN7uez4e6qrVcaIVMf3Yiium3SkAaDTZ/zHvRetF+kbHR9oCw
         TIw4+8p6J/OgmqWtmZplyGG3JAw3OIsOeJhQwmIjuQ4k/bZ5JM16kzBHNHWi7jpiR+R+
         r6VzyKbfQaa+HiTR1D50DJ69vEZJpPn28GShBqyn47rSysrc2e+FMWaSnzztushBEZG5
         KK/6S48pE8s96FipxGzH+J+Bsnr84rv12rBumADZKrK4N46ebMWDrXkB/d6VAcaYVecw
         a84xGQdO+yVhYGVB7ETEMvTG5p75vK2MeDmSFwX1l/caPcnUmU1DNebwDZ5q6jLcptKY
         cC0g==
X-Forwarded-Encrypted: i=1; AJvYcCUweNNxRwNBXWz66qxi29rrGu4Uf5rcqu8VrDjHZiksTr8H0SV+xa8Ol7acXXRbbQ78fYcsoMq07PHjHsGiZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx1Eg9eNB38pH0U9sfckRQ/JLD4rDrg5mc/zd5EaI5vuuQPuGe
	JJmq1tEdbgyrfWFsSVfbXuSkgje0qft6awOY68kfWw2fVt9E8Kls8n8Cjs7IxMaL7AWLenSIbQo
	UB5Gj4kipy2+IzNkOIjjf22W5lyd9Tb38J5MSyAgv
X-Gm-Gg: AY/fxX7unJUg7inpzRMkSVhd2+30lUT3IAa8hPpLNJhlJkObfNkIqfrSsC1wbgJDAot
	G8FMNeTxLz6zkcE4tXQ3Hb/gchoK20poycgxznzb/rK6V89lwSO0WjTPfOL7AY9KtGUw2utdaYZ
	rRa2kntVaUF/M6cRjrBWYxlhQilwifDtN91z8qtciUlIHDt9o+WUtLCmAaAODD4G/d86/e/XhHG
	hTjcoh1h6xA07U5WS9GEOr58nYQg6vyebSW3dE8tjQjA9pyDCCTQjDCRGkP7ZMaiEtuaT8VVjTk
	h3bgBGoKbuw8CG2psPgg7qB3EA==
X-Google-Smtp-Source: AGHT+IEUdvD3cjPJQUd+i/38ghXd7WenRONQcYN+rKti7PPh2t3kdQCDmEphkPsjiPrvX15XZMhthgHlSRSiTWQxA1g=
X-Received: by 2002:a05:6402:717:b0:643:1fab:c9fa with SMTP id
 4fb4d7f45d1cf-649b08ebd80mr24795a12.9.1765643181930; Sat, 13 Dec 2025
 08:26:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com> <2025121339-giggle-throat-3ef5@gregkh>
In-Reply-To: <2025121339-giggle-throat-3ef5@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Sat, 13 Dec 2025 08:26:06 -0800
X-Gm-Features: AQt7F2pmvKYqLnlo-7jEPckxGSTBhy44qunYOEwxpz9Yk_kxzY64crBZWsMxapc
Message-ID: <CAGSQo03JTd3g7RYsqQcGNwWR708JMg3wOnnBxxii_SuxN=49oQ@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Greg KH <greg@kroah.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 5:28=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> > Re-implements qcom-socinfo driver in Rust, using `Scoped`-based DebugFS
> > bindings.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> > This patch converts the QC socinfo driver to Rust, intended to be the
> > first Rust driver in Android that is owned by a vendor rather than the
> > platform.
>
> Um, shouldn't you have a signed-off-by from the maintainers of the .c
> file here?  You are deleting it, and then not adding anything to the
> MAINTAINERS file to take ownership of this new file, which I thought
> checkpatch would have warned about.

Checkpatch did not warn me about this, but I did add the maintainers
of that file on this RFC, so we can see how they feel about it on this
thread.

>
> thanks,
>
> greg k-h
