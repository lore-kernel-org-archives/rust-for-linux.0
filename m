Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D3E421F04
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 17:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774546298; cv=pass; b=KVI/cq261vOLrB2u+/mt797qpFvmGsAGRa7Gv6zcvRL+kaKnQuE+Sr8weypI35/oh3Hd8ACsxl1hCRuZh3DP+cFBOGPRD8Gb0gjmFcwXYhWqiEbE055GI1y8I9cCqW7obkMYPVVk8Kn44tjnjRNd9Ieq7H1fpMAFZtSwDPzY2BA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774546298; c=relaxed/simple;
	bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nam6tNveshGG+VYbZ7WMb7NVsgQ3jrxG4ECDPfowO+UImT4j45bVhdRjwXkALkqkvxVEYW4Jvwya4+Px/WiETEodjKftNHFllR7bOSmpmb1Vrcx4LMt2bxP+l5f2Y/MqdLwt4s3CZ2ur5WKQ0/zaojqsLUU23HKKMOQibglLLqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rM1jUvbj; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rM1jUvbj"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-127148c2112so102972c88.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 10:31:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774546292; cv=none;
        d=google.com; s=arc-20240605;
        b=Wf61+f+HdBbhaB/YCH0lJL9TFhJM8WpYyWMTI6wXWxa+0CSjyd48CNLaEo/aoD3zFy
         lejMC13YJX4papynCZ+IvSDP50HLX4NRsaHmwEIZRePGybL/JV/TKx8Vb1/T8lId6snC
         /eOC7VZI0Yxtmj4ElLNI3ssiRb0pPN6FEI9N1y+l/xYsrS4XtTalG7X6bNmLerseA9ZL
         TdNUt5Qzcmt+Lq5nLbdGt7rrjUrNqr0+R3iVwZrtlSjmKk5qHxT+H6FkmUEoV89HekzS
         rogDMnsCW2jeARKOwmVvg41kPJryVUhCAGQl3Wm0eZxcp0ZDFvD5VQzXEzIydcEsZjVl
         L/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
        fh=RntlAcaHWigaoMw/WNNypcigT0DrF7fwH4odDLTKDj0=;
        b=ZThigkRtlYWATrcz2ZR0Yt+UgUztQaReuQKTxf5eFFgs7YljxCzp5NT2jXAy1RrJnK
         EAtswiqfXgrNDWOor3xY0so5QLKXbb6tkVvYclAhX1jr3/iv2HW66MZHpgIpdkIXvOHN
         q+b7RuBA8uxkXnJivGqLo6WwtZvMna4zAjn9J+woENRtstFMVZ6Uh95+ihbTQuGizTvP
         k1ZLSC8r4h2j9Ep192cLMEHPk0fD2QbqHpoPOZyHyF+hV/Vo38Jf4gLQ55RgVVmKlCd7
         B6rozNk8qeec6cBfAv8XUuraouq8ttwljDMEBn0IpSpIw+1ImbO+1KKKswEuRRgsc02H
         HObg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774546292; x=1775151092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
        b=rM1jUvbjbfocQg2EcdOe7K/Cps45yYp/nwzXMIXIfP6ldLDskv5xhW7mUVt0d+HFo6
         FJ2ZOTg5yFRhagiEGy2zFeaCybwAaSAVTs+0X27nAcnfCADgjFWN1EV3BDapHeIZylAG
         GLkkgjcWvCk8sIYrAO8Z752AK8KqKwIKj/kPTSXQnxPrtHaXKbwiyXQDIu5pRrgcQu6h
         afXwPZHjSYqId0p42qtl5huMHlzuymQg0GPQ7HWsUFdAavGk2XpRkYOZl53y+t12p43F
         dy4ztNh6eOLiBPoiIGIYIk6rgicG1sb8M2taPamP/8fyBktx/MbNDG9/XcGEuv3kpeEw
         KlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774546292; x=1775151092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
        b=Ifh/jzHfTIXK5vWwdBMOkCPEvWEK9DhJzxxI22AWbBFxteE1sq7lQ6WqOuazAKx2sa
         ZGpizPJ2tjzj6jrHaPuujoWpHvXc03qOCxjgFmzaP0f2pCIf8lICuk2vQdYrA1VJ25P8
         vMqDqXuW3L0QEyyrX7ZO8+6vAtsQ0vNhtaVTrVCLFd50VdZcQsR3ISvVoamjtACYItoH
         hDEfRyPJwgvgF41Z6LTebc/WMl42dDsXfHFJ9gRDCsatdHtzXXfBDyT/s7c+A0AeseiA
         IbI4Iq27mFkg2wsMQIzfauDRNaOeZzCUxrF/eoMZa6P2R7gn1aLQYovglp5Hh5bVSTzR
         SFIA==
