Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE002E62C6
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Oct 2025 17:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759858126; cv=none; b=IeYwzY350GNHme2Dh7l4sO6r+HhQKXi0rkzJYCs17SazYsuoJaTzhmeujST5kkTPuEk2RpTBAgSIvLaA2kB+fGHDPASKGnc6EZwGGr2eSigvD+rzLbJXAeapkVQ9/KHcUroawBF3ezzbWY9to7dvdmTNaNt4M+fe128emi3Pw4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759858126; c=relaxed/simple;
	bh=2iGA8velqQRRCZJfqt1BqaTxz6Dq18/F9B0OZGpk+AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m8ZL+GL8lgC8I1QtS2M1k+bESboExkXzOQIiLesVznsgGMEEa1hQkNp2wBp0msXsLQcmXz3ay6MzAEhT1kZV4nBIq9nYJ37MjejS9v8ThpKSiBxVGyVLaOvWq0IKxfF619vg3oiRmBVyxYtSedQOKvqIG1nRzv4OgIMFtR84p8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCCKVWet; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCCKVWet"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2698d47e6e7so12098625ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Oct 2025 10:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759858124; x=1760462924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+z1+ZFlIhihDnc0DazYJHSsjaq/b1tc4ebSOM/fyJo=;
        b=FCCKVWetR7ns15iFkRfydXfrwIXjbirMEWatFdr5VVb0+V7sRzxiZ9G1OiMe+wIe2e
         HC5mU5WZgQJJQjbRkx6sLRe0M5HcIi+W9KM76LXww5gVZ5REDy3FHMxKjCrsL2cyFoLx
         qhzs0ygACpIleRp4JRvmky1N5a45VVNXOnc/EfcOE2TeZy6f1/B43KbVU2IREAzxm655
         HPnPqQ+h9flGa+9wHgeIrp15YY4Ffu+GVu4stLBx/+8pns1i/1ioH66dA46iBhYUvuVK
         1xzhdXWba+kAmwSEKXfkkCnDmETOA15mlw9w3zyBgPAR3j0MabDvi/PaChARaFcj8bmP
         Q12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759858124; x=1760462924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+z1+ZFlIhihDnc0DazYJHSsjaq/b1tc4ebSOM/fyJo=;
        b=ioCejimUTU+2DzeZBJLgd6uxJJknnhfCH87SuE4KSvTzRWEXSlwPOTnTrlaB44iB0+
         njWq9w+v92rV4xUG4dKUowbmncFlLAXC9DL0qd48gpeA+qEqmGW2E1tT3yuCO/157k+l
         yCwDCrwBI8bzJ6SKRYwjsRk5ZPrToSV9FjPNX3cy9l1RhO0kCOUioQIHAIWvfwEedoJw
         cfxn5iIJO65IWedYmfGj9NwdXh/rSCrgrIXMrxSCbFHdekknqNXrbYNtyAbIiW452+YD
         6nFQdWflzoXy6wycb1GsicdoyBzkq24ZsfQIvG7+MuWjeCuZwMfe/UKUGnpFX51T5rNM
         GNyg==
X-Forwarded-Encrypted: i=1; AJvYcCV/RkJPQ9cSYf3LIsWHIx8umFTLiX1YLi1hWuD0T14r94lOvvCDsQNBx7OeXBXzCVzHtz27RwQMu0DXfTsk0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu8YaZTybZlzjLoI2dkyIb3VdAhbhgLFWTe4zQn6cmzLs7K3gP
	FSGLZP+uAjf+/Qz7nhVexeBhyap4nxw+TckhB1OA5IUikPPDWbbAcLZo7T9QxLeWZc5JuxmtNpP
	MK6TJri/itA3Q6efixMuN321E5kujiCA=
X-Gm-Gg: ASbGncuYjxPQmxf2XDRsaI0Nqh9202YXFePLI0mbowea3AUx/TqkmYb53onKnn5LjWS
	fWcychxd0caP66VVo0rzTRcfN0sfMi97KYZXWvt6nSDErvpa/MO+2NV/w/11v4eB+3t1eoB6VQt
	ltLdSas8JdUkwltahUEno3bV3vw3ZLRJf+a43FzR9L5vjf9NeV11JUzGAhBfM0TipfZvlGmZWKW
	he7QOI0RGcQ8SLGyREUunIgFdm06uJ/wvIXsPSGFyNUMqrTT53ORCdhilzX1q2nGTSnfeIZqE76
	0YUALvlj1qCHBwwB2u69Mt5h0jpRqGXQpxuijXsL4enPLJUY8R/Dq7A6xYq7
X-Google-Smtp-Source: AGHT+IGSC3vYYX3XNS4moOyGgDDt00n4NuuDIcKIpjVCiEkfgzJtsytjtTtPmpkZMn1rRbkUYIK9juPhDi0k8/UeVwE=
X-Received: by 2002:a17:902:f68c:b0:267:c4fa:e269 with SMTP id
 d9443c01a7336-290273c4cb6mr3742675ad.1.1759858124355; Tue, 07 Oct 2025
 10:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006163024.18473-1-work@onurozkan.dev> <20251006163024.18473-3-work@onurozkan.dev>
 <aOTx-Oj_VN6fVV_s@google.com> <20251007152724.2b33a899@nimda.home>
In-Reply-To: <20251007152724.2b33a899@nimda.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Oct 2025 19:28:31 +0200
X-Gm-Features: AS18NWADYkZvc6vCbj1UuDcLWaZRX69N2MiK2vPEu5TbDOY6IxUVYA4ThBJP1cc
Message-ID: <CANiq72m8t2j3+XoELfYFG9ivymueOGdwpZnFhRVZ8f3Xw9ygiA@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: xarray: abstract `xa_alloc_cyclic`
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, linux-kernel@vger.kernel.org, acourbot@nvidia.com, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, lyude@redhat.com, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 7:19=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev>=
 wrote:
>
> Why do we not like to use the bindings type directly?

For public APIs, we generally try to avoid exposing C types:

    https://docs.kernel.org/rust/general-information.html#abstractions-vs-b=
indings

Sometimes it still makes sense, of course, e.g. a method may return
an inner type so that it gets used by other abstractions to call into
C. But generally we want to avoid exposing those for drivers and other
abstractions wherever possible.

Cheers,
Miguel
