Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA95431F9A8
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958455; cv=pass; b=MjyuRb2apDE9uR48MgOuM+LOKFOdreQ4im8tkDiXUzSqaCStPc9TaOkHrnQko+3yUvI+ctZBjNTLPTttImh8852Pim9B+xu9fYByLRb8eUqEyBITfnHJpnQgj5YHCbVa+3E3OThfJYkzDN8IKQIu33ii96sEuUZnEshyFLgk9TM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958455; c=relaxed/simple;
	bh=ALWDgG7FdPjEIn4xTa/ZY76rPW7bac0quJ7r4RrDnmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wbi3zoQn5dvOZ+xAoX4B+VYCiMYg1FAuAgUumtIo0ROEJgNd32dsLq4nMUv8hLe4uxQKOy+iOmkJkRBLdGLNceqaJqevzSAoU71/rqBli9L7s24+Z3ecsna7vDz8jbrIDhSn3GAYt57G5WnNlcRaohMY42SvTb/tRWNdG7eRL4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I9691lOa; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I9691lOa"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso1162583f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 09:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783958452; cv=none;
        d=google.com; s=arc-20260327;
        b=GtqjgLaYPCKQ3b4VIuCAWcON45Ovaj3N6Qk06/hRsKX+Pj355VMNXeLW8WiIU17O7W
         ap26+Pd1M9art8uXrVNeKBPelggMrckAIltTt18xYBbOI3M7by01tfK3F2S2mCnAU2Eg
         PzKLDcGIB/FqmISMBqimjJdzvycLpiA1tQm5v4PZok08v1xzmms91XY3VtqeHYqqjDYr
         cV7/Qe3TUIYfMh9tTyLzAR/5fP+URqIv0YvYN0LMkf82ALIo92weITPzdFm8OdOUlqfD
         szKWbVnk491IlHabHw6eg+5SEc3v0HwStHi02Qw8KcDH2Xb0tHN2SprXRUlmOk7wPgDM
         pD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ALWDgG7FdPjEIn4xTa/ZY76rPW7bac0quJ7r4RrDnmM=;
        fh=n/X7njIjU65frQNp0U+02YEF7pzpH0hUUsXtjwNsFuY=;
        b=ETBWUhGY5G4S4BGrwYVli+NEGVaZMGpv64XLGyJbOMu18d0hJZW1BicCa3Efq3zA8L
         MTUIXugAm/uTGNxivsGLb+tjuDlVPtSaArRhlsDO2f97BwxiBxc7H2/rf4EOo0S4ilwn
         1bhz/7ZbwKpXXlZnPBYn2VIYU0SY2AfTq4caJzkbDJPJXeqboy33VKZf+TnANa7KEuIe
         STej7zcmF6MpNJNwcTrtiEl1eVVNF2oQtYT7aSLLOfMvmSAJTDEFufRqoHxGNpedspnk
         t4clVhBhCJ0JskIz3XtQjRODBcxxJrsV5aIUkUYlx+PyvYjdjePNWIl69gWCLX+GCPtc
         9qug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783958452; x=1784563252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ALWDgG7FdPjEIn4xTa/ZY76rPW7bac0quJ7r4RrDnmM=;
        b=I9691lOal1cukx7koS0qfZRymSdq9iRPFuD4DsosVnTASN9Pk7+NuZtqfOoCKdaSAD
         8DtRHbWOaLqXiywLMyq+HUJ3ZXE7gZiMU0n8EMH4XHMX+NuwF+Ue/mpOq/Z01LVpBzwj
         Ru47+U8VRl3XRSH9wCS27sThOOUpMW2vl1t6ySWsn1SerRTpSYS46CB0J+QWDzIx5FlV
         OrWxZDKXKAfNeEwr1Kw0yY9GAxZVXQVgH9nNujRujKw+BSiPyZUSaV0mmMIsjWl8Rrzy
         aR7e1AlIxdpeWH/GtT0m6DS7CmoW1rx62apWfTRlNW6YmgcDD32ekMXtSp8UbIe00jnA
         XqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958452; x=1784563252;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALWDgG7FdPjEIn4xTa/ZY76rPW7bac0quJ7r4RrDnmM=;
        b=RIjNa6wm18V7KvgjCi8VacgdkqxHA/VUz3ZOcquixGWJ9xGQIRfZU92yWpbxxGpQT/
         X9NlM1087MS9DWBmxERRlGju5l6jW3+/Q9KSe9MLzQI5g6x96ruBC5yrEVckr9O5Kckc
         +cho/aKwdS7mJ57uFEWiGaVw7V6azTQdJXLt48NpQILg3Yfs8crZqhS+rR8VZzTZ/pLy
         w6xuBHvknP3oWIQFFGp3TbWFrAi+RQZGTWj6t4dDT26Mbpo8+YF4qiR3tL5gPeLHucIz
         +xo/QnBqJG0GcYkU8XJGymdV0ZANK0HoGPIV3IJB7gK9lKTguKvmQW7pUMLyoSP+QIGI
         G+8A==
