Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868AB20FA90
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 19:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744745456; cv=none; b=hGUO3Ie19RCoGjVUtPYJyEAR+yg6x8b7LuBUXPMfNoAwN8nUIZIz96Zmy/VRCFUOQXK5luXJOkxPJncRiW76PCOvZZxO7K3BVMExFBq8+/B5/+AYas8TdnLIMnXKQlybQ8kFpyaX2ybdhH0ApEWSJwzqBx2zfEU7/TbLIbE1WGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744745456; c=relaxed/simple;
	bh=dApbul0IrNTPVcneKr08SDI8II5HIpqnBCg40ErgrgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=krD2IuT/cvKVXlqXSF3oH8SbMMu9/nOaiNDIxQ3hXmY4oCZTF6dfF8RtiIWsmc4FudnqKY6tfME47oJBb9ABXAd/UALroFt+AV3AIVs3BxIFreMjOOHkBSRJ38mem/vlneJnChRhJPUwGifGZV+TvdT/N8QjP6phMN1CaOpoX9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVsWHz8D; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVsWHz8D"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-301317939a0so1039126a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 12:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744745450; x=1745350250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dApbul0IrNTPVcneKr08SDI8II5HIpqnBCg40ErgrgQ=;
        b=UVsWHz8DoesCeWF+xj+M3QRfzmh63lccHXHd3h8bahGqjU4JlmwCzbfnUEFQpuAwQb
         IfJZmu8eoYoQqWmNf2zomayaLLfnko3CZCbzzd8AKDQHpGxza44Nph7s8nYhfk2i5ujq
         Qci6+KKvmi8yLZVP57RlTM7vYo3HLnvAu/Q9vfWTIPxUb63Vu+QTIH3scznIY2LUwG9u
         ddDvPWcy+fmo4tgQvUEBYANhjWv7CgOb6mYd/imiEH1bPwpwB1Jh64TcKjzx6iUwC8a+
         Vnvl1KXLOo6saLUYW2DHTsXvRDQoMBsFBTZlwHfbi25vF5L7JeD0lCX/BRbP23xuZrnQ
         Ku3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744745450; x=1745350250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dApbul0IrNTPVcneKr08SDI8II5HIpqnBCg40ErgrgQ=;
        b=q/MnyJoY4wkHM/Qghna8OYQK2U65TDWS9tHRb+8jPCrQRGQQZSwzXJGknMqvKrwPEs
         h1IVaXIVVHTCtnpjITBpONyvhHIVNEvKusJy7pYuVr9hTHHkPyYllC6VPygstOhXi9/p
         Gac/C2/ZfaJO2t6nbJxmtwLx+jXxVuITzbSb6sJIDQdGUDu0gUQ7ifWo4tnpiFLv97Kc
         r7rR+s31uxF6ffOTgRTtzY0vJlaTmL8bj/hzB7nFEfXufwL+h/n7ki5Fx75vZEzpEGJQ
         3u425Y+ThtlXvVG4Pw6Z/OlKdO/cAIi1EbMsqtMi3iVabdOau39bMo8N/MXBdAqy9Rw6
         /M4w==
X-Forwarded-Encrypted: i=1; AJvYcCVyp20cFsiJRTy0cUYfVCm7Xyhd/w9oYuLKem/NXaDxOb/Fj0Ql7kl3c3xqS4YAPjq2BaKWE7OnWKCDtBohKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyzx0bsFO6TJTr5S5hnyn1zUAC5UW8oZz6K72f6LVleSprX5MC
	I6kVYGHaviVjHMqpGF8HZy5pzXiE6sWe4x5MMvmLrEvP+vDrXk0dHwKSLFQIWeIEgM9sArleXpD
	wvdjrAIiCaUOba3W8VW7skwUgnp0=
X-Gm-Gg: ASbGncvjYjkCnZzkeDCSzuWTIoQzV655SMvIIp+lQ5OEGvt/SDZ5y41V/+MqAn3zZv/
	3IUjdQbSK2gcqyTFCJ7Nuhy6mxPytoZ3isw3k64XvqvwoNFP+QozcIHAfnpxPj/2LtK73nhpsxw
	QoN8qxvWm5YDkeAYhDINkrI0MXSAaBXFVE
X-Google-Smtp-Source: AGHT+IGaHq92ErZ+0sagtyoSXkuEcorUzu4DA9bYo14xVK6JbsgSxZv8dRN5iZwbXMuBe/nrUrCHhqE1GdXBijijDVc=
X-Received: by 2002:a17:90b:3e8b:b0:305:5f31:6c63 with SMTP id
 98e67ed59e1d1-3085ef97fbamr199521a91.6.1744745449715; Tue, 15 Apr 2025
 12:30:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326202520.1176162-2-altan@ozlu.eu> <7f1708d3-be21-47cb-91b1-68434fc65853@ozlu.eu>
In-Reply-To: <7f1708d3-be21-47cb-91b1-68434fc65853@ozlu.eu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Apr 2025 21:30:37 +0200
X-Gm-Features: ATxdqUFfAFi3mx-8z1kwbsFxTdrFqlCvhnf4oC1055s9FA3LKkcyQnxSw0xnTeU
Message-ID: <CANiq72k5MtUaGpCaMOgj-N-0Th-PqWpBKfdHYsS_6ps8g_U9xg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: static_assert: add optional message
To: Altan Ozlu <altan@ozlu.eu>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 9:26=E2=80=AFPM Altan Ozlu <altan@ozlu.eu> wrote:
>
> Patch has been reviewed by Benno Lossin, can you check when you have time=
 ?

If you mean applying it, I have not picked any patch for the next cycle yet=
.

Cheers,
Miguel
