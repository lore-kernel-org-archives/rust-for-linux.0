Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32A62EEE68
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 21:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781557864; cv=pass; b=jJ43fngsPvaBD0Om7JSsJVfHnY/a8z8PX9QI1HpQv+IutXOmjZm/hbCJOgRu6kpf61iLcrbXjFAyca3LKVGFeuETea8BwQ1eon8h1MI7/InYht5/qSPfU2Ug+1athAzJx9semcqMRR0Nnv5QYpY3+jZe/36TTg/YOBszPaAN+04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781557864; c=relaxed/simple;
	bh=S3XcLirNxAvLlRiJ5yt/NCKiriSoKGGYF4k46mG8of8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=toSz1ZdD/xoYqV0YMd9MLw+y6Eg6PaBNQRIzY3LjvH1YUhlUvlOBS0474KQ1e75KtbfTrl6g0jHWkuOlg5Lbag4TpFokrvPFpVgHFD5BwbHPcXHYMqBBdfL2e9MHoZoO21D+8tJKOdGgZftRnNSxU/N1e2nutYVSkj2Bn9kPa6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A9wjj5A4; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A9wjj5A4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so38176535e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 14:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781557861; cv=none;
        d=google.com; s=arc-20240605;
        b=AEK0cBrj7Wsi8OfsDlQDbqtvF22CvTdOeZSTCsFYhtdqxhmnuMwc8PAmN7Ja8djh/Z
         sIGjHBGWoG7j67r/UjR3UqSLYm0LmP0CMd4+Ues6dZ+zxKFkY4NtttVrpXabVygJC+bd
         2vTGWh/Q604K+a8xeGrq+KHzvxlA6GkWnLICmkWWbggDqa4MwVnMYv09ytcYmEwz44UI
         MDF+7vY4ow+VazH1IiqdhdnwrWfHFttbT7aKnv35ZM42eTS4aRtksG+wWHkF+5sY6thj
         KVLjmPXV/mg+pDGMSgsIkS3Qe4fKj1X8zSDYB0hq4DsDonyRrsli3MQeMsMUVz+OzwnP
         HY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S3XcLirNxAvLlRiJ5yt/NCKiriSoKGGYF4k46mG8of8=;
        fh=HXTC1QJLEc4Qi1Lxq1dMLmtgIDeDrQu5UB5L99CXEPs=;
        b=LBtZilwbWBtm/2/ShQ+L0uJj3JdafvJk9PxjuUmvWAxwJmMO2nunaeDKJUWLjbA9uz
         qZP/e5l6eVshf7ExFA7ONFaEeUvoduHCDWBZzWhxxnk7sc4KwA27yyHM8jW8g6HsrOBk
         Jlxa1lOEVod1Ce2uB0iW/giA0sATB9WHF483dyvWWvDxhggJpB8hI/vpU0UzNWss8VyJ
         /bUtoVHyUT0niZQmAoVU5Kg4Vo6/j5j+Xyvvlh54d7dmis3MgEF8ZPR9iE0AAE+mpL3O
         HA+M520D19Gzw4igAddw4qvog/Qo9SKEh0VEqWKixGxJwLP8IroDtGDlKZatTbCbpbGi
         wI7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781557861; x=1782162661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3XcLirNxAvLlRiJ5yt/NCKiriSoKGGYF4k46mG8of8=;
        b=A9wjj5A4mR8BL8cKl6+bClhV7nW1jOVzR+7EqQWKbZgdylC9SROcOG6WwkiTl6io39
         PDZdkmKMJgavFTGZRjQqcr97E7DH/T+wFfIni1NxeuXQXcUlDGBbwK8FyXVXd6NSMrXP
         4yU4QJTfhWrckrezHBXWapVdANM5rmP7m5d4R01kkbSQXXn96QnkZ/KVo5OrFw+08Utj
         +5qF6UDpnYHQSdzd+n/cTkqt+CV1H5Moig2HkjgFUwNPCr0V9LoOu78yqFQXV7pePu5F
         gZdWhTtYY6g3yc9EfbJS/U4IzmTRP2Z8N2v+S65NO68Wma2CVpy2CvvuxvfzrwRpWO6J
         sIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781557861; x=1782162661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S3XcLirNxAvLlRiJ5yt/NCKiriSoKGGYF4k46mG8of8=;
        b=dQWKyoeb/ZQ8ZSTBYTauwwprCc61F720pNH3ZNv4PpkBZTG+FX30eV2Qwf8C01lrM2
         y7NWX7X0pmvC6WCyeDhkAttXuvDTisiFr7UmxbgzUSS/jM8T/AYe/eQxVvwLfNNGcYaa
         qTRQWlQisC9YXF6RfCNmMhjSJm6AXZhTzu3jCXIG9jOaaolxs4XR3yxnQv81TK0ljuq4
         /WY1EaYYbjutNFJaqOfc5rYeT1Cf1VUysHdn8xG5pelMc9lLTj79Um67pYbzt93WygQp
         RDmnXhaEnAjtTlMUXwS2gHTZnlvB5K3HaFQxeLfSeCN7hexKmdq5NXn1i5ozQmxdJ0Rr
         Gyaw==
