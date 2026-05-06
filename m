Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5003D093C
	for <rust-for-linux@vger.kernel.org>; Wed,  6 May 2026 07:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778053586; cv=pass; b=ksSYMsuBwCZ1crXt/LYUFOn5loycVhmCGLL4EV+FmvP211QEqzYZUVT/0klhGc3GITJ0b6/hxkhQJ3uv1WElbgPXsDhHS2c6BP2A4mdXJZMphOqI15SuxGq1x4usgd1tqhEh8Etk5yG0S4Mr2mKvsH8ZvwZUBdSH+cZx4W3GI3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778053586; c=relaxed/simple;
	bh=Tx3WeZUNhuBZDbCRie8ddYNOeSRcG90ujTtX2LnV7Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCKugubtjN5oQ3jE5B5PpKsgUlx/WQfGY5WCMAYJooSScvznkGZ9/CxA+j06+LaZtTGAB7t9oGxKnhQt89fiQg95iexSk0aRQzdfUPJ+7w7eF6BB0YLwQQdXUgR7cl0gchlO28d7OoNiJTft8mhSBkJt0TKefpFScrPepFDGeKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQ9V5fzl; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ9V5fzl"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38be5e86918so74016481fa.3
        for <rust-for-linux@vger.kernel.org>; Wed, 06 May 2026 00:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778053583; cv=none;
        d=google.com; s=arc-20240605;
        b=Ecvf8oyLCVdPrzSpfabrVtiuiCvO4BQv7xyJ87E+YHz9u0ZXC2ORkPU7Yz31RDJkMj
         E0mMCdgltHEdVRIabYzeHdqUBDdSgm8sqTHfAMSMtEzZUIeYf+b9UJGqR//867Raj4KV
         r67TiH5qeA5a9ICnHW1zjnHxjJ3YyDbpzGp3y/yu+7kyDnJjRN7xsvA7kv5L2Oa2wTh6
         QBC/IT7FYsDreEFIKIiwMhWfZLL5+jXicOqG7ghzITe3Jbi7afycLfcmGDtNsFbwp27d
         C3Db3Im6YL9xkghGzv51/1bbg6tLGjEQngk1vPYrRZ/b9CVMqJ7JihTjYAvRkhcaVb2H
         QZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LtNgMFYOhpx95LShPDCJrC6wGLnY6fi+ZP/Q4wbmgYM=;
        fh=23V4Vu0H6kZ2gNfA0j3D927Cd//iKH+QurDEWjKWioY=;
        b=E6HDLwykDmMAGeGwlU54YMXOjeE1mJlNeJvZfZ36JrY4VEPmzUR0UO+w3CiMeG8XS6
         DGBhqo0FcRpeguV/pjEtIEkl+b4qmfkpSIOH5BS3bC8ag+VUkcCEpVfRkGXf/D+7Z9MU
         CeHhEdiNC3SjRZBJZ2BEKi6pq8SJ3V4f3kY8qLAePD12bk6dXrG34suI9Jn+oeIn3oBz
         CMt3q1MCqviqAF/C94hwLxqmdADXecnpgMX1KeEz7+bHfzOOCi0CjXOC2qqbZxGYQM7D
         hJSWUpP/59kPeecvVwn3CjWR507VOnKgLzCLb6bTKqosJ711M8BZV2uttvO46ecMUqC2
         em+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778053583; x=1778658383; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LtNgMFYOhpx95LShPDCJrC6wGLnY6fi+ZP/Q4wbmgYM=;
        b=WQ9V5fzlXWBOB9K1IarwqJe2iIi8ESzapFRZFFZkIvOE8GCzyy7Wb1DzWMA6+v51bO
         f7/vTPLtTGzLWH5P3zR9crsdOkD8NMRG69exxiYXhndmfXx9k3xgRPAMYzjqX8sPiIpj
         QgENld7W18Dyude30cjuhTrgplzsATL/vQ9t2h8YUUVOvk93tHY4+bC/okb/tkqkLntz
         XbCMY4/IHKHID4Kh4294PME7M154rOv4qNIk/j5RUwraOaCSqaxpX9azx5c3Nlfv8caG
         bpRtrXMnu2GVsJvt4STL5/gBcXd8B40Euym8BCrsE+0VloLj0KRcSEEqsoMUzNUCAVgY
         cVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778053583; x=1778658383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtNgMFYOhpx95LShPDCJrC6wGLnY6fi+ZP/Q4wbmgYM=;
        b=HJwcYd/Ehhvm/Ho3gq810wJn6BoQdCAIbvUY1c0L7gN0DHo/bdPLJggy4zYW5rjtbk
         +QSkf4RlMtwKZh8dgXQ9JZumcsLRO68baA2ang8S6VP9YQ8zblE/zLbJ6FclJKgc6Viv
         BMg8mcNV3+wPW8/YP7Sa6mRm86Pc5aKV7Df6Y8oxtC/tLFpM4I5w++bH8X7I9OC3TJ/I
         tFJo1yuESrt4VkA9NXo7RZjOFOy0AqnwK26wBzieVRen4+586TY5MPwStaDNEn5G0b7b
         80HkYk6InDozh3ZN+XU5GIBGOtduYYE1ixQOL8UXSwvs1l7mbvChhmbcbJxdX806sOUG
         +sSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bX5HH7SGPmjgR9pH/rKhw53JQQ3fSqSkTOVCJwxNncaTHK4YFdkArtJVGg2b0/UMm0R1maxges6kGgL582g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8515oEYXaPQACoxW7TLx/2n4gd2GDJ9/fisU8V3HKl6wI61Hx
	S/c6KPGyeoida7hbxeJvo5z1qBLb8kwXpjodD5MXEPJFxzVkleFnzX8GbMLLOV0DUw/H83ozULk
	UcmbeGGBWCh4xOaviBnGvQXeW+76heJM=
