Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921A42820A9
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 02:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773975345; cv=pass; b=DUvto6wiNNjw0rRJRa7EAVK6KB/gbprNVVp5IQXPICuj18I/xnXly4Cin+O7UG4VFnMHk/mHpMl+27xY1UsMpEloSu3x6cwd1NVLz0sN6hi2JOLBC7lPKCKNy7kbVCtCRg1CWn+kGjAx56jdoKfnMVvF87bAGH1kyJ5lEOjUX8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773975345; c=relaxed/simple;
	bh=XjjsAMWmrZwELC8TfyO3/pUjuvFMVYjw9TBuZTls1CM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sESUUR/D0Nq7BYYbeNtAcb2SdxO5koeXsYxc6ks7t7N0k20ftmJoqoYaW2QNB4o3k9rtba1Qsr0TUjTiTji4fmCWDFR82xNgTDrpTi5Cdb6FEPOTY3Fi6qNR3WYkf7w0btYa3IqgypUVFEoYCtw4gz3EHeW7I6St5ydjXPLlJGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbKZXv+I; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbKZXv+I"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c0bf0a0236so42793eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 19:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773975344; cv=none;
        d=google.com; s=arc-20240605;
        b=U1R/X/QPLKF5/EqB7QhM0ikoccIsowS20c0q3uaFwq753ikUL1b3eb+zTbF21h3jvN
         nkfa7wo8zpD67VOuphkvdXUmXQh8CJ6owZxsiy6zv1b1UFiNyAnY+rHzZhbOxIkm9ElZ
         aBegn2Rv+JabOKtjQy83vUqGC9z9+0UP19w6zd5n8iLMK+9cXC5NjzPss+L6fST8kgYz
         mKQH1GvCztwwhkNF+Gi3OfRs7Rz+mlReodKiLzf2hPGS/hxYXkYHm0FJoswtTZBrQaai
         DwiOuLwQEeIZROUQTlbINhuCLKBqTfFOgwocEDuaPvdBE24cA3CkaOGIyYy7DS2Rmry4
         5cRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tDVwg6XJdWaEorly2x6nuDxv/5mv+hxWuP/497N0rHw=;
        fh=IMqmC5ZMwwbeH+tJkYT2V6xzyQSDbvrArBq1vU7zwgk=;
        b=MCa06sb6rd49RrjboMPt43y2wFODyCYLZxf4yrNgZd3NU4/majKQlEscwbhcfb1RcI
         KCd/ZBuCJ7tHL3RedX7pkRhT3SK6GhN6eWfivX6JWJy31igpOm3YPzqZxsjmGv+KEYi5
         MkFShEtGacadgrCGSWZk0AH2XYibMPV94TW8Ln3a2SUHJG8EvX0a3Dg3AU4MpVAh4gCN
         Dw8LWvk7ZaTdXPul56PeJH4wfURLKhpKUa5xh0en4YXR8dkN7IrUpyHXMZ21E7tOC77k
         +J+xbT3ZIblYryTAtXFAgyVZKqqJC8DPncYrEA9GRAIWEHZr5vBNnTtcrV8V9tt57rly
         idYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773975344; x=1774580144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDVwg6XJdWaEorly2x6nuDxv/5mv+hxWuP/497N0rHw=;
        b=SbKZXv+IWdIA287cvM7T108aqc47S5WtYomFkLqXAVrtfYC6V2PNKb+10y5JQXodHz
         ST/EN7cHNw534+ecG7YkEDG8Vh4KAqT2p2YDaLzwD+2D8w0vWFvr1tkY70nTS77Ic/tn
         3rElN0Yj2J7yMA07GQ2RIlmkggkUyXOj3vEtRb4JqHCXyVpf0ZmKh7MHaZSBl/F+I1av
         LCD0Jc4EfsbKhmpzgfeHXLk2WbYOLClqfswWnhAchmndH41XWyCfRR7jMjXioy9stVux
         doMy2+7nHrkiEAKvi1hbpn9qzOPiBcXSA5DxVRU4FvpNxNJAJfhpNGFuloGuQpuEqrhc
         EJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773975344; x=1774580144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tDVwg6XJdWaEorly2x6nuDxv/5mv+hxWuP/497N0rHw=;
        b=AQPFnAtcJbt+v5mH+Ljtj0Ww8uq6t9m5lAx5G51aiwCVaUiCQUVapxoYvJ0yNOTINu
         xvtV7149/Ed9MuzFeWsiTx1joAML2spg9cDK2SSCeQwKvyTuy5aP6aEKQICpfGplZyWt
         OlGlrtdHbjb1EGeIwdZkrBKWdi8PP8WT7d2S4y6S5CuOj5/g5ptkPd9GVU+t3jTjv+L2
         GwQDMtYHzw3MR7KEbqC/jgn89lpywg362nNNdIE6gsGDJ7W49GdIVWi5gO3Wg7K84TzU
         wGWOdSqvR7QOZFSf+6hd2gnGBA6Hw/CYUu6nO3JyOmCDjq2PL2kJJgH3yXQzwwnXloNc
         ncsA==
