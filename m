Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65953158DD1
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732093232; cv=none; b=uPu7p7VRwHAMtRcXF+lBvf/pE3zCRTsMZH2OAK1ytVJsE9/uUkHj8ZbeAOGkUMbgouhWuS6ObKaPeeoODVnGrql49SYocHljWQzlz7PXu1go2Yw1FDI2KfB9x3TKl1ppsV9W02nxrW3Xb5G9/ITwuPjjtQgxSMZZ+9eMdXxJWD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732093232; c=relaxed/simple;
	bh=bZzAT103RaOWJJnZjel5SGY/kCRYeA1Gafe6RrGj8xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DVuk78dXoo5/vlodLi80pXs4+7KlmUjG130jBE/8WIrNvcxodzqyk5PKT3r+LSh4j1ck2FuxOfZha5YrXY+UqzyOG81rSRKd1xtzE9UpsD9kTrouk7C7Z9+9ClSYdwaCfUqH/HL5h+WX+qdEBsCxpXT8DKMZZ4ooYWvBATpFQbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eQYc+zQh; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eQYc+zQh"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-382423e1f7aso2305782f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 01:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732093229; x=1732698029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZzAT103RaOWJJnZjel5SGY/kCRYeA1Gafe6RrGj8xQ=;
        b=eQYc+zQhmdNdV22cfMm0xNgyVCsRWr/znMESnbBdFXXunVlywhdy4KNrDD9sN77tgc
         XA/HgfTKDdjcPBIiBETf8cj13OYMLGQG0IOBmdndAVHB3Xv0Z0sYehUu9kz9WCN9qHRw
         ihOHaWz5SfmmzuLr2Q0Vr5TmWF6GVGhxNdLLCp1EZgkksAImgGQqdavPI0j78CPmm1s5
         nplOtbAXtPlJrOVFlYK5d+vsI9LjKh1Tfg/F/LZ7ikVpCvVZp+j1SpspRskptRRm7vOG
         YKX62UUN+mlimWKv88BunG8awArhhIgiiH4M90ob/g23Rm1YMe3DPJH2nsE8dMOKLevZ
         22KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732093229; x=1732698029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZzAT103RaOWJJnZjel5SGY/kCRYeA1Gafe6RrGj8xQ=;
        b=UuAWi4i41g4w7oRRRAhxBilnz/9IG0kqfU2PPTAq2aTw90GDM7Y7LolDfdcDov48KG
         hof+YWVWif5kUMvRzYCAaRBfvEZ+oFPontnJznID6Wd1YndsPpHwDq+U71jc8W4MEsQs
         7sMn/ur41oCoMiWf2wvnHqXfKdlsKIkWQ7MVp723P8XvHM+Rjzkec8MNwuNv7rwsj3Kw
         6w3+2CrbS57tJIMgm7I/V9cEAZhKNAIW2A+QzEsesMJXirnifE6y9rXqtrzE3X8xPPBu
         titIy5J2HJ/W+QCfcLjJYZ1HYUXuAX+ExfBHjSFu2OiBjNjNFq/iB1OXWesJBvjNvMCo
         g0sw==
X-Forwarded-Encrypted: i=1; AJvYcCX+FLH//IfgWRYRan8/rXp5J/8eMM3eP452pJPL8PUV4ijaeoYbtmlxkgLrkY1l0ZkjpggG5HAQ3lAYKU3gxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuDGGmMAE5Qsd8GBKqgCsQhjSAEHm00BC0V1pMjQ/B0Olt7m1Q
	K6nsRFltB85x7U0dqWtWn6xJcF93f+qfo1LjH1TR+H8HxWC1Bq9j/A6yhDfZAkHTHlUDGUzzpRs
	DSLa4dpZMD4G9+qvW0NZfWTO7hDAG78qSd/mc
X-Google-Smtp-Source: AGHT+IGXX4HFExUHuXtHYsaoErpli4meBjM5wvO9LBAiYYhQYDrI7XYsk4K7DT1gL0Id9lNtbb6W6FrPJ1v7bEGBQUg=
X-Received: by 2002:a05:6000:1f8c:b0:382:4a80:a5f9 with SMTP id
 ffacd0b85a97d-38254adf476mr1391251f8f.1.1732093228638; Wed, 20 Nov 2024
 01:00:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119192715.38282-1-daniel@sedlak.dev> <20241119192715.38282-5-daniel@sedlak.dev>
In-Reply-To: <20241119192715.38282-5-daniel@sedlak.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 20 Nov 2024 10:00:16 +0100
Message-ID: <CAH5fLgj9jmc70CzJfa0=XrQVdi-VB7uMg+aO8Cmhm2hv97sYmQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] rust: kernel: str: replace unwraps with the
 question mark operators
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 8:36=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> w=
rote:
>
> Simplify the error handling by replacing unwraps with the
> question mark operator. Furthermore, unwraps can convey
> a wrong impression that unwrapping is safe behavior,
> thus this patch removes this unwrapping.
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72nsK1D4NuQ1U7NqMWoYjXk=
qQSj4QuUEL98OmFbq022Z9A@mail.gmail.com/
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
