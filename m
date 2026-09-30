Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F8C445AC6
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 19:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798133; cv=pass; b=XwuaV2F4oqxdtxah0KNTd6a2SAxHoyBbHOXUh2oQRp6MknEWZ1AJsYC+u9iMbFeJ2DiGPT1lHXEgLcx2EgvU8Q5T1dPN/7164ZawjTdRKBb2l+I68lpNPYrsw5sbkpiP3ky7kgASKt5YxjJSWUXDH0Ms/xrzwTal68Y7tK2gdfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798133; c=relaxed/simple;
	bh=WMUdy7tDiX2awRwToea1X/vv/AICGI82qmsgusMQ2+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j00V7mB6SmJMIPj0PHNB/zkyQp2MaLvkpWGBiRnXKQp7qFAoeEwCrd1yKnLwJxo3jPRP8fgrEoiBUQUtXBVhBzVS4qfpIopXKSfDRLy3/o6FE3fSO4j2GMWyVrnBrhpyuD7GZmZxvQVy9V66kZySsJsu+RpHHdqXNL4mEvhERH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nks9wCrA; arc=pass smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nks9wCrA"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c41135so756293f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 12:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790798129; cv=none;
        d=google.com; s=arc-20260327;
        b=idTdM91sCviZjrbeskKyWgZOmMijGQjaezVGAqj/t6djIFjQE6TTOVT3ZrLOquCkFj
         0uiKTlKOLkfQhuQ0zP6dvkHmXoBEDg9DyuicMlMH3OoAXaF6m1esfQVWlTUwM8f6E6Sm
         dPUiJxhWu3PTLSzxZE1PesWrWlTixZtvrOUcV+h3tOb+Nkp2eUgac0JhrqPg3kOCj2nT
         4zWp/l2PXO0DYghvgkb2w14w42GJ8WmAtGW683VLgJ+ZWfYbufMLHYtZVykabHddGgHL
         kGEv21GRoNdMZMll+c6biuHZCjNHyOwYW6RbnbY6/HgWcFESlT2nYBcS+evu1Zbegdp+
         xM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WMUdy7tDiX2awRwToea1X/vv/AICGI82qmsgusMQ2+w=;
        fh=UFNSkr2FMliGR8xMNBW2sMa31N/toqLOWcxX+Cb8J5o=;
        b=cII7BAsYlIlr3eq5L5vxqiJrM9h1L+7toBuXfHqpdKuqZXKWu7zmYDABa5T8yqTYF1
         Hv3js97nsJGIumcRXjRgebb9Ja3RI+h3Wh+nMuEIbHEcf8yyKazWl2WgRvvOR3Vt/dmt
         fgjqlSLKuYtiPWmy6ihAxNyJjAV7s/xJ9wVECAfYyVzsmDIGY57gz+z3H1tHd8px4uwX
         n9GTiIdDqaV0Fh3Ufg2iGEZhOD3P+hCxZWU0J2yBUslCxUT16FWqges3MTmXw7uGaJQX
         433MAWMf18F5K034l2AljWxE6lYcGxEAT8VEm6Tj/Yzvfq+b4Azs1KPNR5IcvgPN81Ud
         fH+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790798129; x=1791402929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WMUdy7tDiX2awRwToea1X/vv/AICGI82qmsgusMQ2+w=;
        b=Nks9wCrA5hSPNe+bsn7IpJBxvnjiwsE94ni+sfjtmBbWrEamXuR5NGcpaCMRri2qwz
         U1KwDXwd7FE+6Lj4nbt5cIdddTNOuVhrwUmxX9Nkv70Ixexd5oVOq4cADSaTUGJUiyMW
         Xj5iPLHXqyFc+PmrKONiVb05nwe4wCo7So+jZ4z+dG/5vGxleDcaMd8btLR4MZV5QMO1
         qJXObhLGYdzdJVf70V3iUkOHc510tz1zZ0MbFh9NdUxDFhXuhNf4F0gfKO04vTmPBXvS
         zyIn/8FYS5XESbFyjhNRFEcHpe9rXObOyGvGTWELpCIUfJDdqIztLlG+qStuDIUpsbjb
         ITqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798129; x=1791402929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMUdy7tDiX2awRwToea1X/vv/AICGI82qmsgusMQ2+w=;
        b=Fz813eRxahxmw/8tHj2morL1DHicf4pvDtes9x1kgx8BGb2BQFlaocQeqSlB5P7i8a
         uftg9bAwDr6UR1GjWOrUDIxlLTCXta8xCyh2GHhPxvRl/Sm6Lh107rMoZMRZnW58Smlf
         p7vwjgq/ZMGkik37X4leKCHwRYYPOTHHuEQsau2A51bjunYoAAwKtbl2zF6BpDalzCeS
         POSWZddWN/U7Sv8ImHca/tbYs5IK281slR8knuXFOubSPkYzo563J5r09ZF515enGeM3
         7J1KEaQC6q6kKCTtmlRm5B9RK6iw2azoYIE+qSFDthDbQ/YOFjxTeBB2Qy9jc0AbzLnC
         7ppA==