X-Forwarded-Encrypted: i=1; AJvYcCUS0XgI905vqXKDdxvlgqf6ATPpC0j8/pDycUoQzOiiVqvdIEVc69kRnW8zee4h82r5pfShcSZeGPvGpNEuFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyaY8Ad45O6nOE5jUQvULOYEWgVSZGeF24G45V7MsnW1paHqua
	8PqZsk4I0DDH9CciTx7bBwUjiMmTrl1eQhoUe/oo/7S+akY1UjyelTgInmnLDdOSXsVRLTdvhlw
	E4FM8M2qECtWViXs8lyABoTCDcJEbzhQ=
X-Gm-Gg: ATEYQzyw3m+tilzf2fsw10rCy3hh6kknzOTpIlmTleguANfvP7PB5L6w0u3pRDhp918
	lvM4hj77omIsjCk1cApm35BF/FOb/tC39KoTu5YZeH+mPImNtvgPMJa0OZ+baLVAWjvoIsBFTHs
	L7+tsb1Nh3sjiqIffNQgoi/dLzeJSSKYP5NPlbBIgc2shIWWkrPY466nQA4o3tfQKjNrj5QEjwa
	Rx89Jp7nVXoH6Hyo1+kiIk6Zvkt+x7mYsGRu7TnSCiXkB0QcS+MO18c4Nr3KpkfWrTBF/SbjhgV
	dvv+N/8SR93Teg5d8LtA4Kq3AQvRHOWepuSwua6/iUfNroeV1fo8En+vR0wltojb5mTt+tyUtTC
	Lf9znyd+DDPAanP4r+Jz1Ng8=
X-Received: by 2002:a05:7300:cd8a:b0:2c0:fec3:fd2b with SMTP id
 5a478bee46e88-2c15d3eebdemr2110432eec.5.1774546291859; Thu, 26 Mar 2026
 10:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com> <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
In-Reply-To: <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 18:31:18 +0100
X-Gm-Features: AQROBzAY2TUlph37K4tdyrXW3PnWDmlLF1E76Ca3evvsqWc92x8ByVyN4OKTlu0
Message-ID: <CANiq72=fm7FnfM2iqOLvsgxxx7X4LBkr7XU8=LWYqSzQ7zjJ2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, anton.ivanov@cambridgegreys.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	david@davidgow.net, gary@garyguo.net, johannes@sipsolutions.net, 
	justinstitt@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 3:31=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> It should probably be fine to use armv7a-none-eabi. I've mostly used
> arm-unknown-linux-gnueabi since I though it needed to match the
> bindgen-target (which is -linux-gnu for all architectures) and
> because from what I understand clang also uses arm-linux-gnueabi [1].
> Also when I selected the target I thought that we would also support
> armv6, but since I had no v6 hardware to test on I disabled it.

I see, thanks for the quick reply!

My current thinking is to enable this only for x86_64 and arm64, so if
you/arm decide to switch the target (and/or enable this experimental
feature), then that can be done without a rush, independently.

(Please take a look at Russell's reply as well about the short enums thing.=
)

Cheers,
Miguel
