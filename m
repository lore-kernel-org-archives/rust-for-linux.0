Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D9E3AEB5D
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 20:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900141; cv=pass; b=WL7xCK0OAoD7Qn0TqgDDZBS1Sm4iEAG84bG+a8wAEFogubUeMfNiL7J9pXvZxVMKfqSMdoL+b05dqOP+9TSssEUAZ4+wU6Yv6De46wb2oKx+Xk4neYHLHfcoMXkTejg4mMFMlBKnILFJISFNFSO9Pol1LxBFiMbDof0O4xstMuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900141; c=relaxed/simple;
	bh=YXw4xZ0v/Cxtbs8sJocHH1yAxpgZyNfN6cPwywVsllg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmWI3z5vKjhe0AA0y689E6Y05VMt7rxd82r8KHMpYqZD0vtOXbQcmBYj1wLmdGilN0xQrxiLJnPbVfps0VHT13qwyGJD+9E/HP02zPzKK+7tFEn7MSYNnhODZ6Fi2eAUKAZ0iezzziZa46aC294cbAZaHkcVW5MHa13/Lfx4Sxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXYM8mcp; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXYM8mcp"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad861b1so710804a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 13:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788900140; cv=none;
        d=google.com; s=arc-20260327;
        b=EbBw2NPRWOTYClv2uFT3bpMvqm30+sqcneiq7oHyqCsWr0xSPlqG9tjz3sC9yV+Ojo
         dixDIE2/XcUb6LLDTWyG2Xty3LNNU/8WnufVSQFHzkpG8l3QO476PxhqHdflH1dCcu2P
         xlNMJKfmNCEUk9+QiZBW5lUv6zFZpFmntYtzQBjqnS4nNJQCufpvNvhBLFwz6MNeNGyb
         Spv2Dmss/H0TBe8IS5W6fCUxX49RRHa8IvYDgymaDs9YDkKSueaV8g3C4pgJcFreM5Dx
         3RMgsLQgRBkE03vTYjGdsnYdwMRRGBFJJaclTTFeTlympBl0mrWK/99JwHgaLgkHsLMj
         c4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZEaDFgx7MxTWxz3lTSDDdfLwOggUV17sJK/9fefp6L0=;
        fh=YF97GlyFMMKH8s7C9IwmMCxfmuHYNXk19wLcedCF0J4=;
        b=kuiYn12taq6javgARI0XCR8LcsZL/2PEwyMeQXznUBTRSKi9ut7ey65EMgG2NAP1Vg
         WE91A9pOj8bGWxtZW7bWIlGx47mIDaZGEopyeAXYtTKThNbB2Jm/nHxUulFCr2sLjeCx
         zTE8X3e8t1myJEu+EacorCw5YtF6bagiBU5LDx9mSxtR813RHe1PHhf6voZLRRyTw6dT
         lyYlYVQrAbjc0t2j3IhMdMTgk9Z4hSxe2RgwAs0ErgpVEk19ZFUzN7g9bMNsxTSFn7lT
         z4prPv9cBvihEhrmhPZH9oAKmFMzAJqxceM/1EYsdBLwLkzIGhEXmFQX7krUp+DR/AS8
         2BSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788900140; x=1789504940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZEaDFgx7MxTWxz3lTSDDdfLwOggUV17sJK/9fefp6L0=;
        b=IXYM8mcpNhyNz4YzUuAiVnm4sPVeUu16RtkboQc+nSoGYzUj5TeCcWe6juvXwMfEnj
         Rgxqfh8R9dPgo0rBvnozKaDDoYWGbKmMANPaWDdC9i48BQMMzFYkyEEtI1f4BYJOGFyi
         GlPXQ8wDKqoeBzajgrDnDqf5ODVXRhgcXs4vhrgP11+0UMnb8eEMyHc2wcpdgc7ZeYVk
         Gn7U9PnMVDdSFrKZrUt6vYLgIuUwuEpLJMHvtDrj9gp0jfa1hji86O9zakLrUYYM6nut
         Qk8JMvJHlls0r/pHbaIhn31ih/goj83to6basZK4u0I+4jiPbFYI8CWPVQA6LQ76GLY/
         taqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788900140; x=1789504940;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEaDFgx7MxTWxz3lTSDDdfLwOggUV17sJK/9fefp6L0=;
        b=H3AM2yjlduQYU091NdMBs+ytIt/CXiLzddjYASzEIiaAnwy/8OmU7M0Oj7JEFZgFqA
         g7lGUd/wOiqEUnLrfTUdHC+ipkUClj2somhfyDVytzW9caT0wYURv8uaQl/fAOIP+NkO
         LxoMCeNOZyX436evaL+TK+OlOxtYNehi40tquaOIOc7swqR+NNYqTbqPiNlRxGz3MHS2
         IJBnXdFoLc/SkZ7ynaoi7XblOU39Hu78cqJxtr7TRaajv2C0/5pF33/qPYKSGIRVXOSI
         9y3uFH1nBNrac3UPLL4cvN58L0ZQxW2Cy4qTHdC5cSTse9STX2cVzlMHIOTzhK6CM9mR
         5cqw==
