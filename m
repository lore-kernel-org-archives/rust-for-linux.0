Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917F0239E9B
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 18:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760640863; cv=none; b=LMrmoM3nH/d4p79ySjHxFq5i9VgnLkLEr1Rq5XHzKlKTF1eqxjz5eJ9U8u5Jr6Pr+NAXfzglJcKJS8shhUov/ATUBx2v6m1HUqbtJIo45E+DQCdJSG93IIbf1eyslrXkoevp+wMeXWl4Q7qkxuiZr7atXnjQHMVoAnwPsxJ6e34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760640863; c=relaxed/simple;
	bh=+utBgb+Y0Uu1IYHRlU1599odQNpYd89QM72RzQIjkKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knFOFXm1wLw1AIh3nSuirGIaVgnyBvyzdAQar2NJMnvwP0QfdhYMQwKJ2hItO8ACE0gRoRXOAjj+V4tPyND7DXKkWJwzegkvWpxtGrDiZyWta+qR/3SXyIMQ2yD135fjhCIhmcmjaqPzoXkTwcPvE425g2p+60S3r9nFz2ezn7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/AcmAyY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/AcmAyY"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2699ef1b4e3so1240935ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 11:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760640861; x=1761245661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfjITJrDrBsj6NyrvMWKq7r/mdAyxrTj8oS5nFcA3D8=;
        b=X/AcmAyYGA+t1YhKP94+NATzTMfT2RmapnyBp+pK1RW/ivJvtADIGOt+BEjkaIO2W4
         JuWbh8C3mYOhYGN2o91ecCQlwtsuBhgDKT72gqJafnWDhEYRX41Ez4nzUutob1/mdjeZ
         UaRCnyao7d+Vp1yXDPWLgiGUnSBZV5/RGDaoEISbEskGsxuq00JA8tpsPBJwHD67CTlq
         7BZvFic4duWbZHwLEK8ogizOFZit4VKsTH9818QTG6BcnDvg3KOXbFA9W99EMFnldMRw
         G7FnRNX7ZRSb8K4uCBMuT8s3V49EKBl1hklAiUk4mzOAy4PwHwbU0ObjJ3EnVST0Ejaf
         DVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760640861; x=1761245661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfjITJrDrBsj6NyrvMWKq7r/mdAyxrTj8oS5nFcA3D8=;
        b=LQ7CHZZyx+VgTAj7kt8eQplIa1K4H4IEQ/KJO2ZrIirFJAbThc+fFP63G29ZsTF0Zc
         jayaL5jG/wmtdly/GVmlll+qSKS8Qj5fhWAoPURbkq5x845tfGAJSI0GbsQC9kFBZ6z5
         rsrf1Zw96HtFs4J08j4h1SJJLfTmUXT2arigrXQwh9oFbrzpqb1/NhKFgqOeDLq9WpN9
         IxJrmfXXFksus3UpPfxW4QgO7OioW7iNtuWN2B8SZZGqJp2YXBzkwU7+9I7MBM7shFJ9
         tQ/5t+tstAezq47OphbjCVU88rhGIyrCrjzHeErER+wzoIOujB0c1O6zRhCYGDx+BYSo
         QsBA==
X-Forwarded-Encrypted: i=1; AJvYcCX/XmrVG0LEbNRdy5/C0i7gvMxcg3DxW6NjAclab5oLvsq32wJ2jFKW4HvfOyNQFsQJSNVZYh+My9VURyi5cA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw58bfkcsHOxAfxtgE74+/LRCKW4RUNWaMERGSA58Tva/tzFHf+
	eskZtySLUuyHnwkFEXnp+XiEyt60ddHVmLU+Qa762mWGg6kTYB3ACHpijRUiPiDH4p/6nIXl9Ev
	yKn+rtIQDMhpdaxPj9w+JbcDOFA6ApPk=
X-Gm-Gg: ASbGncvJ6uapkgCIJ3GvwCS17z/d9aAa4dzcZZQKbPS+e+bW66IFAUpUh2y/tb1RqKG
	GYY8Gp3LtSEAc2Rl65eoF5Fwn/D0l2yt76C5Ear2LHJkwCKLQ8gWfcrkaq70y8X4yYh8celwbTN
	d92jCUcQbGqrEJe3p7lO5lF4ny+t7DrqQarlZfk4ImypD4rpsry84XgUWAHMzJDiXucsYbx1+9b
	n3Q0wgrAUzKujS/6Pz1FiJ7FgxosgVRTKOsRLy9FuCf6PYWZ7h0ONNYobCYPkFNp3FRfhkXP4uR
	GqQAs1Pckq6bkeZLSBNiBwsG29a62MFBbtbBULVpNfWRWAmsZUWps5v0vS65PFXNeMf5t0v3zl4
	8cfQiK8RdK438dw==
X-Google-Smtp-Source: AGHT+IEbKwbqFQ/fneIGbpfTlhDpPKZtHqphNXdfbEVmTezUHkwYnzXeQIHBTRMspHOBh02pv2qlfv7V0DyvDzmt1nM=
X-Received: by 2002:a17:903:40ca:b0:290:55ba:d70a with SMTP id
 d9443c01a7336-290c9cf3306mr5986045ad.2.1760640861448; Thu, 16 Oct 2025
 11:54:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015182118.106604-3-dakr@kernel.org> <20251015225827.GA960157@bhelgaas>
 <DDJR102F5NFB.1X5IVJQ6FK3CD@kernel.org>
In-Reply-To: <DDJR102F5NFB.1X5IVJQ6FK3CD@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Oct 2025 20:54:08 +0200
X-Gm-Features: AS18NWANSYIYYVl5goGbtu4qiEWHeLwDVADFRWSVLvLKuJro8t-8yxzSNbn9BXI
Message-ID: <CANiq72mB_M3GeU8DLg5Wnn66wgUimF1Eg8Vpy50AEZoD23O7Fg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: pci: move I/O infrastructure to separate file
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 2:35=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Those could also be a candidate for the list of "good first issues" of th=
e Rust
> for Linux project [1].

Indeed -- done as an example:

    https://github.com/Rust-for-Linux/linux/issues/1196

Bjorn and others: of course please feel free to create more.

Cheers,
Miguel
