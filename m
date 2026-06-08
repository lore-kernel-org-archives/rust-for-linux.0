Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE72734750A
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 15:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932656; cv=pass; b=gU7qRGRb/pFhIOb1MitWG8cTA22mHQgB2VqYixwU7Q9zhNT6kK3aWdk7ZZWdyY69NtyUxFpL6ESXtgzZZzrEIs6+jzyaVaKJ7I663kWCsEzf2fERVOIWh78+FtHCBRU+kSp/MoiHNnioKmNQ6eKyARxDqc6syXqBBbFfAiTGz6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932656; c=relaxed/simple;
	bh=KoDM1ft57+IHqajAZD3LZL4ag5QYUfsdvyP25IXaXmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpEPtMKG3zkeaMVWPKlM6fZn9R/WTVXIomJ8KP7QxUgi9pmByCjJhEuBNsR5JFT7PTbCXB1LCMRywjVBSAeRIhECYDWD+m/F6MKCgYcHK7cJs8OoT1TFAGcGzfRxWMYVA7zlFa8ddIGZRNiUr6SYO/c61uV0G3jfZ41FVK7gw9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8tOGT6X; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8tOGT6X"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304e86ecebfso248773eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 08:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780932655; cv=none;
        d=google.com; s=arc-20240605;
        b=R0LDd4BUn0utqX9b9tqLwCf7JOzDyq9307j9vs2oVQzM21qhNf34DOVR96xvSJfISF
         9RSCVHm7uaBMJW7lpBFsi8x7CdfA7TkqBozzqZjBs2K+M5UsFvxrpiQ0T/wVfebPuBxh
         Wqsrs3qhhoY9DLn+IGSJVJHaMT4pCyjo+f49nP1C9adQ4Sbl2VlhhC6eHLGiNhl0IAfT
         zLvNYRrWcCQv2YhY3OZ9V4e3i81Cnoqhdpus96hIfoD9NnMau1gRPmN2WAyNSnFLl67f
         PoCwzFRcO6JkSI7aCbqHxCqE5DZaD7RTBvWzCvbxU5N98FX2UxgjYRmBKJfcTJKe7OHp
         /56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KoDM1ft57+IHqajAZD3LZL4ag5QYUfsdvyP25IXaXmo=;
        fh=VthZxK7tLT2ZUdZOmPcncrx0lQBa9tsjcGNpC12L3uo=;
        b=Y8ae6k1lGz+J3IWH/hlHYdduWRUIv/0YaMRndc8unSLWtK5iKWO9aH5u2kMFHqYMV5
         9Mw8mAVfEYUNL/frgCC8yakITnHtcJSHwHmArnYF0WR2OqbjkbT/8OJdXPgvl7LxdBr6
         o70Ba2TrfmuOQ+T1IzOclDLN9WM3oGJq6tg6JwJzqLxnLLHCVdRFqcetKJH9rp4hpeeO
         ZYv9/W6H9ewRYqGBuIfv9ufYJLvfjw5xqZkao56Mm64O0oqN4jfVXGZ0PPT/AsAUUqAS
         xO7FNsaOJq7rHipUc0VaSUur+I/oB5aES291QKFqlhTnpaIEn+zZsxNvVVyDMcUiOgn6
         +fow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780932655; x=1781537455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoDM1ft57+IHqajAZD3LZL4ag5QYUfsdvyP25IXaXmo=;
        b=a8tOGT6XPL/x3C3vzwy51dDb3hgg9I4w2/y4BYsQif16P0TlVypwUZxBq/kZpwIl+3
         XZtAM00Dclo6i/aCxGNviPt6poRnLijRl/jejWdSd76K7+G+zzeH3PCioEcEcY8ic59y
         op3gepR+eZPCze2TqL9job2x0jCXFyb1F1DuFJNBm+mcXGSLvM2jxpuEmIreF9XyHN2B
         qGha0PC3lfpEbELQ9A+wgKceAfwEiWnrUHFb5Q2gBpBxjfrqWNKPFyauN6PBBKow3GpL
         RyCOP86KYlqyB2QVJtCa5TD5xzFFUbzQpKvuru4DsAMsEzlZkWiwzQuwdfqymdf5YMqO
         S1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780932655; x=1781537455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KoDM1ft57+IHqajAZD3LZL4ag5QYUfsdvyP25IXaXmo=;
        b=mmrg2qWRQRcneKNwjS1MWyHoxJgfQDGrG7VoSZ79QbhcAZJaivQ+I926R50Tm3pV4L
         5Juj2Gy6pE4F9nX+T3yi6WMX1hcScW5tutZ7FXmLysHQLFc9NsQA3+xO3QC2ngYUkbQf
         AjBRc0+sUhpYHOZu59+kouAGCqZNNVasSYn9I00W5HT8ISBJDFTaztwg6cTvp0UzhDvv
         02GBL3SOLY35RRFniGiwwLP4jhvabZTDY7MAR698+iL2x37miP41ypIrokR0X07VqPr5
         5tVf59cciBCNr1tW8CGi4akRq3LooWdwWJ0amBgIpzd1EP9aa5hjEdJqO/ljtDtU9eVX
         2e7A==
