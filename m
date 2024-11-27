Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9D7145FE4
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732697333; cv=none; b=DUbh0UDAf/FiV4o8vQ8WfJnRh91aPv8CyxRLJND9+fOQ4USXU1RT6LNIQrVi7HaMlQIwwgx5sADmKjZirUljrEn+A/DrIFD4tCAAlMHFm5WwBCDOB6zP4rpgN4hRs1EgBi04XUub6woRWsm2tVLUdBEv3xw3SBS1gn47JdpEBkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732697333; c=relaxed/simple;
	bh=34K+RiTuaKKiWhapmp8C9xMFZ3EzcXvYzblmRqMaMfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrI6Ky1/EWO+R/1SJifkFXRLKSjqXkZXRkzYtbDeoE3ZRYo8l/3yN7nwuGEMBfb1+9+V/f7zo7momvKrjlmrPuXd7ol/oKOAuu6z+HJOUBo7ThVW9N/wlg5aUb5XT37D4ie+jxaE9uQhmT5cyABk8nF7/NJOAfTNEMmnRj1G5Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1wQMVlkf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1wQMVlkf"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-382433611d0so5433416f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 00:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732697330; x=1733302130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34K+RiTuaKKiWhapmp8C9xMFZ3EzcXvYzblmRqMaMfA=;
        b=1wQMVlkfPu6B7jUFiUhJo7BydU+1QAyLt3NrVv0euER+GmXVSF7q2uh0ZT3C3U16dv
         zV1+Nu0n0e317+Y1SBt+ZSQXTJbyGM3xhd64g9JYoQpACyabOFY44QsABae2/PGUol7e
         623CzLs1VnCaB6TIU2nOqGOMhDME6hjXvqkXwQTnHr6YnSJgSWYJwdC4y1ojoJaj56X2
         VpEwb6CTvwwIaOQfzgG2SADQ32iSDJ2df6O36NXnZy065UZHUtXxCGc6VFrTZVhobmSX
         NJ+oRNMUS/6ryi6c4UpZIVISI6t00x1RVoqG4mqucH78erKD7oLjKtO5EaqcL/jw1ZHP
         2LjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732697330; x=1733302130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34K+RiTuaKKiWhapmp8C9xMFZ3EzcXvYzblmRqMaMfA=;
        b=dDq1baHvo+29XhJj7p8gBbQWMmNzXBBVEMJAwKhpesbkHBBB+tsKvn4wxMmLZyZ8C5
         QHKMrwRH+MzuU/+yPU909z9kZMA3/0kxKcr01/K/hKssEkczm1xVsc2V/Lu6WfjxReK8
         4Eyb2/R+jBRtzvU5rBcQC+jT3yLpj72ZmYAv1JMszaGGQibZjvfVEi3iZkjs7wM+Cmid
         dzpqa0YLOu4eITanwzxY4Bia4ZY3Q60abypUvGz7WDXfu8wRk2WAaIVTPNGSrS1jjPuW
         Uy3HHQ5lf56uJtG7Zd/Q+dc3Yga7K9dWTr5vt9MQaKWdRgTVixjhXohF9PYnc/v5dqb0
         V1OQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/1XxAuuJZWgZexos/0n5OKQ0N9TUyj6ESRWQqyS+aHmkcUDEQLbKaTP/qCBW26Woiu+AgwR9Zakau2qbFnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUX+WdnZ9srIz+iMdeNjaRNU7r0wIfZWhHFadB2VIF3WMkT28m
	BA4ocnY0Hgp4GsE9FWAjEAvId+NTiqhEx05xtx8P2BH4F78hZac2FxB/BqjL2kG7DytCjFRjJEr
	JgKJoRol0L5cim2lw2Dof3pC9d+p7GvGQY0O2
X-Gm-Gg: ASbGncs3h2LPWcPWNLV7Iz8u+05+5bwb/i8kq0bMpjo8Ej1KmSkCxIbxOvfuxvuJK/f
	y+mWOoFqc2QdFodLhL3u03ZNqeQ4PdvGX9pFsEO4MSFTHfMFWlcP835t1dbIvmg==
X-Google-Smtp-Source: AGHT+IHrYa5MPKjpZ6rG5XrYYBgss/SxLDJE63q7/L01zrjFxsv6JsJu/7Vwk1TNRrLZHtxWL9Vl7WrALnO7EnwSl28=
X-Received: by 2002:a5d:584d:0:b0:382:3c1d:ebc9 with SMTP id
 ffacd0b85a97d-385c6edd015mr1613665f8f.49.1732697330019; Wed, 27 Nov 2024
 00:48:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127005204.713495-1-kernel@mandragore.io>
In-Reply-To: <20241127005204.713495-1-kernel@mandragore.io>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 Nov 2024 09:48:38 +0100
Message-ID: <CAH5fLgh6aTZUb7ftfHy1N99CR3togWCT_7w=kzh42q1YRz-wVA@mail.gmail.com>
Subject: Re: [PATCH] rust: add safety comment in workqueue traits
To: Konstantin Andrikopoulos <kernel@mandragore.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Vangelis Mamalakis <mamalakis@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 1:52=E2=80=AFAM Konstantin Andrikopoulos
<kernel@mandragore.io> wrote:
>
> Add missing safety comments for the implementation of the unsafe traits
> WorkItemPointer and RawWorkItem for Arc<T> in workqueue.rs
>
> Link: https://github.com/Rust-for-Linux/linux/issues/351.
>
> Signed-off-by: Konstantin Andrikopoulos <kernel@mandragore.io>
> Co-developed-by: Vangelis Mamalakis <mamalakis@google.com>
> Signed-off-by: Vangelis Mamalakis <mamalakis@google.com>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>

Other than the tag ordering issue, this looks good to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
