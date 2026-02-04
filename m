Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7C7427A15
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770222570; cv=pass; b=fIWDX3UK9TA4U0w+h44o6xu/dfTFfNv3DtWgYQiAw9LY8x+sbBzXDQWM8HO8jLI8tp/Yt5kFofrtxSlapgGUDdj2yzM8aqsHGY1a4cBGCJpqsYKv5wOCVyJ0BYAesmzRyviyZXrbi5nA9CmrwIxt5rOMF7wspydhMx8Dt1ESPJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770222570; c=relaxed/simple;
	bh=FCoebVg7LJUhtIgBoSzk26zD4KI1yijS40SCsrcgrkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRhJzCwA1y1k7HFFvaj5GOqyXFYR3PxIYZrcqi6fgd1fLOQen/LCuOMLVv1TO2xMTM5aFbRMuxS+02VwJ+act7Qk0VIVvxBZd5M/wK0Z4H0BqSGQdSCMghrTrZtlHyXIvMamIKnHFJkW7VZ1fMmZXlKKn1U6RKZxV54qVsQoegI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BV21gMTY; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BV21gMTY"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59de77e2e30so59269e87.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 08:29:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770222568; cv=none;
        d=google.com; s=arc-20240605;
        b=fRgonoVgIHqkzKJwHNImdVhd62OUF4UE18SH1OYMYklV5f4xRr6fU4OmKzspXVWiz3
         fcQBkjgQkIBbs2hb2SRW9O9usMgyihZqC6qmHtbAcPOrtx1CDv1eZuvYTyrVmGVJhdgf
         xIGcp/TerQZmEG3BvC6EmJ32rjDZYh7i0mh1Jn+VLnQEGYfM1yDSmp875Cw7LuqPxRWI
         Uy9zIuvIUvkt9gyZm4r94jOCcadsil8ltf99RFCLSmIqj4ZMah1Y0ZlMRHE7LS0u8vzS
         e6GsNvh4YXqqOq2T8ZFPD/yE4fLXUswZxnejk9+3fgBpcq9uoJUej3K7ebCb5kWQnTx9
         w5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FCoebVg7LJUhtIgBoSzk26zD4KI1yijS40SCsrcgrkk=;
        fh=NRgZbY9zQB8+m0BEPuPx3f6SDwOS97eDl5N2f1NNzks=;
        b=cvW36t5uMz+fWvjFmiEBWGpNquAnvejzEQyItAdsWcSvJGbY2X9G4G2MxKQJuVn9Oz
         c7Q2uFfEIA5gQg8UJm8YYiraJdOSN9pzHnb+b5U6Q1ceI1qSLNpxsiq5nNtiLvqM0kS1
         a4CC+WiBtslEHuirLNyWLhT2pt0xShuTxslpwpu9fLRZiXXmRsrwo8QjbSypm95Xl5gC
         SUj58oJSrqFK+0u1pGWuOclyo+nMoSTRy4rfQzRGhjYy/VnYgCIuQj5pOJDjrDkFXnN5
         muKfjV2fOolFLY4SBWqd5UhhiiD8XPt9c5iv7N1t6qOy+fUdgWOEhyJSwnKA/OjiR1BD
         bBPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770222568; x=1770827368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCoebVg7LJUhtIgBoSzk26zD4KI1yijS40SCsrcgrkk=;
        b=BV21gMTY+iZmBv/RxCvloJnRcUum/A6g2QIHk+etHQIWuBWz4P4U6aMXVQTPTEXt7b
         WwOVertx7APTDMnW4bmHijxGXJ6ddit9mp51QxZVExijP1R8jtOLuZg8jPdEi2x2tGe5
         574LTRBCgdw9317CRJxrvSGfHO+CF9nM8H7U99N8wDCGhU6K5LL1mlODWO2KkNv4HfXT
         HLiuYOGyJQfa7z+0RArDdYeEEvnrQACtGVs+cfJE7Cj9PTtCk24Iur33D/AbHZxgjzZ3
         Y9WpsxhZkVkCDaQeyjLxUD/7zTNxVARGyeG/N+exCDSwZXHiR5eUo3srZI8tDtjIdtKm
         0MTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222568; x=1770827368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FCoebVg7LJUhtIgBoSzk26zD4KI1yijS40SCsrcgrkk=;
        b=IvFbs/udP8eUpnmck2USQ28JZHSBWi20nmPhWLznTPBRd1SrbCaxhhoFfxVlE59Y3u
         4/XNduPgldusCwUvYUdchTykUs41j7UrUFGRPOtAAiU5B/OBntcRvEJn1a6BNUm5hY15
         dOyEQ4LjsheTD2/GU2vj1tYpUyaopSB34YuwvL6uQIMGPlIb0l/BZasxVBnS3UetnPxu
         kOE39OhHb5YEsYObYHhALLdnlO9CM/ZpAvoPc812PvcWIOcGiz/PF1lyMlu/KesJeure
         hK6aOk5Ao+jRuO/YXsoeLtCbGuvJxMOA7oZpZxWetxDnngnRspN7MEDKpGhgYyBXMNtf
         AEsg==
