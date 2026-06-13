Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9F83CC33F
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Jun 2026 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781339154; cv=pass; b=RQR6tIZOcQ0qRYFhpK9lpPHTOyAS026AUEwFfw+f3x6F0vzllYhiFNuBfEYhAwf/wJEtroFnG0kkgxnrPqq2qHdgXXRMzMS2tkWi1KBOzgbYXVxLUagPQ0ePwxg4mU6csXzJLvUhSn89w8GYmd7oNIQC89h9fyL+3rp4y8hgUao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781339154; c=relaxed/simple;
	bh=Nkzq13zWfwLe7N97SIj1ufbi5zP1xnrCzukaQ1u4s18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekWxZ1GMoZC2XsHRj8v7Yi3++TRS8AL3eQohFjo8imJXhslwBjeAsv1mT+5Te3DVYKXoaR5IebuWzE/JwdcIt4ETHYmCjm9HYIdl4Zz5ZSqGn/n1mDaE7lK8v17L4cSlyQjH/S00krqhbgj4wZxfaJF6tyok+UvMPCiiejrKSKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XicmLOQv; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XicmLOQv"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so221941eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Jun 2026 01:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781339149; cv=none;
        d=google.com; s=arc-20240605;
        b=eBDi/skPXOLV92NQTxCPBFWxkeRGB4Z03r6KuoOPvRu5L2g57wJ7ZsyEAaEmCI+/Vx
         VwE6Gne9TkG1zhVwzUlnIm/F51dlsPzcg0+5k6xJR2LHlv0Vc9t9xwg1G+whz0DZ1hR4
         +/OU9tll3+Aht/eXZNG/zTnGp1/N923AGv0PtJFOmiNjKZFUZkoZSOKRmtz9YSjijPmG
         gXrAf2Hq1gdwnpWtOYgd2Ejp5RHzf3pa/Hy67bnbCxaC8xA/t7kjAfxEothKhfixNIeP
         TLXJ2uZFyZgl4UwT3vdx2edeQ/fBT1Z0OQizSGuu3uj7TaG3V7q2YVuy2mNQK+tXfrjL
         yirA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nkzq13zWfwLe7N97SIj1ufbi5zP1xnrCzukaQ1u4s18=;
        fh=REjp4JXtBP8AcH3o1eImUXmr5uENhDhmUszhllyLrEk=;
        b=EvlonVJpc3/BGQPquHudHUJWEEDw38x69ah0brv5BF/iW9bBmyvHczPUICnNF6vVtD
         gshmh6gJ4v+vEi7qdi403ZpSBfSekohal70pkBD9nahDQKmWS0Dw6LKRo5oIzNShXVec
         IcycVIsUH7Od7QmcNndJCseH6vNn6G8jadUGz1AGIOeVDq6lH01jnYCUKx9bVP2e6z1X
         Lv0RwmVLpA2Ha3euB/jGqZ4oRMOrdXOfRNIBkLQ/R+YFEn/I+I0M9YVVHsE+bY7pGyLs
         8DR4+AkXlAGZQUf2PqLgMlVwxu3DN163n//OIWCjB2W+c3wvYJF0jJ+PwkrvOlcL9IIH
         z0Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781339149; x=1781943949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nkzq13zWfwLe7N97SIj1ufbi5zP1xnrCzukaQ1u4s18=;
        b=XicmLOQvutr2FLGxnQfR64bPf+/ottTMo3R8Xzo/DR28DO5KztbCPcNyFsM+5AoIDV
         D0sJ0S/ThY+5r3/1MCQdRqTHUpati5nXeiBGbk3oygZ8T3uLqNTTOQn6xa+3pFwJTu5l
         wp2fIp7APDfgC9l2JnmVpK/TS6VgKcEJitXm050KlFuHPFCzVXkLQOavmckj4pIjNKaR
         mNRbWeHBVETXlTc/yzyOXSm7nArNH7i9QVyqfcT4DZi2S6SwCosgURrvC9fZqNrTb/ci
         7S4kjBMVk4QAaX4/cojvfqVEJOdy42C5kPMhwFQ+/F+b/HrSCRz8/OlCGEYJbff9Sxpm
         Tbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781339149; x=1781943949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nkzq13zWfwLe7N97SIj1ufbi5zP1xnrCzukaQ1u4s18=;
        b=LNZ6ohn68Ws2z6Rs/5fizRZrztSBL7qEdo8+YKxT3V1K0491q+rmhChFZrXKB5yfIE
         WJf61H5IpOLQdCFGKnH9sdxRsVwjEjT27xGlRHps+z0JErw1a37FsPN5CxUCtAdm5pv5
         TMzkqoXTEV+akfYRG9C9aQ7fvtcuG7suJS6GH4k0mZ3LiFNqRFPp44wn4QMRIEFSM02H
         ssHKgKyM1XEISY2PwCYTdpP8govm8ZAH//rxqsvcksRUgz6y0Q5XgznITrKciTfp4zbB
         T+N2aBT9Bra58JJo/awM679E6q2FsXla9FGkhmL6qyF8UQldNIqe0nfapm1Nj3q8ezYF
         kqlg==