X-Gm-Gg: AeBDieuTcQ4Egtg7UMlEfRjEqcRrZxe3T6qQllXYQUllEt+3zJYwe9lUk5AnjY2vYPl
	NOin9cXBDiqUn5mAnOQhSUKuNudEaWwydec1Mp2whu/W/nZqmMWt9D8iuw7rrBwfnqCiujqTRet
	WnaNsZJaA+zlLjb6EaSiPeLznpaJepk6RmN3IkCr6UpnlpAsXmrgFEwitHFk3wYyJlprxt1HKPX
	v+mf9+BXQjLlbnmXw992TMauYg1/6G0F1p69lIWg55EVuYNHZoivk+Bzu+YNReu59hqBJ9PMxj8
	a/albXzlXc28YsIE4nFq
X-Received: by 2002:a05:6512:3986:b0:5a8:5288:5bf with SMTP id
 2adb3069b0e04-5a887ce5fdemr740855e87.28.1778053582536; Wed, 06 May 2026
 00:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429132234.30514-1-muchamadcoirulanwar@gmail.com>
 <20260429132234.30514-2-muchamadcoirulanwar@gmail.com> <5f126a59-9f03-44e3-b4cd-27f70bd9840b@linux.dev>
In-Reply-To: <5f126a59-9f03-44e3-b4cd-27f70bd9840b@linux.dev>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Wed, 6 May 2026 14:46:10 +0700
X-Gm-Features: AVHnY4L_5pgV8GXOjPv-2E2wKzMdg04ytr_7aXwttrNdCJshMRLa8vrmmICm4kw
Message-ID: <CAO26r3R_TxwMwLoJMqjAG0pd2P__V-WmGkTcrZFt6CQwa2y1cA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] i2c: rust: add smbus_read_byte_data and smbus_read_word_data
To: Igor Korotin <igor.korotin@linux.dev>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, devicetree@vger.kernel.org, branstj@gmail.com, 
	lars@metafoo.de, ojeda@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, igor.korotin.linux@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 17:29, Igor Korotin <igor.korotin@linux.dev> wrote:
>
> Hello Muchamad
>
> On 4/29/2026 2:22 PM, Muchamad Coirul Anwar wrote:
> > Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
> > ---
> >   rust/kernel/i2c.rs | 24 ++++++++++++++++++++++++
> >   1 file changed, 24 insertions(+)
[snip]
>
> Thanks for the patch. However, we've previously agreed [1] that
> I2cClient should implement the IO trait [2] rather than adding
> standalone methods like these. This patch would need to be reworked in
> that direction.
>
> If you'd like to take that on, feel free to submit a patch series
> implementing the IO trait instead.
>
> Cheers
> Igor
>
> [1] https://lore.kernel.org/rust-for-linux/20260131-i2c-adapter-v1-4-5a436e34cd1a@gmail.com/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/commit/?h=driver-core-testing&id=121d87b28e1d9061d3aaa156c43a627d3cb5e620

Hi Igor,

Thanks for the review. It makes sense that having the AS5600 as the
first consumer of the Io trait would be cleaner than using standalone
methods. I'll rework this accordingly.

Quick question on logistics: would you prefer the Io trait patches as
a separate series, or bundled as prerequisites in my v3 for the AS5600
driver?

Regards,
M. Coirul A.