X-Forwarded-Encrypted: i=1; AJvYcCXJoAI6TUCipUr6b3bMzGDaW5TnXb/as8dKKOgxlE0sDAqXU4n6+IAjj4g3/CR2rve2WesHdO2VM7W3S5O2aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJbVVsCUQOpCH/pLeV4DtXaNYyyoGEuTEXOqrXGNYNCFm57bGs
	C7WM0rcIE1jCFAKRLw9d957ZQ5F57Uw2D1cMnE4Ki5PIp63OYqR3SwVQy+JCwOWhvOpZvfcFYbQ
	AmuG9UhfaoCp7BCkdrcVaCyRXCgW76TKgMvmtXixYsw==
X-Gm-Gg: AZuq6aK3d2o00qbCdvT2OhpkLFqam3CDVzkI1etgRWdIKuZn5G7jnweYiY48se0263G
	bHkk276sQ6UYKub0W054T05nsRCDf+VlACh7+g0ChpMgrVCbEOP1OvFhx3hBNZuso4fbqe+Pd8w
	t4g8BsSnM8MJAm9DiHfpXrjkC65amlhONF7rfHGS8vH+QonsNG/STWd/zt++sbXBvZWS0BscyXS
	PgUiV+VCAWRC3JwOq85GllDIdyozzJ3TApnuoMq2h6BDSvqfY4gspdE7fBu7n9wGGPnUCiy8CY2
	hcK9Zip3K10BWL2JIbT8GeLQJDLP
X-Received: by 2002:a05:6512:3a94:b0:59e:35e7:498e with SMTP id
 2adb3069b0e04-59e38c0c06fmr1434494e87.20.1770222568404; Wed, 04 Feb 2026
 08:29:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204155037.325482-1-marco.crivellari@suse.com>
 <20260204155037.325482-2-marco.crivellari@suse.com> <aYNxkG3gCspeeW9_@google.com>
In-Reply-To: <aYNxkG3gCspeeW9_@google.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 4 Feb 2026 17:29:16 +0100
X-Gm-Features: AZwV_Qi2OHI1vkZynumslMgY9va6Cdue0o8AVpS22JfQfipmEYF_6gUiHe3EaPg
Message-ID: <CAAofZF5GZ9UBLNH_+NRSyXW1114d++TfEc3EuBiCpPkdwK1pUw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add system_default() around the new system_dfl_wq
To: Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 5:19=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
> [...]
> I don't think we should use different naming than C.

mmmh I think I misunderstood you here then:

https://lore.kernel.org/all/aYMk5skDB0Rk7vWS@google.com/

What do you meant?

Thank you!

--=20

Marco Crivellari

L3 Support Engineer