X-Forwarded-Encrypted: i=1; AFNElJ9LVlE8Bn8GGWOWjguB5X/UNQKtBg41Z7J3ocQas/Ym5pWHt6NRUtQ+iA2PK/ObO2iFCFFI4ga3QwOPeDFqdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+6LvG7VuozmCZIa46//FjjtdumbhTDW4yufTvjz7jY8xOpv7f
	/QiGVMfuWjpNNJMi7jtpgEO9cKJdRW3zl6fsikbnDdUeOevEcrsh5kszHLaMUDuXP/bf7FsbMRL
	YJYWuEP4ofZyRKz9ir4iLbxMb08CZth6c+odHkRWe
X-Gm-Gg: Acq92OGVP81ZR50GzzYjVFqFYAzps1z+p6HwZc7E6CiVJgcLJrbiGzq9PWi07Nvrnoh
	hAt/n8RHBA+nHQKtYyRNu+rRXSfYmPcImpB+ofGA1llAjtlAJZPIEIvVjdUH5b09XWAKHYdJjjH
	UvIg5F2BUwB5wlVmT8Ziip5XKdGYyG7XSS1ZjrTdI5l46Bd0ezVNoIFy0PDSAmgYfMPdljyMw/7
	RW6qbKll3bljvPtU/VtmZEzHrO44GEItZWhW0oAYkP3CgTKFD/mxpPRjlTwxarhiGJxwAUodkCU
	6UuK1l2Dy3gj1u2TEc1D3BwVoT6sugBqDxJ1Og==
X-Received: by 2002:a05:600c:4693:b0:490:cdb2:fb5e with SMTP id
 5b1f17b1804b1-490ec504d88mr247758815e9.22.1781557860744; Mon, 15 Jun 2026
 14:11:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615201737.262-1-iganschel@gmail.com> <20260615210516.513-1-iganschel@gmail.com>
In-Reply-To: <20260615210516.513-1-iganschel@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 15 Jun 2026 23:10:48 +0200
X-Gm-Features: AVVi8Cf54_BvplVdRbFsmkdVZNozPm3W-937vCiH3IxdrMIHTV5gXt6ubjD8MPw
Message-ID: <CAH5fLghjsXYRnY1-Ytx5iqkeREkgpgVK_mLOKBv+ZDipJ_My5w@mail.gmail.com>
Subject: Re: [PATCH v3] binder: synchronize Rust Binder stats with freeze commands
To: Keshav Verma <iganschel@gmail.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, 
	brauner@kernel.org, cmllamas@google.com, ojeda@kernel.org, stable@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 11:06=E2=80=AFPM Keshav Verma <iganschel@gmail.com>=
 wrote:
>
> Rust Binder stats use BC_COUNT and BR_COUNT to size the command and
> return counters, and use event string tables when printing debug
> statistics.
>
> The Binder protocol includes freeze-related commands and return codes,
> but the Rust Binder statistics code was not updated to cover them. As a
> result, those commands and return codes are not accounted for or printed
> by the stats debug output.
>
> Update the counts and event string tables so these commands and return
> codes are included in the debug statistics output.
>
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Cc: stable@kernel.org
> Acked-by: Carlos Llamas <cmllamas@google.com>
> Signed-off-by: Keshav Verma <iganschel@gmail.com>

I noticed that the patch heading says binder: instead of rust_binder:.
Can you update the prefix to match other Rust Binder changes?

Thanks
