Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83453A453F
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 13:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812987; cv=pass; b=adOW6pW6lhbwVqdaM1qWBmz06gm4oDcoTXR3oWzmvLSCJ7UM9lU2dF5CsECp07sAS+QyRps8fQIk7LAa/Yr+k2z91EdvJBSPpVEzgpFEDKYoASyN0gWkCGymA57R0BNgLSpnzempuuGw1IvKUgBqV89XBwyIOxCZ+/LjWzQcFSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812987; c=relaxed/simple;
	bh=ISLS06yB/S3EGCoT9V98gqwfJCG52MaY3yT2t41Lb1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l2OX46bSYWt+4Pwx5Nun8EKj2Xt9pAY11BdMoME0i4e0k033YSohWM6B+vIaKpXAsjC5+1Um8CN5/ltbzEk5iaVKUZl0H4OkkNDXvEB/gZLvO1UCe+L66zwu08GjI/eVTsR0DiMLz3n92FReFkiFW/QPXokOvEpGm+SIr6L+Enc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qEQWcimE; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qEQWcimE"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535dd9a601so137054eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 06:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791812985; cv=none;
        d=google.com; s=arc-20260327;
        b=SydbaJTArHvTN4MIRhlWrf++0gmeAQ4Sl3AMCPOM2ANv5GkRnvPHG+jZPplw+QAJBI
         AsEOWdteiYOCs5/6mHHe7ANDWMRs7Mf6fOp6Gv9iNFJiMhYPe9PbcoesLtkszRrWqjBz
         EXLZ30h8GKadfxi9mOVVDq90zUDe4ZjTETjjvV50RxyR05XciZkPJkfAa2MLttXaS4GZ
         HZ072Kec8dBNCxinqIFfqS2cFCh3VObB94h/MSnjJpZEZEVGYkwpepztJRoF31Ze2ga6
         HuGnroyYeNI0UUI/UehiLWIX8sUz4I6aPQRegbxWf7hRCfF/zyweLIhcXEQeGt9+egNf
         04tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NpCzaba4Z8+h5YN2LOxOirHmD2jHuWMJ2dQPgTxO+Lo=;
        fh=cZxt42hQlryEhWG3K/eULReApZrdj0VIdRbHzviR3tg=;
        b=pk47wJUAm6vWsgefTxfU/uRK6fR4n4iJh+KlHfvAhE7Xfhix1cRrrHTI17KW6nvZTL
         KOW7W4HSS2AwvvW3/KN+nZvSdCXqYy/nsmVGym3NUFUFhcbm2SNjZ6SI0xPuqmros7IF
         YVUiCvyMHbVdu0FudVhzFtm/NPR/k7r/HuE08SvX9s0RSbsmO0nynfS/agKNw6nz8fGu
         rFSJZ+cRN9S4OhcItjKH1HEzHl7pCN1WKPKHEgOGICsft+Mwm5AvJnXMbAYEojPJ5OKK
         eq8AOT5q2gjEWiEQZUTL8WxD+ayBR54B2AdiAO2y7jsBPpWKQLk7hY7NHNO/8X5Xbs4P
         5pcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812985; x=1792417785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpCzaba4Z8+h5YN2LOxOirHmD2jHuWMJ2dQPgTxO+Lo=;
        b=qEQWcimE9b8CLmokMFwVrAG9prNF9C3aX546vx951Rn0IKsOxLHqiKS1qCJmJiQtbs
         5Ate4arF5jrmLcBeINsLd1kdM08gOMUWEfvk+S80zj+ithd7jo6oEdQRl8yNUK11z3Tk
         8CqR9LAnz+fvVkwet3SojpVY+cUJNgKQ2fzIs7cEmPQ6bcBtutu1w6fHObPZibRsEpnk
         mIKIOPePR8ULsvXTsKW3MyjkXdKWvaxXKXDcc7Fd68mNDS4Vwbb3zboYCG8yR3K/IvEH
         gOLSChznN0DXs3+JzLUXdZU8cfSaaAQ3Poc9UGgPCaaKL4dF6+4Us2WAJCVTp8lzLiqe
         kZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812985; x=1792417785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpCzaba4Z8+h5YN2LOxOirHmD2jHuWMJ2dQPgTxO+Lo=;
        b=IvYHuj0dkuCDU/qOAv1DDkPJ8CcEVVPZwBTTnIUi0WBqjttY1GHghWG6D0zSXjOahB
         tAPXgW7MqCwQhzQ3WXmfjSjxxCQPwDny1hxnX1wHmScCy3Upktk/QKXCxvvQeMSEt3/E
         saBbej7iMLTn4B0ZhAy4jtHi/CGxzuaunultVh8RG5WDJI2ALZCixxtujbajvU59Tg0F
         raIp7ymgcpi65O3LnNJa+eYV8XSAAODyVVkVWoK/sk/NpcZCIwTSt6YjSJXCGyvw4Si6
         b4maO4ORvBX0AFFAM+o79IAXNxRGfSNv51CnCXBHk/xxS9655+EYuGjsaRt8KskoBh3g
         61NQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2Q7bzAa1DIXx4WIOh+XLj6hsa/cPF5VGj7AL/o7bDYZtgStJRaZpXIt9oHmkKPYR5Xz32fzom9j5Zc7HLZA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5Qf2NvAy3WCpGC8gdQrXHsyJHgDZlob3DRlsdssuOEvsp9K8P
	Wcoga5joO7Kzj/FwX/uvJex3Hs0UkpZ5E1QDiSjtPPNwzyWYdrrbQaMLXy8WjsPbREmJL8brRfA
	TWuv5RKmAJxmF6Cw5+QLPQ0l06sTlK9k=
