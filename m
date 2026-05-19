Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F1E285CAE
	for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197670; cv=pass; b=Z9q+86FErvsha4O7jvV8XDKBlPewEwAd7EXCAGK4AO05f5i6JTPCy/DX8AVB5ihWSEOXrzJqgfywVlG5moLg2EVSrTaa5SiE85rJKP4n2etb/prfhIf6Ik2X65PoLcn5Fruh5LQS/UCEIkSYjOP/Fa7P+4ugntnprXi8IEoEQLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197670; c=relaxed/simple;
	bh=naF+eFIBVaPQxxaOGNrVUV2zt+dbyRkLeG9JHqTunLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghcEnogt2OitBNsYdXMz627IpPLM8JyuYs4aw95Q4JBM8Qxz2aaMYmWckKXkyAQcqpDHy9Iu0dk0sN0dnc+1Q1MHj/akkZ+rsbP1voJxjSfUcTM0wY6WvsVQjc1aOty9fkoBxnYfpNshm6PaO9xFLVnHpt5p/MQdM5SguOYduQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3QKAkOH; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3QKAkOH"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f114d129c0so203354eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 06:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779197668; cv=none;
        d=google.com; s=arc-20240605;
        b=duwz4zs1RRwkURjIPlof7OD4IhbS807v5lSz2LO/MSyN1Ap6LapBsMVbIfCXoVsdVE
         CKCCGb7B+KyzZOq6Hq7X6kmHvKeJGqDke0WwzC7S5LZ9AUWo21w3IVz3Fo7PvOnDWuF1
         T1Nw4/wkLvedhB/BTGkQXkHeC5/m2nxjz9AoIyM6+rY4t8LX6B11NJ6JQaclMZlhv7wF
         enZL6++aJjbLSU3ifB4DpatHG97hKuVWP/uL5tLHqDB+xX6xrU2dBFO99YtU7r7jJ5/p
         txO7P4OvCRqanlpUeJGJYnBVB4j4UaD0GckAumGLlXIabIz6xIG+nnaXQ3QJqr+PXHkg
         N3mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dH/8yGMfRsmeb4Ra/l98WpGBn5pzwNsIBkPePz8iHO0=;
        fh=V09KZlQJRUguxDcxGAuSV6Mh5lC2pChcfgEa3MbEkwA=;
        b=lLXZBoakCeDfigkOD8meL0TPRHsuQ2aYnC3YDR4Oo9cX3Zh8waqo8oE0rdDlPDAUot
         98ww5RpNCZgoFeticbLem1WP4mswZcUCwyhmY0wdX6PuQMJrQhhuNGv7YA2TzDww76QY
         h0KeCOsJsKql9vhwbtLl+HHjTl/lqYtPYS5D6o9NDfodd7n0Cc2jDYxvyvnbBcpd3aJj
         jT3jHwiQ9uLge42zr0QDjLyB5RseqV3D0aK0Frgtms462WbQ2Vmk2V9ZN0jk5OKhNo2m
         a4HgSUt6YhE/swmXS+XFr/z/HlxRUHdixllV1iahAO4Ah8asCVXt4FE7oWGMzmmr5gQo
         WAdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779197668; x=1779802468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dH/8yGMfRsmeb4Ra/l98WpGBn5pzwNsIBkPePz8iHO0=;
        b=Y3QKAkOHC6LcGS5ofPga3r5bKLfejRPRa5knoWuBdjIQPROhsMlxoCgtWmEDooiLsm
         0+80J+YEhGUXdmi5bn8r2tmzxbHS18gfwjoF9FB1iKPEfkqvByO7GeN85Ge6jjDuaS/B
         UGejyckurv4npWtPDzpzm1RJ87DSXK2HvX+PxJ4BDXkVpSEZfe18oGhU0vJBd3EkhHsO
         ZULy6yrBlR05xc4N5tXJXxbjda/Jwd4iYxb4A6OPBsDNsUc35u62UEuzkwYz2yVcpC2c
         Sj8IexBkLvoJvITBQ2aWGpVgscMHQcWLFEYxaAtCXBVe6CU7A77UligOFth+txU3f362
         0trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197668; x=1779802468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dH/8yGMfRsmeb4Ra/l98WpGBn5pzwNsIBkPePz8iHO0=;
        b=O6Y9TyFV6NeWfIbhMAfeh2WG0enKdH0ArkkUsbJClqB0Ed1ueSSz53xh32k3z3/rTh
         mzjXylUaPtHBBKDkLfdrSEtw4PFoYVBxEjUBhh6tpxbQ9bwdj7joEOkHRKmO1022my1T
         xkqbCqstHX/SBkTT6uI/JTNGaJ9/aCZNo7GTQY5Jb1ltpbvXVr4wyINpj//eAVegB1f3
         pmGWsgPxAF1VGqJZGWBaKe4+TMR9C/umqhqLSF2sCFb8S4Zo4/9cTk+QhxbG0935d8OU
         RKTrAR51LVzIruh1boxieGbOJjZ2Z9tkAo1bWwYNF+yIf7bO56VJuxNaDJ01Qq5d1FSH
         Usuw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZJUgzY8Ec4Z6cmLRRP0CDfsZmKi7fMQwzim4tOChiqd5oqO3eXEb6h7UIstdg2MMQNtCpvY+sSMB79Rl4Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/juqz8YKgMK4Bv0eh81yck9j3DytpdbxHfK99rXoYbWYpgDdH
	EuKNo3ZxWk46jR1aV9TLIudCXYlzLyAqj3nqFTd34PwIbLzm2OzHB+aEX+8Q+cbV5V1WDEdrSTt
	mhIA3ApCDq7bTt//yeIWbMeq4h/s4J5A=
