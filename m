Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D92B20468E
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 22:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763938019; cv=none; b=riw/NrsxN/s4mgtcuOQ0zaVGH3PMLRwFZUoRhyntWyYYgy2HAusS4fZ2zB4zH9qIFaRI2H2IATu9dr/HDMSDIZHZFGzpElGpoiixYPsFbwKlyujnzEY3jVMSPiDqYCncCimh1fpc9bB12rsdHCmjy9tboqvorCM/endNrLeytnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763938019; c=relaxed/simple;
	bh=e0hceDboA05xFP5/VRqZHg1h4iO4L8U3n4dUraP6p84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hICT24ja6YEA9fGbwrcGofW6JXmbNFV/2Xmz9kriz9RCBMu/pVz/R+UOTmOXzAtBYkNL4QjerV6zMWLRIdAYuvScjW3ZIKNQ+lrzD3Iy2WHm48+VgRFBLkLhpVhPuwWFwEg8yHcGGvCBVn1bZto0AZXYBmPNrjZArVQkNx/3It0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muqonko/; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muqonko/"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-43479d86958so18269785ab.0
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 14:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763938016; x=1764542816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0hceDboA05xFP5/VRqZHg1h4iO4L8U3n4dUraP6p84=;
        b=muqonko/UEIQMeLnO3fS5C41/T75yCG89dJ/Uvhmlocl+b/yvUAOX+2rYOEpWQic7/
         SyS6oN9zsvDVyJxB2FSpZoa7XzHZ46w0QKvrz/3WDfLFESjOoYge7Q/zb5KzovtTx7TR
         ow+i8crP6q8mJkKmre7JLDUHeOvrwx7Zd4GIhNwpX05XRaRgwCUoyju+S+TNKFY8GvKD
         Smwr7H0P5V0J+uUjMaIUGdk2KRc85AU2kJqyCY3X3WZb1cYqTQm3jKJInl+xtShTe7+8
         k2FpY86ZY9JHYZpupYfuLgRJOhZv/akruY2iwTZ1CIDY7YjlX3ssstgnQlslVG2hkt8c
         v1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763938016; x=1764542816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0hceDboA05xFP5/VRqZHg1h4iO4L8U3n4dUraP6p84=;
        b=izsLVQwF2fBX7xLqVCCFQ05Gjk+f4MF5H8GN+aiQ/ca4xCRgfSh0SDahDEPYXuN+tR
         7QM7uFlamz8XdBAKmHE+dXocrWXy7uzEF+O4ZhZRXXVWUpfS+4tsMXLjv/u2abb7IinV
         zDNuqS26ORvUs2zZS76JAyfuA7nX4nQMiqrMaNgD4+sUI1JEh7pl8v7xl6Z4unn7eeno
         XvfHZmzxh91ZZ/McGl7lQnPirAbk8Pq8jdwXBxi/vRlos6urfIM/uBgx9CDzrjmFJhQQ
         HWSlM4syHg/oCEq7lS4MHk4Cqx6/0cKdYZj/RHzQ9yOtPymRipjKXiiywYBadhI99TVa
         HhUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKa41UVtax18JrSQHIs341/gX2VmoDOHDB546wBMBdliVBwjlECbS+9hOMsPuN3W1xlED2dQ+SMIbELUDCBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN2K+8/pUpGuwe9oFx5e+Fxraxr7MtaoYfO1kE8w2FtVTvOaJv
	alPk1JyvTn+kq8eBZPnOzHeq+k7pc50S0j/QFf9NmYrTA9G6zi6hQwgA42Za+K+zmvTrnJQTmwi
	MGjcwLhGI8xbD6Apd8m7R+nrGW/W7E7c=
X-Gm-Gg: ASbGncs7DtyUENfVoD5ixglW9L0wzM9iksWJQ8PvICBie34ng0oBJOOJWusv5NKnOOV
	P3sced4bDz0mdj0sKmBZwHgK8d2z+I1m9FU1DXd8r4p90h4WoATK87aF7lybU67uWyH+GkSFT3V
	go8hFSo7MRIBF102Jy1cjIkkNVEUrsVILsFhdgiocaYNL944/G07VSTY19C0XRh3kzE5oRzcdTK
	d53gRMV+z5AHwgF0DV0oC+arRsUViJWYuzFBUShyiH24SQpQuioZhmqBEcRszhg5H9JRxYCQdOI
	iOBaNhBKLrHV
X-Google-Smtp-Source: AGHT+IEL6wOTWEIzN+6uRLqQQTohjNaYVb+umwdBrXzCY3X3aIAhRgkHGXdTXdnHIwE08xwvTjQQuTm0WFDj2WHSS0M=
X-Received: by 2002:a05:6e02:2190:b0:433:5b75:64cf with SMTP id
 e9e14a558f8ab-435b8e5cbb2mr79300195ab.21.1763938016377; Sun, 23 Nov 2025
 14:46:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121043750.298843-1-y.j3ms.n@gmail.com> <20251121053633.1594703-1-ojeda@kernel.org>
 <CA+tqQ4LX2ihwY11VJk3LNNE-STsONJWF0rdDa0Pq09oA7YRXEw@mail.gmail.com> <CANiq72=Yo6-yLzQ6f047vXk1e-mm8=EH5t3dZRpLaZN1iuRNMg@mail.gmail.com>
In-Reply-To: <CANiq72=Yo6-yLzQ6f047vXk1e-mm8=EH5t3dZRpLaZN1iuRNMg@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Mon, 24 Nov 2025 07:46:45 +0900
X-Gm-Features: AWmQ_bmOB06MctdBZgf6VDX6e1eE8DqG-67ueFQMRQg_sxxFTTkFLalse0DNJMQ
Message-ID: <CA+tqQ4Leg_VZWe92zXkygrp-gwRNPwyysYMWLwupX2bTt2R-+Q@mail.gmail.com>
Subject: Re: [PATCH 00/18] `syn` support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, nathan@kernel.org, 
	nicolas@fjasle.eu, patches@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 23, 2025 at 9:51=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Great and thanks for testing! Do you mind if I add a:
>
> Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
>
> ?

I'd be happy for you to! Thanks for asking.

Best Regards,
Jesung
