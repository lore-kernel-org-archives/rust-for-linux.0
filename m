Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED04633F362
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 10:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771584561; cv=pass; b=MMx46T88XEzKeXsWSRgyq1pdKzOKHNSj2uOEvYS4Do4gf3TBj0gGMHgAZQt+CW95s+g/X5hivjrMiDn8eUefCqm3xBJdnTmvToTdIDGSFrauk+CDTP/OgHk44ZdXsPHq9WfwL7fK4ni8JVZzSn7naT+Bs34NuAQMahxoy29OFA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771584561; c=relaxed/simple;
	bh=aOLVDIR4WnlUw1nvqXwQwf234Bh2W6bojDklxd8Gees=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=covuS2DLgYj1SHC0C2sYta5H03v/Ho09N6aNT8bxmR2Do9J8s15LJptAVxJvLdT6iEBkUFpX0B9kR6k4dO0YKPIbV7+OuGcuyjrMIguUL0j/CV9D0mmiIThsurxef8KGExBzXroAg+/x8mFXbENBq4D04Kh0EhfN/uax2KSgMRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JABONran; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JABONran"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483a233819aso14970875e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 02:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771584558; cv=none;
        d=google.com; s=arc-20240605;
        b=SgeHpK3+vmy42/no3/aWQtmxkWQ2X30pDCZMjNA0hGPHVeBgJTd+A8MXl64oCgTIq8
         UtjtMBMVWywPArEaMosZopCRJbsHNSIyjlDS07j5OXgprjp4N4+tPzjAr7kjWD6pMptF
         y7U4BoJ+olO2ohSfAcW4czD906K7D144eAUnqJEKYnAU2EJjp4fq707xyDBLwEPRLdjW
         sg1vOSZyz2lN/aIELKbV9KyeDt5/vaxOW/+Jy9c/2HBRoIWVAgl/uo6k1NSJBT5Dbkay
         OYwHYIKh7ZR3S/d5W8i2ZAl5PHq9MNyay1ThQcrjg0/WVfVwLz+cUB5kuA/vl1I5Bm5R
         2T8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ab0aEJOyc1j8sAVck7x1NuXrJJFBzT+zHKOVXAo2rqQ=;
        fh=tCKwOl2e2nr8YgSC+nUqQfaZFbhAZUnmHd4by/Rylgc=;
        b=I6P42ue2DRGr/+h3yaMAmdH7ZD8TOWjPqqL1y1iGnkRwcyeZRClU/gsnDuIDIMfv/L
         DdAMyl1O+AuVeYPhwbV1BQ0LotUr1Lnvu+DVn+79tFHP0YGTlK4HdxPwH1Lw2wPAx3DA
         raXTdC60HhReMR8shC6tXvN1U1xFk2FCQIs7jZKGQbDYTs3bWuengeyl36TPJEiScB1O
         0lVoU1UvXsW/BENbCzC7asSgnH0ah3as1Pd4mwuhtzirRoa+8YaefDlenBITHWaHAzyt
         AHUkNbu8WuSA1po7Ufa91/+qjtC0HEZqoAvW02Me6Z/Xd4iIjD3J5VtYXpm9mRdhNhxa
         r+LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771584558; x=1772189358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ab0aEJOyc1j8sAVck7x1NuXrJJFBzT+zHKOVXAo2rqQ=;
        b=JABONranC/t/ZRWaTeXGCdbAg3MlyNGEm32nb8g+0L+PjkN0k7v4kud2f/Lc8HtI9p
         RSJ70uRPi9eRvWSiQdR4rSEaIEyNlubpm35GfQ3YOcWC3G9WcVSK61xAwUJAmv+fEQjH
         U0VDLzRhvDs3mprDIFVy3TKWENLnYZA8lvak3zCs19Vc7dc+4ymdsOOcoNXANG+9O4wA
         yAElmODqtzgqw7FDaasHWfeg3jDiHmL7dRWAknBHeykcq12ka7XVCsyOk7kCewg+AQ13
         iGKyafSskeM/uBbKXgMnW0Dq60qRd6tC6hK6mVrNBSjRBZQXO7HJmMLT1etJbZnXuKpV
         q+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771584558; x=1772189358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ab0aEJOyc1j8sAVck7x1NuXrJJFBzT+zHKOVXAo2rqQ=;
        b=nr2Dk5zsr6IAW+GoH8RxHg8CtqAVLr613g5ib9T2J8k5fN84c2IUMBlGHs00pBpAqD
         E9YFSPPtnXTk6ywm5nxJfXSeZTFfghwaH+Awd5pnTFtNik9h2kx1kxyGUDvaeOhcrH6X
         JsCWXBN6tg/OqFB6B+8asB/cOxpMg/w37pOTgn4P6UF6c4fyka4R4VKvUl/lcBqrkf7E
         Tw2SX3bDNssymvxW0v3DLPvFow7oZc9dOtsAcFuJd5zUuPuFic2ausZ93JUH1BUxdhXl
         nV5PEUsfkSxjHsOUnb3vhExokpUYkbm7GIM4UNsv3jom5AfLfQdlnxXA7XR3YMhiWeLj
         ul4g==
