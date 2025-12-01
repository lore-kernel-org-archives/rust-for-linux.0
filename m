Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A41A36D518
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764603330; cv=none; b=N5+F/PutI1rtOZM5oRyO/CJAHYtmMFjuNt94AtjtdxamFlcFkzIK+oGkkjZC7PYaNTaet93YL2QM1f/ePLCgJzBCBbtyMXHbRnpp3xsskCd6e0aUELVErH+a4ywGUy/FfcHV2MuQ8HTsCSyppnAuPTk+p/EY2LKIp8z+u+bdmQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764603330; c=relaxed/simple;
	bh=IUNxN5qrxyE5m7ZulRO3ENGx2G6kLUP7duXkt1dCvso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jc06duOvetOmjtYKssFhT1/UeybInTUJSRq2fe9zcSbVb/5ugNYdK2EQnvvBaLsDCnd1JcIrfwHJzJ2334I60aJQi/vMQ99lh427WVAnYP8cqh8l5w82zv+LvHDqTwhKdzz6md1INqzYtgrxAGHbXDUQ1J3pWOva/HKjiI9uu7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZQuRRGN; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZQuRRGN"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bc0dd142007so45238a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 07:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764603328; x=1765208128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUNxN5qrxyE5m7ZulRO3ENGx2G6kLUP7duXkt1dCvso=;
        b=hZQuRRGN7xx3M3CMFV3urI4F/Khm2/cgnbOWPIQZrNUgWxxvoASFE5uMQZEPDzAygx
         5kjFfRpDLAXCE0bhBlYiMyfgB888UempQp7vqeJRKnNQ8Nk5EwlKsWMPwr3/t/eCocKq
         y1bOB7vIwwrnssz1V7Pm9uLBs9ZHK5Iqpslw0LEPW5RTWZl4JaSeCy9dQORRgZhZ8zRW
         EyPocrZ0P5fTO4eLKMsOB354outkJwBilFs9sbxBlp+0JaJg7uAPx1Owih9UeAKow9i3
         fBxzSsrDT7K7k8B8WkDfEK5LcN3vP6okOa4bsR+tXikJNT3uQUgsERsmnKKK/N36v9YS
         N4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764603328; x=1765208128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IUNxN5qrxyE5m7ZulRO3ENGx2G6kLUP7duXkt1dCvso=;
        b=ND2XfMqidlW+tFb00XOjCPMywRyWwrGC6rYjtKcx2NZTfh0e/hYGsia0XrbAGawR1v
         h83JGZS4Fu/cr4kT9eIyh3DOdGakx5YW9XcF13QmsTvR+AaiCMgSdC5cJtujKoUgTDPV
         0R+YqRfHpsZ1GbjeVUpTo9lZkbpKXlxeRmFdyKU7jHIO6FrD02/W6FHaJaRrkKwZ09pb
         znMqx3mL5AwwLtMe/FuIVwuTxAKxrcAKve8SGLUgBtHfVSKrebHfIOOt+0mLuyotieZz
         BC57PMwrarm+T29MQQYZiQtc1eMXrbHx2NNkQnwKZO4K2OlKFH2uQ/Uo6a+WgCucVp+2
         8W9A==
X-Forwarded-Encrypted: i=1; AJvYcCWiis5G64Q4FayPanIACAidJCbazJpiz5WSTTFVQKmZwDC7bXxL1xpEWqoLWNj/7qYOmZzf3XHSd09Th5pPaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwNDN0VScSvIGDmcxJTeD766oWW5L6+q29MgEKYqcwdFFyx0w8
	nOKS23u1SDVKlXAahDm0MyKKe1cn8X7xTgROdPPLtvrUTOZ85drxdOcvnPqOlKiSNrCLtkuRXK4
	0SGAASzVXUX0Kbo2RL0ON4jsMwF/NjEc=
X-Gm-Gg: ASbGncvk79H1f/vvr0531TZSJTP2bSamwdDf8dbY0OzGxr5si6etb6QJzNlv1awEGvi
	M7FFAiLMc66V58p8xuKZr9DTVTR6/xyYcsHYo95FJYtNaK0gLh9APG3Dum1cK0B82xwLhLwfbxN
	jf43l0vZ7Yh87zmW7tFrh05KRLaJ5hIsQh3hdcAMp7x2vd14F7dwyFQlPjW8VRw3JAdupvJfDmF
	9J4jUzdRrxhglA0e7J3PpwIAPWL/iIdR1l1AvKk9h3nNHemTfGH9oWsBkRicGM25h3AvJBlGgzX
	bunt8IigWVG8Z3o2BqUGOvYyZTuI54xJCRtqIRqGurgy1QgWnsHXvlTNsgkdFCbZnjzErpIz3uE
	1UQ5z0lzhOnGDyw==
X-Google-Smtp-Source: AGHT+IEoCLpm9lr0RH3SWQPZtNE57eOwkauItyiHao4q1iLnYOGMmNevS+W3sSEcxd7G4uHpfc3hJZOjQWWFcvoi3cQ=
X-Received: by 2002:a05:7301:e24:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a7243ec7b9mr21735269eec.0.1764603328166; Mon, 01 Dec 2025
 07:35:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201152759.16429-1-atharvd440@gmail.com> <6DE296DC-45BA-4915-8FB7-78A6A7339A66@collabora.com>
In-Reply-To: <6DE296DC-45BA-4915-8FB7-78A6A7339A66@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 16:35:15 +0100
X-Gm-Features: AWmQ_blJCkBhicE8Cax4nvSPCCoAJ0n5ZIvU9eCcCm1jzeuOpDDhMtG4FEcpZh4
Message-ID: <CANiq72=CS6o9=2KUVgoOKoyEAOpMz+wepLCJe5Mftxuz-RV1Tg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: drm: use `pin_init::zeroed()` for file
 operations initialization
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Atharv Dubey <atharvd440@gmail.com>, Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 4:31=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> I wonder if this should be part of a larger series that implements this c=
hange
> throughout the tree?

They are independent, so it is easier to land them as such (and may be
clearer that is the case by sending them separately), but having them
in a series (even if landed separately) is also OK.

Cheers,
Miguel
