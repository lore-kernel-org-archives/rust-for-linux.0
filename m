Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFB82D7394
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 10:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633920; cv=pass; b=remhP06n9zRfMppe+aAlf+jpOo5POkaXE1GAfXcva74hHqDURpOWZljqIgZW310OQz1NvHMgH2rM2MiGTy3I50w3AZkZjBRqqNA5WMCk1cM9GfAsKOzQDDvvQtoZlLo/H1aiScOcKj5uk3mO8+UOv1m+W6ULZCwK8lHnykZn/Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633920; c=relaxed/simple;
	bh=hdoWyEBSfzPVnW0gPvG4K2YGowzekBI2D6ClbLg5wVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVA4JwfIzF1+RddHw5gErGQHsPmLIJqU7zo8zTi2PsTZ7hMicHjjfUPJsjzwuajNl4KXNChSg8mDxeOiyZTA7GZNzmnNkxPrc48ny9K7s5FZXyUTRtaCOJWZh501dytpjBE79xxNK0dHMvCNKhAWwXd6Ofa56UlL2KyapaU+KCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WM+EaUYy; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WM+EaUYy"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba7eb6022eso16632eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 02:45:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770633919; cv=none;
        d=google.com; s=arc-20240605;
        b=W6t6fkXR25RLB2UaE3RloWuF7iVDLUiGDRs9V585Po606oKNRfQjYqbv8AvrivXtEn
         RTl2MMW7gyowpun54SLx4TJwCW3tXTScEuVJ9d/JegNWJJoh7L7P8Oug52JzAMTPq9+W
         IAG1HMwWLhO2KkvjYAv5Ac5uBbUf/45DL4ubGX7gWGd0ohYR9b263U7zyQHWzYzGsSqr
         Cpl6Rnoe1AZ6oWPK5Sfp7kZBMAHJQ0h/tJK9NdW/UA2RepkE1e3nXLGROuzKn0f6Nl3y
         ugIGcB3Q0zkVu/t2WVg/aWSyIAsSflXPaFP6/2LSMYRF9+IJ+C3WD1uP7jKMa65bTfxU
         a+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OQ+zj5yCqVDGCQMDIhhAeFu/f4Yt8z0Q2y0QTEMA7l4=;
        fh=CEF9tw1nLA/yGIVj2N3GZ5KMMvMKOibzN/wu/n8vrVs=;
        b=JuS3VPETqZlJFm7lSFC056EQe/yGoUblcD/hCWG5rsO38BKHN4/nvqysbN5ND/5GMe
         tb6cHmLkGeIdCr17hdYdcKVwRdkdcwM5cJeOa8vBqiS+6sNJ7spsxiG8L/cWfBiPdCQC
         WSlGlS/W9qiIlaw1mKyGsw2q+v+oExERFYBMm7Zx+Qi1PQuFPcZJXHYMyCD7U4kCdKG+
         pHUEZajbm+npC+S6nGm4wnMPm16/Bq1NjA8tK+VQjNpum3xd0DrVNGh6ICtxAbvMPzEc
         SRlJXGKT3cymjmRQZaOUezcCys1dlSyq8Y0tF11uxJqxBSAN6DmFJhkjb8tCsZVZCC/h
         X5Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770633919; x=1771238719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQ+zj5yCqVDGCQMDIhhAeFu/f4Yt8z0Q2y0QTEMA7l4=;
        b=WM+EaUYyZNlHnVMFvc8KLlnLdkIKxNOj3VdSS9bxzEAtScI+AloLPiCzsVcuxwxpKe
         g54LDkFlLp0751hM4J9FJ6GOigRx/wTU6k4WPoY7Ho6C2DX4AvlFJC3X3lVG4QRAXRsX
         11tB5rYdu4ec0YqiV9v6XqR+/Ch2Hg1AUi4KiHkXcmzs3GmmlmdZlruDk+FjlG7QvAa3
         8y43YDkXNFsvqpYj+yJaOH7c8UsxnL123uMMTKHlsNwAaKJZltYXWYoTcQ0ohI0BgYiZ
         eDgxVCVCUAri/9iKZCgZpP7GDvjTsaKWuE3WtCUP/4gxrHnznktNjHartgLrKCagEXXX
         ZCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770633919; x=1771238719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQ+zj5yCqVDGCQMDIhhAeFu/f4Yt8z0Q2y0QTEMA7l4=;
        b=QoJFsdMyVchgcb3ouaZPTU7eo2ENH3DUgGYqAcFpfc5S6xIhiih7iXBPXAu837W0vW
         oqfWADGTVBAR+la7a1ZJIrRW7agQ/vYFACU0DalOLJi8KTe70ER0aCOVGHg2oWbAJBXU
         jwmaoLUQUZy9KVMzqNIjfc+ZnzkK4pRydVjjxiPVF0avnymyCmILj7Fv3sBI7lXwcsup
         WjJ3diAnYizzg4Xc8FYO80Q3A/kg6s4gvrBM4uYXq3HA7YNYVxLeLTEFppMy63+27n2b
         lW2OR5pWCKycYBV5kpxb6ehNx3ebDHp/iTGjfZvi1jn52w6q/lHo3Y5xFqRfhBuKpfux
         JEuA==
