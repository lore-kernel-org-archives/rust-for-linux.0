Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE12E35A927
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777210753; cv=pass; b=mSqcbmeWebyu2mwDCaTKU10WXuezU89Keoc+LgrJahXgcyyPdAM8s7PuGp2IZ4YzUqlOdGcs6Xuw0zfOo3rQSf+quW/HYiHgJtySQdHuwFoNM8I5NPwUKn8u8uA8c/hjFfS5qhoKif9fBcwmY9Xlv2KLAGu7zX9PUL2c6dQYazg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777210753; c=relaxed/simple;
	bh=DCb1/ZUAqHiTdNTjoUe0Yv3+QBU+Qsu2Ba1dlKT/yhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4Whmxz3LAtveUG6CrcY448p+eIjEciXRaU7HKSZhNU4wyxRUJzbakV0bhYhTGbTQspmFvCY+vSKhZCc2qSYM6BscOdZdmBA3gIJZtcGoduFlbADnRnLvRWpoVdBFDZe2rDQEpgM3sj7hxyaC6ylZWIGFKjXvaNlVL00bQbfH80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkFkGjJl; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkFkGjJl"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2e92c54bab4so938274eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 06:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777210752; cv=none;
        d=google.com; s=arc-20240605;
        b=TCEb7L2YE08qIpoq1rd0YAb5+j3HCJ2RnuBEEyF5ZuQkmnSy9+BFOyMwTgxc8ILman
         1shTNBsL4mV24uorXVOCWkP4ER2Qxkjdk6q5YisCDLguRXY8N1tvn3/+vmJDdKtVH0OQ
         jQWnvS0EpKUUL0CuVrGy5IPwzXWElfTtqGqMFxeX/Tz+yY0gMCqz14DWMQY2PmkYwlsd
         dGUz43D+QzHgq9iJKWmMDOEkq4YvdOcAE6W4xNfc9hUKYxo6mFJu+E/+weAdVWjZmPz8
         6xarWFCudIU0WxtbNLiweHlOtLM90rqCvqg8hKkix4TfXBGJsyrG5HXO7UYsBarLrsYC
         swPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hJ8DcLxB2JVrirt0Sg45Okfd7fZqqQr+r17Ct2ukZ0g=;
        fh=I442Ka4IK71+7cJEnrDldFKOhkZJjZ+bwEwinc4aemQ=;
        b=Cw/GLYiD+FKLbiWpSQUWEN/GRGh5Zu83Yzq82ZXBoMSR3zznS0Z7q2cPEfLyjhcPCp
         pqwAseVftDHZCCxOAsrM7ae1JsfYOaYtwTWXhd28y1Fe0vAE556VMd+0NRU0tbAbkXYP
         PvFCIT0eWuRvGPmW5trS7c91STnnP8SRrrl8enYGQ5tnaXt/S1fAaQPakfBDIUgGoeKN
         G7paSdbWYfhsn/u5Yx58PFnAngmGzlr64dPUlL3g+QBJN7TmACCUXZHyHsc6ReHRV8A7
         zwE3K4MwprqIIABD5UCzuXSB1rhFSy/RgbOR+XXVIZICftZhBAEjHa5Vgp2yxhVv2M9W
         XyfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777210752; x=1777815552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ8DcLxB2JVrirt0Sg45Okfd7fZqqQr+r17Ct2ukZ0g=;
        b=UkFkGjJlQBmBFgkDaUPvHyiKEjWxHm2DThK8aQkrZfLmT/WqFDiFUN0Xt4mU4NCwEi
         313RkXqVZq44fj23QYJd5HxupSCs/I7wWuX0B9oasMKUNye0HRxjTX30IL/JY76/B45R
         0xz0FgQhIVwyi8E+25FNSD30wOVqgVVgD3sD7u1KFv91c/eDW4QIQQkBGgqNAJkIt0JY
         0iau4OedPTGrZba+hlziy4oAdxAqYa5F8ih3TSzBZnYXtKebhk1jfMHGjACj+OyHVWPE
         l0v2FNp2dq45pypQ3zyXd6hqRGEF7CvdvmtjxIn0C/95BwAHzaSxTpDyMZ7DQQhrtVDM
         Wa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777210752; x=1777815552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hJ8DcLxB2JVrirt0Sg45Okfd7fZqqQr+r17Ct2ukZ0g=;
        b=SFS3Gs3OY1Bc6zNOkawjA80YR4FfgysjpR1i2lqazZHhzb6DIzM7B2BvxSOUbUSk7q
         fUxQs/kd772o0vtFjuRF2+fFAG14/gXrsAdCioUckay8e+gRd/jmVqwCbU7Ol4021hot
         //mNGR554nhqCXPKtzRrJW5OHavDrbYsBWLlCUCN8+bOHqkS1/5QEeCZgLJ1dX7KwQXc
         2wZ4b9aaACFx3KFLtn0nh3ffX4YXZMRSsAS5lsuNmNZmfxrON0c4gxjgb4jjaRdhMl4Q
         kyImv/uqzPcHpP8vrFXD6lACBEuFDTo3Mv1uJajEENJcUV0Hsu0ka9Js3PMI04NevztH
         JsUA==
