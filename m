Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166AD49A3D6
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819337; cv=pass; b=T7e3Cl6/d+e/95CZyZDm940VXnKuO1bgNwCF8Yj6hJ9CmGQouAbbyoGx5NpXObAaSBbBpkxq5oGNymYbxW7pNJI5CXyLSvTCCpxCBJ5KakoztDFvISlqhBPt9o9Ft2hgm3FGcHjqzJG8cEyVnl0q+AE6PdpIhv17CQhGBQyEQU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819337; c=relaxed/simple;
	bh=2SYCaADJ/1XN3Z09u7jPVWHmXzxu6QRBwXYpcJ9mhJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e3nfAZh9GQL5juBMF0QaG4E48nH54hYDFgBKNc23HRNbK1CSrNG7Jq8Oa/KIzYRcD3pNN3iyv+2eu4p4CLD6rk4iWNNcJRXVSZy30ToAnCy4WpIUNxepZB4mSAj+Dh1n6j+cJVCIHEb9pJybUaxA26EHS3OX/4iLdeK7SaB7/R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5azZG8u; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5azZG8u"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33c30fcf33fso267285eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 08:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791819335; cv=none;
        d=google.com; s=arc-20260327;
        b=icjvts8cL/H4HPWkzrmnvijcjegG8kPcpvHjLciuClIKeqonXHQ5wKZjO99vkV8TSb
         l7llmmV3NR71P6iNZSWsYD+sq2V6k8rQonupz+nuPuuoD9J/PsP4qNnXKmsU5sW1k/Lv
         Zg6hLBAYm7ujLJzA2ChoFFuAKXa8iFRyR0RBfX4p5kXsBZoc29+BJlt1zi/BUtLgDD3F
         AThlIdIRt4bTVdt3p2zLus2C1px8Qus5xvCW+3kg+gXQpm4rgDPzd8w00T68xX2u1JyZ
         dm+1zPaOyFUmd5aFhrFLmIDzifyGqgmrTOdgj32nGqPjrtNhL7WFBz722/86koxMbmOQ
         td3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RPjrtb7l936ef5b/bGwD+WeOePZE1NghsYuXVPIqEwQ=;
        fh=lfHNpeoOLZarJBOyvQxzWA1ttlfuB8CxnBig/5xADbE=;
        b=JqE3JkX7QxDa8DiyqkC8Z/e1KdZjPDNVp3BRxrCPD3UoOupLdcrR2voflmmSx/TkZZ
         kH9sUqHh1rSNam5aWcsSzInQKeg7CvbRai83OHati2n/rlhY6BcayfXVd4pMdVY9A8e+
         QO1FzEuLdWmDrmLLt+FbhvKnplzv8eXIo3aKZZu0SaKYaPEc3WIXtb03D4j8Urq78B5r
         3SuD7uglZx2V/vR6SJa3mC+J++AVWBWy3UgE6WfKnAb5OI2wfu7Mv+WIZl5kpc6a+6GK
         lf73nNQ/64aGY387vhv/tGCjRBR6EcGeM+K6eokvmADySKjzsr1w0CAW2rhfkXvK4UiQ
         AWzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791819335; x=1792424135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RPjrtb7l936ef5b/bGwD+WeOePZE1NghsYuXVPIqEwQ=;
        b=L5azZG8u2hVcCBYyAwd6KLMxIQGZqnUvxbuq+e1zy6AXgFFo61wqS/Vkll5t2r/M6i
         E9HejMsjYd6CqQQEuAukSky89KdtRknrUM3NuwMghOFI2xB1m8U3v3yB3yW1i6IP5IN2
         nEmz74Vo9Y9HH9NVLCGrTgntPSh4c5id/e7RfT3GDVxQzw0D3UFmqUnuqcxB2C73Nxtk
         nN+9CfgtXJNlKpd/SYTp01cCRtPRUklGeMINJjQptbnD0Gn7JP7br8BNSrHVkL7G+Xk/
         O82LzM6NVlbUb+48YzLgwQg93kqKHiW7xW2JPnAV/g6F+HfPdFz6ZSLDHRr6kPwGjbSf
         dC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819335; x=1792424135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RPjrtb7l936ef5b/bGwD+WeOePZE1NghsYuXVPIqEwQ=;
        b=I2+FPT3kDwAQLh549goAxL/UdwLVjAe/mv2CXFqxe75pIk0K4hh9qUMUrJlIag6JtQ
         dA5XAdoHpxMCJELC9dS+5S5MKO/6PIvBjFR+CaN7L+fDiYdR9tqMqOFAQgh5x/857wfB
         IZwkUaaDzEF0HnK7IqLnw/PEWHSL43upOsJT9OWdCiSvmOUxuvPz3L09uTGjLzVrNrBi
         uGvB0lx3jDd3p+cIOdWNAnN8rkVI4v6lGFOVb1uMy1pfj6aJf4R5m0jwP1wMpCKKy4RU
         I5Rl3lY7gIF6CyTI+FxKsrkHTI1Kpb3sW0hW/4dQuGgQC8DXGbzPGjncQoCNOJcRD/OO
         NE0g==
