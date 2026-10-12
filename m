Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BEB48CD78
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 14:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816071; cv=pass; b=KKkOrDuw/9gTqwACMl6WF6lSAH6H7l0qfnFRBXgQv0hYus1DJDv8XRTj38Mo8ooc6mppH1II6tXjlGE0byowp8umj2RI80R8PY6LBT38TgCJBCqQ+Q+L+03LSkzg3j5Aj/yfQtdL8u7cdBeEqIAqzbAwSd9Ahs9VqHIn2t+aLKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816071; c=relaxed/simple;
	bh=y9JZ2SRwZfWIQuGJGl5A0Ey7T7W/BNYBBTjAm+FNiUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIflBfIIc0jAAc5Hdb60Xg1ZKpSGXIWj6mE6J4pFilMZt+X3KAoskmuPkJw6HDfPdRCOIBhJwlDcMOni2Jm4ZZ/hdvNDJlIpU4elPYfw4klTA9x3LJoHuoM0e4myBORkBC3st4gcNoBqjHlgqxRiFqKr2rQf+hHHejGbjxmHTkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIdvV8C/; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIdvV8C/"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-34c522572bfso224588eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 07:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791816070; cv=none;
        d=google.com; s=arc-20260327;
        b=BynG2+hyw273e82kPEZQtAOISaoLAEHCqIrjNgysLIEF1hCuMbXicKEIWV1/qbPCke
         Vko3WnYJbDTX4ltSRkcnmCe4Qj9kLQ/KPGOppIfI4p8ZX8IXkg9mCfabkRO4AVXYaT0q
         N2P/s4VIxFSD5fWA6KTcCi4/8SicThstUhS3odwm1YIMpTX7Kap4F7IYXyWprFn6w2vT
         Zu9UE2v+uI+FqqmYQWf7xTyYiemXjdkDFXY6ePOGr5HUB7Gmxv2OjVp4yyBBLv/jL1Ld
         Oo0Ikp/w1Qbk74eHqhurC48sb4CP+NEr1aHjyiEzO0aSJol5VZHttPO9IsDhbeYGkmKx
         glnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NadqPd/uvs6B0lBY2MHcQwXAbbvTiPDymQbU6+UNoZc=;
        fh=KvWmbOYBMPkrDE5BnJsDiQVxPMBgwiFuoQB5u1h6D/U=;
        b=BNBWslyrS9NUBhv0RL1NBPPryT7Rq+bVEnglxw+QDZCXvvipGCtqiA/Aua/uQVxpQW
         nhlqlkZeltkvDQTsgWV6P9CoXUzoC71IRpku5jBZQzvkzPVHQ4VhkhyDEhIPzZVFZnoO
         0Fu9v+t2rlHnPgSSVYR/SvtVetWKLOoqN3kDxc5W5oJlL4PSTxi62NvHHUhsGVNtTEkq
         AfUVHVvE1Se/SkwZhx+j85bcrZjxvK+s2GC5/HNpDoA6cKCN1qiNR2s8B5fVGgkU59nD
         TBIyO92qfXK/24PIAyMUOOqGS4a1aCtDqfXw1ZKRpdCg94VqN6H4Fg5hoPr9E9BfbLSk
         M95Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791816070; x=1792420870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NadqPd/uvs6B0lBY2MHcQwXAbbvTiPDymQbU6+UNoZc=;
        b=AIdvV8C/Xx//gWXZBvpFDFWQV6zRjSIY7YmyJdQgkIYvxO7JLKZPpoTkhlp8TcSC1r
         5KqzirH00swxzNLB/gx/U2XBncX5PBB4hz9szrna9HbJ4fQS2YiXmo8w2onoE3mPs9CR
         j4bt8uePOcB2abWGb+hB6K4CcHuT9HCAAomV9J3p33IPq7dpGRTZunSRllKeXJtcPD5I
         wSeqLHD+R0R+p/IdvrpRYH6KUaw6TfHmsaWQ9EL1iVdpZt5zIkOujRf9tQJu5gE9doiV
         lgzmpsTZFni9+pigTd8prVOnqcLP3UmP/PofCpNhh1vpY8N31osZPNXNf+/6IZ4C19G2
         1UpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816070; x=1792420870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NadqPd/uvs6B0lBY2MHcQwXAbbvTiPDymQbU6+UNoZc=;
        b=MukCmlPU7bstSYQw+YHwNX2+188JdmvTV2lGt0UdXCnZ3uTkqav6GIl7ihVw2d59OI
         gQN5/eBjPLIhzc1/0t5nJQkggfM7tOmRZRs1I0FDO1qcIl2TGXJznQueOHTDk3BTr71b
         /Vx2qjyGEqhqHdDmmR0OHKxi5hezqgcq1nZhngaAThdrLcmTP1s8jWubbX8S5SeJaACi
         X1zDv8pENx4//KSlEe8CXNDiepbSMlQCUEFMQchlnFfSFUGpEY5IYtX3/qLgsyKKl82I
         1rkkm9lFwtwOFRUYVQDPCt4zQbmoEuyC0d4PCO9jrRCbxe9Zw3/DlNqNXW7K1qOcKDrf
         LG3A==
