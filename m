Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FC130F555
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760969616; cv=none; b=lgQPI8OMZpa+9yzPQg7/zjdWLa++06sqee8sk1IEY47H4C/+MkPdmkh4+54wLbS/xZFrtJMBoi/7jaHzhN8/GoJXQXkt/FHz1OKeMbaEh89t75T4fZzA08ZCG7fKq9js8I4WRNHCUa0ZKZtLsIbi1GFKOsSw1Itf9PLlzO12r44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760969616; c=relaxed/simple;
	bh=7lJuyR6K7Eyt0hpZteaPqYWMzx5S/jB4N1wiIADeqMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nczYtrCVuwbZVv4rP649/mD8cK8ZB4aLOj/2GQtuUrfFeN8y/bZwr+sS/6BJfUngMf/8cw9XbdytrQIC2qN3ZlLOfPljlNBblV/9qnl0lHUyV2dPEE2NOVltocRmYT7JPDKbMB+LV83xI9s9J9whOmclJXIe+DrSPNwPcWI17e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2q5/fnCy; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2q5/fnCy"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-64990f4dba2so1329340eaf.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760969612; x=1761574412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lJuyR6K7Eyt0hpZteaPqYWMzx5S/jB4N1wiIADeqMA=;
        b=2q5/fnCyC8Ihreh+OJA2T45Djo8c083FsM8XcHVK3gZdmLlg6WKjnIvJE+erQjU3a4
         uX/EW1ySnfn7yECy9Vp+qUKFvSs2GJc21KJ6swHauroZ49IANG1lSuLKCfWwZBJ5PAXy
         D6ObfP9ZM9UvPPluD99it8ZDbcnRtfYqZHiQmzjNuruZ51K9QsNR+UezuSFHFGK+928w
         7JkYGyNhao2CjBYwuF6s5saB4FDbdjtu3CaiGOAN3ArM2DBRSKOKdzHW+txTAb6YGU9K
         m+UpuUaZTl+w9HLY5K4t7E1/xNbJ/sQQxt3surTtT3yrs2SBV/FT6sQNABtfxdyt+AyM
         c+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760969612; x=1761574412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lJuyR6K7Eyt0hpZteaPqYWMzx5S/jB4N1wiIADeqMA=;
        b=xKWpLvpvcNiMJXa3Slgk9X1XD/h5RtPgnLQXwOjQbkbMNfU4PibpJvYFPMWIF82ArR
         qw/LE3iwAkORQxF04XFnxHRcJbO83dBcNyJf+75e3mrZaFQNhpL7iFmFJs/mx9nXhpAG
         SwHCBk1S5EaKhCG6RaxTEHBDrwdOyob4WRf3BtNMkkD+ier5b1elEllwlCahYbeIq3BG
         pqyM1ZuJy/my0j8AIF547cB+zjITi0KREULTWbPbEcXrxTL2k8tdKUIogWlUHz/bvVFG
         mT3/ZBMTBsninRJHzSWXH6vIbzslcLTGQkTPwoEcKZ9Uw+ByZcs0Xnsl7A13LcFSL31z
         96sg==
X-Forwarded-Encrypted: i=1; AJvYcCXf3Mogt0l+6YciAMGGuZ+aznC0mnujQ9iJ4pdl6sUENsBfuff8LhvGx8mCgJBJm0wWMT1my0uDgnLiF5B7Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn2MFvaTqLK5dUFVG+bDaW/X5weG/8q+3QQ3PMr3F6SOI8I67A
	irV2D1PJakDWXDis24Z1hicT72rZDTc0fBcSRoy5KOOSFMRAUDjounAYH/NbC+SwmLoDtk+PXaK
	y6Ug2xZxqWRoRJrwX2XnxPYZLlD5R27sDS6zPtEfI
X-Gm-Gg: ASbGnctWBIiW5Jxxv/rOlclPOJt9hZjTTX2YQWUqtl7H2S30e7XczjtEUcImCjNGXyt
	TlhcmikE/EG3NZVfnLjix3jS4gliDorJq/1WhEnwoQc+tbIczYrDbiRatzMDRvgRGUQMeXz3uz2
	LjPCrhfe7/7Ll0w8V6yrUkyyF9RmzUCBzmFAisSJyeAGFzsitF5ys3j9JKnSkHyPUzXiWNQfaPz
	HVerDudrEvwc3SSlLX4bfl5GboyPoUWJTTJNHRplpHYbGnneO22Qk1M0PTq8EbKYM13/Yxyeq/k
	n8/vj0cfePum2kw=
X-Google-Smtp-Source: AGHT+IGKYboV4DgzhIm34G7rcGBtpN00l5g1+CfCco8yc30ZYZiXCPZrt1Fqgr57F/kqt9fdOOs/pkcuB14jBTW8jHM=
X-Received: by 2002:a05:6870:ed98:b0:3c9:bb61:9155 with SMTP id
 586e51a60fabf-3c9bb619703mr2885352fac.11.1760969611438; Mon, 20 Oct 2025
 07:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020-binder-bitmap-v1-0-879bec9cddc1@google.com> <20251020-binder-bitmap-v1-1-879bec9cddc1@google.com>
In-Reply-To: <20251020-binder-bitmap-v1-1-879bec9cddc1@google.com>
From: Burak Emir <bqe@google.com>
Date: Mon, 20 Oct 2025 16:13:18 +0200
X-Gm-Features: AS18NWBBOd9T9tt7e55UHw8yXwua0AtGW04-Uk8_sluu5DZ6XtXxz-sVb-_3S7I
Message-ID: <CACQBu=UPsWUsqN3HE8kG+DDW_g3z+2yFxMWLQns1sJE=7YEtmg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: bitmap: add MAX_LEN and NO_ALLOC_MAX_LEN constants
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 3:33=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> To avoid hard-coding these values in drivers, define constants for them
> that drivers can reference.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Burak Emir <bqe@google.com>
