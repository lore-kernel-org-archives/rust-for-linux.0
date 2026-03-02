Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886CD16132A
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 04:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772426507; cv=none; b=qwWTu/IXF5RbUWUUtiyw7MaxkqDj1AlDfOm3AH+3zLzlNbLUht0GvLTKC2U2LMQ+ymDj5hqrh1eKX36fban8Sy9gEq5Y+EwmwkfQ2qdGMpjYLS2nzy4A31gX2/ONG/R+wpy5iccHWKAyHKlte3Qm49VSEm8RVkCvvNajGbjUASE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772426507; c=relaxed/simple;
	bh=r12T0BHDr/VgtXY8OdzUiznMupH4NKfZsQudEcgivDw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Vq71WbYV1amlUXAQcgt8lDpsiuIIJaBvSjoZ2HMWTcgbNPyUtpllWWKDGLOMo7eOXEAYamLS7Pj16w2MEC3WJUDzD30ZVNtuHepAL4TelsTI448K+xwUHnF5bUfTLYWZz5hq+V6kQjlgfeErUh2ZOr05z2N2hF2I0hhVBBeAPG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIUGZZRs; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIUGZZRs"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1275750cf9cso3091419c88.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 20:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772426506; x=1773031306; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEdFoO+0diFiw3WTsgvpxOU536f11KaeaBqMvGKLXBw=;
        b=VIUGZZRsFK6sL2HIR5rLWAYfprMTYfUFVWOP0hivMJvVbWbyH8e/gqsm3GybXn7mZH
         siE8KEzqjYUwrlZRDSyafJRNKux/m9S+50E0vJxWnr8EyZNhz2XEOhMm9RTDFhxKotmf
         n/mIa8IhINupTZqmqz9fIGuHT5ZzVOWprcIlsDWHi9YVHrfDFGtJBLK7+7xArJGno+F/
         6DlZWbYKTwZVFN89UjOUyMSQakxE+nn21eMqRhCBLTJCGSHp9OM8xvuvUpTEfRw8HDXF
         WF7lLj8HX+vXGbpJlC5Kl5NJGm9SauVxVUHV04/vBOMNc5oF1MBVQUUV3gHpW1o/LSaA
         1MHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772426506; x=1773031306;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEdFoO+0diFiw3WTsgvpxOU536f11KaeaBqMvGKLXBw=;
        b=onMc1iHQ6OgubgAXegxsEmiRsebaOLoD1gbbO7FYmO5oajiN13lNP0xOzE11NhkaTy
         IjePKIdY7PMyw+d/dLxXAclSaUBxhsF6Mdg2G6AsiSvyNzGjF8kxXk3M9xsluvX7zU14
         LKnUil50Kxiyb5f/jV3kZBq+kFr/9JkEXO3Ak++Q/jNTVA1ihdX/z60UgMHHwy9CGbvX
         7GjApp/oR1yW1ZUbY03C+tbJtzXIXze0LWtQwqbIoIg7rUHwTTasR1PG53SkpCPQ2YPA
         4miq+Jag/YfVtFvm8zeUgC9gNHK/u+a05O37S5BnzDelKgWEca5kY+8+bp+00Q8ruWdf
         N5lw==
X-Gm-Message-State: AOJu0YxXj6z3anBHhvMEXsyKGocK4WCaLWEPqA7LNZIvdGF3PJY4LkcG
	cMGUK10wHNzsNv0pt4iPvcYFpQHSRfByk14drSFX3otkKOvxcyPF5BFC
X-Gm-Gg: ATEYQzyWDmFG6HIBnmo90YwNV/aZErgi8Tqrslv6Z1PRrgB5069V5ltsTGX53ayJkYA
	lm5xCTvaB/fV4Arlfk3ttjqH/hIWFslZXWijCuF+m8zVAWbFx3ozF1NvUSkjRCV9i/ur5TDu6Mn
	CqpIcOVA/N9I+V5PvkdeXM0Q67+VRTyk1b3BbPXV7tas/f5VFJp38ObI06iM+X3tQnEYlU+XgCS
	RUdsrr5JNnO3r7q7JTSfOl2B7nIRdhBlyZdyL2ho+haw3EI0YnxIpXDaZ9v2+eoGTl3uvCVeB93
	lUXF1TUEWG0x0p2qKtdJb1BXPxLsDAe7MIlq7tj1twgN+6qE0EcRcvlr7Km1A2AhY9rUC6OuG2h
	jZ/VwtoBN9sp/Bcr0muu9PjMv3q9C6LkiETC3dmWVpY8s1hoeNhLXDlEcAAmvl65Wx27etW+uoP
	D+sml1gS8yjcMRtdGaKfASru7ITUlB1aiT//Ij2cIPqIpTMJCy4ddqYes=
X-Received: by 2002:a05:7300:ad2d:b0:2be:171c:5040 with SMTP id 5a478bee46e88-2be171c532emr263438eec.3.1772426505477;
        Sun, 01 Mar 2026 20:41:45 -0800 (PST)
Received: from localhost ([2603:8000:bb00:9b3f::18f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdfb3f898asm4442903eec.29.2026.03.01.20.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 20:41:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 20:41:42 -0800
Message-Id: <DGS0RADS6WDW.3L4MGITVFJRJI@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: add projection infrastructure
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260226154656.3241736-1-gary@kernel.org>
 <20260226154656.3241736-2-gary@kernel.org>
 <DGQZOLAH72HC.2OE3REDD7M7U7@gmail.com>
 <DGRGYFHZF7PF.1Q3MZ7C1SBRL7@garyguo.net>
In-Reply-To: <DGRGYFHZF7PF.1Q3MZ7C1SBRL7@garyguo.net>

On Sun Mar 1, 2026 at 5:10 AM PST, Gary Guo wrote:
> On Sat Feb 28, 2026 at 11:38 PM GMT, Aditya Rajan wrote:
>> On Thu Feb 26, 2026 at 7:46 AM PST, Gary Guo wrote:
>
> Good catch!
>
> The code below
>
>     if self.end > slice.len() {
>         return None;
>     }
>
> is rightfully `>` as it's okay to have end being equal to the length. I s=
uppose
> this is what you mean by "somewhere else in the code"?

Yes the second check which i was referring belongs to `core::ops::Range<usi=
ze>`, I agree with you
it makes sense for `Range`.

> This one though should indeed be `>=3D`, and I've obviously messed this o=
ne up.

Patch looks good to me once this is fixed for `usize` :)

Thanks
Aditya
