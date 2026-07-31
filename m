Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7610737F00F
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785531493; cv=pass; b=d5XMNv227o7go9E0E3s1jxBHgnTKmgZpCl4AgoJ4Az9s7iCXgE76ryVDqBzDVbTRnEncOgEuli18lBw2QOFHCBnKGeLw+ccA4YqNb+4wxAk24/W90bf7jgBNePUDp4QjEo2a6BFYowMo42qlDFrqWXqfoEctC3fH5vO2givXCo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785531493; c=relaxed/simple;
	bh=QpxQyRFlAMg3zdNKOHqLP2D+nnCqtp3/FyUT/or79Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4Q63snSQgZelZbfPY8S+Msv8un7xIK6FVyA2cwJnpUiqsO4vN1oQNT6EbR2fLB0OhTDs4ICf0ZsVU4kQuFs3PU2gH6L5HHQiJBsGnOtgRuO1k4NN2N98NeLNkAtB/Z8m3BQTNOOcQpLKytBp7f2jfbOc9tv54UFRAK3O/kLU+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEpkc2kS; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEpkc2kS"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38f0f3c8da5so173384a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 13:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785531490; cv=none;
        d=google.com; s=arc-20260327;
        b=UUVstCG6dDfNZBHOMRcIALep30lZ6ZSUgVkiBI6XJ5NGGF5xWop5qxQIkwMM6pBA4n
         CKKH/UR49eE+L6Xzmg4cyudGAcZbkBAysTA0Uw2z6EsqLPXeIIgKP5iVUbEnBGZc9B5H
         HjPgSJ/j0HtZPE4D1kHcJjkEc1sLBE2pmWJDg6Kpm36xAsyq6ZgijKHHzVFfKYCUUBtZ
         7u9572a/g32Cnjrkg21AeqJyCspU0q5jeC2TNB8+Q52m/1jdIgVc/jQynPxkI4pCCHFv
         q7k+CZbkoOMGfNOsjpUMjkjupA+1Q4KTu/ZjDkZrptsgrdA1uMaelJVHta5QKizuZ31C
         EsIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+Teresz2uzFXJRBmUNilJ0KmYvmwmTuIpPexTxP6II=;
        fh=Ep+fdcsMeLJCw4ms2/pjHA25slDQrdNq9xW/OIuzNhQ=;
        b=RIlf6Ie90//2cf7ouIIM1AGGwkMPqLsDpLw+nJx62ZZWLInenSQG3atHZ8tY9w9hNv
         Uw0eHk+qM74ZRqeQudgmH3E9wfVzotPZVkBeT02NxNnuRHVsFQEp/fRl8Hd66o5Vo/69
         V3zFtzbxgajICm7sTC0Xl87kLIt/yLbERgjKlsmNhiIC/Xi1MPh3QYT1Am9YNRmuKDW4
         7+ZAPfX8Ftz4WEZsuLJXDlBxwebhB5XgvpwK+6DPs/SKcQPrDZOVRhhAsxPNGPzzpOaI
         SvArg3uvy3vBhGSoMx/zm8QIRe4cHcwf2HvCAjoIybjAEBq1AFwhdasHSzJBffrzqsW3
         IM/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785531490; x=1786136290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+Teresz2uzFXJRBmUNilJ0KmYvmwmTuIpPexTxP6II=;
        b=pEpkc2kSKf38ETdsRTjzDUD2lwDILslIJA9FBg/GUrxJgj+RKJs9JrcpHbBKiBTTaD
         lc2DCGmitAssbzbH+YpGEV/ZtVFogg+VQpSwdQz+I/WTBWxjAOKt4VjU+btfuOlFzwNo
         6NeF4Apka8zzVS2C/WMrFL0WJeyGeDceNR74bdJz+ADzItFeTFRqhFccR9R3+HcSUvTX
         6FBgtmg0xT/EkVnOonMLhiPbU0EesIDGc0W2YgaR+ZPsFHoi2ILwy8xZFZQV/jy7A3om
         IpXrLr/9Kr1Of8qtw1Rq3WNNVERGjwt2KZCBOqbKYIPvVjvmyAayH+gpRKOTX3ELEudU
         r8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785531490; x=1786136290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+Teresz2uzFXJRBmUNilJ0KmYvmwmTuIpPexTxP6II=;
        b=rCVHWAH4Cgg2EPG7kZ0jwjLQSH2B8699fKmwl1PJfKKI2+mRrhIGb+Mb2ijVwrm2Qm
         6WaPg1SFEs+6v4M8CzEWUuYAguGiMFbkQSvr2I+b9ahkONsoR//8IR1jDhHNfYMs9jE+
         ebUiC0APFXDQ/oOEFvf+enldBw9y4zW/GSigFt2KBBWZILUO0iWMcxulYWTRkmcI7fjJ
         /zBAgh8Dx0TQZKyOZBHGodCiUX3DFPgGBQmPngOeZ3s1/YmpOP3uz68RAiuFdwWNjSpR
         uoB5ap8jjYZ69nkg4DodOQhTett4a6SkpIFnG+lvs+OOmbr0C1Edjxunk+jgrsNnuNDm
         k0/w==
