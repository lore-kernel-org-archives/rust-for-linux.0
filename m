Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795347516;
	b=JHS582Qd4PgEqps6lc3mGN+6yRunu8Yi8X83J5uHjev51nGMK665++IpvN7H20B+6HLx
	 xfeSQYXete+I295SyFs+KjeMObj0E+xQUvH1iWMkJgPkRTWgrJCOycOzOhhHBWrilBfDe
	 mcVxbkduJW6EqMK8cDMr0oafOz9V734BYvugZLjByIk2C2VQQqem/Qv2htVMV8/kvpvqX
	 p8zuyXsMrRXe2pCJT4F/8FFtaWkpXiNwWZq4atGlSFcLrx6DdqYkcbSH3Q/xsGh5Ab+Aq
	 5o2QUEk4vpLIBuN0gRnqBAI1sY9/q51TBMbM1HwFlVkYqdiNDKIj528HDN8Hun3GAoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YVm0atOhjR9nDOLlJ4gPFa6rcD+/4hLxU/xQnQlbIes=;
	b=seDUzxkltFjAnGfD50qA6TNKtcl8PVV8KvJgld+TJp+in7UXZEHvwtv6Sq22wq8uolFB
	 6EeL1t1i7yN1G6LRvP7dPvcv5qFu2dgB1anZUylWXX/O0qF3Sk+Hsw/o+u2ofLDYmD4Ol
	 ugDm+/HFF6wBlBPuE1rU/7Tt3x/HOY3Ed80liaVG4mEYqfFFc4Tr2Km9l26VEpTMe8A4S
	 Oes24IvVLwbXsMpCXFcm5a7ZtdZ9Wrdo/oedViTrakEwW+OzH61sxMC/3XAyRWm1IsrZz
	 tNytIENB3roWAA8T5rQfaSOJfY/rjD+F8jXeRxg/73XsrNT1+/XJxwbKsO1rTs8/LGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHLwRXTv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C84606A32A
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 11:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C84606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHLwRXTv
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3adef2bf7acso1914591fa.1
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 03:38:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795347514; cv=none;
        d=google.com; s=arc-20260327;
        b=Ggyo23/Wr7K3GdmEQs8w6WJGvsqFUyvP61Xr13ULYHLCNtPlWRm5+X4uONksanqrxw
         e6zJ8PEuwK8RwRqU5GJsCRmOoWwRcaossr9oZ/5Y+GmxxkAMGsyakWs2YKQLyDc8qQZw
         J2PM7Z1gtdGi/qrvPyA8V/9LHSWhMJi7lq6fzBbqR9Kt3O3qtfyOlOuu60IrZhftQASJ
         er4uHDfrjDypUeFyp3FrHExQ07bzZwJG5jhXnoJMG8eJGi/gZ8qrxOLuHlKup6Cz8R1J
         798JEvl5vmuQ+oiF/95g2kuX0HMnjjWuQbso7tqz6mTMQc11edCVYFYJb29UW9SMqu/k
         6kag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YVm0atOhjR9nDOLlJ4gPFa6rcD+/4hLxU/xQnQlbIes=;
        fh=VjzzJ2d71/IbkkL6/Oz3Xqtg9DHG+LUFE48GFCCHvKE=;
        b=OUUeqe7XP2oatVz71X3nKV9Tgng/3KB3LaVoDdYileBvflxj5qM8vzmGWAzBu3YdkZ
         7gADyH99ms7uu1HKnTGt+c4LyTfqbxiuFbnDBt+XpwbCmLUh/LjGZywGQccs5II1ekRL
         q5KBYu+tai7twEPWm8mma4MYtJKcj9UmFohJrBDR6yBU5vVUf1NpcH4b8k4aj2ylxzyF
         iqK9Bk4dHJUc3V6aGuXHOcJKUi6w4fVhP+0vF0Ccu5UeSIF/PCZsfT1SAPGueiQBhK0g
         L2zAkYSwEJFWUY6XXoK3K8cNFTIyTWdWc7CXXsKbdvgKvjBDMpoXtjE64LGUg0JOrVsB
         aO7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795347514; x=1795952314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YVm0atOhjR9nDOLlJ4gPFa6rcD+/4hLxU/xQnQlbIes=;
        b=xHLwRXTvIHOPiGdyOWAJZFVHXZ2zx9COFpOESqj/4DrI4UR32A5Zd1mLYswGv75WZ4
         nsZ4hYcHsCj4EfnxB3iaxLBSBkZ1VZBYmwH5S7Cq73q8HtBoCDQc1jiQvkYzTX+AGfRg
         NnlAYleyKH3HGWTnph7hRYGbt5khCdOYTPo0kq+QI9jzCS1ACJlhjphZBlhukDCnVoRC
         cWUTw77cC5R/+S9cvmguAITuS6HRxDofpAYoWWWoMr98EvtAAVSpiElztF5iOBmPdUGy
         XpoQweGZXljH0GjAwvN4cg+iFcqOPrLJIKwcSUqSOUvci9zXjj562KDDIrdqwEQtrPKg
         37Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347514; x=1795952314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVm0atOhjR9nDOLlJ4gPFa6rcD+/4hLxU/xQnQlbIes=;
        b=D21ATVoxaT/RzDpPHTU7/F3zuyjH/6wzYLmU73NEF+2u3AUyRdnPpqegRSRfHV+A6m
         UBdb0Qme4cx+9zwqhSZ4DUQiWkJ2atbx8yfpynUI7DxM1overxIpxVgpkX7tdkiqyVrs
         bW2XCjli874PW1nxFUjnBfFkcLUEWTDcEL460nSLhdlzvfYU0pXgKaXTd8UK5y6UD30k
         vkCXfkQ5ypBIB6HgXRuG5VMvhpXZaeoobkNMbTrDg34iodlg5WmZbbUn0Xlqaef1fB7B
         1/mHuauhSqLZb+sI98VcQkSpTYFEHjamBSGrGeB6eByBiSQGaO0RFPezdzGvYrzyY9Sl
         7hfw==