X-Forwarded-Encrypted: i=1; AJvYcCU4eZJ6PPNE9HquXJzEE3selghWPczaHpRukE4QzHIxsF8qzZErveE4g5O9GV0YWUNoBeuhubbxpL6kkW0RPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1btaGJP9l9/C1Nrp+T8Kzp1nb/8OKZi3prlK4c6qny6vCAhgT
	hiYtSOHzQaKFkKlYpqhvzDhfsvDQkp2bbqHiEjUEgkwSnVhyxE7HVDEBysaY47tBTaS61lBptiK
	W2bhXMdWK1dCi1arQImUHjROGkxfh2QE=
X-Gm-Gg: AZuq6aIDOccdJvUANyJf4EYs/uDpfgJj9snc2KVODulOOKjHcm3VS6sTWEGYGME17cf
	Di3c7YoFelYs467Xvp2/MS15HOtv1FJs9RfZR/4V9oDYPu83/Rk30SMsyod/o06drJ0d0lIhmhl
	je6IIzP+V8Ufv562+sok0sSuO+BRfKdcYzi/n6BWhg5HX7FqscWuv446pFDK9NSPgXBkmguLumN
	RIN7P6RVOrP3p4FXlTLRwB0PDIuxKLevWICQ5PyVZD3Wpp/oY0KHBR4kZRWAUuPlHegmfJ0hk/L
	81pHzveUR5+Qak16Nqd9onMFQ5RTb87yQA8uvxRujfNN2lC+zm47s6PYHDF9bEwEeICp1JZn1a1
	HT+JFEj9WAZWz
X-Received: by 2002:a05:7300:5794:b0:2ae:605b:d530 with SMTP id
 5a478bee46e88-2b856c56d5fmr2755426eec.6.1770633919351; Mon, 09 Feb 2026
 02:45:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209093432.17190-2-phasta@kernel.org>
In-Reply-To: <20260209093432.17190-2-phasta@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 11:45:06 +0100
X-Gm-Features: AZwV_QiHWqi_ROFSnn_lrcJXExlxQN4kOMphih_9CH-TnKs3N6CI_nQtq6dZh2w
Message-ID: <CANiq72=wQ0o6Rt1kdyn0=VNPEiZ4NTdjt0-URSTkK037zUEvSQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: list: Add unsafe for container_of
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 10:34=E2=80=AFAM Philipp Stanner <phasta@kernel.org>=
 wrote:
>
> [PATCH v2] rust: list: Add unsafe for container_of

Isn't this v3?

> -                let container =3D $crate::container_of!(
> +                let container =3D unsafe { $crate::container_of!(
>                      links_field, $crate::list::ListLinksSelfPtr<Self, $n=
um>, inner
> -                );
> +                ) };

This one and another one below need a `// SAFETY:` comment -- I
mentioned it in v2:

  https://lore.kernel.org/rust-for-linux/CANiq72md+0Lerj+kqr6QiU6ySR3XjRzmu=
BiLjkpWWieM72wyeQ@mail.gmail.com/

Thanks for fixing the commit message and resending this!

Cheers,
Miguel
