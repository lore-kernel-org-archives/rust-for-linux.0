Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62790352021
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 22:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788735388; cv=pass; b=sNRkXfHvnn89TmMszM4WrqLTpZXV+90UsVzWh8YbgfPlwUlTTg0TBVlIixDI6c8qM0AsBKPwQxCnXcXDdoTaXHL+2tfHJsI5Xs5+9JTFVnHY3I8e1gOTKw0GIzPhV7Xe0ax8oC30rcRbCH/JruhxSYAWbnhF3iUOpYjRjxWazlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788735388; c=relaxed/simple;
	bh=paG/hrimgcWf1EkCmYTBW581sxN7ZwP/TIxnC588EzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5jeHvPoSiqmgcvI4L0/xtn+qs5MWJwzlXEj4iHUUCXUrrVEyLTBi7PZCrUczCzSHulfhmOOk7FmMB3pyPMzKdwo8BsSWlHR1qxrTEgzd4GnpD15ixGtHSg6p0eHS/lmDIorrXbaZb3OxdTQaMsEkgzGQDkrpP8owiEcTSaoid4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3RXMjRx; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3RXMjRx"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2566so485053a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 06 Sep 2026 15:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788735387; cv=none;
        d=google.com; s=arc-20260327;
        b=rYgIE5p/i9/zhmLaunv8lTyPN2lcNRNlBG5kshD8RHohmcKay3nidHE40kjz7XXVLn
         VJYUKlhWfzAF6XCRpZZFMeA4RxVL7zAPd/uLlVijD+tWOhwXZk4uqRfn0UzaK0tqa6/J
         amoD59nzdZkfXausTkCEdGINc576tLvduMXn5qvy+jadBK0svMN/mdFmxMv+cUlNjVmy
         nhDFeo14it1ifFoawIWy2e84JFQM4jPYOnvXzPTuTYPjpcY8J+dzpebAnHUmQBY9N4M8
         LwtzKwKp8VKGGXsBH2HgJdV5b4W5rGtYxT+FmkxZjQja2QvBNJ3oTe9Km+VaAqzjM/uC
         1/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rzuSXReGoSaELiwaXh99aoX1WEKTS8+9Sjq3EwGSwww=;
        fh=G/ODFx54uoG0QrpAyxXnGUCYIAr334t7qqcqAmY7hWk=;
        b=bW9v1DSvPtv1+5VZ0Ihdj+YYnZ6ngG1o712N4JD2qLRksJx6T1GfOc9kzY7KY/k/0r
         IHpodZkkRVEeWEtV2QoFM2Hfs/ZV98SeMFleLzRfbMijEaK4+6wBSy71PP9UAxeXDqAG
         gvvIcaeVd3cCGp0jouXYLuNg0TlppM5r0OOrukWLuH+KvmowVALFSTHhPxAW1PKKcQ2U
         psnN53qLOXodzIRZ4+rLa4WbvnK1cRt/gnC0/UE5sx0f1lA+7JLOBiNuOSPSP1/cMzLy
         Fb7mZjrPe4IHpq0Pwk73gCyUe2KH4HJEShjCIu19Pm8RHIK+SsbUdJMYjYwoca3AiBNf
         7Y2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788735387; x=1789340187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rzuSXReGoSaELiwaXh99aoX1WEKTS8+9Sjq3EwGSwww=;
        b=U3RXMjRxGLzRknlLRkASnLwMd5DDqFtb5pKDXrI5rbEFNTV1a5tp8C7fMKyuC27KQo
         U3sn26+ouJDmw/ezZoPydVwQYZFKW4PW+Cd+XHOSL72hd7U9wlKQy9VBDya+WJ31n9uB
         nO693DxaJbrtFw8I4ygfmKX99/rwMotaD0z2YT2eUaY7PesYt0qsbGp78AVuZZXRFBDX
         eLh3+rXP5evqxp9J89PUDdvYQpd3uuBfZ++moHJ0ZrCgVtFFzB+gu9prtySdk+AGowTE
         AftaTwatmze/EH5SNyMQIXi7b9j+c9osYXqK4ED0UWsuaarFX0qGQMp/sFSyYO38Mt6t
         mgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788735387; x=1789340187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rzuSXReGoSaELiwaXh99aoX1WEKTS8+9Sjq3EwGSwww=;
        b=jpIAyBUFQwKoOqiHqK5F5D4p/qfZ92SrZ3im7Bmd+wCgPs+P6RIw5lECNjoZuaBsLL
         bwHyVNEvktA8S07y56eRhpGClkhY+1lQi3e68E571ExBOydvXgVGDRf15fSscYsbib1S
         qdMLybb1On+bwV5Q+WBqdLlPITuOKuf2hzSFHqOQ3tuXZELVC592N2P6A6nQorzqtlr6
         54iFMFnTDP0KyCt/tueLKrwpdeuVbUX3LGdhf8yTmpLdTPw1LygRnU/VeN7Y9pOjfMYY
         czKUqaauhpBIrsZILBJOacKmPaVspgpZeGhQL53JqplKblheTIFpl2dYEFaPebdCOkgA
         LW4g==
