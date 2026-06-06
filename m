Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D85730CDA2
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Jun 2026 12:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748839; cv=pass; b=X5E9/MEo2JC1BuNdSjna0cFLYRUUue4GuCp8+xDD8zfY+vNXLh/Jwh4t4VeXA1viWtk++W/jBTtEIb4E8Asg1ef2jZy9lUMla/EYrjAklsKQCO5Efj2PKsKI8fMEpvW49DcFjrNEat0/Jl4vys5cxKcPsoQEsNOBtplSqF0qfIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748839; c=relaxed/simple;
	bh=SFPwqoiZm69z1NakR6fcL6ZZSlzu12JS7EcIxD5JPDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6pne8rV3V7GZmg1dsTwnyUWIGDCeIIoWJbPXj+ZJJ4UNo0+aIIwE2Uwv1kTQgO+zxImn9GsUskPXedwKdOGpJwPouPMZWTlhbyqoS3DIauda03xP+D47xWvPyYCQxRiHeH0IsQeqL98tIDEMdxdmb/3w44MECygCilMxygPxm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xwxo1MlQ; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xwxo1MlQ"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304dd3bb7a6so242908eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Jun 2026 05:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780748837; cv=none;
        d=google.com; s=arc-20240605;
        b=PJNCpG2Rhz29gN1Ou5AWxgZCwVh+TEQoHraseR5KK4c3YncHNFVOmHLiu1calRpLuN
         ++1MevIMbuRKPZ0dpMfYfBuMnaEpgtHgRQxywbYvqh/H2ZwEnKI0Els+YF85JzQ+jNqo
         opk06TroZYpSfBeeb8YPGnLOQDh3IO4FkIVtlYvZ2vorA7NTAVOHc1oK+3Br4GXHK+4w
         ciLWyuo/qV7dpL+8BY9A1pES/32fAMOdhzvJBRDW+Iz9Aiwz9CQMSDnvv56oTdLgbzK8
         9zWwo2I5Ods7SVeN46RpP923/omlOQC8wpjUAIbxyBCV9Mk4vqcGQ+W9PJjAGOAdYOoo
         la5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SFPwqoiZm69z1NakR6fcL6ZZSlzu12JS7EcIxD5JPDU=;
        fh=jCGcFkaSxNXx4YIDytLj9fvfkj9kA172skcNh4Lakeg=;
        b=eMiPO01H/FL43QacV3FuUa6NdMM4XYL3CZvZXkFN0BL58GAmT7aiFGELQ8PU0Dy57J
         4gbYWC9uuedG3c9Adt08LmMJuA1mIRrrhDM9YZ0BesiTf9zntsLDesoJxv8dNAFX6zBf
         UXkgytlsfEdmTcPHc11ea+9YqhMVVNOTkvnrfUZMqGUwET5Hu+1MWskRKNS1rs0q4v0p
         RMSjE6FBGk6fe/cI4XV5hM0i93HDghDSBNy9XGK9EVXmPBina/XxBswbu6riY3SkoGV1
         8ssObie7uwGPk20AfGqm7EUcgutuAk9zkTo8GiE5O97N0BEsg4WJXIymp7PQDotLCvfn
         aT+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780748837; x=1781353637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFPwqoiZm69z1NakR6fcL6ZZSlzu12JS7EcIxD5JPDU=;
        b=Xwxo1MlQJgc6Ohk4tq2fIvyyA4gTyLqcOOHYPiAWalgDmjgqJMvjF+5lCaqw06zoPZ
         jhwBilNDhl3XEsJ8KxiuhRSVei4saUljLI2ljmaZOcYA3V40S7yS8AsObhmZpPU1bAru
         7IfFLoswqavS+c9iXbhJqlVM+pv9sb8VPDDaO1feCmU0etmeWpx+tqHoGNrP7JQlHXX+
         /7XOLejnAqwlCJSR3V7K5l2R1CDsd5nRprN/ZHGo0ROkGTr1M115WZKwzl+nEppjsXhF
         MII7JacA9i+5LC4yHVBwTSqacVJ4J4DH0J9VnBtgLcZ9ASmKu7T5NGLgmRvzBno3hzJf
         mcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748837; x=1781353637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SFPwqoiZm69z1NakR6fcL6ZZSlzu12JS7EcIxD5JPDU=;
        b=qQ77rzdamQvcF+qjOvx24guCAhXU/9oYLN4Fe49t1UldGqCAfUbhLyh2QsWUVQvyxK
         T52tZSiN55zz+NuK7NdiLvSlV5aJiyknVszVGVvREv3o6iTHcaQ+eSO3gDon7arDLqRe
         zXyqtajI6N01MtEnKldGDN1jetewwc4WHY/PeiBMsA0unrqjAL8ZVkHhQClZtUVO+FOF
         ub8AMtRIC+C5M/AqEUrgTOucS7qnldcVXZGb7rEddp4cyYsw4PaVVH8VBvgSbduwLiKc
         VNacV+8Eth9HrUCw7D2hiqjJpgYtRX1zgj27jQfJnvwFo67UoFkCx+IV8xAh46anZOXG
         gTvw==