X-Forwarded-Encrypted: i=1; AHgh+RoDjX4HYfxkOAkPBgM/CFh9T/Exbaro4e9k9UqUntp1Ov0QIFDfYsTem/dNAX4lR+PcNoAx1PprbtwkyZP+sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJCcmPh6N/padwF2OXpafaSEIJ0WHKnqSVEB1auorBasfcb8xf
	5OjFw0XKzg4n/G/mkRxBM/UGBA7WET1hW/Cze0HEP4Tno26jADoKdipjLLEeS7lydOqg0tHGbSG
	LyXwb5MT2UcGWc1MGorziAFIwBdo+iVw=
X-Gm-Gg: AR+sD12KY2dlADNLNQWllhVTV1T6szQdb4gCmNh80AEe3AOqEY1/LTLPNXso5jVFcRr
	3cj64OoHHHG4XTAhaVnlUc26sinjSNg804aslM7aRky1dEcNvbRxdalhE5zZD6t8SFxdR4bfEN+
	4mNI3jpppVQ8lUZU6nkerlgjhKj5fV6l78HfMvAeoW+lpiZOnRc5VPXCFrfif1MI60mGbWwr50A
	6+AeusHaInRODr3+9/ehVNrgHxLUMnKT5qVM9QVi7YEb21hyafUv6W1hmlJX/E6YToulajxfedt
	7ccOyDu/svQiKhbqYNXMfOmiDXjOqTV/Y4TJ4Ru9Z09kP80pwzwp8zdq5VRp5gXFSKfhaRDqcHs
	n5HMUJdIJU7yOGblkhDYNJBgcQpGG0nmmJqPwblLvMqokvcKhxwkp+b6E4PKN
X-Received: by 2002:a17:903:38c7:b0:2c9:8287:fd0d with SMTP id
 d9443c01a7336-2d052438c91mr17898875ad.3.1785531489794; Fri, 31 Jul 2026
 13:58:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708211435.402426-1-chang.seok.bae@intel.com>
 <CANiq72=-HjYOoJPd=B+0OYrHuyCO+NpcjRvmmhT_ecVZj8q97Q@mail.gmail.com>
 <b705ef27-e87e-432a-ad1a-f425fe66887f@intel.com> <CANiq72kn8F-pnd-YxBiPN9nr02jagRk4NL-3vyX1tERCQjqNHA@mail.gmail.com>
 <fbbe2b57-19de-4480-b0c6-f44a6007a38f@intel.com>
In-Reply-To: <fbbe2b57-19de-4480-b0c6-f44a6007a38f@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Jul 2026 22:57:56 +0200
X-Gm-Features: AUfX_mzIM4fLMtOWaIr9Pfdp7VGovFZERS0Jgk5EJXX3PQxspAj1Mv0yqU8Ra64
Message-ID: <CANiq72n0K3ULP=7iZhB1hnu6NHEHea66drAN3DKJEG-usTn6QA@mail.gmail.com>
Subject: Re: [PATCH] x86/build/64: Prevent native builds from generating APX instructions
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	Omar Avelar <omar.avelar@intel.com>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 10:46=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel=
.com> wrote:
>
> Given that one option would be relax the rustc version while tightening
> the backend like:
>
>   Option 1: RUSTC_VERSION >=3D 108800 && RUSTC_LLVM_MAJOR_VERSION >=3D 23
>
> Or, simply like the previous:
>
>   Option2: RUSTC_VERSION >=3D 109301
>
> Since the rustc front does no longer emits the `apxf` attribute starting
> from 1.93. Also, 1.93 requires at least LLVM 21 which already supports AP=
X.

Does it mean it could be the "OR" of those two?

i.e. it sounds like we could avoid having to pick one or the other.

Thanks for double-checking that and doing the analysis, I appreciate
it! Figuring out the precise version gates for this sort of thing is
always informative on its own.

Cheers,
Miguel
