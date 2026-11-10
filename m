Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794342682;
	b=eBkjqizb6ZPECy8b1aABif0Igh8iHkOtKfC3RY9GCGYtJb1WuG0ssRs0VIiyrlZTg6wY
	 rNcIjWzmsc62dLMbfZEdg40Gq3bhOL96TnV3CQKXjcRdflnigig9er/BEpqCXiQklSHF7
	 8EVku0LmopLFGwIn8EvPCgAvu5233zhBF3ET0UWbS2MwwBmCwGNaRxOGU/t2G/ORnHyGL
	 sS/MFxth0GbjBHB18p7PGMdHcUK/d7/GEsXls1QdOjZsHmBO6HiHSLufPopHlPttYBBRK
	 FFbWgpWr0JlLomwbIsWsbFQUhTK5ArgdS4G09X5xu6i3CyggAr0e7piCeV1SlbrWS5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
	b=qqQQ92yT7PdiWDCwQbdgdky7mv3agBG9fCVNMzqtk+DKIQ2DP9sEf54VOla5fUu57OEK
	 fCb8r/h+U5WhiJfSCFcDNbcGYSzJP126H/a0RED7AjKoSBvp2CRxz3cbLttkcMWuBv732
	 I17ePOgigpccJ80uFEu1VuRc0zD6oXboe9kJXyI48Hqjct/NM8IVd436UQK3zcIdMYa9A
	 YCwOAsr1Ap+e7YmKwpvfNwF+ho/Cy7pe4VOnkxnLRvWdDXsHBKCN3wRAUZkS+VLMVjxYZ
	 F/71R0PPVReFwsvhrHujNmFjfi8v6BXjlO3Eih+uhjXccviPK+ctpyAdoVIx0NHOpiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k2tE9abR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF707606C8E5
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 20:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF707606C8E5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k2tE9abR
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd5f2834b19so172980a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 12:31:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794342681; cv=none;
        d=google.com; s=arc-20260327;
        b=NPWvtKMg/d8G4KK3XX8t6Ewh2sZEAzuBO5ZuzRnY4oxlm82BWmvt7uxbKjtVkQq1EE
         uOrhj1BenzyFtwJ9CMgZXf2O0Xu/IhQorrrEbTfIjejV7D8AfxCnHeYHsuDamp0NX1XU
         eHo8AtgJiWIWLXkDKfInRRvtelHH8OIcjnJAcoViCnGvMMIOYsdtl98OGxlgQNPwX3aq
         1LhlfpYkjgUihu2qHV4U5Y/E85PWmQiLA4vn/gKT3Wmp0dD9qIIKk9hCcWdFzJJpHaZm
         1xkPMiv1yQRWzkj4W+Vgmf+kNi+0aTdvnBBSL3oqw6z/pDNfe/L6UIqw++NZVHkaD8oE
         8csQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
        fh=QqrTV4Nwwo5ESVZGEFv7C+hyJV0LvqNA5kU81aq4CeI=;
        b=XvJEEIFyr7JyAqP2Mnqkx7eqBoJwymq04AO7QYA0ulSdGZXYy9He6MLWUhB9mzrMuQ
         Qcdihga8em9G7nPeifiVNKHo66GVc3E991BQSPOVWhG3IaG5rlbGWAQrC1FXZkAlp1BU
         qKNNJdFOi8/+cWBKuMbvmJo/c99zFCLqe1fc4qObmbuuP6fSKC+pxmPoVLW3B/Muxqqi
         WHVRWl+yYIlCpFcTM+H/To/ttGVb6L04A1/WXjOxMgi9dSrw3bR/XXfvAsF1gXDqgbsW
         xbDtrP5OVLw+JhFB/1JL046nSm1iTXicXbxZqqjlK2rnT1EdcSStv0R4FyGxVStsNXai
         kbAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342681; x=1794947481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
        b=k2tE9abRBySKHePpNw1+hoNwrpCgT9c1iMM92CBR/SFMFu9jyXbH2iCcyH+EmTQTiC
         yBLJMfHXGvpr8xfRPVxQgfnzsDthjwfax2/Tnn6lH65+pgpZ0HNuhexFozmuzYNDgx1y
         +ICdy5xZl5sBC6bwvrkn36HKWD07+HHxiPTqxB/C1Omj/my+bOWwBptkbM1GsQUlAwPd
         k5iKPtFQZWvnr7YHFJcpDSPfMwZhKuL+MTgC+TsDNhb2aGfrhumIhozOSJlps1NyLDFl
         5aulmNUtJ6KcGlw54fstXxrfYoWNLogwNTb77YvSuFf2tr3hJNYtNL4UfLVJ9xRwvNJ4
         xX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342681; x=1794947481;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
        b=vDovEeXKo1VTpuru7/J+1dqD14bvad+EmkyFzU/Sg9mNVNu1k6b6R91T8k68sP8q/a
         GRGDtoOTb01J9WU2kitlKbfuAgMIKQTQCQ78KzAhZvhVItHFYNBidKLnA4hQJvqcj3Sj
         oPqJZYYBJZzfPfmipuNdepCCJXtR6K7zRoGhJCwRSGkSHIZxwQgyYOu4Kp3iH6D3cFNL
         DOq9aUF4bKVeOpQKTxrkNN6IJ2J0KcEGAK656D2aGoVL8LqmObBb2pgMezj9rlgW7AJi
         qTYFKO5l/arAezxo1ioUP+G9mNKUsBlUveT9cOLksHk9adEwlirIBmrDDmwBuFWU3wsU
         eTwg==
