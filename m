Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8521D3806BD
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524332; cv=pass; b=egDyri8Ow6/DZRZOeyeObuN9NI3TSOHamoWzgqs8e7IxFCgz2x1fJrnFiLNzuCLjaZrhYH/2PKkryj9qwhBEM/UKmIji15Cxhb8NvpDGW/k1oT6FmuEt0TUc7G0m60rixM1c+Vd6Q6MwwHY8YvkPZAkNPMUpLjQSDspqkt8EH/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524332; c=relaxed/simple;
	bh=vOZfMiEQfO6pItb9Vox/F3+dXN8hmkgAn9QnqBq/R7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwzwXFL+ETchwqYujIlrCXykRxNmb/sJ6pvnqFJ8PAlqi/yMjL2BUaF0hNBQP2i7Z6JcED4kMyw4cKZ3BikxXaG1cRgGZse8SwyMbMR77Sx0upAgHD0wGsFmVkWe2SNVkERgYDsIUJpBbQwA1/kMfp/8DeQ2HotvR+3Erl9Dx0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGPNCDP3; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGPNCDP3"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c699b2400so1224191fa.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 08:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783524329; cv=none;
        d=google.com; s=arc-20260327;
        b=eK5FSz4r4+5C9kkck1gqJZ4A8e2zDg+ReYUj4ItbPbpOSoB+fB1rrWAGy9pljfihCL
         ljDiMHpBC3jrz0Rql/IOWY9hQyQ5IzVtwwPrIa5JxdNQIG9bYmlzNongO5b1CJO9htAN
         SxFg7efyG0/a0qggoXS5pjCr/Ub/Mt4WBWwlZjVLiYwylKX0ByLQ+mcM+gP/UMxIr2Sn
         rMTj95Xlpy7EajiH+1QQ4vvf9WrGoX8pO4Q4cW2kgr+Zl/JIa0Ev84oa+teGLz8KVPEv
         2J1p98kR1TaDkDeM/8EOxgsit6EfLIwZau3UFIHJWfueyr5m9k4Hc0S9NafXuX5KxKWL
         ur/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vOZfMiEQfO6pItb9Vox/F3+dXN8hmkgAn9QnqBq/R7Q=;
        fh=lSZ2DOLyHg4frUUXLf+SoAAky9S3K2M5zdAoEN1cigc=;
        b=NuQTYd712QsQrgS0I+wVskspVyZLjT2442iURGi5HW98vlYL3YnaDNTbQJ8hM9whyW
         XA2KQyYYZNOuoqkwAX/5p9I5ItBCgJ0pm1yU/FaVPp6DxPOfApU5xksor3X19FD83lw0
         UFCkG+UQB7tQ4LLC51lCnHZ6Ro3jl2TeOtjrY6YbGsfg261Nr5SbGxEJktHG7Ai1qndI
         5c3brsCgsFfZU90PnLoA4ew4s05Kl29E/IpJmVKq5zHEn9B9eI2PJ8GdVQAJNSqB+38q
         n7lQtW3WQr91rIpEnBiz7fuhWy83gGegr/kqsiR5LSJtVMc1vjacvaU7+X9MRNYaJKyb
         LnZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783524329; x=1784129129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vOZfMiEQfO6pItb9Vox/F3+dXN8hmkgAn9QnqBq/R7Q=;
        b=nGPNCDP3zX/JD7JIelS2PhEF+dnHsaiaOhut0qhiHFhIEdMQNv8rhdOteRKRyKDs+O
         MTuI00PiiCwOq2+M77Y9nUMWVSuOrAmNnLqqspkKUVeb7agC/GuayKrvlRzD0hurKyKP
         LQU5pDCGPN4HjoMMdqdCivY23Hb+OM7SBGpQiihaFw2Nqw9UssGn4fktsrrI1SzCGoeN
         ssHsz8WZnXSmo50VjEBo2+1ewIYnjbK4BVSh4LOGnxdKjcz1vBX1SwGcsn0dQQknRNZH
         Is/U1H7JjvTzL5BjnySPwPTbGeGZ/F8uIQcfWdHXZdP6kUJqCXhZE48cxU/07dfmohO0
         EyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524329; x=1784129129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOZfMiEQfO6pItb9Vox/F3+dXN8hmkgAn9QnqBq/R7Q=;
        b=c86drbmQBFA1CA1HyonbT7YJe98mU1kzAzceSVbsUZZifO+7OTZpGL6/HeC5AFeg4b
         SsEcBftSB6BsY5CAu96Ai3I7TzkpPfAdSujPIA6OqUNyL3HWq45MeDeNzy8oCmdewQUF
         bA9GCM0taumz8bTONGUxrkEDTm89Db8gUw8l1REvQMTnIWWJsmLmBqGr+a0UGiwMHtwi
         u6llPAp5pPv+hWNBoVRJA88J2w65NX3enW82eXhF/2WZb/MeV5kLZT6CnNClrIDJ1QJE
         J4atSQeHeePJJ5nC/QQKk8XRRM6gTGLG3Q4VKLzYb1hC1Xpq1MPfUNoCT+4en6izBdES
         q4pg==
