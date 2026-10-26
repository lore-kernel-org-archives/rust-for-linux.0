Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793039397;
	b=3KtSxMrgOW1oDVi3Jx6PI2O6vWBCjocolU4VWHImAbk2y+hjulzZDrg9I3UwPSXA2fxx
	 1b1sxSS1KH/YXx918mLlK0WTt9hwB+UemJXuLLvjstyoxa9djkTH1NUx4SlY6Ws2BgZig
	 I+NKLu/whA8mDKyS/U/nFAcWnByW94c96lO6F6cG4HrMiKfz66DpeVXxKDc3iz5B6M//H
	 8qtvJYtKFBpTpfugP5rAKuI0f3TPi5uMzLwDOXbHYrC2gPvMmNbnE5ICSLLSPElpkVcUh
	 1iKoUcVBEDN5QelY9yTP9vcDAKsYavuI6SFmBOz4X8zH5S2lDEjsgWUA4bOFRNuV36g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U5JtE0ulgMYWAoqxAW4isRu9FUjprsEaC64rQ+byKtk=;
	b=J2XiHh3cM5LMCVZdLBPZamiScPAX0fD7AAnVF0SR6vdXdBjwHr7dhSR+h4JCbELmYuKd
	 8pjsz5thKt5tGE4YVTSmCeuzPBRuNkjHQoul3WATsL1V7C7bHicHlxaqUJy5a0r6zOjYO
	 1prjsHfxdZKmGe9dcPEWItmJtVPbNO/sk5iCDGQxuADdMdtRIkj5cjdnD6Cl3QgLluGUQ
	 7UC730Tg59qDB4yobIx0DvwKPcWZoi6EQK5YiZol5xLhVB8zfZLGqHejlWmh47IC9Ky1C
	 /h7xBSetvfqGWfNG9gj5ZcwAAALz/nVgUc/iNNECzaiqFClqAZu2KG7iikgyd47bsoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	dkim=pass header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=F5FLdh7p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C1C606A320
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 18:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C1C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=F5FLdh7p
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so4437466a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 11:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793039395; cv=none;
        d=google.com; s=arc-20260327;
        b=amyjX5lSID6Lsj+iDEwFVmFi+zYZmIMgUNh/EMYCMgSe5jhd95a4t/L3tUzd8Y51kM
         krWyZQOlbMavJZ+gUf/g2LL8X/IxyCj7G2lnjWmbGjFOqyh4SLqyu/hkDyBj2+vbhYPI
         /EuuWe5+KK/7DA10vNmd0rviS3Q75cb1hyFf8/SxJRfu9gI61LGdfxEte7EgyVNnT4G0
         7Tc1fDCqcnSeXp5/ODPPHAf/gg8ctH6xaeTzyO3/MuiqEK38cvA+FHNc+Cr2RI06M2+s
         EmFfAU8t+oVo9DDtutl15N34PYGSyrUX92mJKGoTmi6uXl0lYPo1gxAz/lTawPKVk+Pj
         p9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U5JtE0ulgMYWAoqxAW4isRu9FUjprsEaC64rQ+byKtk=;
        fh=ybpbi8ctzcqcwG6fd3b5FAyeQyxB/Aj2WDgmlSjZFG8=;
        b=sMwhSQXZyHaEvoblVArNxU/JZiFeBnytwcCJwJbIMjvTyruqMqfX2TNqEIzMTwmDp8
         QFl7A4OiNy5Ol/gjMFpmr2lLhsgo+mQcrUpP03JLVdHCSbQWq2vfTIRF93IjhGWh/w+T
         7iSKhyeVbjHDokWRDF7pZRJUOLgPOXLAeqL8bUVLuFKQJEAsoU7Khs6HjZWHa5wkAsUI
         gpIGZcA8uh7tfAlDxy3Uajjgl0ptQ4nlT6tZpgyPdo82T0gs8WiefV1BQDASLgWUS9SZ
         /VjqRUpL0x3dIvhrJBtMtRbFy3z0G/FgzcyjhSnZEqfBJdmJZ8Hm2jbN7NTQarfs9HbS
         +iUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1793039395; x=1793644195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5JtE0ulgMYWAoqxAW4isRu9FUjprsEaC64rQ+byKtk=;
        b=F5FLdh7p34fCWskzFCe/IjF8in08GE5Azyx5nXtDUbUuVLeSLTkib27cS+47BmE/wF
         A5m0VE9Sysy7TPEDxTyktbnnoHth4J1avxX3bPWBWlWnALOnL3bkkLLjsc5MW7cZRn80
         TobWosF4jp+FPkC0WRM/zzMSU6LavEbFrcz/8P+4QOX8wxnz10X6hoACTVGHDHkvNMfG
         mUGqfjP4mFT1pmF6f819Echr9ASzytH3ykNH+v/1KvOzUAupeXCGYvHyioRVgHsQQN5H
         y+czqSHUYpJO+piYQY9qM1essBvKnBBqj+p/Wuf+H1upszl6l1YOmAwuRWnkbCrK9Iba
         iDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039395; x=1793644195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5JtE0ulgMYWAoqxAW4isRu9FUjprsEaC64rQ+byKtk=;
        b=EKVg/bAJbdWIANDTRgZ4ONzrSYQeQRNsNsLJgGrhlXU/GC45A0PU2tfNXoJLRDOkyl
         /e9MJw/nj/1GeXr/JgTTdKe1ueN0VcJ4vl3F/KTsJkiOT899n7akqAQWlnoIjBSfKWSn
         ZpUg34qgvknb6TT3K12kQBynm/9oUEzZmGos0By7FSbHKtAENk9EGE7oLf2QfJeHzbti
         aSqiZgu12+xWRZDu+LoJbpVgmaKL9gVlnQ6WHa6CC7EHIg2fQZvbf7rp+R2IO/mewBuw
         G8HKUU3ATSIdJtTNOAvT+D5BSzp1f3MC/sM/agYSxTirIdVMkxA8xqZ1OG97PrIcfuXa
         ebCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdeZdo8m3McUkL1Ks2CugL2W2sNKZH6bUIVnDFfwh/YQIJnJOnL5cNocQeZMq5tgEt54LIWVxCrfVQWyX/Qg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJgacaDtfvOaN9KhFgorkd0r1sIBdPsgcdg4OJH/0IS+/jAj6sT
	5aPOTraff4S+AEtOi/b9KzoogLze852O3oJgJNK7bdE3VnjN2197YesFR1ZXRHmJg59+NTtL/2U
	BR6Yg6y7OAbU6gfrnxWs3ZUqRkQ1ao9DNR++jrJWZrQ==
