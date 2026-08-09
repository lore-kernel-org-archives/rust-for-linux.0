Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D858D242D65
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Aug 2026 16:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786293340; cv=pass; b=cZA+rFkLdTevQIQC5R22KC3Rin2gV0xtGTQUd7lvVZLjO6T7bJUPmhyIMlpHtdnNtj0Z2/O4qC13kEpNN53sz76QFcxezXF176OnRXPP0xW9qA20mrQ1GqiJamYXEocbEfVyvaPte9nsqVrsRLySKTYG60EL89Jq/BN3kIc/Otc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786293340; c=relaxed/simple;
	bh=aDb/tKQEVquJFknMj8NWqF2vunSSQoAoQ0+Xb8OS7a0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p6uG9jeXPRAE7pCxA5Dk7uYNcFeyGwwsNhpQFnmQMgshIsABi9vfp3oakwO1UkWZPtBw3FtRTcn1VuYi8j4KRtidwOlzonPrv/pJWOIVpUY+Z1s5rjnhyYyMyMfPykkeVyo0VrDI/QApwSM1pAxDVvdofXs4hcxLXr2OJLfWOK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJQFgRrv; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJQFgRrv"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cad85b7b5aso1226685ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 09:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786293338; cv=none;
        d=google.com; s=arc-20260327;
        b=Y+D0ngImxtSkNYPXkpd5Vif8GPMm7SdQ34GFujfkA/oXFj01C484Ac8I+BaUHu8d/X
         bhVdEYlDC93ixsKhqzlN3aq0cKA+kSb1vsEcSZ5PAN+BIo6g43dNL2Jsrj3ITFkECyPq
         jR78sF0fPWg9CmEejMLD0TDONy0EdSkIu3nz/6vjMktDsM5bP560TqB/ijni0HILtjLB
         +5aafQMbiCv0fnXrH8/VUMvlgHg06vzT0n9LTQSFbNjl4jDH1Um/ly7FgyG2pEr0gMRU
         o7GvNLPmzFE4Ev1hopvhLGnlJKe+hFY62zwKEleu4gkkHuPKjTp6QqhE3+U4GJkejysI
         nQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aDb/tKQEVquJFknMj8NWqF2vunSSQoAoQ0+Xb8OS7a0=;
        fh=rq6H/CWP72h0sMFwij71uyE3b8UNXqe00A/kPLN2BE4=;
        b=QMyD3YhzJnktajXlCmJO5MAhAkTDFCjhSUvnAq93xg3iJZzjIDybEAIHnSkHkFMHc/
         LEPVQdNjpERbb+Lf3xG8ou1zpkp2tYpbCfSsY2PJho6jli44oYYO39qMWx3zwX5DdEhs
         NhjhIxjiSrFvYcx1QJDyO4TKWsFsSNP9NMXxuqSdzWK7TpSNJ6avvvb3Rk7sWgFNThyX
         Hj5cF1llI7bvUNtYBPkQWzFRqE0/AFlxsYumHyPr47UHq4menzc3sMOr7cGYlAA8ArHc
         341FjqdaPwr6rR8txgw/gqCPS78MJ6k1haduiflDaY86+uiPsY8hmN948a2SVvhXTXjD
         Nexg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786293338; x=1786898138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aDb/tKQEVquJFknMj8NWqF2vunSSQoAoQ0+Xb8OS7a0=;
        b=AJQFgRrvreFPRA7mRU3jdZAdra0kbXgfSAJVB0IqTgb7fuKjTb+5HZzY6+Ct/wTY1J
         /filY/SjqnFY9cJ6Mh8yr3v/Eq4j5l5vpsE3CHPnLj5F8Q3gKIrFuopX4dHI3UJ77spY
         bsqW2tcB5ci1402GUHz2riCsxV7VyyPObX+9VHTohfdxwhDwIC/L2BWMYxdbQ+3Qvylg
         TBXMLa3Xc2LkW+DwuKwi0zS88uopJ42DHp727yn/3Xs/PG6Es98Xri53dntnv628kmkF
         oU5TlMAwKzUGmDwOCZ7JyXkx4XcGI4k4g5aORH8m5tsi0z9Uqmv3RACdb8IgFjjrT2j2
         mEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786293338; x=1786898138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDb/tKQEVquJFknMj8NWqF2vunSSQoAoQ0+Xb8OS7a0=;
        b=lcpqPPviS9fuo0Cgqq6T27u0FBPPxZ1uaihHKujLDSH49/PnYwvSZyos+HBh/SMXsh
         QYLzysNWGNu4BDl9X18loc+V+mWK45pDEAE0x93oD5WgUawUzjS4ElJuCLblHP0IjFO6
         AtASuaGxf5OADejGocefLrsIrK2JhpxnrbZEUsEgxizrpKpxq2X57YFAnNhnoScILGG2
         5vuZQc4X4Jho1rgxqYrcGiIV+3mPZ8KQ9xtA1LsnBi9xSNhXVkdKY2oouQoxQQlg1qI/
         nm8EgNmC6lyysxQuAijOHmJimU/p0uVlXf4NS33aAjsU+HkFaGkqN0Aevo4Sodh9Tl3A
         eT/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpaKyCf75EfqpNtNJsiKow/z1mNhwix27272td2BvVXnGW97oxyXPn3hic3xJeL+nb54t+XfucvN9tdaL/RZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsPkg965nLX5RhMOXGpzx9mYgF4vQDcxXo8QpJitXAmmr8f5rQ
	lYoZHxSzD5+kwpLEIzy/e8oW8GMHkQHS6zqro9c7U4KzQmnXWSUVrw286VQtplqIT3JSDKH7W0W
	SvuUOIs563O2c/Oy9VLCFk1QGLWyhPII=