X-Forwarded-Encrypted: i=1; AKwUvBzboikFY6peiricxAfylfNYmdJDkMbBczXG5v5fnK2reIKt7YAw3stVW8ct8rBfqkKIo2XRJPjkt7iimNHt9Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ2ustZgS5l4ryAmA4Hd4k1Lk7j5QzG4QFw5Zcvgp6C88tT9mD
	WpYI+hxA6g9OuRGXfMkVhPSz6zOjPl40lWfhU5eS+p5yfGKo4QmNUC2/p96Tw/pF5qdjp4SA6bi
	Hoy8LLsTrcCBEMCzcFmoDnxApo50TqSY=
X-Gm-Gg: AYBFou1TI01ctYsZMWRyTriNI05ll8nS+YETLR4bPCFdygGnISAI46gb8o2GwbwBopG
	SgXuINxMRDjyfKe7qkADL3AHIpIKUyVV23ulxb5TKoBjmW10Nnndb5DpMsnlACcoeX34yL65kCb
	ym2YPNH/Mwmzd8viKiQnHcAXFr5qccYCY2oiymiBxwx4aPAc47v3hTJZ7vEjxh7b4vCx+ZHTgt7
	0FpZbgBCL9aj7S6DfowMl6kfr7poY7gAkCBQksEGMVK7BjkxtI4uOX2fkUNR/PthAzB2PU4ZfXk
	2FS8CrfLhIAYF0wiW5kt4FId89x6w70zOcljwH9d57O1LHgRPZeYF8a7k31DiRJ4UrReB/6wPhM
	rcs4ByA2elRj9DS1xc0TiB27DsCEeplpojcSRZecgFk8ETvshnjOL4qIUbckHrnh1QF2jTyKlY/
	XGQl0YBBbJ8idZjmfoKJ2/JBXEr7Mbc6rQcHUusVNKcb/yjowjfiKHMT+86zzGqg==
X-Received: by 2002:a05:693c:8810:20b0:35b:cb5b:c71e with SMTP id
 5a478bee46e88-35bcb6b1c6cmr1545025eec.1.1791819334971; Mon, 12 Oct 2026
 08:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002104550.2877930-1-tomo@flapping.org>
In-Reply-To: <20261002104550.2877930-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 17:35:21 +0200
X-Gm-Features: AclHuK85Pldtr0ECoOLRtFhNaahZKiLNXk4rmJudeZbxydISuiGxggKATO-0hgg
Message-ID: <CANiq72=pvipUs95sjkyk=NTwHK3AT782VB5BACJzuruW5tSzZw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: bug: update the SAFETY comment for
 warn_slowpath_fmt() on UML
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, anton.ivanov@cambridgegreys.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, linux-um@lists.infradead.org, lossin@kernel.org, 
	richard@nod.at, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 12:46=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> The SAFETY comment says that it is always safe to call
> `warn_slowpath_fmt()` with a valid null-terminated string. This is not
> true. The taint argument must also be a valid taint number.
> Commit 951d09ca450c ("rust: bug: pass TAINT_WARN to warn_slowpath_fmt()
> on UML") fixed a bug where it was not.
>
> List each condition that the call meets: the file name, the taint
> number, and the null `fmt`.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-next` -- thanks!

I added:

    Cc: stable@vger.kernel.org
    Fixes: dff64b072708 ("rust: Add warn_on macro")

so that this goes together with the other one that actually fixes the
issue. It is not really a user-facing fix, but it seems to me that it
makes sense to put them together and to avoid a de-sync in the
comment.

Cheers,
Miguel
