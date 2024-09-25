Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ABB19F121
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727274487; cv=none; b=Zjq0rhcLKKJtMQOqSI0qPfQe7bDdEW9uV2O3xJaLYhKHedvG8Bz3KmFQfCs3o5JfS/wRk/ZZ1E6ZSRALR8K5qcgA3woTy1P3cBeqI/xaVAwYGvMqV0cv2kGcyepH/fwlPgAp8/6vC7PvKjlPmmO5BWMNGEVlLUGKEtIe3iVgL58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727274487; c=relaxed/simple;
	bh=obC/7/KH2c7jTGLio49zTh/+gYmG1p+8KVkj8WjaOGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBF0E38WmBpAtwzMxwPwOrOBL+R+nsYXW2t9Y7tDUZ2suo/F+80DE7HgqQ+EVfcQ2YZ1PnhcVmCpQuy+poNdLuUi/2AlFnUUZkcWAsPW2B3Vd57Ela3TgybbU1+VrUjHOGRhVzXlbwAiDaukItdiBLiQtP8F3llfYmSbCpKhs54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yvmOtMvs; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yvmOtMvs"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso86950305e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 07:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727274483; x=1727879283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obC/7/KH2c7jTGLio49zTh/+gYmG1p+8KVkj8WjaOGo=;
        b=yvmOtMvsyuqmWcKgosMMwuDw1YNcL0c6yyyeMt/KM3XnwBDe7IxheCrJR1znqGIF9V
         Dwx47snfHh90QJxC0Tmsldo/M6jhry9+OTBhP97Ji9OPuV/5jQL8UCfhOU6OQyxhcjDl
         QZjZSqpYwHU6iucuQVEYlkat6thzuNK+yW+nMNJ3zlfSCJp95lD0gZmoMhHB0MpPHXuL
         A1u77LA2+myI2e+iqoAZjqdyxs7Bj7npGbhZ9GkljUw3EJLy4ZxaRgOjL1Km6vr1S3eG
         qXv+Gp3WhtVqhnjWrmIMyMVn+VRJhVArzE9DK1Ywrv8y1zvOV3Z2M7X6gCgPD8Xwgl55
         A3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727274483; x=1727879283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obC/7/KH2c7jTGLio49zTh/+gYmG1p+8KVkj8WjaOGo=;
        b=ntpbWflD9Qw99p29SjrefqcUOTFg7YdByMTom7kocCEseL9Q3SinIuFTofIKbbwwOF
         nW6rkzEwb/4w3b+MApS38RgNGr7kpswymshrd9i32TdXR0eZrXy+Ki5+ma07UfQNdx0e
         D0wpsqpoa395m3Mw3pOLEX2X+uugU5AyhvrNQf85/AdOXhHz4ILgfgrI0JDUDwi2nHZu
         eRmYHjnFJGuVrWG7Brocs+w0z4vbuU7g7D8p4SVZv3lMAEiA1X1prpjT364RpLixi9lH
         nHhzus/IAzgavSQ8oO9DgOIOdxE8ORQrI49fBWRCft2OHLNnIoPzQv8QAqhG2J2gVcVP
         OrkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHPNinhfZ70PXrnPkVRN/b8EOe5IFfvZSNcj7fGcItOKjq2VSTa8G852HsYKFTEiPs+JK3MArNLUYCCLSO7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoZG+sIwJ1HRdZx9NigUG77Fy8FfeMkMvpYctuN7z/uS8DDadC
	r4OcE4ssH2CzOYASfpP+roIBZwNgFcuw06jF0I/7+slE1z8KR2fBZlvqfH27LoZa9nbgwlZWMaf
	Z6ygjrqKg9D3FCcr/VmLVMd6LWuSvHGrz0e6u
X-Google-Smtp-Source: AGHT+IFd9vRwftTt8XvUpteeBh1GBHyoPi/G9HBBRN0TTqfaKPh4NZIR8691AkkQ6GlnqZn4WH3b/ayxYAoChf7kkaU=
X-Received: by 2002:a5d:58fa:0:b0:374:b30b:9ae7 with SMTP id
 ffacd0b85a97d-37cc24c511bmr2574271f8f.49.1727274482535; Wed, 25 Sep 2024
 07:28:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925141944.277936-1-ojeda@kernel.org>
In-Reply-To: <20240925141944.277936-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 25 Sep 2024 16:27:50 +0200
Message-ID: <CAH5fLggG1n5RMHcE3ZWjz4m7ybG86gwSAsnh2NU5pvTL+zqQgQ@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: fix `patchable-function-entry` starting version
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 4:20=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The `-Zpatchable-function-entry` flag is available since Rust
> 1.81.0, not Rust 1.80.0, i.e. commit ac7595fdb1ee ("Support for -Z
> patchable-function-entry") in upstream Rust.
>
> Fixes: ca627e636551 ("rust: cfi: add support for CFI_CLANG with Rust")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
