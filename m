Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EC0433A8
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Apr 2024 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712234937; cv=none; b=kuwS8/pIHDly+t4kWwwvgt6XCg1NdvVbD1fDeqo/Slg18Z1jsVnDMrufqEOAsVSwIrVkhkeG02rKA28GIC+vIJz79+bx8xFt//PNW7rPAo+aNPT8gYJgQfc0alvrze/NFC2klBtj/quFVljdU4aZ5dj0OGCZ9pi+iOP3Jjd/1bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712234937; c=relaxed/simple;
	bh=CDW+rWUwlBs2jr/h4xTTDqP5Pco98DLtx7p8J/ZzVus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JopRAgvRKnrkD+/FRUOHeXP/TATIH5bYNvCDYBnOwHGUuNos8AP/eda2M/nHhbfDBcPT1M26VtzK4EDXNuVKpwwdb5CMx9kfO8juWhljM1dALIB5dQfCRtNNnY3zzVlH9MLffwW07CCjlVqnokBBP+Y0FMIM/39A2SYmeMyX3j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mnk1VaCs; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mnk1VaCs"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4d43d602cd6so340250e0c.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Apr 2024 05:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712234935; x=1712839735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDW+rWUwlBs2jr/h4xTTDqP5Pco98DLtx7p8J/ZzVus=;
        b=mnk1VaCsT+DrkDCFAbjnInE8cA7VV/Vt4fcDnK3yTuQ4nPh3fSKkCVtzNnK3Cf3JjQ
         2RnykLQu1BpiTn6Wv+aUmmLed9AWuXDWxdww5ZLD5yExMm415sPePkyrVEAgMzIfdbr/
         Mk7K7huVgTdq7XZ2LoK0tO5y6L5MAqy9QApxsnCMg+FhSqeSfLe8C7Vs/qZXhUiOY83C
         wXOUe+SM/zpAtgcBacRNL9TEWDOoyTBSWJ+srzQl/JchDJ3EGvpwiS1IljIzl4LkXyq/
         A6uZJ0hSFmOrZgwHYBPY0VJC8BEYvrFIdcYNyuKRDGaaCLsa1x6qtlT0uLDsEqGrXhVR
         KcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712234935; x=1712839735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDW+rWUwlBs2jr/h4xTTDqP5Pco98DLtx7p8J/ZzVus=;
        b=tYJ1vcXemoknr1h/exgj3Q0xmPKav2leIuT2afcqB6x8pk94BweHfH77MzUK3jslmD
         s5gc5FGbZjg/2tNOQUX2JeC/BGlzRsNDejaGPFLGjXgRJ8IpPL3qNUEw+5b1odc7QmHC
         QjOJ1/CXnEmk5qB9eeUFJv1RlEX5nZvH3kWMPdqBqU4arkGKkeOOv2YWcyBiXi6Abmfj
         /2lwp/drO/ZjRQXfZNpWpxLmBeVLNL0p0K+lVZcCdv+xPK/XcASbj1hKDf6GyW0DY31H
         ZkUmkVdSpg8OZGkqOwegHSPDKM3rZLR0RoBlSrr0cfmsB2vbTTzzGyIqCjMB9IYanA6P
         F0+A==
X-Gm-Message-State: AOJu0YyFMy9jU4neRLZrL5/nC1J3nlmlm3VgYQkEam6cUm0mUzsK+tzh
	KtJ7tuPQ0D02t7No/Q+jTTneoNtbFpg+bEnWFF4HVE9fiGO/D8Bo45GEDh0B45NTIhTC9cD22hy
	XDQmUloB7nm5ovrN61qBjCNKFN406ppxMESiE
X-Google-Smtp-Source: AGHT+IHBt43zs+C9TqoUJqSvnZSsuN94K72cszgVwXZ/P+H9S6ThVSgqdaK2Haea8KCJbJ1OgGJTRLLQtqcb+3X0JuY=
X-Received: by 2002:a05:6122:468c:b0:4da:9aa1:dd5e with SMTP id
 di12-20020a056122468c00b004da9aa1dd5emr2612931vkb.10.1712234935216; Thu, 04
 Apr 2024 05:48:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328195457.225001-1-wedsonaf@gmail.com> <20240328195457.225001-6-wedsonaf@gmail.com>
In-Reply-To: <20240328195457.225001-6-wedsonaf@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Apr 2024 14:48:44 +0200
Message-ID: <CAH5fLgjCQNxnZgSP_fx0NKq9TRi-byRTSb4qL3n45yMS1zrtHg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] samples: rust: add in-place initialisation sample
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 8:55=E2=80=AFPM Wedson Almeida Filho <wedsonaf@gmai=
l.com> wrote:
>
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> This is a modified version of rust_minimal that is initialised in-place
> and has a mutex.
>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
