Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F66B3F8714
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002005; cv=pass; b=XzQdyqgnTvxtYy2ofiqAvxJUGn1a3uTOKZT8MxdnOFdzoBUZKAHAf+3VxmAoe9f8DQ6rXYeEVY+oElxGTyWSx7Gk2mMLTNRZ3KroezEZLxujyfNH/ufz8w5BdAazLbL13Bjj1H/dDBqBj9KpaWDlJozbPPshYjuupjdKDtlCz5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002005; c=relaxed/simple;
	bh=cu2Kue8JGdzYQh52hcHKldi3QvOVFh2giqHCrt+XPLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVICeL/RNlnGV6r1YM+0K9ThoUIRZhjkEr2pgnmX8siCEWgxZPMlfMdHg4L8JFjqXGmfuhP/2nh01n5UXjuQnKHuv9PD/uANRjavUEgrymkZ9KqIYTFrsB4UF58AwFGzUKnYW7uhKPC2h155PBNJmBOXlkpjb0xrlAJ82vrpE84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qcsJFj+3; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcsJFj+3"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304d4e57d33so248831eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 03:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781002002; cv=none;
        d=google.com; s=arc-20240605;
        b=Z4L2fGp+oud1u7BN/jsjJNYSp5mg8j7F5AxXJ1V/fmaJYy2SxFpvBJa/3RLxaol5LH
         YNWSMJWI9K0KN4RFggwA2WvWDFI1DxmQkLxabMTnpOgUmTwZJecuRZj1QcFHFqyaQO85
         NWHYiUpkfhi3/upLxTOSu3iQXwdj5zSc7yXdmNiFGjwnE5tamS2HCubsfYBs+kV9tU5i
         r0HrqKAEGGDtC395M00r8lHG9XITT8PMRJo5K2tl1Oy2QCak0zUQ3VipyK9PEulO8RIE
         vj2RUwPa2AWv9Ba/Yne39NYS4z8xVaEvLer4Kv4HwOY20uHWyw7GNzUTPmEZVq/F+jBg
         uMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cu2Kue8JGdzYQh52hcHKldi3QvOVFh2giqHCrt+XPLU=;
        fh=rM8M3NWc4Nb6De9qLhgtRHVz70BSNwKOVVSij8PYkcQ=;
        b=YSD6cYSVA6GnWrGUSXqx43k+A8yfQChYArjYVwHcvYaoKHkj5WDAFGo2KNxeMDGqkE
         1zSCIbT8waprtf4q60KAgKkcJqlzVV8t4Fs+3Eqg66iqOxxkPghkMRzK7DBIuRN+rTtf
         vq+hz+21y1QDijH7+tk4gGPfpFiZ8aXlmSHHZcoN/8Lzoc2Ak8UZ8B1iaPJ9lzXTTCki
         QKcsNKqVAhKFUuZPlz6ydrj9Er+hYbVQmoAhAHeBn1LnlDiJ6HUEdVNCuLvw5gYMxae5
         fMYaQ+MeVPMnLbiid/HFI/ezJQT/8zCBBEwpKMcvfHXDuxmvv+dST/zmQIHDh21nRWPT
         LRVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002002; x=1781606802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cu2Kue8JGdzYQh52hcHKldi3QvOVFh2giqHCrt+XPLU=;
        b=qcsJFj+3UXexWTH1XdidoUjoHs+NHAbFgbmDtsAMeyMILuh0fvtKwPQmUOY7z3FTd1
         NRz2SKacxJBRDjyFnGq1FgGrwzazPequMIetYdcW+6TZUrebr4qF6yDd8QW2p/Qn7q0v
         nCOA+tnA2DuekJM7y7E9xtNctXv4EMB2U4KE0y0uuWLjY3ECKyzspSCGjQSHc0hEbzoJ
         uUazqgaQ9z25mCoIB0rNb9oBpSZ7SbC6N1qz0i4z1OFnCk/sfcjGHDDOT9hIPocQsFng
         fqW/CPQkjGu5UteD4Rma1V/46aRhzTaW0oXal9HGawBavIKG5m+yKyZ35TSiHFSZihz1
         fnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002002; x=1781606802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cu2Kue8JGdzYQh52hcHKldi3QvOVFh2giqHCrt+XPLU=;
        b=N38nTRWRWQCcZOuwbwuXYBKVSqogQHTUB5Ry9W9itDOQE3ZhY+02asOkVIC0BTQ9qK
         rS5N5AqMo76n4AU4h8qm/6wMTgMUVXx65nW/GRcQiU/4Wwm5GqIrJ+bnrnl62LMKa8Qr
         hW8hyq6TG+FoNvKUnFGrmyW1AkAjUA5ZOe+5RzVNsypUtLlnpYoOXXyNwsayMts/OpYR
         oFcRtyiu7HpyAbvVhOCDior9Y+7/RCcopCS5BqO/3lxaqIzpWw2btda4EcM4YRvm57Y2
         24TJDtvtp+ixO2lPzIlMqtfGvo4EgAQh7eyprbrHDo9QaFpNfqsmyNj/OIV1P+P5fuP0
         Q3iw==