X-Gm-Gg: AYBFou0Y4o/+V3eW0671vmRD8clyAsTxD95wlYftZrJLSzs8h5kO8wwPppLKNeUl0qJ
	G55xXsojGSDCOXJb0+zWv4YftKfVhmkhQKNRidRhH0EK/B8jPPlHOCQ9MBih/+Oqxo8w0cKHkGU
	DlT/Pl7KarTvNeXls8SErCV1l6bqBuRGy+UJ21LX9ZP7iY9QQuc+oUFCS+ZQvCB89VZzzB9/IQQ
	2v7urIxlW/qsaiMT5OPUR9fshHrHa+OxmWgKFFOHLQXbcK64+RGnLndGBqDU0pInQKhiRz7erIU
	pNjJ+nViQK7253vEaRXhe15+fdXQCJyYpSbm1dlbwMYPQv9dL4TFmdcLM9m1O1meDWpqKeG4vI2
	GIGXWNaDFAQGRCzrgq5r94vXgwG2W0ChE9WLyNGxXplFPzBwV1oEAUmMn2ZGEVLc7zDgMFMb3wV
	8A2r54cQ1HmGaOQ4xcDhfhJ2TA9qbXwOih+7nqK3LLWn+HO2L3pGU=
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr21703631eec.0.1791812984668; Mon, 12 Oct 2026
 06:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-binder-consolidate-txn-prints-v1-0-c1032ed3221f@google.com>
 <20261007-binder-consolidate-txn-prints-v1-1-c1032ed3221f@google.com>
In-Reply-To: <20261007-binder-consolidate-txn-prints-v1-1-c1032ed3221f@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 15:49:29 +0200
X-Gm-Features: AclHuK9FlJBQxWuBg5ggpSstOEqtRu7wPHdBjMSfhvAc0OWk2l4KtMGqxb3on2M
Message-ID: <CANiq72mk9x4Uxzx5+TCoWi4omZ1RjzrBNHpNx-wUVEdk4bZfVw@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: error: implement ZeroableOption for Error
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 4:33=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Rust Binder wants to store an Option<Error> in TransactionInfo, which
> derives Zeroable. Implement ZeroableOption for Error so that
> Option<Error> implements Zeroable.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

If this goes through Binder:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, if it is not going through there, I can pick it up.

The `// SAFETY` comment could be a bit more verbose, like the one you
have in `drivers/android/binder/error.rs`, e.g.

    // SAFETY: `Error` is `repr(transparent)` over `NonZeroI32`, which
is part of the option layout
    // optimization guarantee, so all zeroes is a valid representation
for `None`.

Thanks!

Cheers,
Miguel
