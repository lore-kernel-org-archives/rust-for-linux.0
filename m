Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375502165FF
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jan 2025 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431254; cv=none; b=orBGuIxy43bMzIBBSXVx66WTR9QU9ifekQeQPiBlBuAELRkwbYv1mF3ugOshGf6i/ghCBj0ToJWTZWSStabogj6hMP3vIPiFHGjTQe2dQERgZeSd2BUugyWdir4K4F97HWul6yR+eJIt2mjgvqbzpNZqykJ4ucVfbAteJGBSCIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431254; c=relaxed/simple;
	bh=Gr+FVDVSg/TIp+F53d1q2gBjDvP0u+LOL+SfX2iO2HI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlE6O0PudPAFiqol9VXeMSdwzCe7L+ylNfqmLPRgHd5ckgOx+Nz5n5eunH6pKOXD5Lx44ULmNEUEAC4ngckhos/Au29Hv2c+5Ip9Iqf/hkoYToltamfaGQTzSuEosDervDiYLiNSF2DbmnCnvlEJqVfJbVY9qyPN2DhJHWlgLTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4VDQ8/1P; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4VDQ8/1P"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so10783655e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jan 2025 06:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736431250; x=1737036050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vd2modhOIdwHlNo/NYsljFpQRTtO1/25202rdbAmZPU=;
        b=4VDQ8/1Pug8sHLDFwL/qN54I4dK9/kqYlwsVs+IYgDO38dmWSSY2Q/tx9k5WkoHBBu
         5qiD/Ii4iCaKzdFAK0EG9++EeH+2FynTLYn5MkhsvyWkpB19UwE69afSLPlqlQefuoWO
         cLjlvxwtmpFrg0CxyXcbSuVmBaqS5LgHaZXr0qVFR+OK1ynwLi65UzPgph9A2RZdb5oA
         W3mMtCIL8apAo5odpLepbVOAmoCPEDCfUsgy/oARie4s7mPMl8vmqYKtT8MgEfzyOp0i
         jiDBh2epXFH5FhKy4oW5y8vUV8uCQP4ZEQxKZ/+KTkH3hgPX/nqCHDoZCAJ686SQE8kS
         HU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431250; x=1737036050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vd2modhOIdwHlNo/NYsljFpQRTtO1/25202rdbAmZPU=;
        b=YQNaiMRf4HrW9oeiMGk7jiwH0yTLmnp/Hy/5q2At1ylJsEYBMHMGvyQYcflS5MKXL0
         RA6QNPzjOEJxpFIlR5t2K9MoonKp5YFtv7XlMXeeIQQ1ez1tQZyKTkBvB14OiI1amzSE
         OWavDmcAbG4XHJr5hGGRPLJl1h+xw+YZT1FHSEdOTSefqRBhtVK0Kg0GkhfE2XRSmhgX
         PJe5bYkBeX7Boq7RhVKy4zcDnGbkCnWTRSm4syulwzp41o2rOyJtcMVXI/jIj859PRdf
         XKTokxbE2IQf+RaOk11m3VAuPOVvzuhnx+IvwnsxQ8J0mlRXCXTJLhnoCMxXnyWeNAcb
         QQzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+I93cpeE55hx7RDBr6FqtpSoIZB3nWiyqpDP5fsMosiEaBqoMolxqAbrsLERQpbFvCLuiMHQuKrmShp6sow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+BEq87JJvawYLoId1TIMqpQbZ6TbFbTDgvoblsr39ney23IQ2
	ezL7xwNPaT2TxjlOek1ytKKCGjLR11KByZTJjxgzG9L6QMUTdTR7pKepWvouRG7uLkxr4zZ5gwX
	9qKUHiU6evaPzHNKfJRj3q4DJ4S+7XtIBXIEc
X-Gm-Gg: ASbGnctqipmDWOY/LmG7u6X33CJVVMtm3NSpI+gqm4RFcYwxTFgVjRwenRTLFoTmEXp
	4A+TkIUWsPWs4If8tW/Db/3Gk6tX5JipfHasqB10=
X-Google-Smtp-Source: AGHT+IGqwOzSXyYuRGjDCHZkeGeY4YhDDzfnm5qUF7FcIue07SDIGmszaTFHdyW+iM5yyQ/Nae7806kyobVD7BcRh3E=
X-Received: by 2002:a5d:6d87:0:b0:385:df4e:3645 with SMTP id
 ffacd0b85a97d-38a8733ba58mr5725525f8f.50.1736431250229; Thu, 09 Jan 2025
 06:00:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
 <20250109133057.243751-4-daniel.almeida@collabora.com>
In-Reply-To: <20250109133057.243751-4-daniel.almeida@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 9 Jan 2025 15:00:38 +0100
X-Gm-Features: AbW1kvZPYuNl3EWBeZGLhg4IOyC9qUceAGbCfFXBUkMEww-onSgnM0W0rpOOHj4
Message-ID: <CAH5fLggiK6eg+aHGSXeZCMovkGTNkEhxKqKwubcKC=4accNuWQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] rust: platform: allow ioremap of platform resources
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, boris.brezillon@collabora.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 2:32=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> The preceding patches added support for resources, and for a general
> IoMem abstraction, but thus far there is no way to access said IoMem
> from drivers, as its creation is unsafe and depends on a resource that
> must be acquired from a some device first.

"a some device" typo?
> +    /// ```no_run
> +    /// # use kernel::{bindings, c_str, platform};
> +    ///
> +    /// fn probe(pdev: &mut platform::Device, /* ... */) -> Result<()> {

When you use `#` to hide part of the example, you end up with a weird
empty line at the top of the example. Please un-hide the line or
remove the empty line.

> +    /// Returns the resource at `index`, if any.
> +    pub fn resource(&self, index: u32) -> Option<&Resource> {
> +        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct =
platform_device`.
> +        let resource =3D unsafe {
> +            bindings::platform_get_resource(self.as_raw(), bindings::IOR=
ESOURCE_MEM, index)
> +        };
> +
> +        // SAFETY: `resource` is a valid pointer to a `struct resource` =
as
> +        // returned by `platform_get_resource`.
> +        (!resource.is_null()).then(|| unsafe { Resource::from_ptr(resour=
ce) })

This is a bit confusing. Perhaps just

if resource.is_null() {
    return None;
}
Some(Resource::from_ptr(resource))

Alice