X-Forwarded-Encrypted: i=1; AL+hErFeuH5HdDNn6TDW+HyPXkcpy/IznpFOwF97uGmmFiBfPwU+lP/NLbuutW/ij0Pe21wuXDjlTaTK9aS00excZw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+UEnC8aQffAG4JVS3mVpT1PTrqgbM00AZ1nZG4gJXbebmFnVe7
	NMuGYjfzioPyqneo9NMQc83iXTzkKBZv2LdnyLeXRigQsupcS/MkXwzMgCMZ0GC/xq2SaTUlCKg
	Hatzrt+nxYQWqLWN2ipYlzw9Ks1TlTsI=
X-Gm-Gg: AZFdTZfnRYBWrP7b+TwxshpIUUsO23aggVpr43yyqDrHlsZ1HAsbBZeAZLKiQRnoJts
	/v4bvjriEPrkwy27CGGveXjzd4qFy93jZ7FQe5q/wSAPTOnpFJeCpjS93BNULdoXihEp1IUfZJL
	KjyRhWh2Rvu4wibpZ/EVH1D2eMWhvjWh6vfd7kJgrhRyg390W7g0MnS1wlVBowu5m2JlPHMf5rA
	2irIP64cp1MHfTdHr34II1NV9w4cEI56dLwZxssAvpp1mZovZ15n6NXDOMuXNrqh5MZfEFzfhmK
	e5iTT5aA0agH5w/ySSpcUYJJQKCg6xWymtnowfPkSsxrWI26u7qH7egJDoOhFSxWPDwu9CcNADI
	hkZZXO9BSUlvYH87KqZtBXJIbzfch2Ov9L78HEjBj9Ssws078yKbKh+1xiR2x0xqZOK5n40N79U
	nGC2eF9QnJksn6i0xKaDgUwZ9y2yOI9/dhrwESLtVGmMyTOXobyQEuY8LQ6smOS8iFrQfnoA3pZ
	X9LiaGj5igTJ43rDdD8WJ38+ZE3XpDEhr6AqoFqJlyqfaVIU2OfHDybbITdy0rRijY5HljZ
X-Received: by 2002:a05:6512:31c3:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1bc76a33fmr3371052e87.2.1795347514504; Sun, 22 Nov 2026
 03:38:34 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-rust-helper-namespace-v1-1-3b9a05553ff6@gmail.com>
 <CANiq72kWXzP1SWUvhOT2k-rNjopnySXeBkjwrx63V2QUaLpnGQ@mail.gmail.com> <nh-eaa5d67e-6d05-468f-9f19-273bc5b23ad0@google.com>
In-Reply-To: <nh-eaa5d67e-6d05-468f-9f19-273bc5b23ad0@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Nov 2026 12:38:22 +0100
X-Gm-Features: Aa3M54ofQVSiRzi-fgoVKnLP0jYbT_Rm3zSkFfSi2xtBRiBz58W07aP7BMXi-VY
Message-ID: <CANiq72mTs=_4wSHAjCJNdOcmODHzPf0ELY6t6vqCNt2E--XYaw@mail.gmail.com>
Subject: Re: [PATCH] rust: put C helper exports in a dedicated namespace
To: peder.bergan@gmail.com
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, mcgrof@kernel.org, petr.pavlu@suse.com, 
	da.gomez@kernel.org, samitolvanen@google.com, atomlin@atomlin.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, wedsonaf@gmail.com, gprocida@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 6:50=E2=80=AFPM <peder.bergan@gmail.com> wrote:
>
> 1. Would you prefer I wait for Giuliano's series to land or send v3
>    with it listed as a prerequisite?

Either way is fine, i.e. in general you can send patches that are
conditional to other patches (within reason, of course).

> 2. Should I keep the KASAN import for v3 or move automatic imports
>    into modpost in this series?
> 3. If you prefer modpost, should it add the import only when a module
>    contains a Rust object and references a RUST_HELPERS export?

If the `modpost` approach (or similar) works, then I was thinking it
may not need the manual imports, i.e. the idea is to avoid having to
write those manual annotations if the automatic way can figure it out
when to add it. But I didn't actually try it -- maybe I am missing
something.

Thanks!

Cheers,
Miguel
