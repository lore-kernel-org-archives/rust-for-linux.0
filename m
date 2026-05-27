Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D48F3CA4AF
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883839; cv=pass; b=W/M622AFSJ8r9t/ZeSaU27dmUaZJmxi6eaIDIDmazu4zMKilK3UCYoiGrtDLBLt+NdMg9YTF/GXDn0LCAwAx4qGuuCJ1cCTls9t/bYTmXHcoaZWR72XIgtTxkbTMzZP9JC/5E14tD+R9YCUetiGFzABO4ik6uAnYqF+1ULuRb9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883839; c=relaxed/simple;
	bh=9SMvJts0+Ko8/KsbmBYJVEEWqO8MvsW6A3genso8CbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkhMFZ4EF8dAAuQiopXSLALSFk1Y3fW22ja9T+WQvhLlveJ700vrGoGLDNQX38RXw2zcb/9LAgZ6vf46e+jR8yS7Fuc1usaLKnxDs38HyhQuSJtfqChqxR2RFw1/JtrCKf6VVpemFx8fuXsHIUu+lDsHaT9a/RDorke1iAdv+zM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjSt9NWc; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjSt9NWc"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bda3b4318dso1187106eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 05:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779883838; cv=none;
        d=google.com; s=arc-20240605;
        b=DyOmveZ0WFBjozLLmcPog/ZT+81pKyD6FMHeoKSd7hkJDEXBSyvCgnEsYECrZAcOsf
         fsysTpAUGmTDH0v9qJTiafb1AI5sYuO52DC66d6HJn54OjKdRaTDm5/g1PUKwtLekfrK
         jd9yZT+XnzaKjeEMkKrKoMm8y0E1Va9YyPXPNP+l0cp63rYbx9ceLIPMP1nyCFTb5/qF
         eR0ypAKGptY2eZm3LsAKReJrijnwOkZt0r+g7EE7EbcdYUMFjoU660DKf2euco6OExTo
         mDE+lbX2aqO9YqXkjKsNZqo0mmNL0IJLuBwOZWAR3vcQfmDGz09L/KHRYhpkg1LcT8CS
         n99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9SMvJts0+Ko8/KsbmBYJVEEWqO8MvsW6A3genso8CbU=;
        fh=ktpi6isgAZmCGbq03VTctSUsleorZmB39pnjRWHQN9s=;
        b=PhDNo/Xfj61vep+oIwQ0r+dBKukLo27K7AV5mswZDPecDat2Ayr4oNolugnZ0hUrYa
         ieU7NUoZXhO6nrU2dG3wuK3k56EkeXQBT22i01cOwVxhqkP1LR11DeJJNL1AO1haAA0D
         5u+E5oeZtUyRKtoijhwK5ohEbfcsI4JuqLxumki40A34p4gTK9646If8W1hJKUQB+tbW
         PbnDH6d5SJXLmtU5hGLkR5wQjMwJVxx/vmyyisN4kpkrjABvOn5n940aqUlhdwgZpo20
         xDuS/ytbe4UQwIwUh/m3/BxPupshQpc7iYFz2GM7k9aWPUGUBhOMoQZEWilGX8xmr5qv
         hkvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779883838; x=1780488638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SMvJts0+Ko8/KsbmBYJVEEWqO8MvsW6A3genso8CbU=;
        b=XjSt9NWcEEtkR6Md9py/ePCY6+G7eTbNZfhy0HnJUJlY+LNmlKUEz87zGpLU8qy2xd
         0bcYhMhhcmAzHHiVvh3W0VQrFpJS9R678SvwknCwcJThtgEQ6iukwIeVrh32odrx/+Jv
         /RgFuVgTFBhXzt9MkQSx5IyL+OfhV3PyY777D3MHe66RrZzCIqxV7sQQhJZqjmbbhbFd
         DMfXtVNheID7ga19pq87beNSB8BZWep9GK6w1xfkVbnRYuov0Eozc2ybT/U1n8GV2hFv
         Jr1OKEHjomRtSrM177CbVSaBSeisg8z0h6yC/mNaQyDNRQN+k17EJVHPEsdHAOJ69V3u
         s6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779883838; x=1780488638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SMvJts0+Ko8/KsbmBYJVEEWqO8MvsW6A3genso8CbU=;
        b=SJcFsedcqDdCKY1QG+qj/ZnSiDPX2UEo1x3CCwbHEDWX4vm2T+UaC5lbkTyDFM8f6H
         kup1Ns10xeQFCscXulCv0Gqg2nDQa/y6510A/mgDOIXj92TlsGp2ZclKEnWI2y2CsxRP
         CTXicbV01zBphPLml0uUQ9+BMmzmvmWeAvS12JiQEJp5H3oe2qCL6eVTMqXxBtDMnMQo
         neL0eKqcejjvyzM3gZxNWQzHRCFWG8jHyI5w0vtWA9QRiyDZGprW4tvH/aIhFJiqZpbW
         aaH3wyaWs8iQTHdEo5URNI2AQ2xmdMkfMk5C/Dip0KROinWJG47Lb35IexwDtjqZcLTR
         xlrg==
