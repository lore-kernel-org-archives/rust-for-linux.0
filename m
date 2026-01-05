Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED9C314D0F
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 17:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767632924; cv=none; b=E+qEKtRH+/vDpWIGSI36wj00ihpd5EVOpe3eFvwKdT/0p7znUFFOUSnk7JlKWpL/GjfUgIXNLXcAyjXpDEmCFn0PfpLhqEUGIeNLvTTY002qMkMwEJVL00cUFBxkWOpE5J8ECqYq3eSg0+GaGpzDSCqDFlHKuikoqdDf9plYJBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767632924; c=relaxed/simple;
	bh=amfRoCSnm0J910VRHPtMl2YPDj4b6nYy1EJ2w+HpuP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fbmlyzj/rivXnLCRH3hGyoe/72IHW7tDLDB8qopvxlpdzdLa0gzNRoLAMnqgnEdsD4nB4arCkG9eDGLqi6h3EK8zcu1fHtlU3UnolPqNYTIuHlnbiUwGqh3IQIItUucPyPFXaNRRDgo56mfJnZbiIG6836GkHhilN+/dmzw7/d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gh30nWXD; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gh30nWXD"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c1b5b65f832so901a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 09:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767632922; x=1768237722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amfRoCSnm0J910VRHPtMl2YPDj4b6nYy1EJ2w+HpuP0=;
        b=gh30nWXD1fi6b/pzMa6xqTKD91xdz8/RpmQAdRjsyserfXNblAaRtDsjTu3Aajp2sG
         e4DipDkgkdMbKSZKr/CmFEfnPcUDf7QORRtX3w4GkIOR4kVrxLrrdQQzoQjgnX3N1pis
         RI1T5PF0+if/e3zQn2GKcxNnBqOQ2h64+X/lVC8HEB29sEtHRmvgKT571icXmiyoGLp8
         gFUGXmwgYUbagcGsijWQKPtIDOzDo/T6ZzyFJ+2NaVAIdGr3BaQkKsakPAYPAL31s3OS
         VBAfA5s/56gH/msbrEWFQEHxOI8d1oICxlb/VPE5xlYs+bThhB2scs7P0R75Lf+hhpVT
         ep4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767632922; x=1768237722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=amfRoCSnm0J910VRHPtMl2YPDj4b6nYy1EJ2w+HpuP0=;
        b=BdTf7gQ5AQKLY/xMNeXF23oEjG/DFJMc8X3fjxfF5LOTq6NMVVnzWk7XBTfsm2vRU4
         enQny7Rr2xsiaGh5bSZCDClML4u/7GEMku0Z+YlhagXphHXlMvNpd7evJADJn/xYVaTH
         MqKajWGRCVJk6lMs1vZm53BqdqT8AC7u2nRcKROpxfd63IqY44UjBAxhtIn4S7JHL1UR
         CfJ0dR/ok9T+/X7mxs1OKr0F44TeK+IhLpb5OypOAXeF9F/r8bkR0JvF+xxs5HvidLLM
         6VeotYEIPxFi7tp4z3UdYUOP3H6dykZkPiMnfF+e7orOV1NI0jRpHc/JfLtuQVi/j2/b
         U2IA==
X-Forwarded-Encrypted: i=1; AJvYcCULRogElrh0FoU3C9ZHYE2Xy8MhKucWZwJ9UmIRwI4gQhKrqTkBPEdPutVNjRpNt6UP0GncbHwNf5CFJ3iIsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCHPOdpf9MV0KUOK9D/FAIqBHERZPF++NL6b6UWwUGCdHqMQOw
	O3kJbLtHGFG1IG1DrFccmsgdxff0LtrwaL8aL+gYyOPoQtdD/PtY9zL1332YgOvwDNL+bpU78kc
	BBMtC2AVkwKILKtq9nbMcLrQNFX77LjY=
X-Gm-Gg: AY/fxX4Ofgd50NDbWlpoHEmrGv/VZRVtPZX+jbetxPz5wHsXop3d8BAOskg3rYBaEYN
	k4Mn9viXLrUXHyFcq4TzcKLeTF/FsspI/yr8C5TjNPDkBGtNMQtzci5NcPgNDVOYQyqsdSEdjWP
	DoeOHOhutPLryG2rW/8WbuBO9OmrMyVkxwl4Gjhzp/kNaTWvPpnM23XOYOokyzxJD+eGq41ZSb/
	6EChl0A8NFsnb/p7p9YqYhQ47Gmh04uDTP3qzj/8ZbsHx1d2EX+5i6NCU6r5RZwoulqTRZ8vaPT
	+TMzZfJRr1BTgRwGgq+Lx94Mj78ibIa9dc8pLFXe9peAnnK6vqzKw5i6lfWWig+vY+IX1h9tLXG
	yfSCD7LnF5k0Xch+h+ujGCow=
X-Google-Smtp-Source: AGHT+IFCT77sjwP8WsVf38KzNhLSc389Z74WR6RbIKpq8/UH60ZTJAVplwJhfAbh32hVQxJxWaSPevjz136zlkFvBOE=
X-Received: by 2002:a05:7301:4090:b0:2ab:ca55:89cb with SMTP id
 5a478bee46e88-2b05ec45daemr23837094eec.6.1767632921895; Mon, 05 Jan 2026
 09:08:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-bitops-find-helper-v2-1-ae70b4fc9ecc@google.com> <aVvu3zF2rYKR3XC0@yury>
In-Reply-To: <aVvu3zF2rYKR3XC0@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 5 Jan 2026 18:08:29 +0100
X-Gm-Features: AQt7F2qgJhYo4wXjROBopa2fcjVagJmY2X_qZO28fo-0vjIHyCZZM1weSHo3PZk
Message-ID: <CANiq72kXNUQtFRDHrcox2GK884mgux0CCntPo_r-gwxzkTNQHg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: bitops: fix missing _find_* functions on 32-bit ARM
To: Yury Norov <yury.norov@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <bqe@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 6:03=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> Which means, you're running active testing, which in turn means that
> Rust is in a good shape indeed. Thanks to you and Andreas for the work.

Yeah -- to clarify, we have been doing "active testing" for ~5 years,
even before Rust was in mainline, for several architectures and
configurations. :)

By the way, this reminds me I have to reply to your other message from
a while ago.

i.e. this "active testing" does not mean you don't need to test your branch=
.

Cheers,
Miguel
