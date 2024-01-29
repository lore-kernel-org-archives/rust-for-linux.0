Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBB35F565
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 12:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706531819; cv=none; b=WpiaP7dD/sxhZgXvLdoEb5QxDiy7TegLBUmR90TkbbG26k87dpDVCXKLn6atHNemEgoD+QFzwemFiH4ME6b105hYKVcM8Io6QnEs7zDRbAAMO0ZUmLJ7wGA/o4pJ9HQqbrORXDHbtaEZ4go3TKZJhkzFAH0JG1bZ4H9BvFltZXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706531819; c=relaxed/simple;
	bh=pVDbK4+U5dnImWnrLR3D0BRDQiDrcNk7H6OZakmw75k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svHbRcRS56ubt0ZncOB47x9Y/gifVKBEcSGJtg2thFHpwLpcurQ6xwa6tsCl8zW/iwu7iaydBe/CodN7wj6ubm0qbV9VGO436xmRMSZ7pBYi9PKB7DygeUMWhYs3HG7gA9l6rsZM0I8pNCu/j3v6arINCklUmu0soU1oJYUXk6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ch0duICl; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ch0duICl"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-46b35fad293so540693137.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 04:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706531817; x=1707136617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRYBXl41q6OAtYKMwlEI5bHNAHjUNEEyp9mJAUowiBo=;
        b=ch0duIClrVa6E2n6zZFIxa1F8waBhU+UDv2vEguFOFXvYTomaBzARqpNtkgsHmvPLw
         ScbKv7t4/++FWtkq9hgdXywJAj2jKpWZeS+/CLFmxAqwc8L++d8P6vBTTyK0N/HDTzDv
         rUTZFn4GGCpfdAD01upyDXKmF5g4iYkdWSf3vjDVnlnSOZxG2OirjA8vF+N8Jis+4kJO
         l4BXyoxC+yKGYZPxIkkwPoqKeQKPIHtSWW5LchKIFB1CRAY7Gws7uch8dZ1uokg8j+j2
         OSoh8wbTDJUqtUBgocs6Jkk2JypTI6fR4p5ofecfL50kHI2bP1673Xe+StMPkviDtXzH
         ZW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706531817; x=1707136617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRYBXl41q6OAtYKMwlEI5bHNAHjUNEEyp9mJAUowiBo=;
        b=RCxapLlKrMYdIoSSh4aoa5e3oQ8nrrIbsCD+Ai4ebW2MKBgbs3mlFdVzLBtkwNvHhl
         R09hVNHnIuCCZ1MtNE0+KOcOOMZhu9saWZKTb80oUk/2oqBZOPhDvfXbsYvyPqh6d0BZ
         iinJ9rUVIIRQxlzEPu6MyBt8ix0YVsAOWgf/1SrpWUzOUXm6/1cS35LGUzL3MDDFlqHv
         CyKLw10VtZvvMmymtucuFzrzm+wx+xlAsR3cX/MX5st4l5w+wUlZXSjqYlG42chR6KHy
         mbnK6WN5QLnQQ3kS4qhZiNIIm6KK7Hn0YQntjH30wixMyXXsZgohRGudEgDqO1twtgev
         sneA==
X-Gm-Message-State: AOJu0Yx+yuhpph4pmph1UocqKke3acNDiQWczUu38UefRR8QYMnIsX9l
	8FTUli2LmvPyZc8NJ4Gp09Ij6DBcMFH3dQQKHgcRyH4CmhFTu1yEyrPoX+6y27L89w4a03mPQ6I
	/2N6r/QA/YoMhQO+u3g2+GHL5xP7RCb26unSS
X-Google-Smtp-Source: AGHT+IEUqWCFrPiHd9sMPgGAmhfn37b9kLcPJ5hoZiU0O9BscFvk4615ujcgTVRgksPJXQnM3x2LKuEhH+AU3kHWf24=
X-Received: by 2002:a05:6102:665:b0:469:a971:f60f with SMTP id
 z5-20020a056102066500b00469a971f60fmr1708730vsf.7.1706531816423; Mon, 29 Jan
 2024 04:36:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72=9PZ89bCAVX0ZV4cqrYSLoZWyn-d_K4KpBMHjwUMdC3A@mail.gmail.com>
In-Reply-To: <CANiq72=9PZ89bCAVX0ZV4cqrYSLoZWyn-d_K4KpBMHjwUMdC3A@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 29 Jan 2024 13:36:45 +0100
Message-ID: <CAH5fLggMYqR2_WKOZwp0caMMOHgb2s8S1zY2FkUWrRsHGjJ2Dg@mail.gmail.com>
Subject: Re: linux-next: workqueue + rust build fix
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 1:22=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Tejun, Alice,
>
> Today's next-20240129 includes commit e563d0a7cdc1 ("workqueue: Break
> up enum definitions and give names to the types") which gives a name
> to the `enum` where `WORK_CPU_UNBOUND` was defined, so `bindgen`
> changes its output from e.g.
>
>     pub type _bindgen_ty_10 =3D core::ffi::c_uint;
>     pub const WORK_CPU_UNBOUND: _bindgen_ty_10 =3D 64;
>
> to:
>
>     pub type wq_misc_consts =3D core::ffi::c_uint;
>     pub const wq_misc_consts_WORK_CPU_UNBOUND: wq_misc_consts =3D 64;
>
> Thus we need a small change in Rust's side [1] (which in turn triggers
> a slight reformat of the code due to the line length change).
>
> Tejun: please feel free to fixup-it into your existing commit (diff
> likely mangled, sorry -- let me know if you prefer a formal patch
> instead).
>
> Thanks!
>
> Cheers,
> Miguel
>
> [1]
>
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 498397877376..d00231e18007 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -199,7 +199,11 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) ->
> W::EnqueueOutput
>          // stay valid until we call the function pointer in the
> `work_struct`, so the access is ok.
>          unsafe {
>              w.__enqueue(move |work_ptr| {
> -                bindings::queue_work_on(bindings::WORK_CPU_UNBOUND as
> _, queue_ptr, work_ptr)
> +                bindings::queue_work_on(
> +                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as _,
> +                    queue_ptr,
> +                    work_ptr,
> +                )
>              })
>          }
>      }

Looks good to me, thanks for catching that Miguel.

Alice