X-Forwarded-Encrypted: i=1; AFNElJ8TTegQo8BC6K6jwBZ/Os23O3KoZ1E9LuS3X/pVfy/vbZyNA7bCqvvS7KwzYFE4TK0JJzQ5LLYzqoCpvd7pfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwboGEU54sc1vzfSJIXD+n4L0urgHL3c0LHVf3xHpGk2tUS63/
	p7jNUDK/k9LPFIavbT5BlIOW2Fl866QBtBjSkmXYuehSHGQKm6L31geMoM2pBBOP5F8JkcQUlq/
	v/EK9dKEdLN4gDypfKSzkmlicq8tdNVY=
X-Gm-Gg: Acq92OFdFMOhtneHy+hs15oLhDlQ1SFObhrW3YpeqdDbS09yW/eVedO1l1MQ/Xqax13
	Cp5aiEHxcXvoVvrGRQNI2rG6rQZ5wUie83AjNiWmY/gjoYvlF5ZYgJewbHpLndDxVIYR+XCM4WW
	slbe6NRFbDJ+vS0KjuOTXpCDqTYBR8QwiEsAflY62qsAiJesXAtGdf09Dkc00rHlDeoi2obw0tZ
	k42mYIKyr1t2mBMah6DmQ+JkQqU2mWH2ke+wOx6NATAcpL834khE6WaTJXT5jZd1PIAjf+yfSMP
	SC6tkF2/4f3ClCFO7YbOEFBZnlvodU5I20UQFywzyLbiFWceBUEArUeCkJyCTQzWcAFe99+Dm2x
	pQ0PIgMuZuq/NSAF2zuQs3D9uky8Hrjt6+g==
X-Received: by 2002:a05:7300:fb8b:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-30448f39539mr5268008eec.1.1779883837507; Wed, 27 May 2026
 05:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521165622.279953-1-japo@linux.ibm.com> <CANiq72kT7YEuMaM7wkOtCz8ZqEXbPLniA-x4L7E=B+x0zXt_2Q@mail.gmail.com>
 <20260526161312.19291A8f-hca@linux.ibm.com> <CANiq72m4GVWFYqnxNtCHTPu7XcGewHB5LNwOoayTfnXs9pPbNg@mail.gmail.com>
 <ahbJtRzeJUqpj3Ux@google.com>
In-Reply-To: <ahbJtRzeJUqpj3Ux@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 14:10:25 +0200
X-Gm-Features: AVHnY4IOwat8wHLs5SZ_NDcVxFuUim-Hf_Ilt3-n29eG-Ytnw8O6D6NcQ4eP7VE
Message-ID: <CANiq72nATtptB+hOHAgqg8Zn_mzUSPRZUCXxnL2j0_yNqrMgOw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] s390: Enable Rust support and add required arch glue
To: Alice Ryhl <aliceryhl@google.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, Boqun Feng <boqun@kernel.org>, 
	Jan Polensky <japo@linux.ibm.com>, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	ojeda@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	rostedt@goodmis.org, ardb@kernel.org, linux-s390@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 12:38=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Based on some very quick research, it looks like enabling the backchain
> target feature does not affect the ABI in the sense that mixing together
> object files with and without this option will still work. If that's the
> case, we can add this to the list of known target features for this
> target in rustc, which will silence this warning.
>
> (If it affects the ABI in a breaking manner, it needs to be added as a
> separate flag rather than being added as part of the -Ctarget-feature
> flag.)

Yes, from the different discussions what I saw is that the issue was
mixing it with `-Zpacked-struct`, but that is already rejected by the
compiler. They also discussed whether it should have been its own
flag, though.

Cheers,
Miguel