X-Gm-Message-State: AFuF++lUXni+8aH4qbL9kZ3i3K69+0PlMSrlVkRKF/L/6HmfvZUaMtaX
	nl5Z3oSdVl4xgTdKfEzeUbzvAQqoUKYR23YTxFygZkHxRktLiMJnvhYANOGnwjS/Q6VWPpP3fsw
	hbUzn73N05FHfFewBFrbMWt6vYJaNpuDo99QPrqI=
X-Gm-Gg: AYBFou3Dm6cq44LU03JcS65UWDXKYB7pipLLoaeq6VJllN8nWTwUWMAySwTg6BJ4ICf
	O5rv0t9G2QSyRBNRUpVo7IqWCwFpmglcisOLAkzbFK35KIxkRtsgzJXqv3c8dAlIxwGWweiHJqQ
	VL+pabkAr+rP+rZMp8uDkPhMb+9KRMR9E7BG0rZEiGBWThjP1a80p20zYsGx4HPUlDRnYrbUO0W
	anKze783ZlowRs7vMXszMCXbAd/CkiBUiFOkWzvfbplvZ3Ew50F1vITZgpGEP6x+f4a5CtRVBC5
	DZwprGlb+fkgJoq17vf54IUwfBvKZMeXcXKMdH5skrNMBt+T1Fl1lUM36BhCFceOqhZ8yC4vpPL
	OVEbffYt/Zm1XhhkrQQ61i0zcvio4TZz7aQjlVuo05AUhRalSRNdtzY/+DZ1d+R3VUVjkSY5nX/
	OjjE8RQeB5DTrf078WszU69H4pnr87lE52dG5ojK7kOG0XEQb8fnY=
X-Received: by 2002:a17:90b:3a48:b0:38e:480b:99a5 with SMTP id
 98e67ed59e1d1-39b3d5e53d5mr20657459a91.2.1788900139529; Tue, 08 Sep 2026
 13:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908203850.952156-1-mohamed.osama189110@gmail.com>
In-Reply-To: <20260908203850.952156-1-mohamed.osama189110@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 22:42:07 +0200
X-Gm-Features: AcwNN1XAlwKznncSyvNy4CeitfiGGzd-Pc1KNtKCx7LJ-xn9WktXMBJqmxmI35U
Message-ID: <CANiq72m_9_mSVZreLA1DAkhKfk6cpDf5AJ5zhENwoaosKy-Gxg@mail.gmail.com>
Subject: Re: [PATCH] rust: print: document safety of printing functions
To: Mohamed Osama <mohamed.osama189110@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:38=E2=80=AFPM Mohamed Osama
<mohamed.osama189110@gmail.com> wrote:
>
> Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>

Welcome and thanks for the patch!

The kernel requires a commit message.

In addition, please see (and maybe help review!) previous attempts:

  https://lore.kernel.org/rust-for-linux/20260729175305.723486-1-cianmcguir=
e167@gmail.com/

Finally, the commit message should have the right tags, and Cc all the
maintainers and reviewers of the `RUST` subsystem from the
`MAINTAINERS` file.

Cheers,
Miguel