X-Forwarded-Encrypted: i=1; AFNElJ8CONbejzaAvtHorSITZi7PjrmUEXYI+7RwdO0JMAdxISE0/BSQlZjTfW9Psh1y9sMyrjHMTNoSxYS3YE32bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5+To2KpWzDSlHFb24VDEEtWrLgAXdrv2xwL1+Bhvkd2bOQyRY
	lt3k1qyQ6p1WxlN4YLhR2r7CMl/FOPkriT6MEp/GxRuWESZELHDC/ulqSeADI6GtqOoVrP12XDp
	K9Ww6/y5j6dBmnhvC2b2UR83mevfRm9w=
X-Gm-Gg: AeBDieu3uUELoiqjnbW89QxrzjeRd4DQHXBeC86zVgUAKThGSxJ2EDmkz53IaWaxoZA
	ifdkJQ5JsY+sP/bZ8wwsKZiAwhl50w9qqYDoDfNYsWrH14BdiHb1HucQiLWlJNWYhP+t6JODHgI
	YeuSDeDxI79uMStW5nrdTyV3fb2DDoA1WiE40lmmopInnRmiJHLMtHghp+ZfFIInXB7Nw7/yFRv
	kmdMQ/oS+TiDDpvY1A2qGbebLs6okfs/DxI7jdUTCB9oRcpJuaktbu19bXEOBcT/8p/DjTQU1Ly
	mbV9s51lsToult6GReEny2o/QhcbO3MfkHJh4OE1riqTECjKEzSmPLhr97fUdSQ18ET/r7Syz7E
	RaJoVP/aIJ9d64KcQCHBgNgW4qw8xP8uCpp/WX3RCd1e7
X-Received: by 2002:a05:7300:7253:b0:2ea:5057:a2f4 with SMTP id
 5a478bee46e88-2ea5057b6ddmr6070527eec.2.1777210751989; Sun, 26 Apr 2026
 06:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425135701.34010-1-sagartaunk2@gmail.com>
In-Reply-To: <20260425135701.34010-1-sagartaunk2@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Apr 2026 15:38:57 +0200
X-Gm-Features: AVHnY4LIb0TcNjHBTKhK40AaNmEOlKHBf9QTa2JK8buSU_aWWzQtGRV8YeklLSY
Message-ID: <CANiq72mtOi_Lm0RqkvSpjVuzC6S0yf_-PFTRtyh4_Gi8c_BWWQ@mail.gmail.com>
Subject: Re: [PATCH] rust: workqueue: fix SAFETY comment Arc refs in Pin<KBox<T>>
To: Sagar Taunk <sagartaunk2@gmail.com>
Cc: ojeda@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, gary@garyguo.net, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, contact@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2026 at 3:57=E2=80=AFPM Sagar Taunk <sagartaunk2@gmail.com>=
 wrote:
>
> The `WorkItemPointer` implementation for `Pin<KBox<T>>` contained SAFETY
> comments that incorrectly referenced `Arc::into_raw` instead of
> `KBox::into_raw`. This implementation uses `KBox`, not `Arc`, so update
> the comments to accurately reflect the actual ownership transfer.
>
> Suggested-by: Onur =C3=96zkan <contact@onurozkan.dev>
> Link: https://github.com/Rust-for-Linux/linux/issues/1233
> Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>

I am copying a procedural comment since I just wrote it for another patch:

  For this case it doesn't matter too much, but in general, when
  something is a fix, we add a Fixes: tag (and in most cases Cc: stable@
  to accompany it). That helps backporting (when needed), adds context
  e.g. for reviewing (at times), etc.

Thanks!

Cheers,
Miguel