X-Forwarded-Encrypted: i=1; AHgh+RqW3vr3HcJD/qUYOYbDHbUhD0HnIUY362oXH5Lx1NBu82HUXu1TnldAt/zU5SryqTAY2yw41MVvFtI+F4du9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwESQmpZcJmiq3wOk4IX64Y266KCF4xpaU11AlPB6yc7VghzvW
	5/AAN49PKj5Nn4IItZEwc8EvUQC0ZyZWWXOTGvn4WKiQVoXrbGw9E2nadEm4yfZJeO0BdNb+bIX
	xHbjFMcTDTf3jHHu2/QugcncFDwL2OEU=
X-Gm-Gg: AfdE7cnJYjGYLjsjnNzVXzDisY6tInuYqxrp6fscxDDWUa1HaW7C/JG+WQZFPUZ3MyL
	dt+BwO7Uhi41WIbVyZvCLGCKihwsbjW5zCcnd9KrdBQkwWNYJgAcrOogErjeufGvRwGljBETBt4
	+N6zaIAozOd06Ajk0X3siLpdLL7N/Afq3BXF+BEl1JKaEADgAs7rUDvfYGdiM/jrvw4dQpe5qh2
	FVWSwZThuqAdWbDwelU9gJFuVccoGemXI3uaBPfWWJrRsDcl8P9ONY2GYbcS7LidhToF3v3hfON
	Jrn+nZxlBqH8KblISyGsGZAX33wlIRLNLdtjCE/iJrdXsR8wmlemJmw3RqyBPOKt7NwwUgJ35q7
	I6XgZd+P3tKBo
X-Received: by 2002:a05:6512:3987:b0:5ae:b9b3:9f96 with SMTP id
 2adb3069b0e04-5b0115c01f7mr445459e87.6.1783524328462; Wed, 08 Jul 2026
 08:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-io_projection-v6-0-72cd5d055d54@garyguo.net>
 <20260706-io_projection-v6-9-72cd5d055d54@garyguo.net> <280FBE45-5653-499B-9BB0-A2C77030A826@collabora.com>
In-Reply-To: <280FBE45-5653-499B-9BB0-A2C77030A826@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 17:25:11 +0200
X-Gm-Features: AUfX_my_GxC4KLJmz5i_4DX9QExeJawd6XQyKpw76D3pBDNdQQvLPjQ9qPUqEYs
Message-ID: <CANiq72nyEK7cMphaawV73bN7VmAKG-UOE4SPDWDpAqoLs8zzKQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/20] rust: io: use view types instead of addresses
 for `Io`
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 4:37=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> You mean to avoid that cryptic =E2=80=9Crust_build_error=E2=80=9D when th=
e assertion fails?

My reading is that it avoids the assertion failure itself -- if the
compiler decided not to inline, then it would fail to build when it
should have succeeded.

i.e. it is not about improving the error message, but about avoiding
the error to begin with (not sure which one you meant of the two,
though).

Cheers,
Miguel
