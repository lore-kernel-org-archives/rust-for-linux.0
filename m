Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7065034EF07
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 21:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013942; cv=pass; b=AWMrjIwr+GuPD7ixY+NwSosHJgjZFZOyskSy7c6KGwvGqp+piPTmZeh5QHqzK2I/UQEuc5ICw5OoPAFfbaC52TJubRJYKbAv48w2sCIiMRN80LBQMH8SsMR2Wuhq3D/dGrUE7Ws9l2YouUrFHSlywYxbAtsngNwNvZJKOgC/WgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013942; c=relaxed/simple;
	bh=6fysRVISsRCgSjjNd6NMwPvN9Unra7OKnoCFbNYCDUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YW/+fzy5+6vOCAZijVyb6myIorbZqsEK4wW8857EojW//FluN9qhgjUJa4/khe/gM2VPRhj/mNIz3lfZ+3EWcGusp9G8ARUqmilaDEaLgubgifLIMMwVa2Rq0BXdQ5HO0gOxCGzSCTAhO6L83PFfOU2gUTb6rj+SwJVJfQNJGsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=U13HTggy; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="U13HTggy"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b8306b9f8so52529506d6.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 14:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792013940; cv=none;
        d=google.com; s=arc-20260327;
        b=Lp3MwfeAJ79Tpnrfp0dl5eE1ZNjb6OSUoj5nAih5QFBka9Hi/XIHChp5y4FEKAqXQe
         jNZ3oOgzT6UmtuHLF1cT20+cuxFQ9KCyRDbQ8tF+qE1gj7slx7Bm2q31SQrJREFhmhkl
         6iXO9S+nOCsDp90+b3d1zLW8hpc5LVR/PXjI4XbPm7K2FEQCe4Za208EulSDKm41SWxU
         wolp6xA+cwjtGi35OiDXpoH5nMIa8+7sdDBeO2oDjzqvuaiAvATFldKQGIEUbNF/Zfj5
         VCac1af64E9vNBPce2adDNgOkONw7K3p6fIvTQSbBv6MnXRdEVByx5hddqPBdrEUTOZY
         ZBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6fysRVISsRCgSjjNd6NMwPvN9Unra7OKnoCFbNYCDUs=;
        fh=17wgcBX0GrHSVLnchSShjzMwswGhqHM/u3aKJtoiqZM=;
        b=sPr01bNzn/KkhKwi7BbSS8mh7ykLJ0aBR47V6poJvQXpTsdtWeFEP1JBCx2MoERCIK
         W7MacwcpQdVFhDIsE/kU/jRvJNHWS+DYjzVTKuM3EDMzz/DD0eWrbaVpeP7lUY+9HFwn
         DRaPbHT4/nAD3C1+AYoS1A4d3UmuCAGcqAy7gEda2nsHsQKccYQNh0c/yY8WlT0T3YNW
         Wu9GRvVXWU450QT8ptl5chRgzExV+5kgefxgFs2jWFlq3kZ+6mQao3ihBey2Is3HD9jK
         JlF/754JaTy6mZz0PtYo6/9G7nBp6WM49A34udAD9XiV6vgFl+Xf9fHb2VCpCoZxCU++
         9KQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1792013940; x=1792618740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6fysRVISsRCgSjjNd6NMwPvN9Unra7OKnoCFbNYCDUs=;
        b=U13HTggy8iLBTSW4MGhW/2tzJ/Q5kXIgkYbeb2Dg8+5M9BLGOQFuNLvIGA+TdL47wD
         slIB9BiyI8WBM+acdeE7vW1JlkW2nwK60HVeczQHiG5GxAm2x9pKqnBdbi9/wGrOPLJI
         d2QaLlEasVITwtMN8J2GbZuIeMjH5ZuSPTkFT05Xn9Krr8lpytfiAMCCi0rJ65F/VNhx
         nwZ6X222GSsxfG1ERFp/a0FqkaK+hG1JoquXTrmOtQ/h/TJJWT9uXlDIP6kjkCN7l2tM
         8q020pmYsQZ8Fc3X+jRU3hO3s2FozkRx8suGGpPIuj5ZeNRoxplrTTIKbZQpwRGuxTlt
         3XpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792013940; x=1792618740;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fysRVISsRCgSjjNd6NMwPvN9Unra7OKnoCFbNYCDUs=;
        b=vsEbzqN0pccss8Qe10ojvRdPD2Htufu4cvslePRoiLpvbdhbBdDz55O3z6etFhaVI4
         cGUUSAoLzlSYpewEwyBsGxp0BPeMT866YvpXwQjrgB/P4Fq+t2fsj7WDoCD/NoWRlyvk
         4flb5pgRbfk3trnR/vvMJqkfMWZPBJV++ceNE+OGoleRheqZIbX1pKb81myi96sAV6wB
         XK/xiCJbpeKj+r0i8vND/4665HUxNVFchn9bRPeX+/Jtswd0tGpomqvTpVsqOunO9OM7
         yycculfXjrAqQuX4bFyh5VI1977fmMsY1Ir8KODkjekip3hDeuZAjnUDbeJDHWf1JhlD
         mhvw==