X-Forwarded-Encrypted: i=1; AHgh+Rq9Luj4T9jwXyhZ6edqOskeyrRE/C7NKZkuXpT6zwY3JijwQlQO4lIvU+PJ46gVyPe7tSs8TSsSYJ27ty7ycg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3amXnchLdEpg/0xYWZqopRXILz+4jEWNadb8e4bt1YDbTb1SS
	tARa+G1DqnXL+52PXSYc6ZdS3ZROQkElVZ+y+yT1bFGdHPZLhw9QqHRDSFSdvEGOFIqjGHjTuI2
	8/kkCpxOREfWwS/z+QtI635W5zcILVJDuM0ZsV1Fu
X-Gm-Gg: AfdE7cmO8nGo7AWo/jI5ORAX+VDTqgu1v9Gz/wyqidVZSuaZJqovcJDM2iX2oDC1jge
	shPj7Pv122Y25devqqrOEdqA3bisBtpS7D6MdwBmyMT9TezNmXKUKR/ytgoUAiofuUsDgi5vW4A
	0fLH1pUFxU571bsoMFU7XOtsAY7Toqe64cLyTIXp3f0Smsui2q7OP+7foOnnOMHtt7k16G6NCzx
	FTP2s+wcO0M6e7JGOrkZakxInys0q92WnJ/sWBYCH6QLefd4w27WyV8Nqa0wlTL/F4VmQH4Rc7r
	6+ItgqxZXGQacn19ERkZ79XmsoE=
X-Received: by 2002:a05:6000:5ca:b0:475:f0d1:eb6e with SMTP id
 ffacd0b85a97d-47f2dcf98ddmr11425126f8f.59.1783958451446; Mon, 13 Jul 2026
 09:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-gpuvm-sync-send-v4-0-6c7f4ab2778a@google.com>
In-Reply-To: <20260611-gpuvm-sync-send-v4-0-6c7f4ab2778a@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Jul 2026 18:00:38 +0200
X-Gm-Features: AUfX_mzafnNy2CZx7HhG-61E_iI8Ovz5oh7Oawc3qtTDsCZ0QceVSz27HCvZxcM
Message-ID: <CAH5fLgh5A9qKptL7K4BqQDw2O6Bgw9dBN8vhZAWxx1vDjOE3mA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] rust: drm: gpuvm: implement Send and Sync for
 refcounted handles
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Deborah Brouwer <deborah.brouwer@collabora.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 12:17=E2=80=AFAM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> Hi folks,
>
> GpuVaAlloc and GpuVmBo implement neither Send or Sync, so drivers
> that move them between threads need their own unsafe impls. GpuVm
> implements both unconditionally, which Sashiko points out is
> unsound.
>
> Path 1 requires Send + Sync on DriverGpuVm and its associated data
> instead of bounding each impl separately, as discussed in the v3
> thread. Patch 2 adds bounds for GpuVaAlloc and GpuVmBo.
>
> This series is based on Deborah's DeviceContext patch as they would
> otherwise conflict:
>
> https://lore.kernel.org/rust-for-linux/20260610-gpuvm_device_context_v1-v=
1-1-01a890b17448@collabora.com/
>
> Sami

Merged into drm-rust-next. Thanks!