X-Gm-Gg: Acq92OEUnpScVYOJS7HQH9G9ZT8MJQymfiL2xkhtgOsr3uOBeHZo+3K+waEepVahq4l
	cn1qz4TJhmsVkqnJbO+ueLY2mutzp05WJysuNlhkLcfov1OrPyj7OsMrZUyuw/CvO7HVjvFbCEE
	dzPEgnm7iR0w9Jup33OB3Qie/HP4UkPAsDgaDNd+aDJv27auL8x90VtRCQCfEGx0YCHxryW4i+n
	Gz//YTEH3d96Zoj3JkNWJ65EU075RSlIQjjov34ubhaZ5cjJ8l1GGq/pUAXNbQXC6oc381bESWD
	3jTNrAkmM1eLpsU3oMv0MK1UgQOJtjGAhdqdD0eqEttaoJ99kUjKQffyD70BLs5NOQ6zGXfWhxx
	PJ5/bDGhSFPXwuNPaMF8ZHDg=
X-Received: by 2002:a05:7300:dc14:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-30397b88952mr3989391eec.0.1779197667973; Tue, 19 May 2026
 06:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517000149.3226762-1-dakr@kernel.org> <20260517000149.3226762-17-dakr@kernel.org>
 <DIMLSVG1IO07.28UMFL4GTCQG4@nvidia.com> <DIMMHPLUV2LK.39WF9SGO8TLK5@garyguo.net>
 <DIMO9MW468B5.2KSIVYEMY31YF@kernel.org>
In-Reply-To: <DIMO9MW468B5.2KSIVYEMY31YF@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 19 May 2026 15:34:12 +0200
X-Gm-Features: AVHnY4K5vpbJGhCh2fM0bDGLH-gDIENRDMeBQsxYOoXtqTcl9WixZ1bWmTIZnkI
Message-ID: <CANiq72myVDq9oLyyZqUf3Se9-JLDp=qGhBJy01nOxMaZBRxADA@mail.gmail.com>
Subject: Re: [PATCH v3 16/27] rust: types: add `ForLt` trait for higher-ranked
 lifetime support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, aliceryhl@google.com, david.m.ertman@intel.com, 
	ira.weiny@intel.com, leon@kernel.org, viresh.kumar@linaro.org, 
	m.wilczynski@samsung.com, ukleinek@kernel.org, bhelgaas@google.com, 
	kwilczynski@kernel.org, abdiel.janulgue@gmail.com, robin.murphy@arm.com, 
	markus.probst@posteo.de, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, igor.korotin@linux.dev, daniel.almeida@collabora.com, 
	pcolberg@redhat.com, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 3:03=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
>       That said, I expect LLMs to be (heavily) used to write drivers, and=
 LLMs
>       are typically trained to be compliant. So, I could imagine that a p=
rompt
>       along the lines of "Can't we make this work without unsafe somehow?=
" leads
>       to an LLM abusing this, while going unnoticed for the user.

Could we steer LLMs to avoid that? e.g. adding a line about `Unsafe*`
items to Sashiko's prompts.

Also, a `checkpatch.pl` (or similar) warning may be doable too, since
false positives are OK there.

It could go to the ASH (Acknowledged Soundness Holes) list we
discussed some times if we end up adding it.

Cheers,
Miguel