X-Forwarded-Encrypted: i=1; AFNElJ9cESXdwIRBHl8nZjaFQBRMLszPmgG5jViclOjEYSg5lYMp8T8g50vxN2QVBDnivCTDc+4+tqXD6B3T/VRzzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXqt4cI9scA+d70ft7TeLx5ORhtrlUZnWPCO3oa0EamCPUeq7Z
	o9sc0Rj22RQSneb0DuSYkNs+MgDkJAFS+TsxAlmU1f18aT7dJz06ZjqnHni6Fyhasef34ca/3Pp
	lXevRGOtv/ga5clF7NK6uesHgiVRM6uI=
X-Gm-Gg: Acq92OFK4RMBZ+xTYINqBQpGXcgBhtO7TanPY9YQdj/3pVPr9v83if+ALGJpKk4+0Di
	kkNsYXvsDhkQua9KpGH9I5nRniXi3LsHKqBm8rnJB93fegMxfPsDT2l1Kqnae+1E28Nzsb71Oj+
	r+tVo4ORQf7KHcsVZo+h1qjUyRwl32pGUSIK+vaHNHsml+kgG1LvRuk9i4RO2Ct4+BzEA/ZsKBA
	TnsPKbdE3d2vB+7DOs7Xz5Z2CSMChaGeWtV6pBeQ355ngqTBNjiPlh66zaK5lCaJ+nkVerAKjQd
	LNC1e1QP84iVmA3yEdWiyxsVmC1dUdWJE1XnPil245ssH6MpY8+Aolvg4I2/yvItpCqIUMGilat
	zpTWP9fXRqb2B4ZPdCE5XjKI=
X-Received: by 2002:a05:7300:4306:b0:304:3c33:7afd with SMTP id
 5a478bee46e88-3081ff5d099mr1677256eec.1.1781339149602; Sat, 13 Jun 2026
 01:25:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611190555.2298991-1-gary@kernel.org> <DJ6SM9BJ7GHN.JX9HXO3ZMBPM@nvidia.com>
 <DJ7OKONXCQPN.1N5F9PJSNNGIR@nvidia.com>
In-Reply-To: <DJ7OKONXCQPN.1N5F9PJSNNGIR@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Jun 2026 10:25:36 +0200
X-Gm-Features: AVVi8CfkVzJUC7BQsk0AjbbH47SzipZdpte8J9uGKYIm2nYqnMSToZSWx4p4874
Message-ID: <CANiq72nGqOGj+mtngQ2V8+UrV7QiAs0km-usMJNYypmr-RmWxA@mail.gmail.com>
Subject: Re: [PATCH] rust: bitfield: mark `Debug` impl as `#[inline]`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@kernel.org>, Gary Guo <gary@garyguo.net>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 7:43=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Btw, should this be
>
> Fixes: b7b8b4ccdad4 ("rust: extract `bitfield!` macro from `register!`")
>
> ?

I think it is reasonable either way. One can see it as a "size
improvement" or as a "fix" if it was unintentional to not have the
annotation.

It also depends on the magnitude of the size reduction -- if it were
very low, would we see it as a fix?

Cheers,
Miguel