X-Forwarded-Encrypted: i=1; AJvYcCUJl0zlQIwgyUBLQ4Jeb8D6st9fOc0yHtuEj5M0lIdGtFSRWxXs18UgXfi+VWk/arZTINtsJcut7xvDk3Y3og==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxOOXSjdRDfzh5kXvJtCPpqUHeUgucQC5kuOWDgTTW1Q5fPego
	p3a48AhUo0rh7yXgnEln51/21aejk94YmntfEGzbIShR9XX+33wjpJtwb6wy/P5+zEYVfTq4eQd
	+f0d1aD4p0wi/uHi57yDhHWciWZtVcMdGWz/H+cn4
X-Gm-Gg: AZuq6aKq5d9DQzOLoHSjPYh9C2EpQcwvadJ1cz9PfVZI1pt6Rn4F4qTjdazxngB90b5
	upExF6vAhJX8Zwbwhbtegu02TIsbghSkZD/+lTqrribUFQh0mdke6zAnBUIMxayEt5u+bBBIK1s
	IdHhPxM2mU8wf18xr0BjtEXUaycMsJsgPLJZvXXLW+Y2plYA9fLy7IkhmYwMlCPgXGZ/RHs7WUM
	0iZlJY3EHKMjT3wtxZw3FBntHUSNiwYH7f4/q7c7fVw3PB6i5p1+O/ZZ8kxyfjNLcpS42TE1PdY
	7ec4OyiJCotrE4qdUUmS5qN6NZSlTuAKFD3k0g==
X-Received: by 2002:a05:600c:5289:b0:483:71f7:2782 with SMTP id
 5b1f17b1804b1-48398b0990dmr130223325e9.12.1771584557648; Fri, 20 Feb 2026
 02:49:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-unique-ref-v15-0-893ed86b06cc@kernel.org> <20260220-unique-ref-v15-9-893ed86b06cc@kernel.org>
In-Reply-To: <20260220-unique-ref-v15-9-893ed86b06cc@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Feb 2026 11:49:06 +0100
X-Gm-Features: AaiRm51MAhLW1OtRkAHOYwRwshfGarw67yqaE2vYRvgLvB2RCqsl8u_ReojFPGo
Message-ID: <CAH5fLggNQD+TbA7rXVB5w+O+qHcJcYC4u0b3W+mHR2DZiUe4eQ@mail.gmail.com>
Subject: Re: [PATCH v15 9/9] rust: page: add `from_raw()`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-security-module@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 10:52=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Add a method to `Page` that allows construction of an instance from `stru=
ct
> page` pointer.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
> ---
>  rust/kernel/page.rs | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 4591b7b01c3d2..803f3e3d76b22 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -191,6 +191,17 @@ pub fn nid(&self) -> i32 {
>          unsafe { bindings::page_to_nid(self.as_ptr()) }
>      }
>
> +    /// Create a `&Page` from a raw `struct page` pointer
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must be valid for use as a reference for the duration of `=
'a`.
> +    pub unsafe fn from_raw<'a>(ptr: *const bindings::page) -> &'a Self {
> +        // SAFETY: By function safety requirements, ptr is not null and =
is
> +        // valid for use as a reference.
> +        unsafe { &*Opaque::cast_from(ptr).cast::<Self>() }

If you're going to do a pointer cast, then keep it simple and just do
&*ptr.cast().

Alice
