Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E19212FB26
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Feb 2024 18:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706813709; cv=none; b=Q0Rm7vF2EAs6fMv5w1WrNELnW4rK3nj51S31nfyWftYlerJ5DEQ5VvrJw+fRS7w4oj+0/px41cojTn9boau3g6DkcATh35tMuvWIu5sQg1cjalYBNkMhyBzwTRn17KM6ChvwPUocsXvl/QP/hQDLos741l6dwOX/4Ds1yuSDVls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706813709; c=relaxed/simple;
	bh=f57Tgnlf9rFdiG4E8MDi/gmhqbZE+QeF1UXrVEXyl1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s7gsnRCOVGHIXc2ggsDBFpAkjXE6Tq2pkb2v2Xh1bvIRUticpZrOJnM5TgRzgbszuqxj3yFMB+AdPa82BHljVyDcvZ0v4eHHFEMXiTVQL+D/Oy5AsBRHuTtodQryeQgtut0/AYkZCqFaC7hiR1wuE9Ny2sCtc0dWJSA5eDCjiTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SE4NzPuD; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SE4NzPuD"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60417488f07so14124437b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Feb 2024 10:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706813706; x=1707418506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f57Tgnlf9rFdiG4E8MDi/gmhqbZE+QeF1UXrVEXyl1s=;
        b=SE4NzPuDIyjD22+ZBghG21tDWQtrifuciMq5z7NUngzhhweZlEa7O34UIc4CG/VbFt
         NRmocmiKOosVO3LUizQpCOQ2GAjUuwR9zvhBJGb4bYzV8bcKFZwCqmXWG70bte0QpXme
         GvGeAYt9ygT+zPfaoQJS3APr4/gziMB4ddpTO3fGGBd8mdGN4G4fXNmzpTKEAnRHjsta
         YGx530IgsPDuUV2tJ7zq9NJDdb/Y+IwjswbpKEm1Mujvq1DsespmD2SfOQ/GpAG2BsAK
         pg+CQ+IeQT2T6JSG5AuOcrG7H0eSwIWLgkS2YcttjqtGx1R0rsGAKaHW6p8gVVfHVfXE
         ylGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706813706; x=1707418506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f57Tgnlf9rFdiG4E8MDi/gmhqbZE+QeF1UXrVEXyl1s=;
        b=ibmEwloejE3zaWm7IollQ6I4DnvuLbIvMvWPepaW+QRgsBXz21RZNu1JTgR0obiv8d
         473OkoCSkWEWEc4rkQR8i/R/fMfZMfWtTo7M5LkdtO6BQbnarLqe28lYNFCm0kLp9DDd
         VTPEoSJmO7X6rfrj4Xn/9aceMYtJzW2KiO//Eq3K6u3GUQlxdZGAoLMpZ5zjAbU0rB/s
         uhKzJfnqEqkKf9SrQL+rJftj8cQHU2AQmfivcWfgDByDRXph79Z5nZoj6UdEvjP+0Cpv
         W2lmsKBgOITFmPgqEMGm/NcrU89ppMizm3GjH3eG9W1wrupM7b4SHg3tr374kDwbqOQ8
         5pbw==
X-Gm-Message-State: AOJu0YwAVeypWMRVYejTwbs+i8X0cPQCyi9Qi01XouBd8jBrnWuIB8vX
	9W17E69dwf0x+OfGumffqFF1ca+x5Ia1O5Dd1x7LmeQpQAlPl1gnGKNtfMr6bDF4GP5KLHLqS85
	9p6ncLFbZK/KRhGEOJmEl+raLirNNBPtBAj0=
X-Google-Smtp-Source: AGHT+IFJXghC6qT8xKspwOxB2Q545Cux0QL/LJeeGXOh2wASnKimVHbd4Q0yYw+FNiB8Nf0vsuvI16gdCSL5L1ZS+Kg=
X-Received: by 2002:a0d:ccc3:0:b0:5f6:d447:b85a with SMTP id
 o186-20020a0dccc3000000b005f6d447b85amr3342792ywd.7.1706813705978; Thu, 01
 Feb 2024 10:55:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <929f47e0-8aca-471d-b54f-26908321999b@redhat.com>
In-Reply-To: <929f47e0-8aca-471d-b54f-26908321999b@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 Feb 2024 19:54:51 +0100
Message-ID: <CANiq72=zcLXOzYbLjNz08s_xN=oC1ZaePnsRigMJLzQONUa5xA@mail.gmail.com>
Subject: Re: RfL branch for PCI bindings
To: Danilo Krummrich <dakr@redhat.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Philipp Stanner <pstanner@redhat.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 4:02=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> w=
rote:
>
> I'd like to come back to our discussion from the last "Rust for DRM" meet=
ing regarding a
> common "rust-pci" branch.
>
> As discussed, in the context of the Nova project we are interested in usi=
ng those bindings,
> contribute some more (also in the context of Philipp's recent PCI work) a=
nd help moving the
> code upstream.
>
> With Nova we should have a driver project which should justify further ef=
forts to upstream
> the code.

Thanks Danilo!

My understanding from the meeting was that Andreas kindly agreed to
maintain a `rust-pci` branch in a compilable state (i.e. rebasing it
on top of e.g. `rust-next`). I am happy to create the branch already
if Andreas is ready, add it to the website, etc.

Or if you (Danilo) prefer to drive the branch instead (e.g. because
you may have more bandwidth), that is also fine.

Cheers,
Miguel