X-Forwarded-Encrypted: i=1; AFNElJ8/9ak3uAXQquvHLnyyFStm1fSE9HNR8KDVU1aZ+FFrtdALgA0z+LiPbe+BLy2jGnKgEy6vJcneUOBo/xA1MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZBUczYagNZDzENW8CKne/keYYWmkuBVjwTjj8VX277fLSSuhG
	AeDXql7xObUudZGmCkfA+t1B4gWovju+9MDt9f+A2HcU/KCrg9fCn2Mta1iV6xF81NHJ4n2UE3U
	rHVLcQjZR8UgiQzikPtqQKLOTZPAnZf0wBhI6
X-Gm-Gg: Acq92OEPPJ+hbZ1cAZX4q7Psy8zLqoTeF7cUQtnjzsxZ49vbnRXDSDWUrptNbn4JK42
	grqJJzxu5JiVr/BZ/rFgG5evV8u8xTNRUBZMQ+mOzvyTRyhKq89RkVx0iEPzbWOru202R8b7ERf
	ncLIOZVBKBQ3eOj1/qUXzMLZtmX2G6IwN6uNPhj5sAMvA3QZzlFpgKZfd5thkQ51oKMYIy7tC2S
	2/kSP6BcfF/wW3Vr+Nrmlc1XRDObsuJhUJ/ajGu2CI1b8Jd0Cu5eQU7b0lhutRdPba8PcjTWCbb
	ltHbkjAVkJQ+HS6zNirqpN7v6Opf5k6oLVuiXeGHpnFVKgb/vTAx+S+jEPCwsi1c0ln24e07v8C
	MPOa7RFGQXBxZqrDHVEjRoajgwZ9SUEkjNg==
X-Received: by 2002:a05:693c:25c1:b0:304:d700:1e90 with SMTP id
 5a478bee46e88-307d5fed73fmr773935eec.3.1781002002406; Tue, 09 Jun 2026
 03:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606-bitfield-v5-0-b92188820914@nvidia.com> <aibq0WVkvey9C4_W@yury>
In-Reply-To: <aibq0WVkvey9C4_W@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 12:46:30 +0200
X-Gm-Features: AVVi8CcWK268E6b32_9RGqxCdLYA5s3NWf2-go00cNlkmk7E_5xxbpCtVF0SRiA
Message-ID: <CANiq72k_Ge=AgwqNTi8w3CoSX4s6TTbJMe9X0x6MCYXep2oKCw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] rust: add `bitfield!` macro
To: Yury Norov <yury.norov@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	driver-core@lists.linux.dev, Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 6:16=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> Thanks for the work!
>
> Reviewed-by: Yury Norov <ynorov@nvidia.com>

Given you are the `R:` and it was just a day in next, I decided to
rebase to add the tag.

Thanks for taking a look!

Cheers,
Miguel
