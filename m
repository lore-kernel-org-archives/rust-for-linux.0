Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB9C13FD74
	for <rust-for-linux@vger.kernel.org>; Sun,  5 May 2024 22:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714948428; cv=none; b=ZzTQ+vFWxXPNrBDimMcw3W857f0DqC+FTsx9GTOg63SLb9bfpBR5AXCGrEOT6w/tb6NZSK2CANpmHJLukQb9AENTpsiSJ9czSXTxN2ZIj0tpT6ZgenSWEgAnp2ErVYkl56oy7fyi4LAkxLhmHFjenAmF8p1XvvB0BeX9QWOseww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714948428; c=relaxed/simple;
	bh=18uCiiRRMPjNnJTP32uuwyiLYk1it2TX0GRi8o8Dyho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eLI0WibmTAvizkREwu778xOx0nLEL860Z9wZMG+AhNqziE8docX/k7tAfREzm4ArFuaLhSqHBMHDo9CAPi3v49sJ1HLQMCG504k8Ft+lNum6HlCQ7iJDONT946CWlvGej2QyIDKBjjx6C65Nj6RpxGdrdTGC8HjzN+KIT/svJII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQrzgvF2; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQrzgvF2"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2b239b5fedaso1081030a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 05 May 2024 15:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714948426; x=1715553226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18uCiiRRMPjNnJTP32uuwyiLYk1it2TX0GRi8o8Dyho=;
        b=HQrzgvF2Ip/hr5Ct+WBM31hAxCo8trRFl4YEYSsu0RQNmKCMFLSfrL8jMg5nhbbNIt
         b095w8K08zeCcj1WQFY02TEJBZKs9zrF3r9xXStZmxJmUWdKdlZeKYBgaf/8NkfNQQ+N
         hufGjS+jclPFz1A0mOawD/iXGsSsM+kAmrj7DdgTdJBII0+5pAiketLR2nt3200Je3UY
         Pze8zLaAXYZprZVaSvo1sCg4Gk8jU9gcrNrCzsHKZfq/LUkoy1dFZBZR1vEL3FQBjPip
         rmxu1P5vFg04puJl1TjYCMv+cJpXShE9R3g4WPply2R+3Fh4mHrvM8S1wuMNOGbJDFld
         Zltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714948426; x=1715553226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18uCiiRRMPjNnJTP32uuwyiLYk1it2TX0GRi8o8Dyho=;
        b=mqLzrWUy7SppAlzxquWqwYGvIjs2AkhfBlgVW8KUA4XbMzbqaBJwLhUQrW1tAoEtjD
         04gsUGGyMOM5GlgRnAT2/R0S2XmdQeOvYtL+ShMVKM1q8nc8yS+uA0F+lYshR3bceeYK
         ERxAF6od/yc26QFefUoADfNFGcFfVQr+4BIQexcIcHsz2EsA/S+4ODUtvyCnTdGSXp/7
         WlUgpyrHHJl+GcBZlDJvmLV8dfEHuLgWTEb2JwRE/MUHyezGsO/4Bm9whlWuDhOwliiI
         D6LbGOyLL7HpFDa4OVpYCexYvFnIvgt9kpx29X0r2TPWNAejHoGIOCdT3yuixjC2XOi4
         dShA==
X-Gm-Message-State: AOJu0Yzw493r8OB/tcwZDQafZ4mcguoo/tXwQqw5wQjP44zppRAe55mc
	plBnHweJ7xOpqKugwlPBrkufzxLH6v/BYCHxDcv/sHXezXvvv+skZUewKm+2HV5fhor0MG69utT
	kfZFXOx5P8GU5s2+hYV8s2R+v/04=
X-Google-Smtp-Source: AGHT+IH22TXJhRHYcaEutGi5OPFSncmiO292aoDfiZ4EHvhIQ40PdhX9IgND7elmixmoXpfKIoL8g3RS6ggzt2rSYPY=
X-Received: by 2002:a17:90a:6006:b0:2b5:46b3:2e8a with SMTP id
 y6-20020a17090a600600b002b546b32e8amr810890pji.39.1714948426116; Sun, 05 May
 2024 15:33:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418070618.3962736-1-dirk.behme@de.bosch.com>
In-Reply-To: <20240418070618.3962736-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 May 2024 00:32:22 +0200
Message-ID: <CANiq72mG+CLnRf4sWj1+fjXLdGO0cjDSXJdL3y053NjK-n95PA@mail.gmail.com>
Subject: Re: [PATCH v4] docs: rust: extend abstraction and binding documentation
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Valentin Obst <kernel@valentinobst.de>, 
	Trevor Gross <tmgross@umich.edu>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 9:06=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Add some basics explained by Miguel in [1] to the documentation.
> And connect it with some hints where this is implemented in the
> kernel.
>
> [1] https://www.linuxfoundation.org/webinars/rust-for-linux-writing-abstr=
actions-and-drivers
>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

[ Reworded first section for better clarity and some minor nits.
Changed link into Link tag, use tabs for code block indentation and
wrap at 80. - Miguel ]

Dirk: please double-check that you are OK with the reword. Thanks!

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