X-Forwarded-Encrypted: i=1; AL+hErHfbctTgkS2r6CPTLotWW3xgxmebOshwLaHM2y1v/M/M119yKR+bdYnd0mfc9dgrFKtIxcSBiIRjbls87W/sA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9V21qjZy6hbnFd0Kb0wzDne4ZQhIWahiLi3pzuYN7HLkVTa12A
	inJ18kpQsPW5WAAg8gSkDUG8ZYygT+bF9/BWLBCq85j4CYATQ7vxdKTmd6m0TjnFD4zOz/KU62U
	o2w0y1ZG0QnJ5BQrO5H7WSBJ9fiW91jk=
X-Gm-Gg: AYBFou17tgZqdUtkrUEA8NI5QkslrM62HgHKxkCdhZXyhCO7altUXikYdvq6BE3Re64
	18L7+c3w4al1/Rl/3S2113rldCcDUnR0uGPvpVcvFIYQo+Ew1RA70dMHck28afOdqvC7RBFKn0F
	10P8E+ti4VEp0HXm9t/5cOhIr09p8k46rTa5Z+8JOAAvVAygeOKK/IfS1/Sin5dwilzO9iEVCyE
	utOHP4KEA7GF95iUPvIeu7i5SyhBVzCJuU4ar9JSZbga/N5vhnp55BbH2iQWzOs3RLxky3Zqx+/
	V4bSxQNIy3AQxgDyFmlqDIItUv6xHffCSqjPEn90oObRO+e8yclWx8EkV1zlYZJzyD7myQcCx8C
	T6fAPltoOd8/Lmef0NIURg4I2WI6ifO+bMajrkHQbVS9aPFYMyeaub6Mgkg26PyyNQdq9mRFSxt
	RyGeA75r7b1VunYER0gUV+sCQXB5wlgRcjtqIvZidpt43+fiNGotjxzEvUD4hoIlQWIJ0nJ3eWx
	YwoBaNeRBZoD7ObTL9kJJ/KQV3SDUFtvsnDmc4bAXzFbkkglzArFPFsHw==
X-Received: by 2002:a17:90b:4b0e:b0:3ab:be66:ddc5 with SMTP id
 98e67ed59e1d1-3b182f3642cmr189775a91.6.1794342681275; Tue, 10 Nov 2026
 12:31:21 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018175457.87803-1-ojeda@kernel.org>
In-Reply-To: <20261018175457.87803-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Nov 2026 21:31:08 +0100
X-Gm-Features: AclHuK_uckGpnRQludUiuJa2Hr3E-2Svi5DrMdfVjm-Nu4czLx7g97kWJ04gZ0I
Message-ID: <CANiq72npfiOC2ZCan-zAe-h79kba_5jtWFAeAoigCs_hnO8gJA@mail.gmail.com>
Subject: Re: [PATCH] x86/rust: use `-Zindirect-branch-cs-prefix` for RETPOLINE builds
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 7:55=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The C compiler is asked to add a `cs` prefix to the `call` and `jmp`
> instructions that go through the indirect thunks for the `r8`-`r15`
> registers, which makes them 6 bytes long instead of 5. That gives
> `patch_retpoline()` enough room to inline them, e.g. as `lfence; call
> *%r11` for `spectre_v2=3Dretpoline,lfence`.
>
> However, Rust code does not get the prefix, e.g. for a
> `CONFIG_MITIGATION_RETPOLINE=3Dy` build:

Any comments on this?

If it helps, then I am happy to take it via one of the Rust trees with
an Acked-by from x86.

Thanks!

Cheers,
Miguel
