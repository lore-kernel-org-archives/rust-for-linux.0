Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559E51DC752
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Oct 2024 17:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728321048; cv=none; b=BoXSFdgev7T+KpG+wH0GVbVCZ7MLSPPHIRXYCaIMnFNu6xfgGAXgHsJz5tyyS6REclyufYNGa62Sw5ZcweZyCG0NGdwR+2XPt0KM6V7/eCdW7ypWmsAd0NAlD+1T6dYLPEqB/5I9wbBQl7Pz2uINw/0Qrcezn3nFTPCA5k4b7bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728321048; c=relaxed/simple;
	bh=h660+y+XJGilXuogbrsyWERxOVuiN4cmdXnB811wDs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfWsf6ya23tZaEoEhhpOuN7FZ3nE/CL8IrPBmjvdHAyDbwhemT7FhrbqjNwceMa80o/LM1eF11toCVopMVs/CXqgSQN3O0oXNtbi+lBwCQtdI2YXuhB4+k8Q2J12lq4lwdVPeMjjJDPyGHqEkpZVOo32IgTr6s57HMtppFoBAnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bd454C9M; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bd454C9M"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7db3e962c2aso483929a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Oct 2024 10:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728321046; x=1728925846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h660+y+XJGilXuogbrsyWERxOVuiN4cmdXnB811wDs8=;
        b=Bd454C9M3QBYisdnYdHfiXeZ8ApdMf4M2+/Ldz1q4xMSVPDohUXxFfLBZLwLp3LncS
         V/Ew8zLpXuwSFsnlL4WfSnM4iqu4Wq70X2CoouUxPbILp7kBvgcPZtEAecgI07uO3EB8
         uTbIHCc89+6Ib13fUtZyCdiuR9uUQ/0MdDAb804z8DZ8k8ZsRo2EhL3HwAVpzaBEV/IB
         UBjS53jsQ9QrU1C/jx2lm1wP4cVwgZ+70ctWFb7fQwznmr/BAuosDdRYuxEGBdgVSyK7
         3jB1U6XQMZPgry3m2Xg1GutEuinct6mThTccq8Xn5jjJv89oXG30KjvrutuRFWeCQdtB
         aR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728321046; x=1728925846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h660+y+XJGilXuogbrsyWERxOVuiN4cmdXnB811wDs8=;
        b=sZZmt3v/wFn45oQ4ACIh20hkJA9ARJ2BrQ5EszTHQStII364m9OYTS+hJKvuG6EL4E
         pg/cNdlCXYEcaMYnQkyXeM1BTnqgx6Sc5UTvxcwWPY+l/8QINNTyW8Lxh29/qInWSUEP
         GAhGvEX1gx3zOhcqxHapgkTtxD00fSgis2koXaDD33q+HqFeowdYeBxBMzr7XMXwowhP
         veFufk0sDW+Cyf9RryJ6qIt6eXRCyzez3YC6+NsC5z0eLrciSyYjECl2cbbfK8zKTn8X
         lzCuT6dh8xbs7Mkzd9r21ju9J04QG3PrD09H8fbNue3lAEGe5+45EtJjukpxuF2HbIEb
         A2fw==
X-Gm-Message-State: AOJu0Ywi3EUqA3y7rQuk2VrJ5E3h7baJUC8CZy+wdfKxZSwJqt/mXrlz
	spJdN+KYnrA+S02EFRmrsN0KidvP2fxF+TmxW8wxlhse3pgI+RWKUAe+WOhGYfrec4cjW7bvfvg
	In2mJ9K21Xp3Pfi71QPjpHflV88BhPHhu
X-Google-Smtp-Source: AGHT+IHRrYtuLS2lPI01PXNr8lBnhKRlSz50MnJCoKjidGB9sO0c8jL+r8IzNQP1S3MSP+5G5UuEvLWljBylJlaSgKo=
X-Received: by 2002:a05:6a21:3399:b0:1cf:2be2:5e5b with SMTP id
 adf61e73a8af0-1d6dfae33cdmr8618265637.11.1728321046508; Mon, 07 Oct 2024
 10:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930141206.GA506883@thelio-3990X>
In-Reply-To: <20240930141206.GA506883@thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Oct 2024 19:10:34 +0200
Message-ID: <CANiq72=wsWyJiYy5NVFa0fLeztjFDP7h_2XJdDodi8A5rG8Azw@mail.gmail.com>
Subject: Re: LLVM toolchains with Rust 1.81.0 uploaded to kernel.org
To: Nathan Chancellor <nathan@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Mon, Sep 30, 2024 at 4:12=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have uploaded versions of my fast LLVM toolchains [1] that include
> Rust 1.81.0 [2] now that mainline has started supporting the latest
> version. If there are any issues, please let me know. I will bump these
> to 1.82.0 when it is released.

Thanks a lot for these, as usual!

I confirm they work for me and I can QEMU-boot a kernel built with them.

Cheers,
Miguel