X-Forwarded-Encrypted: i=1; AKwUvBz+PecLBnJMKeukVlPIpKcIOAsh9HbZXHYhlmyY8CgHIGxK0zDCk3e6Y9X51raNQRctkZrzWE1kAGjy83SDiA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL58DcTQiESA6oyrrirh5gl7ozHQXsl95k6Fe2xjbjyXATXNL3A
	a63cHJC1weKm9nEBpI5GIsqhSRd37bqftg+vaq+65U6QadnAfSavzJ6xC4Kb9tOhsk2pSggwoCj
	MwIL1gXLm470c5/fSAnJF4BC6+ra5eWi0eOAHt7oF
X-Gm-Gg: AYBFou06eqvMybd0F3MnIthT62HKCYA2ThZ3IyTSOPHGG35ga4gF+pURgyXc5CBz0pV
	XPyk06sfhI/9uH6zUKtnwiVueooyJbv2JWFlKepZ54VYvohmoh1R0rR+XFIMoweJeBNAOkfrCDd
	ykpfX0wZQT2EtuXeJ2CIDgxCVL0/Lo63rNuWSE7Jnd/B7cGaepysHwWXJ0dSHhGxqeHXZTslwfU
	Qr3QxhNtPZRi8pdxmkT+SfxekCLmOBljZc+krlkMo9tVUzzK5UGDUwYyi4ynZgQLfGlSNFHopsJ
	qlPA/usoby5222iSdlH5sw6CO+0JVtRdoyxgyCBmz7b2jBp7oua36i2y5oKrC3w7KtxzQiGDkgj
	b6Amu1+Z7o/XRbwArUrEqsSQhkGOZzhg=
X-Received: by 2002:a5d:588a:0:b0:48a:fc9d:fbba with SMTP id
 ffacd0b85a97d-48b02457162mr5782247f8f.1.1790798129262; Wed, 30 Sep 2026
 12:55:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-tag-set-send-sync-v1-1-51acdb36f4bb@kernel.org>
In-Reply-To: <20260930-tag-set-send-sync-v1-1-51acdb36f4bb@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 30 Sep 2026 21:55:16 +0200
X-Gm-Features: AclHuK_sfXYw15I6fJGf7REWaiGXo9FpiV5-U-o9glg31QFqn2PhckzyCf-vAyA
Message-ID: <CAH5fLgim+vLu-92B2vCi28cd7xOkwAPTVtuGqDHF=cj5VmpknA@mail.gmail.com>
Subject: Re: [PATCH] rust: block: implement `Send` and `Sync` for `TagSet`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Thorsten Leemhuis <linux@leemhuis.info>, Boqun Feng <boqun@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 9:44=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> `TagSet` never implemented `Send` or `Sync`. This did not matter until
> commit "rust: block: fix `Send` bound for `GenDisk`" made `GenDisk: Send`
> depend on `Arc<TagSet<T>>: Send`, which in turn requires `TagSet<T>: Send=
 +
> Sync`. With that bound unsatisfiable, `GenDisk` is never `Send`, and the
> rnull driver fails to build once configfs requires `GroupOperations::Chil=
d:
> Send`.
>
> `TagSet` owns no data typed by `T`. It only wraps the C `struct
> blk_mq_tag_set`, which can be dropped from any thread by calling
> `blk_mq_free_tag_set`. Thus, implement `Send` and `Sync` for `TagSet`
> unconditionally.
>
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> Closes: https://lore.kernel.org/r/d1381ed8-eab8-4fd7-8b15-1e94876d7099@le=
emhuis.info
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