X-Gm-Gg: AR+sD11Z+hwmLMdjiui+L0xXSeeAd/PfXYWvW0lQab0TsI2aLXq7zW7/qyU/dWXtOfJ
	ibNpsBi2fdT12BXVz2uuK2Sd3ywSEHMq06zAxC4LgT511lh97Td1WxHW3UQohFP81wPSGzXRCmR
	x9QcNcJmyGKnhL6Yzs8X/U3sUbGcQ6VEzp8poojXTdWHZHUYs5W6vvU8c9OSo7pTlKDSwYQnowz
	vZCHEM/c74zpjB7GL1oQOlxZvxDZSqZo1SYg3CiPDDuQc0e53Kfzu0HJMGEnfx/LhS/TJDk0WAc
	x6t29Vk9KwCgcOJNQunQ645pBIcbpTDt3zeVBr3GtUZx9QTdyAUnzA4VCsoMTTGdst0xPaOjFtM
	GghxCtSsV3Wqll7lUQwhcu4GUysX4VGqjbOVxH7vrfQWNi763NBFcXVZPsTLI
X-Received: by 2002:a17:90b:c02:b0:390:af7c:fe5e with SMTP id
 98e67ed59e1d1-390af7cff8dmr11149536a91.2.1786293338167; Sun, 09 Aug 2026
 09:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805190012.2934907-1-gary@kernel.org> <20260806170101.67544-1-ojeda@kernel.org>
 <DKI2GNME8JEU.27LL7M7GZHZKQ@garyguo.net> <CANiq72k=xyeftXo7VLvxPQkaOQdXZP69rK4_GhcEc6khuaJqHQ@mail.gmail.com>
 <DKKEMEKDOIM7.1B1R7QP42HR9J@garyguo.net>
In-Reply-To: <DKKEMEKDOIM7.1B1R7QP42HR9J@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Aug 2026 18:35:25 +0200
X-Gm-Features: AUfX_mzEHpXkygepSJZzkIzdzVebv8fn05BPCami4_KZsd0_nSv1UWi87XPI_mE
Message-ID: <CANiq72nMMRG_mduKbfyEJ1a94R601KHHBog4LQPnpWx4NXkw4w@mail.gmail.com>
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, gary@kernel.org, Mark Brown <broonie@kernel.org>, 
	linux-next@vger.kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 2:16=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Oops, indeed! That's embarrassing. I've pushed it now (it was the same co=
mmit as
> the current tip of pin-init-next, 1e26aea0355ad2afa1ccbc62885c01f5bcfc58c=
a).

No need to apologize! I think it happens on most merge windows :)

Cheers,
Miguel
