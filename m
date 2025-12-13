Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77733191484
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 00:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765585289; cv=none; b=mb6Y4WVWMPr194tqmlkzLbImKz68so8aIZ0KPH6DDOyqxbPfs88oT/egaqDLJiWkMGbDrNm401xCQOp3CyXcrNr8naYMYzvLLZAz/9WzRr/gSS8i8w3KT97rB7Z8DDso3qNAwKJiflqnZIjXttSL1cKha1lQKap5hTxgGoPgiK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765585289; c=relaxed/simple;
	bh=APyDvW6fQ1EbVIuHlB3g523wtBvhEHf+WZ1u0mvxV7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pzrAicJCnIjuiDWlhbEmHii9ZLOt3DYq1LUcR94ELxPXtMdZNP613q/8UgjL+vIRFKpiHXvbeqDGsdnv/WTUHDFDnZzKHliP0U6E/SdHyMWKegnQVTHGLUGBsoAEl4rHtCs8+oiPdAziTFg4qhdmupwPrdeUnxagWSBuPvKMBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpUOgizW; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpUOgizW"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f3018dfc3so1483435ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 16:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765585288; x=1766190088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APyDvW6fQ1EbVIuHlB3g523wtBvhEHf+WZ1u0mvxV7g=;
        b=LpUOgizW+ZvSC6ml4L/DX3RFCxFlWJUA7ibBLn4cpIGlAPhRGUqvscVl+fsF7Zl06c
         doexruitg7Cn/QLCILuQIT89N7rL5TVm2RZ47oZNQ1tR5WMEwSrMerk6IAe5dP27byVv
         6i0/Y1FZCIXBES3WCo+iawveGfHLdccETuEDTXdx4svZDqtGhgjR7GIBLEZlMEQXQAs8
         m5z6bqfWyE3lYTbayAbPHzBcQVaPj4CQqU6L9xW0RNdLG87D6S0tOPjylu9oJn/YBmLa
         rkBYrqM9PLDM4oB4FaKFpl88S8ukf08U8VzqeHquNIDDQtjKrH0Jho8XDgnEMV4NjGPa
         wiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765585288; x=1766190088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=APyDvW6fQ1EbVIuHlB3g523wtBvhEHf+WZ1u0mvxV7g=;
        b=UTzElQ+vdHcATnzy5+EgmSOYFfrgmENyPNXvWl52WKQLELJ9lHdFPRylGQ7YNO5f1L
         EauM7li/g29KBHt2a7mYn4Rn9r8oGXtpk6Ytsc6j8WaBehwDFNJb+6EvV2/Tfq35wSPc
         eLoDJDhxOu4IpjWmn4NMo6cJQDfKRbuhZxq0gJ5ockwi1ky+suxDni9MiwacWn2EICoG
         fcg30ODsJBRxCOop4igwKeUyaliLDcM5AdC60KE7eVeHoQBzhvv1GgxTQGqi/Dsw9g5N
         J12idU6oqxYO7vaYdyqNPFgQpybMgP+bULdtrmP9lt5RGQreYe9AEbFQmsiKIiX/d+vu
         HKfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC0wjURS/TY0o01gTjsubKTzDrpK9QnLSLpJSW6kEC5QpOHn7f+jc2yi2n9fwtlaLTqYlURsOImK4minWAQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Janu5QQKikV5XuyrC34snkWwzzuXLaIrpt86v/VkuQL26Wg0
	+C5W0Lh15pAHvkGxOBKrcgecAL6NVxMZCh7NSBQRlNAbKrQ/i9X1TRc7d6m9jnQzu3IpZio8BIN
	wVrRlGHGqej8XHM8x4sg8m4Y0l8+Lbyc=
X-Gm-Gg: AY/fxX4PXna4zuYokopiwTao35yGz4W5acpsa1MB2ozKqzNZWnifF3ZGS7eX3iLbPJf
	OysXLmbpI896CyWEEj7GwsOkCvwp+baotpbBfsxrzukL1Y2AQGejgAhZXljk1BuxWzKd8t9kYoJ
	JFDPY3gm+iatgg05VLOxAC4INGkmMw+86xVFAFDGu0tsngKe8K4+/2OYWvMmvUmvMNioTvIpwHy
	gGB1wvBL+jJzUn/zKQwrnniQ7vjuAovA9bjRRAni6P/6zPCr85LaiN1xiCV5Kb2+LE1Q3nyB30Z
	lJE6khTYWsaoFHksDtrl72Wgs7B8jr2x/cjUsH366aeEFKPqpp4MGMQxxWtEr8KasCFnxVj0ryZ
	pvDfUp6i354A=
X-Google-Smtp-Source: AGHT+IGvmJFSRg3pku/XCc4bkSEttsOeTUucdXVX7pbq92k9JkqPBDEaCCKfODAXTwD2tMIx+M11Mnt7gNFogMJlthI=
X-Received: by 2002:a05:7300:4624:b0:2ab:ca55:8942 with SMTP id
 5a478bee46e88-2ac3015d78emr1371865eec.9.1765585287639; Fri, 12 Dec 2025
 16:21:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213000042.23072-1-ojeda@kernel.org>
In-Reply-To: <20251213000042.23072-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Dec 2025 01:21:14 +0100
X-Gm-Features: AQt7F2oAWZVPbgHgNr8kOPTjynv8PNZnNj6z6SGIxIsBYM3cDU7JHHnF22i5fmc
Message-ID: <CANiq72mNRONqF4g9S42zhWU-g64DvyN4t3jyF20Ux_xugxn-pA@mail.gmail.com>
Subject: Re: [PATCH] rust: conclude the Rust experiment
To: Miguel Ojeda <ojeda@kernel.org>, Carlos Llamas <cmllamas@google.com>, Todd Kjos <tkjos@android.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 1:01=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> it is already in millions of devices
> via Android.

Thanks to Google for confirming this, by the way.

Cheers,
Miguel