X-Forwarded-Encrypted: i=1; AKwUvBxYgVyIPNwkanBffASBUfPg/0esb69KiKe9JqZLbbo9fbPQj3u1MTSrfRes2z8so4U4kwXGtioFijWNrc5mVg==@vger.kernel.org
X-Gm-Message-State: AFuF++nTKQBTrdbDDh487pTMeoT0s4ocIjRe3MiRb85fkGuP39eGu0Ai
	mQdWIhi11BfidQdDXdLfDEz7RsjR8oGSSvhxnas7Mzatw1w+csNbiMfKa2eU+obLdcd2m5GWGDg
	S1majlbYD5Pdqs987NVTLWa38P2EpUjc=
X-Gm-Gg: AYBFou1o1iAKWNatfGFxdFiy/3eNhUPN49NxeM8FNbKJUKRxB7i6NvBGACvKIrkGmye
	RsyKoU/VS9j0dq8lSczrPrQhkxARcblRBsxEZZoaxcreXBflAXVjgIGVaPH4uPu9EBbUnihxDU1
	R0c53SH7Z1KaetVAowWQug7gXyNoCyr+JkRZYwSvUjWSy3ReORzi1Evy/RqTsBtVaum7VV1vkXq
	FgNQNqPmZiPHcK6mqzC7/dR1iXGCgp1t1kUTZbxNQkJP0Ie3XPANesmr6E7gPu8tDL7LPucuDD8
	OWdHADQ7OjD3O6uE4IJ0qm5g7lLTQALctZmTI6Atgr/IjNN9nbjaUBSQSB0hJvWy18JysztuyIV
	TCXaE9lI2l43VxLRGhG0ohSe5OepGjf3popxPAe9hrOJ0DoLlWASNL3sheiOj
X-Received: by 2002:a17:90b:3907:b0:398:bada:832b with SMTP id
 98e67ed59e1d1-39b3d8a3d1cmr12034422a91.6.1788735386695; Sun, 06 Sep 2026
 15:56:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906215822.1201022-1-jhubbard@nvidia.com> <CANiq72noJ-4Sx6Lj32yGWTm_pzmMkH1Ue37W1y2anzpmN9mMeA@mail.gmail.com>
In-Reply-To: <CANiq72noJ-4Sx6Lj32yGWTm_pzmMkH1Ue37W1y2anzpmN9mMeA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Sep 2026 00:56:14 +0200
X-Gm-Features: AcwNN1USv6HajX3FrU4EvG2yFuiOdSdQ1dukhQR4-hacY4j-0RzaxKBUNfPWA2A
Message-ID: <CANiq72mOMgLi-8BBhFDLTzKqWrBNu0n_5D46jnwU0kwJgZ=j6w@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `clippy::as_underscore` in the generated bindings
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 12:48=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Thanks! Looks good to me.
>
> We have been getting 0.73.0 and 0.73.1 fixed for a correctness issue I
> noticed and I didn't see these yet -- I definitely recommend avoiding
> those versions for kernel builds.

And by "we" I mean mostly Emilio (Cc'd :).

By the way, what do you mean by:

  The minimum supported bindgen is 0.71.1, and 0.72 does not emit the
  cast, so upstream CI may not see these warnings yet.

? i.e. what is the "upstream CI"? I am not sure which one is the base
commit either, so perhaps this is about some CI in DRM or similar? In
any case, I think I will remove that bit from the message since I am
not sure what it is meant to add, but if I am missing something,
please let me know!

Cheers,
Miguel
