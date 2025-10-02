Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326DF13C695
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Oct 2025 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759445436; cv=none; b=AK1L6Y86g5KoUJdW/1N7+FyWKWtwlg/+pub0P9UNvGsOCERl+/8gicYOnvG2PoGyRVa7iQzYmUEOMiHWazU3tPM5Fowjh74OPefnM2gmWeZvsYRXUAsPklDEot1Udl5ulrarR5aEuVDhndyNZJjV4g9muC9iex74ECtrTDdAp5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759445436; c=relaxed/simple;
	bh=BCUh+3y9oWcGOLJYRgcUnoLdgWctAgE5Oi5walHuFOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RH5KPTKbGAzu0hLOgwsAn8Xem61YEXW/cAjkge0fjFk21/SyMyGuS8hEiG/tjcKSUt7NemM+ZLQzLdiiL73IBKtRqchggpA7SfsSRbbdJb2mq4md0Xg27nOLOoS+DykKYEaUVyE8GwUmrBSNdo+2bSVXHgfmsG5jtnShRRI8Bm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjJbSQvM; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjJbSQvM"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27eda3a38ceso2543815ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 15:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759445434; x=1760050234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCUh+3y9oWcGOLJYRgcUnoLdgWctAgE5Oi5walHuFOo=;
        b=hjJbSQvM4Fnk8rNXdGHe3V3ytFEpUFyY147t+kzfWWW0Vdj6JwDp0wnyCISZbyKUZ/
         rdPEuHcE4hXw6LlxCatasSHW9SR/xnvf4G7B7/dN6tZU2BL1uT4AVqixwYKCAd1JwuSp
         /sM6M45TZsliOc3rwxQK1NskdULET+QRut5S2AHv9YVkpUum3XMYak7VRH89r5Nzi378
         AmDcDVqkwu5z/ZdnSqmHKM9JApQ6TnRBeqRp6C9Kdu8a/bcZFfIB02o/S0U5mG8k9gZf
         xrKwy80KLSPy/+WohjiAsouR91rFe6XVnTEI9DTbBP3B5xDsNB6tvEPYHOXc8evDWmfS
         8bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759445434; x=1760050234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCUh+3y9oWcGOLJYRgcUnoLdgWctAgE5Oi5walHuFOo=;
        b=sQZq5aWWryRDle8+sMhCoz8pP6m1Cp8F/tO39IHkMGVYPsM0oldpbTg1XFIDj4Jbp0
         X8hbO6AZi/IulJnmo/rWA6f9hvnQ+K6xf/md7SNTXEZa3JerLNnPC1xvGhbyL8T+yQN6
         eRqN4bAAaKYuscTVr8Mcw3vOtwl/YfXNFUrXNNtoxk7AqnYor/4yxElrmGKq7RJH0a60
         fLm7CQUqR786BihhKrhLrOGvnCtJuRWVgoWsbQGDNxHl8X0oh6/PPNrh7q2X2rSgEiiR
         VR4XoJRD30fEeMi22dMnJZmawN1U87uwEN6HZ2FQ5xN7l2hWimi5wYojm4ei22lu2UK3
         APiw==
X-Forwarded-Encrypted: i=1; AJvYcCVJjsxaWR19OtSsZ4KL54cYcmGurRbbxYGLdpxBFJ+qO+MQQGygSJrp17m94u21qIZPFVOWZwYgbIo9ahMcFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqNi1CQPH3fBiRLJiMtdlerDFn8WoCVscZw/h1/wx89RUXWgih
	cVTWZp5tvOdGmNK3RjeuK7AftUW5nbv7wYQNxdOUQ8FVyAcIu0Ki2avAU8Enb77K4TGg1qajU2W
	gBFabk04P7HssHWBS8FZQC2Hm3kMqUoqZ2Tir
X-Gm-Gg: ASbGncsZZBJeCy+BPCPW16ou7k5aaptCgRXFhcG5/vsePXUkX0JEFJr7KiM2a6fsimY
	o9Ve56Qa2VN9L9PvrdIPp/k/CBAWkbhdU7ybQIspFJXMdsVYmejhB+3W3ZrcNUK3ZWHagk5AEci
	W5PCPG0ZgDKqpc0CM4r8PBYMCGLYvoay1I3No+r8W9QDTEXXmCoYw46fgEkO5wH5FM5u+YLxKzB
	2tarjodTDuiUMNtTGCNHq6Fs7ZrUatZ6Dwwcv2ElehbQZDTMfzah8H6J3+cZC5JSiV6R+iSEXHX
	kKee5keIfvOe/RLi3E+XOX+lQYV0WlJOsZaA0FkhnEeQTXwWuA==
X-Google-Smtp-Source: AGHT+IFV4Wfa8o9I+3qoUvKZUb+LJ0mJzlOW+f77CCPCebEjpFDzi/h/XE2fti4OE3uAE5/ckhQ5s/wz69kA9mqMIR8=
X-Received: by 2002:a17:903:234e:b0:27e:eee6:6df2 with SMTP id
 d9443c01a7336-28e9a6de147mr5355555ad.7.1759445434467; Thu, 02 Oct 2025
 15:50:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com>
 <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
 <CANiq72kWWPAZ3gq2ktMpVeMKpWOU1nAmYi-4d-BgbuDti77ggg@mail.gmail.com> <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
In-Reply-To: <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Oct 2025 00:50:22 +0200
X-Gm-Features: AS18NWABBmYLu0f9tJYY4He7LPAqs167ZupYqHiSSMsWv0t6_x72VaAKmUard0M
Message-ID: <CANiq72=5eDXfq02FXUBpEpe5Ke9kxhT2CUQU5hsMkPMBL5QWbQ@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 12:43=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> It would be nice if someone were to test it!

I did...

(but on a different branch, by applying your diff, reproducing the
issue, and then my diff)

Cheers,
Miguel