X-Gm-Gg: AYBFou0ucvsj+PwjV3vXPeEG7JMkxEeEFwB7Ks4mvq98f8KX9H0p44eya2XU+kYX7uT
	KAKva6T07889WU28s6t/g/PwaD2dkiCowNIVwXl4hJXALYSvaV3NS6pTyqOG662U0nnegXh0QUs
	xly/OZZ1iHglE6IiQViaz5kHnAGyi27Gs78D195qwiNgKoT0cNqP5Btjk1332UCoedxsdFsrzgx
	HGauqV8twpwoPuVnJmKo9dZJO2C69s0XdmwwvIDa6uQ0Zqr+eK603C4XH+KbrcuPBJ3LlBhRuVR
	z4Umdl2u0sv/d1fa4LVYhnuS/WfHpmOdhgdzjXMOcj4ruyTumbYnQ64wcVJkQ6gXw6//05Skh0s
	IzX6ENzbUOjF05fELu05Eq/YE+RLBK3lXc6BGBtJ+g4BFAfNkQXoY4H4VFCuvnk11qBKXMOVqb4
	9EwTY8MfkOVl01qg==
X-Received: by 2002:a05:6402:56:b0:6b1:fe71:dd4f with SMTP id
 4fb4d7f45d1cf-6b443000260mr6204675a12.24.1793039395011; Mon, 26 Oct 2026
 11:29:55 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1790981219.git.pgovind2@uci.edu> <687438f7767b2c65d9782d92a6e96387e63adc99.1791501243.git.pgovind2@uci.edu>
 <87ecdcocy7.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ecdcocy7.fsf@t14s.mail-host-address-is-not-set>
From: Priya Bala Govindasamy <pgovind2@uci.edu>
Date: Mon, 26 Oct 2026 11:29:42 -0700
X-Gm-Features: AclHuK_NWDW06AJkV9bsXUlF6KhQq98hFLfASvmX1C8GfbOpkPuGw2SjJywrX8Q
Message-ID: <CAPPBnEZVOyjPM3ucycLAEeymR3v=_B0uuF6ufVqXCykYx5BzDA@mail.gmail.com>
Subject: Re: [PATCH] rust: configfs: Fix reference creation from uninitialized
 data in `Attribute::show`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, ardalan@uci.edu, zhiyunq@cs.ucr.edu, 
	dzueck@uci.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 5:37=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Hi Priya,
>
> Priya Bala Govindasamy <pgovind2@uci.edu> writes:
>
> > When a configfs attribute is written and then read through the
> > same open file, the read reuses the buffer allocated for the write.
> > This buffer is not zero-initialized. Writes to the attribute go
> > through `fill_write_buffer()`, which allocates
> > the buffer with `kmalloc`, and initializes only the input bytes
> > and a trailing NUL byte.
> > The read in `Attribute::show` callback creates an `&mut [u8; PAGE_SIZE]=
`
> > to the buffer. This is unsound because the reference may include
> > uninitialized bytes.
> >
> > Fix this by initializing the contents of the buffer to 0 in the
> > `Attribute::show` callback before creating a
> > reference to it.
> >
> > Fixes: 446cafc295bf ("rust: configfs: introduce rust support for config=
fs")
> > Reported-by: Dylan Zueck <dzueck@uci.edu>
> > Assisted-by: LLM
> > Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
>
> Please check if this patch would solve the issue:
> https://urldefense.com/v3/__https://lore.kernel.org/r/20261015-b4-configf=
s_kzalloc-v1-1-17c1ba6db062@debian.org__;!!CzAuKJ42GuquVTTmVmPViYEvSg!Mr3TT=
m5smb01RdTG7L3SdTttRentAHlDvhoVd07Igksga0mKNkfwYMBBSv6-UDsbT8Ek2qAiRYdRvcBR=
33Ya8Q$
>
> Best regards,
> Andreas
>

I've tested this patch and it fixes the issue, so I'm happy to go with
this one. Results are here:
https://lore.kernel.org/all/CAPPBnEZz_oGkK8PQ=3DU3Tv67oDp+OaH0qzdv_m7u_fB7f=
ePvYMg@mail.gmail.com/
Thanks.

Best regards,
Priya
