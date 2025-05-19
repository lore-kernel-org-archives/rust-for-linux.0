Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E512B78F4E
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 21:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691385; cv=none; b=UHKurUDMEws4KxUj0276NLvwBjN/3fdCdmZ0JUL6k5CFzpdNCbahg+AxSSqp1qoR61JIdtSVOiqiEpZAJZaC84gT6uX7N3y4BwxFyDvZbgRLzgpdmRjn4CMYtUcPnFbw1NFdwkc0pssQSKrkZS7SL+2fBgFD0IK8sB8TUCycHu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691385; c=relaxed/simple;
	bh=+u7PB1Z5VLEbrjkXeT5Fg1xx3+Xzkn0Fzy8bmheyQgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/n7vv6bhOzSXOs5NIMpvn/O5DTZwB4q7m/SE+bVLYkTqsMTiVas8oK4ltTFF18bbYj8ewpQVvZeKjTVUHQaFoWRHPXh2iAlKyUwC2eQ5LgB8MlSYfmHH95h/DbJk7H57iJyKD112PcAo5j0YOmwx3iPM9+aN+fH1f/IuLy6Bwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dxcnorgB; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dxcnorgB"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-601a8b6c133so3251516eaf.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 14:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747691382; x=1748296182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+u7PB1Z5VLEbrjkXeT5Fg1xx3+Xzkn0Fzy8bmheyQgo=;
        b=dxcnorgBjLty/D3q1FdVhx2AEA2vra0KnwirFM36g6Xh6EfYEksr7z3AMVNJbaETBb
         Vh8F9WDsy2e0RSlt8lznVpchdyZZ8PtmJIL8hM9LJaBOcXCkTNIEf7DwoA3Q42Koxb2c
         5IO46GKTEci+b+WHlgKOlHmdFkOtbDR3lvfKMktTAqJJCZWdfhk3EfZrDbRvWej8KWjr
         SRcKkCPbaL0WSMDUnKeCLx0YOzH5zI3VxWCm4zOkcJ1rhlslJBjzUGI+7+pWoxT5Ob3G
         H4zhhnZyUXeakKcrj0fAXMLn3rGGiwv4hVZwPM6swvW14I4ARVXDYgBu7M9KS3cZQB4Y
         y5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691382; x=1748296182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+u7PB1Z5VLEbrjkXeT5Fg1xx3+Xzkn0Fzy8bmheyQgo=;
        b=tCcZ3Kg+1Y+VkhNXxQn8j5AbOm+ZbAjJaPemEyAg5QDXdGBCWSLecwXdCfhmJ0m2gT
         bJhVX+A2xM3oCB8+UF0FGVGLHwK3x2hHAyijZv9s5q0Xh1/JuDMV35mMFyMSFqHVOCUI
         DpNs10Fw5upLMVDY/ycf5rA9HD/wTEhwD453VRGi8lYt25ic7RrHgxPsJyEtwgv/4kZa
         2UqRn4iPdqEJHSM8quB00KwF9K84OC6hozFA8/QTLCs2QKQmiXcvRfjKXxnx+S0OICMd
         4T8oQTF0pzb6NE4ceKX2WkLG/8XaY1he4Gln5U+pa31ffqhVZpqjuiScpZcVIkW6gpI6
         BCQw==
X-Forwarded-Encrypted: i=1; AJvYcCUug9NFxR6KcDssLGSNFC6m9Onnq1TKZE8qEyEhKPabMfgPrAyxI4rx0W04+hvS9c9yQYswct43jj8a76IxWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGSYS83TCIV8qIKrzhpK6cADAoROV0itZs1y5HQD0Jo18nF/dF
	MmAmQCbTB8isHCt/XVuinee/lWSSQBS+SylZHlMtoG6d0MaWcV1fl5QTz7RslkNDWEJYc2+QcZ8
	6FBB4gHgK30QgJlU4UNo7Uk5fV9VMyTcJsxevrQe5
X-Gm-Gg: ASbGnctcmP68hudbj0GqFM8bU5NcVSro8SyWftM4I4H01yLAz59VcfYIEaG3vFyw4jS
	ITyxgYhidoogwHzl/84ef9ukGE34DUvvObu8L5fgrm0mzQi2ZSzPMMiy83Pf8skJwEL91yY28BM
	+6CH3D42MdA76bTJuJV2vOHIY20scuscnsWDHvVsfhJJKe1cIb3OBky51lxWyH
X-Google-Smtp-Source: AGHT+IHDHkRq58JIPNvvyPB5attty18ozlWf44b0VeRKkgwSND9j7m7Tdi8BgwfZq3B/e6Q6Hx/u8L0vzV3d9OtEQe4=
X-Received: by 2002:a05:6871:6115:b0:2d5:714b:f07c with SMTP id
 586e51a60fabf-2e39bc8c605mr11232672fac.5.1747691381732; Mon, 19 May 2025
 14:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519161712.2609395-1-bqe@google.com> <20250519161712.2609395-4-bqe@google.com>
 <CAG48ez0rGwFeVtj6AKg8YY=D9Atvp1h5FdW3szswEJsRmkR86A@mail.gmail.com>
 <CACQBu=UNAFjKw_m8oE5Mst_eThEf36zqgUWZ3a0u1m4zr6MoJw@mail.gmail.com> <CANiq72k6vhzR8W72B-vqHy3rrTv+y9rYECx9bfHX=eD6TXye8A@mail.gmail.com>
In-Reply-To: <CANiq72k6vhzR8W72B-vqHy3rrTv+y9rYECx9bfHX=eD6TXye8A@mail.gmail.com>
From: Burak Emir <bqe@google.com>
Date: Mon, 19 May 2025 23:49:29 +0200
X-Gm-Features: AX0GCFt_KNDRxySWbchXyhWaT6j0sKpaZ36nYbMjHgqpY54iLKrBcjTnijcS_7s
Message-ID: <CACQBu=VXAPfVGxVFiW4iZWF=kd4ZdwH4xwz0YgXnoqK1UnHRkA@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] rust: add bitmap API.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jann Horn <jannh@google.com>, Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 11:42=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, May 19, 2025 at 10:08=E2=80=AFPM Burak Emir <bqe@google.com> wrot=
e:
> >
> > The "unsafe" here should serve as reminder to argue why it is ok to
> > not have any ordering guarantees.
>
> `unsafe` should be used for unsafe functions, not as a general
> "danger" or "advanced" marker.
>
> (Having such a marker could be useful, but `unsafe fn` is not it)
>

I can see the appeal of having a strict definition "safe =3D no UB".

> > The last sentence is supposed to say: when you have a &mut bitmap, you
> > can reborrow it as &bitmap, and then happily call this atomic op.
> > Even though it is unnecessary.
>
> I don't think that is related to safety preconditions. A "# Safety"
> section is intended to explain what the preconditions are.
>
> So, for instance, stating "The caller must ensure that this is safe"
> does not add much.

I see what you are saying. Not being sensitive to order is a
precondition to a property.
There are many different kinds of (colloquial) safety e.g. crash
safety or data integrity.

Sticking to a technical definition of safety has the advantage that
one can be consistent.
So I'll remove the unsafe marker then.

Thanks,
- Burak
