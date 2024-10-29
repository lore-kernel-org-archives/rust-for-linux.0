Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F681EE024
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730205953; cv=none; b=ESP4G1neyBPCduIV/gQkSBkjynYiYSMAtGJhx1Lcocr7X5iLOFKSwP7P954Vr5Q46Qww39VKBVDw4pwzd1h5hd/1LQFU/A1JC/2oSpUWf7qffYBQjtrbq6be7VZ+4YY70358yWwS29VbTUf0sadn1qPh086XVZne29MOy2cqYnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730205953; c=relaxed/simple;
	bh=GtzJ47n0bMGIC3fQwXJAU5Hmzy0ocBZhCDRYOCRmxZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLIowuJx5mV/CjEPOjSgOzMexbWZVp7xqkZeQCn//p4hpoZ7DQO7uvH28oCe5PUTGlfWNHZZZuZwhlQ1I2AzE0BR6DwGfeX73QN5ywGr49VElMq+JK5sLbV0Vav4zw4WqtA6yl9Eqh+4d7P6f+Q4F9JTAmvD2FxbvdbU+3OtE/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wr6DQDzV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wr6DQDzV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4316cce103dso70931055e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 05:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730205949; x=1730810749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtzJ47n0bMGIC3fQwXJAU5Hmzy0ocBZhCDRYOCRmxZU=;
        b=wr6DQDzVgsxzoBfN0tOEWhKrDMMy2lq+MYC5dZCB9175P8C/HW975PcOeeAOB9/Oep
         WhwYf//UYIuPF+YWVT/Zsi3xHElNMHr3AaatzUdRw5npggTaV2CUpXVy2W8La1FzWn25
         gJ4L372teJDi8wISFxQKpBjxM8PUmwl42/i2tplU0Upi8HkqDy4iwOWb+bIYcT1EarQK
         0uiaYjSc7+zHFbD9JIbfA76MiYu6SR9J/hYzukeo9h1QzZ0xls4hSlPUBUVoaps4YxOy
         HVuVUPg6iX0hFqsTXbZDNG7aEQ2uvjF9jebQRZ9OfPe90ZLENK048af0b8ioNal40vW3
         2oKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730205949; x=1730810749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtzJ47n0bMGIC3fQwXJAU5Hmzy0ocBZhCDRYOCRmxZU=;
        b=NURVmD/PsI1dVd2oFAwHrJW86p1TyGgfQWADsuox5CXc7sPEwO0NJiGWwlyKs/LuUp
         BUtpQZXLsfhdoG/8azQVbFivsPybhg+nO+9bdNV7y6Pw5miWFMAnyc0osOKAdNGBPanA
         s9G4AUKv0P5n6xzpN5W8jT4LjyluIr/vXGXgzSL8qAQrDngG54bRklHqPj9fzlks7MCi
         gNBdzXbigy4KDUo/MCiAvIfZCP/iQBiyz3PiXEeQ8qTm8Y22vNEAY8WwsAzX5Z4ofxHE
         v6ujHo+eFijR+OQXforp3EjbYTZ0jb4SdsjOqVGwTr+FndhaTQBN9ttp3+rp0zYvTVE3
         v71Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjOjnjkAJhTQieolmPoYoGexYW8H0n+9+G5e4Cizb/xCd8euKCGKUpcwNzG6M13dznh2mVoeSaIxBe7+xf8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn29dhqkkSCjeVp6fnj6tefC6MuPTecsfHhpw1tqPQxjTYNgB7
	yu5UKrlN2eJguvwKdbeehGbxCDwCfSgGVE94hh7RgCQ9VsS9z6p7CXKAHLOtF8CCGkyChXGmXDg
	p7N7YKW4n/Ya/z8ytdY+tijSiGpOoqMNnZkSF
X-Google-Smtp-Source: AGHT+IGeiowj3zMHJ3YR03nzzPGzLm/Rxvr4HwKwchMRBnozZXVzhVD6hnCcZcIEs7fKbrQEswkrjJ+oz3BaJydpoLA=
X-Received: by 2002:a05:600c:1ca1:b0:431:518a:6826 with SMTP id
 5b1f17b1804b1-4319acadb66mr124917775e9.19.1730205949075; Tue, 29 Oct 2024
 05:45:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022213221.2383-1-dakr@kernel.org> <20241022213221.2383-3-dakr@kernel.org>
In-Reply-To: <20241022213221.2383-3-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Oct 2024 13:45:36 +0100
Message-ID: <CAH5fLghQ3Rdgk+xzz9RzNzTs4vYLMO0q-SkDOrnb1u4TkPQVUA@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] rust: introduce `InPlaceModule`
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, tmgross@umich.edu, 
	a.hindborg@samsung.com, airlied@gmail.com, fujita.tomonori@gmail.com, 
	lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com, 
	lyude@redhat.com, robh@kernel.org, daniel.almeida@collabora.com, 
	saravanak@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 11:32=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> This allows modules to be initialised in-place in pinned memory, which
> enables the usage of pinned types (e.g., mutexes, spinlocks, driver
> registrations, etc.) in modules without any extra allocations.
>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Miguel: I think this patch would be good to land in 6.13. I'd like to
submit a miscdevice sample once 6.14 comes around, and having this
already in will make the miscdevice sample nicer.

Alice