X-Forwarded-Encrypted: i=1; AKwUvBzjdClI8BZLEsXMq2p3Gy7SXBnHCuUqyMjCZSy4r4A0LZqlbLDGlnrHTS9QOs5xWMk4CxSWHLXhr3CtLlM1Tw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI5h+drgumcNlkyIcwPwIob1B7kGm4ls66lJF3f9K0F1L8tt6a7
	vIJPyEMmf1nFTkcTG38/wD04p4cFgnTL1bVkhhfQJT9QlUziZyevzAUQuG/eAQGFPnODpgwqtli
	7eu1CgTa4KiIiCp4CjLYJ271nBGgfVT8=
X-Gm-Gg: AYBFou2zLtvDrcVYo2v6mlgMExaUAAzxn20OsEbv0PK36RpG5XjsNJJjxywzMV6BFs2
	5DpVyfX2VoLtx3SS1/5lNLNsRNemXS6i8AWEi5buEl6SebZRJ9kC3PNuu96GvDs9Z5O2Siq3YvR
	/OZJo1H7plEbYKvx5j+hFvAlrpF+ASXhqTgLsvUbgbbtnhdFUK3CT0QbchVkINCXvBdFAbmllER
	8w6Fnu8ecdGo2uITRmQN5jWZ6n3f/2x7vOeVFGHitGFizRY72Fccpyb+uRYj1AEIHmQmzAWCM5v
	cxt+dXkRZ4ZHGGvl0lykaluXA1gMxX1VzSax492Jv/M9gNruH2r8M6G4l2l58mbeY+nQkhJnBfn
	8OVIrMM73KKGZAmFHBPJkpjOEnXtVrt3jkNSX5qE45ocvBq/yB1lgwuqSR0OdP92YNo/6XLJfu7
	OV4YmNYqPJN3pWXLOSF7iO5SMxL+G0haIZOK537HwjMqmLnIFh70GAnt3QVJNjTB8=
X-Received: by 2002:a05:7301:428b:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3587ee40938mr14086041eec.0.1791816065173; Mon, 12 Oct 2026
 07:41:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004121230.373216-1-tomo@flapping.org>
In-Reply-To: <20261004121230.373216-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 16:40:50 +0200
X-Gm-Features: AclHuK967sNCwIuE5Qfb6l_lpCmzHVhHAK0gIHkOXAoJD5bt4FEZJrItXK8pbdk
Message-ID: <CANiq72kEM1Z1yb6SVSCrEBfFVim2R-fXfSSJG2xphPGABq0H5A@mail.gmail.com>
Subject: Re: [PATCH v1] rust: arch/um: Fix loading Rust modules
To: FUJITA Tomonori <tomo@flapping.org>, david@davidgow.net, richard@nod.at
Cc: anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	linux-um@lists.infradead.org, lossin@kernel.org, tamird@kernel.org, 
	tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 2:13=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> arch/um/Makefile adds -Crelocation-model=3Dpie to KBUILD_RUSTFLAGS. This

Hmm... That was intentionally added by David back in commit
905a77077573 ("rust: arch/um: Use 'pie' relocation mode under UML"):

    UML expects a position independent executable for some reason, so tell
    rustc to generate pie objects. Otherwise we get a bunch of relocations
    we can't deal with in libcore.

So it seems David faced other relocation errors (?).

Cheers,
Miguel