X-Forwarded-Encrypted: i=1; AFNElJ+V9V7eXdybljf2mF5fwl+nAzFPzfsPrd51lnjhPjrIigrcW9l1yEN8MicQYeZ/EIL/6zHrm5lFqD2GFIIndg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf40RJiFG9ACT77EXtqb6WLF/xe0mBX7mU924HBOoyuqaYBZi/
	LBVpRlRJu4LrFfram8Sjek90vvm/U7747jNPZXDGQMyWR/j42166CS0rhXUsCJauCWC9LqZ52dc
	Z9WFY5ouAJNXNRzFcW7YyKqdq5fmyO+Y=
X-Gm-Gg: Acq92OHw9qWJTYDXlRbGQ+94naCZuVXDZBIBS5+S8eso3Xp9AtRROeov+OWDPDntZhO
	Hq2n1Zy+cM8sZx+u8mnh16U2lasqNUZPp7hIp/T9XTZgNKMSvCWjOBAJHVeM8Xl5/fCmr4lsc8J
	GKJxfqLWX/65lKC90kNpBHscZiwqaU1Imn/XKM5UdWP/VVIIgJ7cH9a8RbddYBxX8xF0rwTaY//
	jNKr4PnNXAWP/BhcWiL/MafbneQBDdPQ1nTwp9qOwGTup1UEloU4I8Ec74iCi7aelfsHt8OWHzf
	GVfxAx/kJEOaNynpUszmbb0OIwWJuNZqf2bhTcwZK8WddRtTK/Hy3H9pIRKXJSYa5PrX36wuU7l
	WDlHbDkf2/59FzFQk61gpLtl2ayLC74TN2g==
X-Received: by 2002:a05:7300:3b06:b0:304:e327:aef8 with SMTP id
 5a478bee46e88-3077ae6b572mr3167623eec.2.1780932654619; Mon, 08 Jun 2026
 08:30:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608141439.182634-1-ojeda@kernel.org> <20260608141439.182634-20-ojeda@kernel.org>
 <DJ3QP2IPKKZV.2L0CY2KLXP4LD@garyguo.net> <a2079a1c-098f-4f24-bed3-ecd9ab97b868@kernel.org>
In-Reply-To: <a2079a1c-098f-4f24-bed3-ecd9ab97b868@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 17:30:41 +0200
X-Gm-Features: AVVi8Cf_c-DZas1gA5Ce852YBnxXFdgvl49984uxOVbL-bKWanfzmu_gwWxAcQY
Message-ID: <CANiq72k-DOq2b=cr9NshGHyc9mOTv4kpamnKGiSUG9iOhtgMnw@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] gpu: nova-core: firmware: parse
 `FalconUCodeDescV2` via `zerocopy`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@google.com>, Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 4:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> There are still lots of other places in this file where FromBytes from th=
e
> transmute module is used, thus the file still has an explicit
> transmute::FromBytes import.

Exactly, it gets shadowed and thus the methods (well, associated
functions) are not available in that case.

For files that do not have this, then we don't need it, indeed.

That why I mentioned in the Zulip discussion that this "incentivizes"
developers to remove their old `transmute::`s so that they can remove
the ugly line ;)

Cheers,
Miguel
