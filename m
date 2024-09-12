Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC921B1D5F
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Sep 2024 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726152168; cv=none; b=nkkFVJNI4VfHA1urrtUkPjcOQjttTyzsPUQhMC6cO5nZMkYlObPg9VkMS3wRIsIyUf3oaTTZUOkD6ypRGHELyBk4lv5PkDadpXX+TbqoEPR1k32VbNfvrnyCSRI5KAVSgDJ9YsbUpWVebcF7rChwKkDTBMm9DPg9ZuWfvN4CtDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726152168; c=relaxed/simple;
	bh=fVMcrR40M/knaTgXSltaDGwH9UmjMpGuERSLTP5FNy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrIWKoOfGFcA3VX4LB9VacUbSWREuYIV/j39OoOONHH7GJlELggxAFGPK9fhCg8uHU/nKQn1Medg+wfWnkVNKK6B4dHdFJ6IBKNNOk66CPu4lMew7GVv/JRi6O00SH3OODF3mPjuuhiJShpC63TXpWqv0XtbaAsMR+lVbJtGbUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KoFnAKWT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KoFnAKWT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374bfc395a5so636625f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Sep 2024 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726152164; x=1726756964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVMcrR40M/knaTgXSltaDGwH9UmjMpGuERSLTP5FNy8=;
        b=KoFnAKWTcbDvogV8FWmjJ05/sPSRB0KwIURBtk1EualpRr2wwVedzE/GRqAqo2rCc7
         2xNFKiWvQjmwiyBSyjQhL3cFh1C5UUGh9HyzoAzP4ngN2ZocORz15C5+7RauqDw4O46/
         jq7Hu3ZDKgkGfaGn+8YDYAOPOpsyZGypWYjqDOI10pERSQXIsIxGJ1K+aKIO4/Vh03H+
         LpcHVxrhtcUhIcw5ySD/NKLrPUsd8Cn9FM/I6tlt3QbTthKdtnWNaFNuJuDFxTNCuASf
         bX/EecPlaM6aCLD9YlyoRDFambfGOEYHRwciRAwl5zCHIiCqAGkZ9Nz50oJemChK+m4D
         ylbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726152164; x=1726756964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVMcrR40M/knaTgXSltaDGwH9UmjMpGuERSLTP5FNy8=;
        b=Mq9Ka1mDDGWf2mRFqVsap7omdP1V6LYooQDrOIn6k/7ezPboparhAx+a65oSpPkR88
         oJTuznuVKcvqQeLfYi9hvRvCPdy/wN54AT+7ex0HGCbb5QnaBZN0qEp98zlKMbDLsqlE
         bfH0A5y3wvkpefvL38pVtOJ5iZig8ZK55QjoQ6F8AWe5/01Xd/SC2uuW9WlXGIo+o/bi
         JV04mDsgCnYXx9Gk4XffCMAqwm9cMUrELNPZGvPoIKyLdoL0+n9OcPIBw43TVmxaaU0C
         zBAddcmZSRKSQsefpuwZFJbk787iFvMYkmS91XRtVAtHs+Pg2KUwZzw78Wy0GUHtOpb9
         4g7w==
X-Forwarded-Encrypted: i=1; AJvYcCUllVPe2U/BUALUQo0JwtAapwCBmFF0+v9K8skdPtDfxcZkNF3BlRPnEA7RlkyjCTsLIcFsmcW4UKawZ+8vHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzffT0jjNHucEBp5bdbgFBBGpJRl/2EwCz7WM3h9/9J7XuQRrpK
	4ClhSWoUqaTVj0pO+vHrHPbzZzOL8MuU1UWgcR9RaRUfI+TAYntwPr8llennykVUcF6P+v9X0Gu
	tjz3bUVQVQ04yK/QqPsYAYAK3vpwvWgNtMen5tOnfzKkIrfMh9JwB
X-Google-Smtp-Source: AGHT+IHALIxKJ9EmmZrr6JopaHY//jvcs9CC4vCo+dLy3p7lo/sOflNvVkEuV8d6ztg+CjlxzGc0rB9ZGhqX25cavnI=
X-Received: by 2002:a5d:4107:0:b0:378:8b56:4665 with SMTP id
 ffacd0b85a97d-378c27f952emr1943818f8f.24.1726152163986; Thu, 12 Sep 2024
 07:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DM4PR14MB727613E0669989AF7E12357FE9992@DM4PR14MB7276.namprd14.prod.outlook.com>
 <CAH5fLgia5Vbta2xFB8d2T1Lzcqsq=aSocVFcvxD=dVE85Ucbxg@mail.gmail.com>
In-Reply-To: <CAH5fLgia5Vbta2xFB8d2T1Lzcqsq=aSocVFcvxD=dVE85Ucbxg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Sep 2024 16:42:30 +0200
Message-ID: <CAH5fLgjPYRSMDmbPyyicjJFy5EFmyZrqJdz73-uHark-=BpzzA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Make functions accessible outside the kernel crate
To: Filipe Xavier <felipe_life@live.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 12:56=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Mon, Sep 9, 2024 at 9:59=E2=80=AFPM Filipe Xavier <felipe_life@live.co=
m> wrote:
> >
> > Change visibility to public of functions in error.rs:
> > from_err_ptr, from_result and to_ptr.
> > Additionally, remove dead_code annotations.
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/1105
> > Signed-off-by: Filipe Xavier <felipe_life@live.com>
>
> The title of the commit message is very generic. It could be improved
> to e.g. "rust: error: make conversion functions public".
>
> Otherwise looks good to me.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

How about from_errno? I think it makes sense to make that one public too.

Alice