X-Forwarded-Encrypted: i=1; AFNElJ/0yRNACizfNrBVk5XSaMk67mAJLdWP7FddSAAvEsPWpAqT7xUrr84Kt2XKarWHfj0w8YyT4DuRNafDALy3mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCeLPvDqI2lhmA4XXp4QwaLMTIbG1/5BHUwfeGz+Cx/lN/rHNv
	inf7ZEqqksF4ZyBLibMaGzLD8Xvqi3Im3l1seFEsfv6cPax1KbnzVc7IZ4HD9FFT8g3Bi6gasS3
	qpHiP5ai7pbb/nB9hn9OdBeP+/rl6Sp87w5shbcI=
X-Gm-Gg: Acq92OGqZW/8T6lclOajaezUq2odN6a49g+dQeaTVIq339AVnwQi/yqX29NXSNAqAoq
	brpPoxs9WpNtAvtQwh66j/HxmDQ1Kx5JlMnOL32wt0Opbgl2oUHIl/xcnxXm4oE1gVYa2p1rT3R
	cto8dpnbPtpsux+UWIzv14F07rlNkitI63WE+HRoWSldofp25hvZYTvRQF28qNtQqCWwTc1koVe
	uGgQm+28snh1ZnZMOO2lfi4TzzCycpd5+vArhdw0FigksO0RN2qQLvPVrQdyOicddLPsxbBhBpc
	C7gEFWte49DCWAOpUqrsdCCu9+E7cm48nsaf+RE61C9K8h0JKTnHU9PZHeaFKdXCmGoYPqYZNWo
	siz5y0nxELTNdYpRevc/X71vk17JY5A68iw==
X-Received: by 2002:a05:7300:5723:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-3077af4a612mr2188501eec.2.1780748837034; Sat, 06 Jun 2026
 05:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602163949.2215642-1-gary@kernel.org>
In-Reply-To: <20260602163949.2215642-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 6 Jun 2026 14:27:04 +0200
X-Gm-Features: AVVi8CeDce8mR3e3ofGRHOJZrgnVgPPyoMyEYnj4-evdZI_OkwHfZieBeTtaFxY
Message-ID: <CANiq72n3t1VW5oTFeEZt-raBFnhO-uw_Fjm17vEY2SuvR8XNWA@mail.gmail.com>
Subject: Re: [GIT PULL] pin-init changes for v7.2-rc1
To: Gary Guo <gary@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 6:40=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> There is more developments this cycle than the last one, with a mix of
> improvements and cleanups. No breaking changes to users expected.
>
> Tuple structs did not make it this cycle, I hope it'll finally land the n=
ext
> one. I have also been working on getting pin-init to support self-referen=
tial
> types, which I plan to send next cycle (although unsure it can land in th=
e next
> one).
>
> The refactoring commits have been in linux-next for a while. There a few
> patches taken later in the cycle, and they have all been in linux-next si=
nce
> 2026-06-01. Feel free to wait for a few more rounds before pulling if you=
 see
> fit.

Merged into `rust-next` -- thanks!

I have reworded the merge message to use the style Linus expects for
merge commits, i.e. mainly using the imperative, like commit messages
-- please take a look!

(For future PRs, it would help if you can follow the style)

Cheers,
Miguel