X-Forwarded-Encrypted: i=1; AJvYcCU85AV0/N3V2v5zSfGrAv17G9EUX8DZT6ijRZfeVYfjhsBZ3I79mBJPvUikrNXd8BVt2No92UCh1oQaKAEg4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+UAgQpeGzC4JZ3BXlJJl9jjsCw8LzRdKOd/1ZOLXoDv+AYM7Z
	WaPmYrlneAc/1DneTjAVbcCg7CwuS9uwAds5qx77aPtlZgoJZ5BTVu3diw6pwpMunYEWM2zLhCG
	50U7SzwM8ht1dtmr1EQ4ememAUPvsAi8=
X-Gm-Gg: ATEYQzwnz17/ho8Jz/1guz0+vxbsmZZNK9yozbR2AX8AcEgmPckpHVezIbMJuwpIrQX
	uCJxmsB3CX+fiTuIgcTVC72eYwgDefhRZ0yQ3NmNdjkUfrU5qj3gVPA0UasWxVPVSupg07caG5p
	PObwRt6DwssL52qIVbKg2NXqVZtU0SClZ1GTufa58+0fHPyjwm9+9n42xmvZCF2Dpv0EclEFHlL
	Qr9MehEIIFEdklREnpbY+ooWBZzomiTRn+iuhETmWsFKB5ZAzT7XJUNpTpUIvT2IgHjSB6qqksW
	N+xDn9tMRtctR17aeGblG2ifY7MNjo0vPFct3oJaBjK5S0u36tHEJDdg9sZPcwZ1Zk/WnrvvQia
	Y6IGT8qM32KqbhLN65iX9jnU=
X-Received: by 2002:a05:7301:6093:b0:2c0:bcca:e9ae with SMTP id
 5a478bee46e88-2c1097ae9e0mr371378eec.7.1773975343676; Thu, 19 Mar 2026
 19:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320011844.2264931-1-alistair.francis@wdc.com>
In-Reply-To: <20260320011844.2264931-1-alistair.francis@wdc.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Mar 2026 03:55:31 +0100
X-Gm-Features: AaiRm52AcUJCW-51hKM-LebZ47cjZmSPMRCAYaLrBJ-or_SIS1tdMyuUMAdkmts
Message-ID: <CANiq72kj+BVdrkLS9wfZm7GToEjcbq7gaBZo4C++2VkcnVktkg@mail.gmail.com>
Subject: Re: [PATCH] rust: Mark all from() for Error functions inline
To: alistair23@gmail.com
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	aliceryhl@google.com, ojeda@kernel.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 2:19=E2=80=AFAM <alistair23@gmail.com> wrote:
>
>  rust/kernel/alloc/kvec/errors.rs        | 3 +++
>  rust/kernel/error.rs                    | 6 ++++++
>  rust/kernel/ptr/projection.rs           | 2 +-
>  rust/kernel/xarray.rs                   | 1 +
>  rust/pin-init/examples/error.rs         | 2 ++
>  rust/pin-init/examples/pthread_mutex.rs | 2 ++
>  rust/syn/error.rs                       | 1 +

Please Cc all the relevant maintainers and reviewers using e.g.
`scripts/get_maintainer.pl`.

The commit log also should explain why we mark them as such. It also
doesn't say that one `inline(always)` was lowered to `inline` as well
and why that would be preferred (or not).

Thanks!

Cheers,
Miguel