X-Forwarded-Encrypted: i=1; AKwUvBymw54mLX2Zw1f174sLk98xg30kDcrMBfwluVeGau5Nuw9KWpTQY5gWv2CrDq+fTBtD04sA9BANGj2zkknb3Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYK/TO8ciaQ4TXjCZPzRxnFjkM2DFPiYi4sapQyL2P3SAptivaR5
	/wfMH/gQ3UWQZ3L2d7tUFcJmtW/bNu7K4kNFNWb6AwuWVXRPdKzHLFgBE5PCY9PP8KZuNr564iH
	6JJ+fgmHp1mgVUG3alGI2LcFFnFAaWs0STkABC8KuSw==
X-Gm-Gg: AYBFou2EZ3ywwlBhapL+d7k4cI91pY3bLDsnvxVGPOsTCP7gAjIqV23gyl4rdmKcAYU
	DCo61Y+U4IPtyt2pBwpk8i+gpCyEEcl3xpFqhcsW0D8qgeZzBFBHaIXZu1QKg1Gs0YPBDvkl1tT
	/hgJx76bICOFoPq9y/Plukf1cT1ge+sQ2ydYqDynC9u+e64/40Wfrp2dEehqXLrl5I06axZ+UzA
	VwY+rw9Waz4Ct10IW9RuV4qruHc0q912mSxpf200645iQCWunDLpwpncoPfk8k5GtTnnWszvu6b
	cdRHD2CdNWjs8AtxOxXVpU7O3CveC3Kg5l+2RiNpWPOk0zDoS7jUwFCh7AwRDOYiI34KIaLZTH5
	0LKhSvZ538l2jzRpvV9v7SQ==
X-Received: by 2002:a05:6214:194b:b0:919:85a3:313e with SMTP id
 6a1803df08f44-91b554c3f01mr295872726d6.17.1792013940227; Wed, 14 Oct 2026
 14:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788901318.git.pgovind2@uci.edu> <a71c5593cfc66e21f24d9c07ae3469fc4f8ea501.1788901318.git.pgovind2@uci.edu>
 <DLSX1QUUMSA4.C3YJIVTOC2P7@kernel.org>
In-Reply-To: <DLSX1QUUMSA4.C3YJIVTOC2P7@kernel.org>
From: Priya Bala Govindasamy <pgovind2@uci.edu>
Date: Wed, 14 Oct 2026 14:38:48 -0700
X-Gm-Features: AclHuK-ZW6mE8FMgFPO0YwD_SeSPs7s8O5ZA8QoUSzDP1KeSMhZFfV5SP2KjBD4
Message-ID: <CAPPBnEYqVDHVonzRwMAvOjVfrTmjXQD7=v6LnP4EknxPOZjt0w@mail.gmail.com>
Subject: Re: [PATCH 1/1] rust: io: Fix `Region::drop` releasing nested
 resources from the wrong parent
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, daniel.almeida@collabora.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, me@kloenk.dev, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, ardalan@uci.edu, 
	zhiyunq@cs.ucr.edu, dzueck@uci.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your feedback. We will address this issue in the v2 patch.

Best regards,
Priya

On Wed, Sep 30, 2026 at 12:59=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Tue Sep 29, 2026 at 7:46 PM CEST, Priya Bala Govindasamy wrote:
> > Fix this by storing a reference to the parent resource in `Region`.
> > This ensures that the parent remains valid for the lifetime of the
> > child region.
>
> I Sashiko has a valid concern:
>
> https://urldefense.com/v3/__https://sashiko.dev/*/patchset/20260929174612=
.Jss-fw-sa4kdEy7Hk2_uC8PLsUpZ-K_gGWyuz4Qc6_k*40z__;IyU!!CzAuKJ42GuquVTTmVmP=
ViYEvSg!KWKxj1WyZCEbpDclCnamJVxSVUhhlXJiX_-xnNZOlZ5TtGiUySSQ33XIkL3Id53pEUt=
CiRwIGz4VqQ$
