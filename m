Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4625352C5B
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Aug 2026 19:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786305040; cv=pass; b=RyYboVq0WBaxkhFhGxF2XJrrDuUiivq2A5icD42+OmS7sk/Wgyy/5Ux9KzyQFr5pVWA4KS6g9YSmJtxnP88ycttmGa9go5UlVIUard+AjQkqD2Bwsw43vhPHzMJ8BeMvl56O22AEIMehb6bz4ik62PVHsx18dPDRCMdVOrB5WiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786305040; c=relaxed/simple;
	bh=azT3Il1c2URcTpO/qYV0vdqBxYPgUPdcXAllVG9Kbg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cllj3kJlHKWgEXCwr0EooRZ3DS6R+RDBvE9HfuvY+7GXJrOz35nq6JySXDKdF3JzIUSzhDEB6igbjc2g5TP7BU20K6zk/5JKibPxXtUVlR5mQhstArXzCgIW8suwfwj3BzrZ99WDqTRMrzHHvPm1NWyvE+oQp8hD9s+ovG25J7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiBjt/tD; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiBjt/tD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dd1cc8dc8so154998a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 12:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786305038; cv=none;
        d=google.com; s=arc-20260327;
        b=muB+CjLyhmYvVUkoXt9lDNJGyXpxsMimgyzWI7HlUuAbncKQ7lMFXlzvVsMC6BtLQI
         HUtcJBZz9TVSTJc5X+iwUWNENSXdIww343kPzv0BdhH8CMTv8WLgb2WBuA3x6sIe/aED
         r38XrQA9SHZhkuB8w79EQcOtwgWHypdBUmR6dvrpfdQMFob2H36oKzY7QlyyFt21v8KT
         yVL6xdBbcjbRuH6HFg6B3By7wh2en/7/kBnvNp0niw5HYfJsA7mAOZ4vGB+zWTXusjxW
         3cXOJqi6/RSJbC/Lb3GF8VuMQNvgHGGU9paBQ/5fEnUYsJRBgGnih1GAb1KJk0msvBb2
         9LfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MZ7Jl29g7s0yvrchSpGgWLqktXPM1mR+R+ZdCuKRN+o=;
        fh=ha+w7k8fYfR2K/UwG4vmG1Ynyrgxgvi7THBcNDG2+MU=;
        b=SONwkgMoJLPq8uK/rUNsHHnFWcVFcwtP2fSWk68FMBrhVkhBZtb1ZPQ4RNkGY1BtRN
         G0Vd+hkYqT08Qm9a6rD3J9d/ilz8YFWHtQTMjhe7sDsuWaqc1iqkaA8uUR7L1D1x+OnX
         nM7XxW4JX7pTwJAAtWsSBELr3Mv+kulOdjPuhictb7ehsm4hma/Jq5KbQvfpyQAQP/84
         Ffh3w93mo3zahHOG+2dPHftnh2ddOl2iRHfGyrPAVSDyNx/zPUOanDSZoCaUv4teUnqT
         HD6bugdak78E4wzFxBxdKrWG4vu+frRUeEqU7UDv6wvUYriEqjS2eynvM2bFP8LQK0Qg
         utEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786305038; x=1786909838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MZ7Jl29g7s0yvrchSpGgWLqktXPM1mR+R+ZdCuKRN+o=;
        b=kiBjt/tDCZ/PGEPTRGBFevudKZS8Wudz/MXBd+hsbyvIr1XZLJtPy4HsGOotbVqIew
         XbPkfq2e9ZXdhl6xyBOZkw48Jr+tTVn4heeGIAB26yiLpDDnKZM92G57mcLVEsEsFeO/
         8D0wbihfnQZ2Q2mP2KtYRaoXZ0XugPOUkBAMa5f/yMr5Bw0qrdZXO1VzqNDBwbMlkG2h
         95PoKzsfxuePGFbnKWzLYPXoSVvosun77NQuVggcSkxCAUpQA35uUMfmqQfLtIeyG58e
         eluXvd0F3XjAmgrRJTrMc1cel+FtjRT4VqvaF1oTBrNPwOtTszF6QSCJKa2akLLv3T6k
         glgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786305038; x=1786909838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZ7Jl29g7s0yvrchSpGgWLqktXPM1mR+R+ZdCuKRN+o=;
        b=V0h4h6lHrzB/brnMVcIaOz8NdY1xBG6r99cGBX29L5h+SswJOuKITgp2gfXGDMGIKC
         uvJsBMCS7egyfZPOU2u7VVBJ0R+2+WSkBguCgzgPdX5SGjVC6+Eyb+rR/2KEDw+jsMP5
         aAGWu1OcCVpKuHg/Ur5U3cg4bD5D4SpZ/bND5CjBO+V8I8liDEE4kaMaNQm+9jxa4f4v
         D7I3UtnHZlHb+WNDlq7S4gvBDnz2jr8Mx8i4tQCUSrBnNfU0jnn1ZOhSICjDs3H54jW2
         VdtQEok9u2YmMlXzti3/W7E3GJ8EFAMIz2Z3LhaxdNDjXqxABvieI1CYqpYHZOpHnV+m
         4Gng==
