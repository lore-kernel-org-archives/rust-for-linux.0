Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E60F1A3154
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760348754; cv=none; b=MQn5LdiaZTS36YeTwn1SHND9v6mS/1KBVzJIoW1Qlgo1AHnVt+bTWrZpn/Fn4LLSRQ7JgqPMRDokTgDxsyTZzy1rZevHBpL4L9HaWyy+H2fTTDyEE/eyvn740vebg9ULOY0mAwKZAzEMn1PNGFy+gRM4J8GrD9ToKcol4708BdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760348754; c=relaxed/simple;
	bh=f5S5EzRGvuz/r4X9fJ+a+VGxsMoAlj8KpasOUBJh7Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnwioi+YlNf76YACnJtsFRkMbExZoUSJYYUTDaqzuTH7kRredwytXP+Qzaa7MPP3bHek0rJg7EFI0WhklVg2XNR/JGW8Gu2p95/VbSBciert3TThxrviXcMNLaJs4aUPg01rIi3MbvZZDrOnQagHrNsTs/m4AngCX82dBXJKzY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cMFqA0Wi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cMFqA0Wi"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so28575615e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 02:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760348751; x=1760953551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVu1hEkIf44NHHLfFJPgY+f91pjliiXRGzufnhZn7d8=;
        b=cMFqA0WiHBlr+qcD6I3/7PFTzWl85dVmq/H7T3GWOpm2RsiGufqjMM72VEAJCLkDAe
         DhwME2wCbZUe7DEF89ZDFF4VAJIqsnIFEAV4/JTlOPfdtrnofR7iyXVAZN1hfd2N1zvD
         cjkK560wz2MEV8zSGtcv412sbn+D+S2jvHo46NcSOT4S+qM5RMLA/XRskJdCNXcUR6ub
         vdIHk6GkDbWXdAUqoptWSvI6inMArupUEQsM91Kh7K9Cc82OfnGs1NVqdZdPosvEkm+K
         9WpEpB5qvuaAYhIBEdqgsjXlBVTSV9WoyT0ozfU53TqH9EdL0CEbRVWMilrPcGyk2xwo
         xz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760348751; x=1760953551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVu1hEkIf44NHHLfFJPgY+f91pjliiXRGzufnhZn7d8=;
        b=vxOMzHXxO6XJQlCNcccV6A+gf8AwBDF7cgcC3rxLm1OXni9IIvtG18TpLWEl6rs+UY
         9LXg+9ICEXDOa7tsZLQ5S75NkeX1JjRF5SxJaDOzcrm8rwbReF/CF2fRPUkJ2dtZtYKe
         w4X0EGYhwpXEnxP0GNX/SdvKGlB0U8sSmMBwMyVuHQTBdmyrjQT32YIs3kjsHn7OXxjf
         OIzSX6mnT/1nxV8pNSqPBanmaahsiR+6RyxK0a7tqemtcqIzrVSf2x9sfrDk4ROPXTv7
         DZvW7UxvTz+hea3WwWLKsLPgiErzeaBPu8a35iGvAV0qg2lRTKqwgkpaEvcOARvJHSeR
         bxMg==
X-Forwarded-Encrypted: i=1; AJvYcCVtpd7dBrrUTQZ+D+TvXC/6IkJgaU3+JlGn3Uu5MgW6N+1Q8Krv0LeubqQ7tX9RM4sIWqyjcHNMFwlWvQauOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf9SPfb1V4NfGBfKz1IdMvbBtZvua8LBuF+DgFymc8yTHvFW8u
	cBSokN8eGQlQ2Rm6EBqkV5qxLf+d9HcYbTIlAXp1CafVR7j0jw8pGEINjVMtp4dPKQfJXeNgAcF
	w90dMX4zYMuBKMYH1jlYnBhegok8ugJ0qitomFYbP
X-Gm-Gg: ASbGncst0kheNATvbNj9sihio5oTzv/BV5PRTQROZLKBNBollb3D6ygyJle9GYeJRyA
	zvTWhuIqBsQOmL/biKwIPPkRaaozF/sJs2qJsaoCOGAktvyhEAJEme9hVlUdQQq2/tWNQKMra0W
	xbVT0zCnoCXHR7ODGcRV77byOrmsbmjKxqrH37FDayEz3lG2NAzGAg3p58CepVhgBoe8hVeEr88
	LnWlQ4oGoQqY/wKMkioLETtOo77wmvErFViUhdLpCPrHiM0W4N/tLlWGf5i6hlTypV2+IZW
X-Google-Smtp-Source: AGHT+IFqaBixRi77uwFxD0KO5fWa70Oa0mflVhXrjLFcAwKyNCUyus7ehKoAqeSTAbzAk4ZDHyQpfzilqQdd3qFUiUs=
X-Received: by 2002:a05:600c:502c:b0:46e:3d41:5fe6 with SMTP id
 5b1f17b1804b1-46fa9a9ebb8mr133351055e9.9.1760348751245; Mon, 13 Oct 2025
 02:45:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003074939.465517-1-benx.guo@gmail.com> <20251013043812.13186-1-benx.guo@gmail.com>
In-Reply-To: <20251013043812.13186-1-benx.guo@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Oct 2025 11:45:39 +0200
X-Gm-Features: AS18NWC7zd8zRon9s3XEh0rKZRaVm37ojpo0BrRNHaKslRzb8eH_XUzUW9LbRAU
Message-ID: <CAH5fLgi4C454xG67vN-T5rRV1X4-rAGEj_ftnHqTOoN61wtcKw@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add translation of rust/testing.rst
To: Ben Guo <benx.guo@gmail.com>
Cc: si.yanteng@linux.dev, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	alexs@kernel.org, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	corbet@lwn.net, dakr@kernel.org, dzm91@hust.edu.cn, gary@garyguo.net, 
	hust-os-kernel-patches@googlegroups.com, justinstitt@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	lossin@kernel.org, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 6:38=E2=80=AFAM Ben Guo <benx.guo@gmail.com> wrote:
>
> Hi Yanteng,
>
> I=E2=80=99d like to confirm the expected use of the In-Reply-To header fo=
r versioned patches.
>
> In my case:
>   [PATCH]    ->  Message-ID: <20250929163531.376092-1-benx.guo@gmail.com>
>   [PATCH v2] ->  Message-ID: <20251003074939.465517-1-benx.guo@gmail.com>
>   [PATCH v2] -> In-Reply-To: <20250929163531.376092-1-benx.guo@gmail.com>
>
> That means the v2 patch points back to the v1 message ID.
>
> Could you please confirm whether I should start a new thread for [PATCH v=
2], or if there=E2=80=99s something wrong with how I used the In-Reply-To h=
eader?
> Thanks for helping clarify this.

When posting a new version, you should start a new thread.

Alice