X-Forwarded-Encrypted: i=1; AHgh+RptcmsTF/JcEsrXuHxUKBHhSkB9JBGIIlPyTEaPeMfIpIZy/z13qZ5ZP7LepmSJl+xxHLKONeTdwxa3TEJqIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1/VCHrg+BiXdr2BgJ9kht0eSB58ss89Rr3IVMzQiJSuQ8+v1/
	XZkvJXCecr8ekX/rtrM2wH+lAiFXnUelbetPRzJrORn87pfeGRt7T5u13RFKinFEJA+YRHo0IZZ
	Tzoby2NK68iPTpQynX4BOQtEy1T06XS0=
X-Gm-Gg: AR+sD12WJPoSS/4/gtEIeCqaFYh9HxCmlaz5EHF22zyXi3kyZ0vQIv/F+MBW9V02EM+
	7yKOq7b9/hFkIByhwFvGUg+Fyxqgkhxw7SGGD/ykL98eR56qYj+giOg4zeiQ2kTuDwlGUusg9c2
	YEQ646GJn/Sn8Aq3gzwr7bvAHmlmwp+QuapZoX5bRWzE/5zlwPiKV2Pmk3ATd3/+Zvd5oOvARst
	3/zifdW3CScVmYg34EZdlqnv6HIGAkxsNFDfoewsHZc9wEjO06u1Te87A36nkoUNnw3mjDt/ami
	asgv/bRvJbnvL+hQ9mX8c6vdyFNTdt9Z+nNsKD4JAHjtBGmS5rrnY/8k0AGHKWlztmfLMKBmUfa
	SHjxWXyYlmcMrfjZHCP3V8gGIzmPG0Z1b/6tfinWYEgpaMohzA73vF36bkzhj
X-Received: by 2002:a05:6a20:9392:b0:3c3:a491:cd10 with SMTP id
 adf61e73a8af0-3cb85dcaf65mr27568571637.1.1786305038198; Sun, 09 Aug 2026
 12:50:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-hashedptr-v14-0-817009769ffb@kylinos.cn> <20260807-hashedptr-v14-2-817009769ffb@kylinos.cn>
In-Reply-To: <20260807-hashedptr-v14-2-817009769ffb@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Aug 2026 21:50:25 +0200
X-Gm-Features: AUfX_mx4wUfniN3XS6y9nuzHvZIYz_4WMzKwVPYRxnJxiE4tVcod6kMrLlM4sVA
Message-ID: <CANiq72=urinBJ52pS+pS3zOdhCXC9hgCAU8NJjVqyw87ZQ4gQg@mail.gmail.com>
Subject: Re: [PATCH v14 2/2] rust: fmt: route {:p} through HashedPtr to
 prevent address leaks
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 10:15=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
>
> +        // SAFETY: `buf` is a valid, writable 32-byte buffer, sufficient=
 for
> +        // all architectures (max 19 bytes for 64-bit under the default =
width).
> +        // The format string is null-terminated; `width` (c_int) and poi=
nter
> +        // match the `%*` and `%p` specifiers.
> +        let len =3D unsafe {
> +            crate::bindings::scnprintf(
> +                buf.as_mut_ptr().cast(),
> +                buf.len(),
> +                c"%#0*p".as_char_ptr(),
> +                width,
> +                self.0.cast::<c_void>(),
> +            )
> +        };

I think Sashiko is right, we probably want to restrict the user width
to as much as the buffer size minus one, e.g. in the `match`:

  w.min(buf.len() - 1)

And we probably want to add a test or two for the boundary cases there.

If someone really needs a longer width, we can always revisit, but I
suspect not.

Ke: do you think you can resubmit with that?

Thanks!

Cheers,
Miguel
